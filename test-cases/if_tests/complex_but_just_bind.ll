; ModuleID = 'Module'
source_filename = "if_tests/complex_but_just_bind.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@scanf_integer_format = private unnamed_addr constant [4 x i8] c" %d\00", align 1

declare i32 @printf(ptr, ...)

declare i32 @scanf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = select i1 true, i1 false, i1 false
  %1 = select i1 false, i1 false, i1 false
  %2 = select i1 %0, i1 true, i1 %1
  %3 = select i1 true, i1 true, i1 false
  %4 = select i1 %2, i1 true, i1 %3
  %5 = select i1 %4, ptr @printf_true_format, ptr @printf_false_format
  %6 = call i32 (ptr, ...) @printf(ptr %5)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
