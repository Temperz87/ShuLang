# Specification of ShuLang Intermediate Representation (SIR)

ShuIR is a SSA IR, in that there are blocks and updating variabels is not allowed.


## Concrete Syntax

`name <- statement`: defines a new variable and binds it to the stmt

Statements ::= `x + y` | `x * y` | `x - y` | `x - y` | `print(variable)`

## Abstract syntax

`Definition(name, statement)`: definition and binding

Statements ::= `add(x, y)` | `mult(x, y)` | `sub(x, y)` | `div(x, y)` | `print(variable)`
