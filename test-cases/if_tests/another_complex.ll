; ModuleID = 'Module'
source_filename = "if_tests/another_complex.sl"
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
  %0 = icmp slt i32 3, 6
  br i1 %0, label %select_true3, label %select_false4

select_true3:                                     ; preds = %entry
  %1 = icmp slt i32 7, 10
  br label %select_cont5

select_false4:                                    ; preds = %entry
  br label %select_cont5

select_cont5:                                     ; preds = %select_false4, %select_true3
  %2 = phi i1 [ %1, %select_true3 ], [ false, %select_false4 ]
  br i1 %2, label %select_true0, label %select_false1

select_true0:                                     ; preds = %select_cont5
  br label %select_cont2

select_false1:                                    ; preds = %select_cont5
  %3 = icmp sgt i32 3, 5
  br i1 %3, label %select_true10, label %select_false11

select_cont2:                                     ; preds = %select_cont12, %select_true0
  %4 = phi i1 [ true, %select_true0 ], [ %8, %select_cont12 ]
  %5 = select i1 %4, ptr @printf_true_format, ptr @printf_false_format
  %6 = call i32 (ptr, ...) @printf(ptr %5)
  br label %exit

select_true10:                                    ; preds = %select_false1
  %7 = icmp sgt i32 5, 10
  br label %select_cont12

select_false11:                                   ; preds = %select_false1
  br label %select_cont12

select_cont12:                                    ; preds = %select_false11, %select_true10
  %8 = phi i1 [ %7, %select_true10 ], [ false, %select_false11 ]
  br label %select_cont2

exit:                                             ; preds = %select_cont2
  ret i32 0
}

attributes #0 = { nounwind }
