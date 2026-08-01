import os
import re
import sys
import subprocess
import time

# Return a dict containing the pass timing data
def parse_timings(text):
    results = {}
    for line in text.splitlines():
        # I love regex
        m = re.match(r"^(.*?):\s+(\d+)", line)
        if m:
            name = m.group(1).strip()
            value = int(m.group(2))
            results[name] = value

    return results

def format_timings(timings):
    ls = []
    for k,v in timings.items():
        if k.startswith("Optimization iterations"):
            ls.append(f"{k}: {int(v)}")
        else:
            ls.append(f"{k}: {v:.1f}μs")

    return '- ' + '\n- '.join(ls)

def one_time(command):
    start = time.perf_counter_ns()
    proc = subprocess.run(command, shell=True, capture_output=True, encoding='utf-8')
    end = time.perf_counter_ns()
    return (end - start) // 1000, proc.stdout

def run_and_time(file_name, extension, max_iterations):
    command = f'./{file_name}{extension} > /dev/null'
    if os.path.exists(f'./{file_name}.in'):
        command = f'cat ./{file_name}.in | ' + command

    # Prewarm caches
    one_time(command)

    # Actually benchmark now
    total = 0
    for i in range(max_iterations):
        print("On iteration:", i + 1, "of:", max_iterations, "while running:", command, file=sys.stderr)
        total += one_time(command)[0]

    return total / max_iterations

def compile(cc, file, output_file, flags, max_iterations):
    command = f'{cc} {file} {flags} -o {output_file}'
    total = 0
    timings = {}
    for i in range(max_iterations):
        print("On iteration:", i + 1, "of:", max_iterations, "while compiling:", command, file=sys.stderr)
        new_time, out = one_time(command)
        if cc.endswith('shuc'):
            out = parse_timings(out)
            total += out['Total compilation time']
            for k,v in out.items():
                timings[k] = timings.get(k, 0) + v
        else:
            total += new_time


    for k,v in timings.items():
        timings[k] /= max_iterations

    command = f'{cc} {file} {flags} -o {output_file}'
    return total / max_iterations, format_timings(timings)

def benchmark(shuc_path, file_name, max_iterations=100, out_file=None):
    fd = None
    if out_file is None:
        out_stream = sys.stdout
    else:
        fd = open(out_file, 'w')
        out_stream = fd

    print('# Report for', file_name, file=out_stream)
    print('Times determined by running each part', max_iterations,\
          'times then taking the average', file=out_stream)

    unopt_flags = '-O0'
    opt_flags = '-O1'

    shuc_unopt, unopt_compile_timings = compile(shuc_path, file_name, 'unopt.ll', f'{unopt_flags} --timings -l', max_iterations)
    shuc_opt, opt_compile_timings   = compile(shuc_path, file_name, 'opt.ll',   f'{opt_flags} --timings -l', max_iterations)

    unopt_unopt, _ = compile('clang', 'unopt.ll', file_name + 'a00.out', '-O0', max_iterations)
    unopt_opt, _   = compile('clang', 'unopt.ll', file_name + 'a01.out', '-O1', max_iterations)
    unopt_o2, _    = compile('clang', 'unopt.ll', file_name + 'a02.out', '-O2', max_iterations)
    opt_unopt, _   = compile('clang', 'opt.ll',   file_name + 'a10.out', '-O0', max_iterations)
    opt_opt, _     = compile('clang', 'opt.ll',   file_name + 'a11.out', '-O1', max_iterations)
    opt_o2, _      = compile('clang', 'opt.ll',   file_name + 'a12.out', '-O2', max_iterations)

    print('\n## COMPILATION TIMING', file=out_stream)
    print('shuc + clang timings', file=out_stream)
    print('|  | clang -O0 | clang -O1 | clang -O2 |', file=out_stream)
    print('| --- | --- | --- | --- |', file=out_stream)
    print(f'| shuc -O0 | {(shuc_unopt + unopt_unopt):.1f}μs | {(shuc_unopt + unopt_opt):.1f}μs | {(shuc_unopt + unopt_o2):.1f}μs |', file=out_stream)
    print(f'| shuc -O1 | {(shuc_opt + opt_unopt):.1f}μs | {(shuc_opt + opt_opt):.1f}μs | {(shuc_opt + opt_o2):.1f}μs |', file=out_stream)

    print('\nclang timings alone', file=out_stream)
    print('|  | clang -O0 | clang -O1 | clang -O2 |', file=out_stream)
    print('| --- | --- | --- | --- |', file=out_stream)
    print(f'| shuc -O0 | {unopt_unopt:.1f}μs | {unopt_opt:.1f}μs | {unopt_o2:.1f}μs |', file=out_stream)
    print(f'| shuc -O1 | {opt_unopt:.1f}μs | {opt_opt:.1f}μs | {opt_o2:.1f}μs |', file=out_stream)

    print('\nshuc -O0 pass timings', file=out_stream)
    print(unopt_compile_timings, file=out_stream)
    print('\nshuc -O1 pass timings', file=out_stream)
    print(opt_compile_timings, file=out_stream)

    print('\n## EXECUTION TIME', file=out_stream)
    print('|  | clang -O0 | clang -O1 | clang -O2 |', file=out_stream)
    print('| --- | --- | --- | --- |', file=out_stream)

    o0 = run_and_time(file_name, 'a00.out', max_iterations)
    o1 = run_and_time(file_name, 'a01.out', max_iterations)
    o2 = run_and_time(file_name, 'a02.out', max_iterations)
    i0 = run_and_time(file_name, 'a10.out', max_iterations)
    i1 = run_and_time(file_name, 'a11.out', max_iterations)
    i2 = run_and_time(file_name, 'a12.out', max_iterations)

    print(f'| shuc -O0 | {o0:.1f}μs | {o1:.1f}μs | {o2:.1f}μs |', file=out_stream)
    print(f'| shuc -O1 | {i0:.1f}μs | {i1:.1f}μs | {i2:.1f}μs |', file=out_stream)

    if fd:
        fd.close()

    subprocess.run('rm -f unopt.ll', shell=True)
    subprocess.run('rm -f opt.ll', shell=True)
    for suffix in ['a00', 'a01', 'a02', 'a10', 'a11', 'a12']:
        subprocess.run(f'rm -f {file_name}{suffix}.out', shell=True)

if __name__ == '__main__':
    shuc_path = sys.argv[1]
    file_name = sys.argv[2]
    max_iterations = 100
    if len(sys.argv) >= 4:
        max_iterations = int(sys.argv[3])

    if len(sys.argv) >= 5:
        out_file = sys.argv[4]
    else:
        out_file = None

    benchmark(shuc_path, file_name, max_iterations, out_file)
