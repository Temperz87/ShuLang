bind add_five_inputs() -> Integer in {
    bind loop to 0
    bind acc to 0
    while loop != 5  {
        bind acc to acc + read_input()
        bind loop to loop + 1
    }

    return acc
}

print(add_five_inputs())
