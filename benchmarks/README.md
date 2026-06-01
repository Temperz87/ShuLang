# Benchmarks
Currently these benchmarks are limited and WIP, however that will change in the future. These benchmarks are generated using the [profile.py](./profile.py) script in this directory. The script compiles the program:
- With shuc without optimizations
- With shuc with optimizations

Then runs the two compiled binaries through clang on optmization levels zero, one, and two. The statistics reported are:
1. How long each shuc pass took
2. How long compilation took (shuc time + clang time)
3. How long execution took

For each possible combination. Note that, when using the script, shuc should be compiled using the `build` target in the Makefile, NOT the "debug" or "profile" targets.

