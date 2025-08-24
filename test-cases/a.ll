; ModuleID = 'Module'
source_filename = "phase_3_programs/loop_once.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %loop_condition1

loop_condition1:                                  ; preds = %loop_body2, %entry
  %0 = phi i1 [ false, %loop_body2 ], [ true, %entry ]
  br i1 %0, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 1)
  br label %loop_condition1

loop_continuation3:                               ; preds = %loop_condition1
  br label %exit

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
