bind a to 10
bind b to 5
bind c to 3
bind d to 8
bind e to 2

bind result to 
    if (a > b)
        (if (b > c)
            (if (c > d)
                (if (d > e)
                    (a + b * c - d)
                    (a * b + c * d - e)
                )
                (if (e > a)
                    (e * e + a)
                    (d * d - b)
                )
            )
            (if (a = c)
                (a * a * a)
                (if (b != d)
                    (b * c + d * e)
                    (a + b + c + d + e)
                )
            )
        )
        (if (a < e)
            (e * 100)
            (if (d >= b)
                (d * (if (c < b) (c + 1) (c - 1)))
                (if ((a + b) = 5)
                    (a * 42)
                    (b * 24)
                )
            )
        )

print(result)
