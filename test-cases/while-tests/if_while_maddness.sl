bind loop to 6
while loop > 0 {
    if (loop = 2 or loop = 4 or loop = 6) {
        print(1)
    }
    else {
        print(0)
    }
    
    bind loop to loop - 1
}
