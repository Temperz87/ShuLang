; ModuleID = 'Module'
source_filename = "phase_4_programs/factorial_input.sl"
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
  br label %loop_condition4

loop_condition4:                                  ; preds = %loop_body5, %entry
  %4 = phi i32 [ %8, %loop_body5 ], [ 1, %entry ]
  %5 = phi i32 [ %5, %loop_body5 ], [ %3, %entry ]
  %6 = phi i32 [ %9, %loop_body5 ], [ 1, %entry ]
  %7 = icmp sle i32 %6, %5
  br i1 %7, label %loop_body5, label %loop_continuation6

loop_body5:                                       ; preds = %loop_condition4
  %8 = mul i32 %4, %6
  %9 = add i32 %6, 1
  br label %loop_condition4

loop_continuation6:                               ; preds = %loop_condition4
  %10 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %11 = call i32 (ptr, ...) @printf(ptr %10, i32 %4)
  br label %exit

exit:                                             ; preds = %loop_continuation6
  ret i32 0
}

attributes #0 = { nounwind }
