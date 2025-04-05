bind factorial : Integer -> Integer to {
    fix recurse in {
        lambda n : Integer -> Integer {
            if (n equals 0) {
                return 1
            }
            else {
                return n * recurse(n - 1)
            }
        }
    }
}

print(factorial(5))