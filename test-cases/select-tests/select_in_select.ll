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
  br i1 true, label %select_true3, label %select_false4

select_false1:                                    ; preds = %entry
  br i1 false, label %select_true10, label %select_false11

select_true3:                                     ; preds = %select_true0
  br label %select_cont5

select_false4:                                    ; preds = %select_true0
  br label %select_cont5

select_cont5:                                     ; preds = %select_false4, %select_true3
  %0 = phi i32 [ 0, %select_true3 ], [ 1, %select_false4 ]
  br label %select_cont2

select_cont2:                                     ; preds = %select_cont12, %select_cont5
  %1 = phi i32 [ %0, %select_cont5 ], [ %4, %select_cont12 ]
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 %1)
  br label %exit

select_true10:                                    ; preds = %select_false1
  br label %select_cont12

select_false11:                                   ; preds = %select_false1
  br label %select_cont12

select_cont12:                                    ; preds = %select_false11, %select_true10
  %4 = phi i32 [ 2, %select_true10 ], [ 3, %select_false11 ]
  br label %select_cont2

exit:                                             ; preds = %select_cont2
  ret i32 0
}

attributes #0 = { nounwind }
