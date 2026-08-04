/*******************************************
* This program does not current compile    *
* It is meant to represent future features *
********************************************/

bind even(n : Integer, odd : Integer -> Bool) -> Bool in {
    if n = 0
        return true
    else
        return odd(n - 1)
}

bind odd(n : Integer) Bool in {
    if n = 0
        return false
    else
        return even(n-1, odd)
}