bind add(x : Integer, y : Integer) -> Integer in {
    return x + y
}

bind x to add(6, 7)
print(x)
