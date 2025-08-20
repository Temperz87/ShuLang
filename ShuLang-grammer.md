# Specification of ShuLang

ShuLang is an imperative procedural programming language, currently supported if statements, printing, and some math operators! The grammar of the language is outlined in this file.

This specification was last updated during Act 3. Any changes past that point will not be reflected here.

## Concrete Syntax

boolean ::= "true" | "false"

binary_operation ::= `x + y` | `x - y` | `x * y` | `x > y` | `x >= y` | `x < y` | `x <= y`  | `x = y` | `x != y` | `x and y` | `x or y` | `x xor y`

unary_prefix_operation ::= `not b`

Value ::= `identifier` | number | boolean | binary_operation | unary_prefix_operation | `if boolean value value`
- Numbers are 0-9

type ::= "Integer" | "Boolean"

Variable_binding ::= `bind identifier : type to value` | `bind identifier to value`
- ShuLang is capable of inferring types

Statement ::= Variable_binding | `if boolean statement_list statement_list` | `print(value)` | `while condition statement_list`

statement_list ::= statement | statement_list statement

program ::= statement_list
