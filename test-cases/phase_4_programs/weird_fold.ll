; ModuleID = 'Module'
source_filename = "phase_4_programs/weird_fold.sl"
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
  %4 = add i32 1, %3
  %5 = alloca i32, align 4
  %6 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @scanf(ptr %6, ptr %5)
  %8 = load i32, ptr %5, align 4
  %9 = add i32 3, %8
  %10 = add i32 %4, %9
  %11 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %12 = call i32 (ptr, ...) @printf(ptr %11, i32 %10)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
