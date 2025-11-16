; ModuleID = 'Module'
source_filename = "phase_3_programs/loop_continuation.sl"
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
  br label %loop_condition1

loop_condition1:                                  ; preds = %loop_body2, %entry
  %0 = phi i32 [ %4, %loop_body2 ], [ 1, %entry ]
  %1 = icmp sle i32 %0, 5
  br i1 %1, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 %0)
  %4 = add i32 %0, 1
  br label %loop_condition1

loop_continuation3:                               ; preds = %loop_condition1
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 6)
  br label %exit

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
