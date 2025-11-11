; ModuleID = 'Module'
source_filename = "phase_3_programs/loop_in_loop.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %loop_condition2

loop_condition2:                                  ; preds = %loop_continuation11, %entry
  %0 = phi i32 [ %6, %loop_continuation11 ], [ 1, %entry ]
  %1 = phi i32 [ %12, %loop_continuation11 ], [ 1, %entry ]
  %2 = icmp slt i32 %1, 5
  br i1 %2, label %loop_body3, label %loop_continuation4

loop_body3:                                       ; preds = %loop_condition2
  br label %loop_condition9

loop_continuation4:                               ; preds = %loop_condition2
  %3 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %4 = call i32 (ptr, ...) @printf(ptr %3, i32 %0)
  br label %exit

loop_condition9:                                  ; preds = %loop_body10, %loop_body3
  %5 = phi i32 [ %5, %loop_body10 ], [ %0, %loop_body3 ]
  %6 = phi i32 [ %10, %loop_body10 ], [ %0, %loop_body3 ]
  %7 = phi i32 [ %7, %loop_body10 ], [ %1, %loop_body3 ]
  %8 = phi i32 [ %11, %loop_body10 ], [ 0, %loop_body3 ]
  %9 = icmp slt i32 %8, %7
  br i1 %9, label %loop_body10, label %loop_continuation11

loop_body10:                                      ; preds = %loop_condition9
  %10 = add i32 %6, %5
  %11 = add i32 %8, 1
  br label %loop_condition9

loop_continuation11:                              ; preds = %loop_condition9
  %12 = add i32 %7, 1
  br label %loop_condition2

exit:                                             ; preds = %loop_continuation4
  ret i32 0
}

attributes #0 = { nounwind }
