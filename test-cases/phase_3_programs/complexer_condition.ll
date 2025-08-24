; ModuleID = 'Module'
source_filename = "phase_3_programs/complexer_condition.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %loop_condition1

loop_condition1:                                  ; preds = %loop_body2, %entry
  %0 = phi i32 [ %7, %loop_body2 ], [ 0, %entry ]
  %1 = icmp slt i32 %0, 5
  br i1 %1, label %select_true5, label %select_false6

select_true5:                                     ; preds = %loop_condition1
  %2 = icmp sge i32 %0, 0
  br label %select_cont4

select_false6:                                    ; preds = %loop_condition1
  br label %select_cont4

select_cont4:                                     ; preds = %select_false6, %select_true5
  %3 = phi i32 [ %0, %select_false6 ], [ %0, %select_true5 ]
  %4 = phi i1 [ %2, %select_true5 ], [ false, %select_false6 ]
  br i1 %4, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %select_cont4
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 %3)
  %7 = add i32 %3, 1
  br label %loop_condition1

loop_continuation3:                               ; preds = %select_cont4
  %8 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %9 = call i32 (ptr, ...) @printf(ptr %8, i32 %3)
  br label %exit

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
