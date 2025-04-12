bind even : int -> bool to {
    lambda n : int -> bool {
        if (n equals 0)
            return True
        else
            return odd(n - 1)
    }
}

bind odd : int -> bool to {
    lambda n : int -> bool {
        if (n equals 0)
            return False
        else
            return even(n-1)
    }
}