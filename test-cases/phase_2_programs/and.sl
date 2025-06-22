bind x : Integer to 0

if false and true
    bind x : Integer to x - 1
else if true and false
    bind x : Integer to x - 1
else if false and false
    bind x : Integer to x - 1
else if true and true
    bind x : Integer to x + 1
else
    bind x : Integer to x - 1

print(x)