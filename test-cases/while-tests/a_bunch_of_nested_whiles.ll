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

loop_condition1:                                  ; preds = %loop_continuation8, %entry
  %0 = phi i32 [ %8, %loop_continuation8 ], [ 10, %entry ]
  %1 = icmp sgt i32 %0, 1
  br i1 %1, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  br label %loop_condition6

loop_continuation3:                               ; preds = %loop_condition1
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 %0)
  br label %exit

loop_condition6:                                  ; preds = %loop_continuation13, %loop_body2
  %4 = phi i32 [ %16, %loop_continuation13 ], [ %0, %loop_body2 ]
  %5 = icmp sgt i32 %4, 4
  br i1 %5, label %loop_body7, label %loop_continuation8

loop_body7:                                       ; preds = %loop_condition6
  br label %loop_condition11

loop_continuation8:                               ; preds = %loop_condition6
  %6 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @printf(ptr %6, i32 %4)
  %8 = sub i32 %4, 1
  br label %loop_condition1

loop_condition11:                                 ; preds = %loop_body12, %loop_body7
  %9 = phi i32 [ %13, %loop_body12 ], [ %4, %loop_body7 ]
  %10 = icmp sgt i32 %9, 8
  br i1 %10, label %loop_body12, label %loop_continuation13

loop_body12:                                      ; preds = %loop_condition11
  %11 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %12 = call i32 (ptr, ...) @printf(ptr %11, i32 %9)
  %13 = sub i32 %9, 1
  br label %loop_condition11

loop_continuation13:                              ; preds = %loop_condition11
  %14 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %15 = call i32 (ptr, ...) @printf(ptr %14, i32 %9)
  %16 = sub i32 %9, 1
  br label %loop_condition6

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
