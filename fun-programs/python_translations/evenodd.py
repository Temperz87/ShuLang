def even(n : int) -> bool:
    if n == 0:
        return True
    return odd(n - 1)

def odd(n : int) -> bool:
    if n == 0:
        return False
    return even(n - 1)

for x in range(10):
    print(even(x), odd(x))