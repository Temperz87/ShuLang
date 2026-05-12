; ModuleID = 'Module'
source_filename = "while-tests/if_while_maddness.sl"
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
  %0 = phi i32 [ %14, %continuation5 ], [ 6, %entry ]
  %1 = icmp sgt i32 %0, 0
  br i1 %1, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  %2 = icmp eq i32 %0, 2
  br i1 %2, label %select_true11, label %select_false12

loop_continuation3:                               ; preds = %loop_condition1
  br label %exit

select_true11:                                    ; preds = %loop_body2
  br label %select_cont13

select_false12:                                   ; preds = %loop_body2
  %3 = icmp eq i32 %0, 4
  br label %select_cont13

select_cont13:                                    ; preds = %select_false12, %select_true11
  %4 = phi i32 [ %0, %select_false12 ], [ %0, %select_true11 ]
  %5 = phi i1 [ true, %select_true11 ], [ %3, %select_false12 ]
  br i1 %5, label %select_true8, label %select_false9

select_true8:                                     ; preds = %select_cont13
  br label %select_cont10

select_false9:                                    ; preds = %select_cont13
  %6 = icmp eq i32 %4, 6
  br label %select_cont10

select_cont10:                                    ; preds = %select_false9, %select_true8
  %7 = phi i32 [ %4, %select_false9 ], [ %4, %select_true8 ]
  %8 = phi i1 [ true, %select_true8 ], [ %6, %select_false9 ]
  br i1 %8, label %then6, label %else7

then6:                                            ; preds = %select_cont10
  %9 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %10 = call i32 (ptr, ...) @printf(ptr %9, i32 1)
  br label %continuation5

else7:                                            ; preds = %select_cont10
  %11 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %12 = call i32 (ptr, ...) @printf(ptr %11, i32 0)
  br label %continuation5

continuation5:                                    ; preds = %else7, %then6
  %13 = phi i32 [ %7, %else7 ], [ %7, %then6 ]
  %14 = sub i32 %13, 1
  br label %loop_condition1

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
