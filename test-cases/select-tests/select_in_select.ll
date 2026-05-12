; ModuleID = 'Module'
source_filename = "select-tests/select_in_select.sl"
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
  br i1 true, label %select_true0, label %select_false1

select_true0:                                     ; preds = %entry
  %0 = select i1 true, i32 0, i32 1
  br label %select_cont2

select_false1:                                    ; preds = %entry
  %1 = select i1 false, i32 2, i32 3
  br label %select_cont2

select_cont2:                                     ; preds = %select_false1, %select_true0
  %2 = phi i32 [ %0, %select_true0 ], [ %1, %select_false1 ]
  %3 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %4 = call i32 (ptr, ...) @printf(ptr %3, i32 %2)
  br label %exit

exit:                                             ; preds = %select_cont2
  ret i32 0
}

attributes #0 = { nounwind }
