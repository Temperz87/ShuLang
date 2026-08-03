; ModuleID = 'Module'
source_filename = "function-tests/input_in_function.sl"
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
  %0 = call i32 @wrap_input(i32 5)
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 %0)
  %3 = alloca i32, align 4
  %4 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @scanf(ptr %4, ptr %3)
  %6 = load i32, ptr %3, align 4
  %7 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @printf(ptr %7, i32 %6)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

define i32 @wrap_input(i32 %0) {
entry:
  %1 = alloca i32, align 4
  %2 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @scanf(ptr %2, ptr %1)
  %4 = load i32, ptr %1, align 4
  ret i32 %0
}

attributes #0 = { nounwind }
