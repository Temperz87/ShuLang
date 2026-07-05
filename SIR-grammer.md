# Specification of ShuLang Intermediate Representation (SIR)

SIR the IR for ShuLang and utilizes SSA form. Hence all variables get assigned to **once**.

I think most of the stuff in here is pretty self explanitory (as I lifted it from LLVM). I'm assuming that if you're here you either have no idea what you're doing and are poking around the repository, or you're a hardened veteran who has spotted 100 different inconsistencies.

This specification was last updated during Act 5. Any changes past that point will not be reflected here.

## Concrete Syntax

param_list ::= identifier ":" type | param_list "," param_list

type ::= `Integer` | `Boolean` | `Void`

function_definition ::= `identifier "(" param_list ")" ->` type "{" statement_list "}"

statements ::= `name "<-" value` | `"jump to" block` | `"jump to" block "if" condition "else" block` | `"print"(value)`

boolean ::= `"true"` | `"false"`

immediate ::= `"$"Integer`
- Integer is of course a number

variable_reference ::= `%identifier`

cmp ::=  `x ">" y` | `x ">=" y` | `x "<" y` | `x "<=" y`  | `x "=" y` | `x "!=" y` | `x "and" y` | `x "or" y` | `x "xor" y`
- Boolean comparison
- `x` and `y` should be booleans

binary_arithmatic ::= `x "+" y` | `x "*" y` | `x "-" y` 
- Basically just math
- `x` and `y` should be immediates

argument_list = `value` | `argument_list ", " argument_list`

function_call = `identifier "()"` | `"identifier (" argument_list ")"`

value ::= `immediates` | `variable_reference` | `binary_arithmatic` | `cmp` | `"Φ" [block, value], ...` | `"Select" x y z` | `function_call`
- for select, `x` has to be a boolean, and `y, z` have to have the same type

statement ::= `"%" identifier "<-" value` | `function_call`

statement_list ::= statement | statement_list statement

## Abstract syntax

Statements ::= `Definition(name, value)` | `print(variable)` | `Jump(destination)` | `JumpIfElse(destination, else_destination, condition)`

Cmp ::= `x > y` | `x >= y` | `x < y` | `x <= y`  | `x = y` | `x != y` | `x and y` | `x or y` | `x xor y`
- `x` and `y` have a width of 1
- Putting this in prefix looks weird, hence me maintaining the infix notation
    - Cry about it

BinOp ::= `add(x, y)` | `mult(x, y)` | `sub(x, y)`
- `x` and `y` have a width of 8

argument_list = `value` | `argument_list ", " argument_list`

Values ::=  `BinOp` | `Cmp` | `Reference(identifier)` | `PhiNode({(predecesor_block, value), ...})` | `Immediate(number, width)` | `Select(condition, true_value, false_value)` | `InputNode()` | `call identifier argument_list`

param_list ::= identifier ":" type | param_list "," param_list

statement ::= `identifier "=" value` | `function_call`

statement_list ::= statement | statement_list statement

function_definition ::= `identifier "(" param_list ")" ` type "{" statement_list "}"
