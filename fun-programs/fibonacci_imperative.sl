bind fibonacci(n : Integer) -> Integer in {
    if n <= 0
        return n

    bind last to 0
    bind next to 1
    while n >= 0 {
        bind tmp to last
        bind last to next 
        bind next to (next + tmp)
        bind n to (n - 1)
    }
    
    return next
}
