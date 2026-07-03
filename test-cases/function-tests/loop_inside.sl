bind fact(x : Integer) -> Integer in {
    bind acc to 1
    while x > 0 {
        bind acc to acc * x
        bind x to x - 1
    }

    return acc
}

print(fact(5))
