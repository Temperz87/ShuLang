bind n0 to 0
bind n1 to 1
bind iters to 0
bind max_iters to 10000
while iters != max_iters {
    bind tmp to n1
    bind n1 to n0 + n1
    bind n0 to tmp
    bind iters to iters + 1
}

print(n0)