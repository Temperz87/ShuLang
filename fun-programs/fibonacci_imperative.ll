; ModuleID = 'Module'
source_filename = "fibonacci_imperative.sl"
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
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

define internal i32 @fibonacci(i32 %0) {
entry:
  %1 = icmp sle i32 %0, 0
  br i1 %1, label %then1, label %continuation0

then1:                                            ; preds = %entry
  ret i32 %0

continuation0:                                    ; preds = %entry
  br label %loop_condition5

loop_condition5:                                  ; preds = %loop_body6, %continuation0
  %2 = phi i32 [ %3, %loop_body6 ], [ 0, %continuation0 ]
  %3 = phi i32 [ %6, %loop_body6 ], [ 1, %continuation0 ]
  %4 = phi i32 [ %7, %loop_body6 ], [ %0, %continuation0 ]
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %loop_body6, label %loop_continuation7

loop_body6:                                       ; preds = %loop_condition5
  %6 = add i32 %3, %2
  %7 = sub i32 %4, 1
  br label %loop_condition5

loop_continuation7:                               ; preds = %loop_condition5
  ret i32 %3
}

attributes #0 = { nounwind }
