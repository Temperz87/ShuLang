import os
import sys
import subprocess
import time

def one_time(command):
    start = time.perf_counter_ns()
    subprocess.run(command, shell=True)
    end = time.perf_counter_ns()
    return (end - start) // 1000

def run_and_time(file_name, extension, max_iterations):
    command = f'./{file_name}{extension} > /dev/null'
    if os.path.exists(f'./{file_name}.in'):
        command = f'cat ./{file_name}.in | ' + command

    total = 0
    for _ in range(max_iterations):
        total += one_time(command)
    return total / max_iterations

def compile(cc, file, output_file, flags, max_iterations):
    command = f'{cc} {file} {flags} -o {output_file} > /dev/null'
    total = 0
    for _ in range(max_iterations):
        total += one_time(command)

    command = f'{cc} {file} {flags} -o {output_file}'
    output = subprocess.run(command, shell=True, capture_output=True, encoding='utf-8')
    return total / max_iterations, output.stdout

def benchmark(shuc_path, file_name, max_iterations=100, out_file=None):
    fd = None
    if out_file is None:
        out_stream = sys.stdout
    else:
        fd = open(out_file, 'w')
        out_stream = fd

    print('# Report for', file_name, file=out_stream)
    print('Times determined by running each measure part', max_iterations,\
          'times then taking the average')
    print('\nNote that individual pass timings are NOT averaged out')

    unopt_flags = '-O0'
    opt_flags = '-O1'

    shuc_unopt, unopt_compile_timings = compile(shuc_path, file_name, 'unopt.ll', f'{unopt_flags} --timings', max_iterations)
    shuc_opt, opt_compile_timings   = compile(shuc_path, file_name, 'opt.ll',   f'{opt_flags} --timings', max_iterations)

    unopt_unopt, _ = compile('clang', 'unopt.ll', file_name + 'a00.out', '-O0', max_iterations)
    unopt_opt, _   = compile('clang', 'unopt.ll', file_name + 'a01.out', '-O1', max_iterations)
    unopt_o2, _    = compile('clang', 'unopt.ll', file_name + 'a02.out', '-O2', max_iterations)
    opt_unopt, _   = compile('clang', 'opt.ll',   file_name + 'a10.out', '-O0', max_iterations)
    opt_opt, _     = compile('clang', 'opt.ll',   file_name + 'a11.out', '-O1', max_iterations)
    opt_o2, _      = compile('clang', 'opt.ll',   file_name + 'a12.out', '-O2', max_iterations)

    print('## COMPILATION TIMING', file=out_stream)
    print('|  | clang -O0 | clang -O1 | clang -O2 |', file=out_stream)
    print('| --- | --- | --- | --- |', file=out_stream)
    print(f'| shuc -O0 | {(shuc_unopt + unopt_unopt):.1f}μs | {(shuc_unopt + unopt_opt):.1f}μs | {(shuc_unopt + unopt_o2):.1f}μs |', file=out_stream)
    print(f'| shuc -O1 | {(shuc_opt + opt_unopt):.1f}μs | {(shuc_opt + opt_opt):.1f}μs | {(shuc_opt + opt_o2):.1f}μs |', file=out_stream)

    print('\nshuc -O0 pass timings', file=out_stream)
    print('-', unopt_compile_timings.replace('\n', '\n- ')[0:-2], file=out_stream)
    print('shuc -O1 pass timings', file=out_stream)
    print('-', opt_compile_timings.replace('\n', '\n- ')[0:-2], file=out_stream)

    print('## EXECUTION TIME', file=out_stream)
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
    benchmark(shuc_path, file_name, 100, None)
