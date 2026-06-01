bind sum : Integer to 0
bind i : Integer to 0
while i < 100000000 {
    bind sum to sum + i
    bind i to i + 1
}
print(sum)

