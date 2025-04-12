def fib(n : int):
    if n <= 0:
        return n

    last = 0
    next = 1
    for _ in range(n, -1, -1):
        tmp = last
        last = next
        next = next + tmp
    
    return next

for i in range (6):
    print(fib(i))
