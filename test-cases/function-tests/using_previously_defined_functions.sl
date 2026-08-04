bind id(x : Integer) -> Integer in {
    return x
}

bind wrap_id(x : Integer) -> Integer in {
    return id(x)
}

bind add(x : Integer, y : Integer) -> Integer in {
    return wrap_id(x) + wrap_id(y)
}

print(add(6, 7))
