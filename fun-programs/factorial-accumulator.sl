// This will be WEIRD to compile
bind factorial_acc : Integer -> Integer to
fix recurse in {
    lambda acc : Integer -> (Integer -> Integer) {
        lambda n : Integer -> Integer {
            if (n equals 0) {
                return acc
            }
            else {
                return recurse(acc)(n-1)
            }
        }
    }
}(1)

print(factorialacc(5))