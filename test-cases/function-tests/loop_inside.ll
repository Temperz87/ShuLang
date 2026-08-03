; ModuleID = 'Module'
source_filename = "function-tests/loop_inside.sl"
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
  %0 = call i32 @fact(i32 5)
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 %0)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

define i32 @fact(i32 %0) {
entry:
  br label %loop_condition1

loop_condition1:                                  ; preds = %loop_body2, %entry
  %1 = phi i32 [ %4, %loop_body2 ], [ 1, %entry ]
  %2 = phi i32 [ %5, %loop_body2 ], [ %0, %entry ]
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  %4 = mul i32 %1, %2
  %5 = sub i32 %2, 1
  br label %loop_condition1

loop_continuation3:                               ; preds = %loop_condition1
  ret i32 %1
}

attributes #0 = { nounwind }
