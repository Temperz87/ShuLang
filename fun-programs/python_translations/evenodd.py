def even(n : int, odd) -> bool:
    if n == 0:
        return True
    return odd(n - 1)

def odd(n : int) -> bool:
    if n == 0:
        return False
    return even(n - 1, odd)

for x in range(10):
    print(even(x, odd), odd(x))
