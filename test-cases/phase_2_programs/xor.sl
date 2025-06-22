bind x : Integer to 0

if false xor true
    bind x : Integer to x + 1
if true xor false
    bind x : Integer to x + 1
if false xor false
    bind x : Integer to x - 1
if true xor true
    bind x : Integer to x - 1

print(x)