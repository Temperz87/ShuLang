bind a to 6
bind b to 2
bind c to 10
bind d to 3
bind e to 6

bind result to 0

if (a >= b) {
    print(a)

    bind temp to 
        if (a = e)
            (if (c > d)
                (c * 2)
                (d * 2)
            )
            (if (b > d)
                (b + d)
                (d - b)
            )

    if (temp > 10) xor (a < b) {
        bind result to temp + (if (a > c) (a) (c))
    } else {
        bind result to temp - (if (d < e) (d) (e))
    }

} else {
    print(b)

    bind result to 
        if (b < c) and (true xor false)
            (c - b)
            (b * c)
}

if (result != 0) {
    print(
        if (result > 20)
            (result)
            (result + 100)
    )
} else {
    print(0)
}
