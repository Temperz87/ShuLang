; ModuleID = 'Module'
source_filename = "phase_2_programs/another_funny_complex.sl"
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
  %0 = icmp slt i32 6, 4
  br i1 %0, label %select_true4, label %select_false5

select_true4:                                     ; preds = %entry
  br label %select_cont3

select_false5:                                    ; preds = %entry
  %1 = icmp slt i32 6, 9
  br label %select_cont3

select_cont3:                                     ; preds = %select_false5, %select_true4
  %2 = phi i1 [ true, %select_true4 ], [ %1, %select_false5 ]
  br i1 %2, label %select_true1, label %select_false2

select_true1:                                     ; preds = %select_cont3
  %3 = icmp sgt i32 2, 5
  br i1 %3, label %select_true10, label %select_false11

select_false2:                                    ; preds = %select_cont3
  br label %select_cont0

select_true10:                                    ; preds = %select_true1
  br label %select_cont9

select_false11:                                   ; preds = %select_true1
  %4 = icmp sgt i32 3, 0
  br label %select_cont9

select_cont9:                                     ; preds = %select_false11, %select_true10
  %5 = phi i1 [ true, %select_true10 ], [ %4, %select_false11 ]
  br label %select_cont0

select_cont0:                                     ; preds = %select_cont9, %select_false2
  %6 = phi i1 [ %5, %select_cont9 ], [ false, %select_false2 ]
  br i1 %6, label %then19, label %else20

then19:                                           ; preds = %select_cont0
  %7 = select i1 true, ptr @printf_true_format, ptr @printf_false_format
  %8 = call i32 (ptr, ...) @printf(ptr %7)
  br label %continuation18

else20:                                           ; preds = %select_cont0
  %9 = select i1 false, ptr @printf_true_format, ptr @printf_false_format
  %10 = call i32 (ptr, ...) @printf(ptr %9)
  br label %continuation18

continuation18:                                   ; preds = %else20, %then19
  br label %exit

exit:                                             ; preds = %continuation18
  ret i32 0
}

attributes #0 = { nounwind }
