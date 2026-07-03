bind do_stuff(x : Integer, b : Boolean) -> Integer in {
    if b {
        return x
    }
    else {
        return x + 1
    }
}

print(do_stuff(5, true))
print(do_stuff(6, false))
