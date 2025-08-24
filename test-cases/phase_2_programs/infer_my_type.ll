; ModuleID = 'Module'
source_filename = "phase_2_programs/infer_my_type.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %1 = call i32 (ptr, ...) @printf(ptr %0, i32 5)
  %2 = select i1 false, ptr @printf_true_format, ptr @printf_false_format
  %3 = call i32 (ptr, ...) @printf(ptr %2)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
