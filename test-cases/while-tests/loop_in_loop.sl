bind i to 1
bind acc to 1

while i < 5 {
    bind j to 0
    bind curr to acc
    while j < i {
        bind acc to acc + curr 
        bind j to j + 1
    }
    bind i to i + 1
}

print(acc)
