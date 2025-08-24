; ModuleID = 'Module'
source_filename = "phase_1_programs/racket_parenthesis_hell.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = add i32 7, 8
  %1 = mul i32 6, %0
  %2 = add i32 5, %1
  %3 = mul i32 4, %2
  %4 = add i32 3, %3
  %5 = mul i32 2, %4
  %6 = add i32 1, %5
  %7 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @printf(ptr %7, i32 %6)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
