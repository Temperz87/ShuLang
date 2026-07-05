// This will be WEIRD to compile
bind factorial_acc(n : Integer) -> Integer in {
    bind factorial(n : Integer, acc : Integer) -> Integer in {
        if n = 0 {
            return acc
        }
        else {
            return factorial(n - 1, acc * n)
        }
    }

    return factorial(n, 1)
}

print(factorial_acc(5))
print(factorial(1, 2))
