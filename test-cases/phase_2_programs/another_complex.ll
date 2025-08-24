; ModuleID = 'Module'
source_filename = "phase_2_programs/another_complex.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = icmp slt i32 3, 6
  br i1 %0, label %select_true4, label %select_false5

select_true4:                                     ; preds = %entry
  %1 = icmp slt i32 7, 10
  br label %select_cont3

select_false5:                                    ; preds = %entry
  br label %select_cont3

select_cont3:                                     ; preds = %select_false5, %select_true4
  %2 = phi i1 [ %1, %select_true4 ], [ false, %select_false5 ]
  br i1 %2, label %select_true1, label %select_false2

select_true1:                                     ; preds = %select_cont3
  br label %select_cont0

select_false2:                                    ; preds = %select_cont3
  %3 = icmp sgt i32 3, 5
  br i1 %3, label %select_true11, label %select_false12

select_cont0:                                     ; preds = %select_cont10, %select_true1
  %4 = phi i1 [ true, %select_true1 ], [ %8, %select_cont10 ]
  %5 = select i1 %4, ptr @printf_true_format, ptr @printf_false_format
  %6 = call i32 (ptr, ...) @printf(ptr %5)
  br label %exit

select_true11:                                    ; preds = %select_false2
  %7 = icmp sgt i32 5, 10
  br label %select_cont10

select_false12:                                   ; preds = %select_false2
  br label %select_cont10

select_cont10:                                    ; preds = %select_false12, %select_true11
  %8 = phi i1 [ %7, %select_true11 ], [ false, %select_false12 ]
  br label %select_cont0

exit:                                             ; preds = %select_cont0
  ret i32 0
}

attributes #0 = { nounwind }
