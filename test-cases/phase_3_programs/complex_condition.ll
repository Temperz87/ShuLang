; ModuleID = 'Module'
source_filename = "phase_3_programs/complex_condition.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %loop_condition2

loop_condition2:                                  ; preds = %loop_body3, %entry
  %0 = phi i1 [ %0, %loop_body3 ], [ false, %entry ]
  %1 = phi i1 [ false, %loop_body3 ], [ true, %entry ]
  %2 = select i1 %1, i1 true, i1 %0
  br i1 %2, label %loop_body3, label %loop_continuation4

loop_body3:                                       ; preds = %loop_condition2
  %3 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %4 = call i32 (ptr, ...) @printf(ptr %3, i32 0)
  br label %loop_condition2

loop_continuation4:                               ; preds = %loop_condition2
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 1)
  br label %exit

exit:                                             ; preds = %loop_continuation4
  ret i32 0
}

attributes #0 = { nounwind }
