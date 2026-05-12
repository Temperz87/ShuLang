bind x to 0
while x < 5 and x >= 0 {
    print(x)
    bind x to x + 1
}

print(x)