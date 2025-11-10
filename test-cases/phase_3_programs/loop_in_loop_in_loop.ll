; ModuleID = 'Module'
source_filename = "loop_in_loop_in_loop.sl"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %loop_condition1

loop_condition1:                                  ; preds = %loop_continuation9, %entry
  %0 = phi i32 [ %6, %loop_continuation9 ], [ 5, %entry ]
  %1 = icmp sgt i32 %0, 0
  br i1 %1, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  br label %loop_condition7

loop_continuation3:                               ; preds = %loop_condition1
  br label %exit

loop_condition7:                                  ; preds = %loop_continuation17, %loop_body2
  %2 = phi i32 [ %10, %loop_continuation17 ], [ 1, %loop_body2 ]
  %3 = phi i32 [ %11, %loop_continuation17 ], [ %0, %loop_body2 ]
  %4 = phi i32 [ %17, %loop_continuation17 ], [ 0, %loop_body2 ]
  %5 = icmp slt i32 %4, %3
  br i1 %5, label %loop_body8, label %loop_continuation9

loop_body8:                                       ; preds = %loop_condition7
  br label %loop_condition15

loop_continuation9:                               ; preds = %loop_condition7
  %6 = sub i32 %3, 1
  %7 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @printf(ptr %7, i32 %2)
  br label %loop_condition1

loop_condition15:                                 ; preds = %loop_body16, %loop_body8
  %9 = phi i32 [ %9, %loop_body16 ], [ %2, %loop_body8 ]
  %10 = phi i32 [ %15, %loop_body16 ], [ %2, %loop_body8 ]
  %11 = phi i32 [ %11, %loop_body16 ], [ %3, %loop_body8 ]
  %12 = phi i32 [ %12, %loop_body16 ], [ %4, %loop_body8 ]
  %13 = phi i32 [ %16, %loop_body16 ], [ 0, %loop_body8 ]
  %14 = icmp slt i32 %13, %12
  br i1 %14, label %loop_body16, label %loop_continuation17

loop_body16:                                      ; preds = %loop_condition15
  %15 = add i32 %10, %9
  %16 = add i32 %13, 1
  br label %loop_condition15

loop_continuation17:                              ; preds = %loop_condition15
  %17 = add i32 %12, 1
  br label %loop_condition7

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
