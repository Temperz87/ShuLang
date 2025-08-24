; ModuleID = 'Module'
source_filename = "phase_1_programs/complicated_assoc.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = add i32 4, 5
  %1 = mul i32 3, %0
  %2 = mul i32 %1, 6
  %3 = mul i32 %2, 7
  %4 = mul i32 %3, 8
  %5 = add i32 9, 10
  %6 = add i32 %4, %5
  %7 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @printf(ptr %7, i32 %6)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
