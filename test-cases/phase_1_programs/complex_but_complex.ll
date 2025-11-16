; ModuleID = 'Module'
source_filename = "phase_1_programs/complex_but_complex.sl"
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
  %0 = add i32 1, 2
  %1 = add i32 %0, 3
  %2 = add i32 %1, 4
  %3 = add i32 %2, 5
  %4 = add i32 %3, 6
  %5 = add i32 %4, 7
  %6 = add i32 %5, 8
  %7 = add i32 %6, 9
  %8 = add i32 %7, 10
  %9 = add i32 %8, 11
  %10 = add i32 %9, 12
  %11 = add i32 %10, 13
  %12 = add i32 %11, 14
  %13 = add i32 %12, 15
  %14 = add i32 %13, 16
  %15 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %16 = call i32 (ptr, ...) @printf(ptr %15, i32 %14)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
