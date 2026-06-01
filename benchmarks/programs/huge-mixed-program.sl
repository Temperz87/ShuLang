bind a : Integer to read_input()
bind b : Integer to read_input()
bind c : Integer to read_input()
bind d : Integer to read_input()
bind e : Integer to read_input()

print(a)
print(b)
print(c)
print(d)
print(e)

bind sum1 to a + b
bind sum2 to c + d
bind sum3 to sum1 + sum2
bind total to sum3 + e

print(total)

bind diff1 to total - a
bind diff2 to diff1 - b
bind diff3 to diff2 - c
bind diff4 to diff3 - d

print(diff4)

bind mul1 to a * b
bind mul2 to c * d
bind mul3 to mul1 * mul2

print(mul3)

bind gt1 to total > 10
bind gt2 to total >= 15
bind lt1 to a < b
bind lt2 to c <= d

print(gt1)
print(gt2)
print(lt1)
print(lt2)

bind logic1 to gt1 and gt2
bind logic2 to lt1 or lt2
bind logic3 to logic1 xor logic2

print(logic1)
print(logic2)
print(logic3)

bind choose1 to if gt1 total diff4
print(choose1)

bind choose2 to if gt2 choose1 mul1
print(choose2)

if gt1 {
    print(111)

    if gt2 {
        print(222)

        if logic3 {
            print(333)
        } else {
            print(444)
        }
    } else {
        print(555)
    }
} else {
    print(666)
}

bind counter : Integer to 0

while counter < 10 {
    print(counter)
    bind counter to counter + 1
}

bind huge1 to (((a + b) + c) + d) + e
bind huge2 to (((a * b) * c) * d) * e
bind huge3 to huge2 - huge1

print(huge1)
print(huge2)
print(huge3)

bind cond1 to huge1 > huge3
bind cond2 to huge3 > huge2
bind cond3 to cond1 xor cond2
bind cond4 to not cond3

print(cond1)
print(cond2)
print(cond3)
print(cond4)

bind nested to
    if (cond1)
        (if cond3 100 200)
        (if cond4 300 400)

print(nested)

bind x1 to 1
bind x2 to x1 + 1
bind x3 to x2 + 1
bind x4 to x3 + 1
bind x5 to x4 + 1
bind x6 to x5 + 1
bind x7 to x6 + 1
bind x8 to x7 + 1
bind x9 to x8 + 1
bind x10 to x9 + 1

print(x10)

bind checkA to x10 > 5
bind checkB to x10 < 20
bind checkC to checkA and checkB

print(checkA)
print(checkB)
print(checkC)

if checkC {
    print(777)
} else {
    print(888)
}

print(total + huge1)
print(huge2 - total)
print((total + huge1) * 2)