bind even : Integer -> Bool lambda n {
    if (n equals 0)
        return true
    else
        return odd(n - 1)
}

bind odd : Integer -> Bool to lambda n {
    if (n equals 0)
        return false
    else
        return even(n-1)
}