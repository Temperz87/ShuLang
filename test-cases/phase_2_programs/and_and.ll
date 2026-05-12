; ModuleID = 'Module'
source_filename = "phase_2_programs/and_and.sl"
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
  %0 = select i1 true, i1 true, i1 false
  br i1 %0, label %select_true0, label %select_false1

select_true0:                                     ; preds = %entry
  %1 = select i1 true, i1 true, i1 false
  br label %select_cont2

select_false1:                                    ; preds = %entry
  br label %select_cont2

select_cont2:                                     ; preds = %select_false1, %select_true0
  %2 = phi i1 [ %1, %select_true0 ], [ false, %select_false1 ]
  %3 = select i1 %2, ptr @printf_true_format, ptr @printf_false_format
  %4 = call i32 (ptr, ...) @printf(ptr %3)
  br label %exit

exit:                                             ; preds = %select_cont2
  ret i32 0
}

attributes #0 = { nounwind }
