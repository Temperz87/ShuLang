; ModuleID = 'Module'
source_filename = "phase_4_programs/loop_until_5.sl"
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
  %0 = phi i32 [ %5, %loop_body2 ], [ 0, %entry ]
  %1 = icmp ne i32 %0, 5
  br i1 %1, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  %2 = alloca i32, align 4
  %3 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4 = call i32 (ptr, ...) @scanf(ptr %3, ptr %2)
  %5 = load i32, ptr %2, align 4
  br label %loop_condition1

loop_continuation3:                               ; preds = %loop_condition1
  %6 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @printf(ptr %6, i32 67)
  br label %exit

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
