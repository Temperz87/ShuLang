bind x to 5
bind add1(x : Integer) -> Integer in {
    bind x to x + 1
    return x
}

print(add1(x))
print(x)