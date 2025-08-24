; ModuleID = 'Module'
source_filename = "phase_2_programs/if_select_complex_values.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br i1 true, label %select_true1, label %select_false2

select_true1:                                     ; preds = %entry
  %0 = add i32 1, 2
  %1 = add i32 %0, 3
  br label %select_cont0

select_false2:                                    ; preds = %entry
  %2 = add i32 1, 2
  %3 = add i32 %2, 4
  br label %select_cont0

select_cont0:                                     ; preds = %select_false2, %select_true1
  %4 = phi i32 [ %1, %select_true1 ], [ %3, %select_false2 ]
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 %4)
  br label %exit

exit:                                             ; preds = %select_cont0
  ret i32 0
}

attributes #0 = { nounwind }
