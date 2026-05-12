; ModuleID = 'Module'
source_filename = "while-tests/a_bunch_of_nested_whiles.sl"
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

loop_condition1:                                  ; preds = %loop_continuation7, %entry
  %0 = phi i32 [ %8, %loop_continuation7 ], [ 10, %entry ]
  %1 = icmp sgt i32 %0, 1
  br i1 %1, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  br label %loop_condition5

loop_continuation3:                               ; preds = %loop_condition1
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 %0)
  br label %exit

loop_condition5:                                  ; preds = %loop_continuation11, %loop_body2
  %4 = phi i32 [ %16, %loop_continuation11 ], [ %0, %loop_body2 ]
  %5 = icmp sgt i32 %4, 4
  br i1 %5, label %loop_body6, label %loop_continuation7

loop_body6:                                       ; preds = %loop_condition5
  br label %loop_condition9

loop_continuation7:                               ; preds = %loop_condition5
  %6 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @printf(ptr %6, i32 %4)
  %8 = sub i32 %4, 1
  br label %loop_condition1

loop_condition9:                                  ; preds = %loop_body10, %loop_body6
  %9 = phi i32 [ %13, %loop_body10 ], [ %4, %loop_body6 ]
  %10 = icmp sgt i32 %9, 8
  br i1 %10, label %loop_body10, label %loop_continuation11

loop_body10:                                      ; preds = %loop_condition9
  %11 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %12 = call i32 (ptr, ...) @printf(ptr %11, i32 %9)
  %13 = sub i32 %9, 1
  br label %loop_condition9

loop_continuation11:                              ; preds = %loop_condition9
  %14 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %15 = call i32 (ptr, ...) @printf(ptr %14, i32 %9)
  %16 = sub i32 %9, 1
  br label %loop_condition5

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
