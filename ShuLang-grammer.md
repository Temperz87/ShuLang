# Specification of ShuLang

ShuLang is an imperative procedural programming language, currently supported if statements, printing, and some math operators! The grammar of the language is outlined in this file.

This specification was last updated during Act 5. Any changes past that point will not be reflected here.

## Concrete Syntax

boolean ::= `true` | `false`

binary_operation ::= `x "+" y` | `x "-" y` | `x "*" y` | `x ">" y` | `x ">=" y` | `x "<" y` | `x "<=" y`  | `x "=" y` | `x "!=" y` | `x "and" y` | `x "or" y` | `x "xor" y`

unary_prefix_operation ::= `"not" b` | `"if" condition consequence alternative`

argument_list = `value` | `argument_list ", " argument_list`

function_call = `identifier "()"` | `"identifier (" argument_list ")"`

value ::= `identifier` | number | boolean | binary_operation | unary_prefix_operation | `"if" boolean value value` | function_call

type ::= `Integer` | `Boolean` | `Void`

variable_binding ::= `"bind" identifier : type "to" value` | `"bind" identifier "to" value`
- ShuLang is capable of inferring types

body ::= `{ statement_list }` | `statement`

param_list ::= `identifier ":" type` | `param_list "," param_list`

statement ::= variable_binding | `"if" boolean body` | `"if" boolean body else body` | | `"read_input"()` | `"while" condition body` | `"bind" identifier "(" param_list ") -> " type "in" body` | `"bind" identifier "() -> " type "in" body` | `function_call`

statement_list ::= `statement` | `statement_list statement`

program ::= `statement_list`
