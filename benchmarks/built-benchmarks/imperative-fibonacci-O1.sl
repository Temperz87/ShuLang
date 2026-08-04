; ModuleID = 'Module'
source_filename = "programs/imperative-fibonacci.sl"
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
  br label %loop_condition4

loop_continuation6:                               ; preds = %loop_condition4
  %0 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %1 = call i32 (ptr, ...) @printf(ptr %0, i32 %5)
  br label %exit

loop_body5:                                       ; preds = %loop_condition4
  %2 = add i32 %5, %4
  %3 = add i32 %7, 1
  br label %loop_condition4

loop_condition4:                                  ; preds = %loop_body5, %entry
  %4 = phi i32 [ %2, %loop_body5 ], [ 1, %entry ]
  %5 = phi i32 [ %4, %loop_body5 ], [ 0, %entry ]
  %6 = phi i32 [ 10000, %loop_body5 ], [ 10000, %entry ]
  %7 = phi i32 [ %3, %loop_body5 ], [ 0, %entry ]
  %8 = icmp ne i32 %7, 10000
  br i1 %8, label %loop_body5, label %loop_continuation6

exit:                                             ; preds = %loop_continuation6
  ret i32 0
}

attributes #0 = { nounwind }
