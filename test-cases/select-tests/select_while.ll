; ModuleID = 'Module'
source_filename = "select-tests/select_while.sl"
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

loop_condition1:                                  ; preds = %continuation5, %entry
  %0 = phi i1 [ false, %continuation5 ], [ true, %entry ]
  br i1 %0, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  %1 = icmp eq i32 0, 1
  %2 = icmp eq i32 0, 0
  %3 = select i1 %1, i1 true, i1 %2
  br i1 %3, label %then6, label %else7

loop_continuation3:                               ; preds = %loop_condition1
  br label %exit

then6:                                            ; preds = %loop_body2
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 1)
  br label %continuation5

else7:                                            ; preds = %loop_body2
  %6 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @printf(ptr %6, i32 0)
  br label %continuation5

continuation5:                                    ; preds = %else7, %then6
  br label %loop_condition1

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
