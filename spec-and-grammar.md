# Specification of ShuLang

type ::= Array\<T\> | Bool | Char | Data | Integer | T_1 -> T_2 { T_2 } | String
- Array\<T\> := A contiguous sequence of T
    - TODO: Write test cases for this
- Bool := "true" | "false"
    - It's literally a boolean my dude
    - There's also a bunch of comparisons
- Char := Numbers $[0,255]$, one byte
    - TODO: Write test cases for this
- Data := Some object thing I'll have to figure out
    - TODO: Write test cases for this
- Integer := (-$\infty$, $\infty$)
    - Perhaps only 32 bits? I don't know yet
- T_1 -> T_2 := A function that takes in something of type T_1 and outputs something of type T_2
- String := An array of characters, it's just syntactic sugar
    - TODO: Write test cases for this

statement ::= "if" bool { statement } | "if" bool { statement } "else" { statement } |  print(statement) | syscall(string) | term_bindings | "lambda" identifier type -> type: | update identifier stmt | while (bool) stmt

- if is just like if in other languages if the bool is true/false then do the then/else yay!!!!
- print outputs to the console
- I want to do something REALLY funny which is why I have syscall

identifier ::= TODO
    - I don't know how to formally define an identifier, like non whitespace alphanumeric characters that don't start with a number???

term_bindings ::= "bind" identifier ":" type "to"  statment
    - Creates a new variable bound to statement in the current scope

term_bindings ::= "fix" identifier "in" statement
- Binds the identifier to its current location
- Returns the newly created term, doesn't create a global binding (see facotrial.sl)

application ::= function_name(argument)
- Applies function_name to argument
- Note that functions as of right now can only take in one argument
    - Might add sugaring for multiple arguments but I don't know yet
    - Also there's like a hundred registers I'm not using :skull:
    - I'm sure there's some like "uncurrying" pass I can do