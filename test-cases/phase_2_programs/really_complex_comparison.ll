; ModuleID = 'Module'
source_filename = "phase_2_programs/really_complex_comparison.sl"
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
  %0 = icmp sgt i32 2, 5
  br i1 %0, label %select_true6, label %select_false7

then1:                                            ; preds = %select_cont5
  %1 = select i1 true, ptr @printf_true_format, ptr @printf_false_format
  %2 = call i32 (ptr, ...) @printf(ptr %1)
  br label %continuation0

else2:                                            ; preds = %select_cont5
  %3 = select i1 false, ptr @printf_true_format, ptr @printf_false_format
  %4 = call i32 (ptr, ...) @printf(ptr %3)
  br label %continuation0

select_true6:                                     ; preds = %entry
  br label %select_cont8

select_false7:                                    ; preds = %entry
  %5 = icmp sgt i32 3, 0
  br label %select_cont8

select_cont8:                                     ; preds = %select_false7, %select_true6
  %6 = phi i1 [ true, %select_true6 ], [ %5, %select_false7 ]
  br i1 %6, label %select_true3, label %select_false4

select_true3:                                     ; preds = %select_cont8
  %7 = icmp slt i32 6, 4
  br i1 %7, label %select_true12, label %select_false13

select_false4:                                    ; preds = %select_cont8
  br label %select_cont5

select_true12:                                    ; preds = %select_true3
  br label %select_cont14

select_false13:                                   ; preds = %select_true3
  %8 = icmp slt i32 6, 9
  br label %select_cont14

select_cont14:                                    ; preds = %select_false13, %select_true12
  %9 = phi i1 [ true, %select_true12 ], [ %8, %select_false13 ]
  br label %select_cont5

select_cont5:                                     ; preds = %select_cont14, %select_false4
  %10 = phi i1 [ %9, %select_cont14 ], [ false, %select_false4 ]
  br i1 %10, label %then1, label %else2

continuation0:                                    ; preds = %else2, %then1
  br label %exit

exit:                                             ; preds = %continuation0
  ret i32 0
}

attributes #0 = { nounwind }
