bind x to read_input()

bind i to 1
bind acc to 1
while i <= x {
    bind acc to acc * i
    bind i to i + 1
}

print(acc)
