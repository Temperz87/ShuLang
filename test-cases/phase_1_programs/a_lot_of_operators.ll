; ModuleID = 'Module'
source_filename = "phase_1_programs/a_lot_of_operators.sl"
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
  %0 = mul i32 2, 3
  %1 = mul i32 %0, 4
  %2 = add i32 1, %1
  %3 = add i32 %2, 5
  %4 = sub i32 %3, 6
  %5 = mul i32 7, 8
  %6 = add i32 %4, %5
  %7 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @printf(ptr %7, i32 %6)
  %9 = mul i32 4, 5
  %10 = mul i32 2, 3
  %11 = mul i32 %9, 5
  %12 = add i32 %10, %11
  %13 = sub i32 %12, 100
  %14 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %15 = call i32 (ptr, ...) @printf(ptr %14, i32 %13)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
