bind x : Integer to 0

if false or true
    bind x : Integer to x + 1
if true or false
    bind x : Integer to x + 1
if false or false
    bind x : Integer to x - 1
if true or true
    bind x : Integer to x + 1

print(x)