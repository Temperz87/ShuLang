# Specification of ShuLang

TODO: Make this formal
Right now it's just incoherent ramblings

type ::= Array\<T\> | Bool | Char | Data | Integer | Lambda identifier : T_1 -> T_2 { T_2 } | String
- Array\<T\> := A contiguous sequence of T
- Bool := "true" | "false"
    - It's literally a boolean my dude
    - TODO: Add a LOT of comparisons
- Char := Numbers $[0,255]$, one byte
- Data := Some object thing I'll have to figure out
- Integer := Numbers (-$\infty$, $\infty$)
    - Perhaps only 32 bits? I don't know yet
- Lambda T_1 -> T_2 := A function that takes in something of type T_1 and outputs something of type T_2
- String := An array of characters, it's just syntactic sugar


TODO: I am missing a bunch of scopes
- I still haven't decided on how to do scoping so yeah

statement ::= "if" bool "then" { statement } "else" { statement } | print(statement) | syscall(NAME) | term_bindings
- if is just like if in other languages if the bool is true/false then do the then/else yay!!!!
- print outputs to the console
- I want to do something REALLY funny which is why I have syscall

term_bindings ::= "bind" identifier "to" type statment
    - Creates a new variable bound to statement

term_bindings ::= "fix" identifier "in" type statement
- Binds the identifier to its current location
- Returns the newly created term, doesn't create a global binding (see facotrial.sl)
- I might remove this as I imagine I'll only ever use fix and never use bind

application ::= function_name(argument)
- Applies function_name to argument
- Note that functions as of right now can only take in one argument
    - Might add sugaring for multiple arguments but I don't know yet
    - Also there's like a hundred registers I'm not using :skull:
