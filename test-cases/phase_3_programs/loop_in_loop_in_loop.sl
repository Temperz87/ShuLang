bind max_fac to 5
while max_fac > 0 {
    bind i to 0
    bind acc to 1
    while i < max_fac {
        bind j to 0
        bind curr to acc
        while j < i {
            bind acc to acc + curr 
            bind j to j + 1
        }
        bind i to i + 1
    }
    bind max_fac to max_fac - 1
    print(acc)
}