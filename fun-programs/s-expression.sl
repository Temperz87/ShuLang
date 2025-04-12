bind statements_are_just_s_expression : Boolean -> Integer to {
    lambda n : Integer -> Integer {
        bind x to 5
        bind y to 6
        update! (if n x else y) to (if n y else x)
        return x
    }
}