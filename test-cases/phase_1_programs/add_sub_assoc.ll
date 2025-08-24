; ModuleID = 'Module'
source_filename = "phase_1_programs/add_sub_assoc.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = add i32 1, 24
  %1 = add i32 %0, 5
  %2 = sub i32 %1, 6
  %3 = add i32 %2, 56
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 %3)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
