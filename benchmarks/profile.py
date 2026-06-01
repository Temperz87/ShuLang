import sys
import subprocess
import time

def one_time(command):
    start = time.perf_counter_ns()
    subprocess.run(command, shell=True)
    end = time.perf_counter_ns()
    return (end - start) // 1000

def run_and_time(file_name, max_iterations=100):
    command = f'./{file_name} > /dev/null'
    total = 0
    for _ in range(max_iterations):
        total += one_time(command)
    return total / max_iterations

def compile(cc, file, output_file, flags):
    command = f'{cc} {file} {flags} -o {output_file}'
    start = time.perf_counter_ns()
    output = subprocess.run(command, shell=True, capture_output=True, encoding='utf-8')
    end = time.perf_counter_ns()
    return (end - start) // 1000, output.stdout

def benchmark(shuc_path, file_name, out_file=None):
    fd = None
    if out_file is None:
        out_stream = sys.stdout
    else:
        fd = open(out_file, 'w')
        out_stream = fd

    print('# Report for', file_name, file=out_stream)

    unopt_flags = '-O0'
    opt_flags = '-O1'

    shuc_unopt, unopt_compile_timings = compile(shuc_path, file_name, 'unopt.ll', f'{unopt_flags} --timings')
    shuc_opt, opt_compile_timings   = compile(shuc_path, file_name, 'opt.ll',   f'{opt_flags} --timings')

    unopt_unopt, _ = compile('clang', 'unopt.ll', file_name + 'a00.out', '-O0')
    unopt_opt, _   = compile('clang', 'unopt.ll', file_name + 'a01.out', '-O1')
    unopt_o2, _    = compile('clang', 'unopt.ll', file_name + 'a02.out', '-O2')
    opt_unopt, _   = compile('clang', 'opt.ll',   file_name + 'a10.out', '-O0')
    opt_opt, _     = compile('clang', 'opt.ll',   file_name + 'a11.out', '-O1')
    opt_o2, _      = compile('clang', 'opt.ll',   file_name + 'a12.out', '-O2')

    print('## COMPILATION TIMING', file=out_stream)
    print('|  | clang -O0 | clang -O1 | clang -O2 |', file=out_stream)
    print('| --- | --- | --- | --- |', file=out_stream)
    print(f'| shuc -O0 | {shuc_unopt + unopt_unopt}μs | {shuc_unopt + unopt_opt}μs | {shuc_unopt + unopt_o2}μs |', file=out_stream)
    print(f'| shuc -O1 | {shuc_opt + opt_unopt}μs | {shuc_opt + opt_opt}μs | {shuc_opt + opt_o2}μs |', file=out_stream)

    print('\nshuc -O0 pass timings', file=out_stream)
    print('-', unopt_compile_timings.replace('\n', '\n- ')[0:-2], file=out_stream)
    print('shuc -O1 pass timings', file=out_stream)
    print('-', opt_compile_timings.replace('\n', '\n- ')[0:-2], file=out_stream)

    print('## EXECUTION TIME', file=out_stream)
    print('|  | clang -O0 | clang -O1 | clang -O2 |', file=out_stream)
    print('| --- | --- | --- | --- |', file=out_stream)

    o0 = run_and_time(file_name + 'a00.out')
    o1 = run_and_time(file_name + 'a01.out')
    o2 = run_and_time(file_name + 'a02.out')
    i0 = run_and_time(file_name + 'a10.out')
    i1 = run_and_time(file_name + 'a11.out')
    i2 = run_and_time(file_name + 'a12.out')

    print(f'| shuc -O0 | {o0:.1f}μs | {o1:.1f}μs | {o2:.1f}μs |', file=out_stream)
    print(f'| shuc -O1 | {i0:.1f}μs | {i1:.1f}μs | {i2:.1f}μs |', file=out_stream)

    if fd:
        fd.close()

    subprocess.run('rm -f unopt.ll', shell=True)
    subprocess.run('rm -f opt.ll', shell=True)
    for suffix in ['a00', 'a01', 'a02', 'a10', 'a11', 'a12']:
        subprocess.run(f'rm -f {file_name}{suffix}.out', shell=True)

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python3 profile.py $path_to_shuc $sl_file_to_benchmark')
        exit(0)

    shuc_path = sys.argv[1]
    file_name = sys.argv[2]
    benchmark(shuc_path, file_name, None)

