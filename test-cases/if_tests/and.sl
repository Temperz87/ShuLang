bind x : Integer to 0

if true and true
    bind x : Integer to 1
else if true and false {
    bind x : Integer to 2
    print(5)
}
else if false and true {
    bind x : Integer to 3
    print(6)
}
else {
    bind x : Integer to 4
    print(7)
}

print(x)