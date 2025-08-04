bind x : Integer to 0

if false and true {
    bind x : Integer to 2
    print(7)
}
else if true and false {
    bind x : Integer to 3
    print(8)
}
else if false and false {
    bind x : Integer to 4
    print(9)
}
else if true and true
    bind x : Integer to 1
else {
    bind x : Integer to 5
    print(10)
}

print(x)