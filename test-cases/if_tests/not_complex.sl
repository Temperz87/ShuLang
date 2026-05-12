bind x : Integer to 0

if not (false and true)
    bind x : Integer to x + 1
if not (true and false)
    bind x : Integer to x + 1
if not (false and false)
    bind x : Integer to x + 1
if not (true and true)
    bind x : Integer to x - 1

print(x)