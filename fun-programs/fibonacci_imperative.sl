bind fibonacci : Integer -> Integer to {
    lambda n : Integer -> Integer {
        if (n <= 0)
            return n

        bind last to 0
        bind next to 1
        while (n >= 0) {
            bind tmp to last
            update last to next 
            update next to (next + tmp)
            update n to (n - 1)
        }
        return next
    }
}
