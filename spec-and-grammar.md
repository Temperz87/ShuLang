# Specification of ShuLang

type ::= Integer | Char | Array\<T\> | Data | Lambda T_1 -> T_2
- Integer := Numbers (-$\infty$, $\infty$)
    - Perhaps only 32 bits? I don't know yet
- Char := Numbers $[0,255]$, one byte
- Array\<T\> := A contiguous sequence of T
- Data := Some object thing I'll have to figure out
- Lambda T_1 -> T_2 := A function that takes in something of type T_1 and outputs something of type T_2

term_bindings ::= "bind" identifier "to" type statment
    - Creates a new variable bound to statement

term_bindings ::= "fix" identifier "in" type statement
- Allows the identifier to appear in its definition
- I might remove this as I imagine I'll only ever use fix and never use bind

application ::= function_name(argument)
- Applies function_name to argument
- Note that functions as of right now can only take in one argument
    - Might add sugaring for multiple arguments but I don't know yet
    - Also there's like a hundred registers I'm not using :skull:

