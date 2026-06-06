; ModuleID = 'Module'
source_filename = "input-tests/dont_del_input.sl"
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
  %0 = alloca i32, align 4
  %1 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @scanf(ptr %1, ptr %0)
  %3 = load i32, ptr %0, align 4
  %4 = mul i32 %3, 0
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 %4)
  %7 = alloca i32, align 4
  %8 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %9 = call i32 (ptr, ...) @scanf(ptr %8, ptr %7)
  %10 = load i32, ptr %7, align 4
  %11 = mul i32 0, %10
  %12 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %13 = call i32 (ptr, ...) @printf(ptr %12, i32 %11)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
