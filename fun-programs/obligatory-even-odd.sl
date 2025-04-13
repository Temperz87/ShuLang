bind even : Integer -> Bool to {
    lambda n : Integer -> Bool {
        if (n equals 0)
            return true
        else
            return odd(n - 1)
    }
}

bind odd : Integer -> Bool to {
    lambda n : Integer -> Bool {
        if (n equals 0)
            return false
        else
            return even(n-1)
    }
}