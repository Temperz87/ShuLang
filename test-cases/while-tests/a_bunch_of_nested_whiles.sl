bind loop to 10
while loop > 1 {
    while loop > 4 {
        while loop > 8 {
            print(loop)
            bind loop to loop - 1
        }

        print(loop)
        bind loop to loop - 1
    }

    print(loop)
    bind loop to loop - 1
}

print(loop)