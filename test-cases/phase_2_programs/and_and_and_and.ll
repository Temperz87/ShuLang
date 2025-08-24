; ModuleID = 'Module'
source_filename = "phase_2_programs/and_and_and_and.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = select i1 true, i1 true, i1 false
  br i1 %0, label %select_true7, label %select_false8

select_true7:                                     ; preds = %entry
  %1 = select i1 true, i1 true, i1 false
  br label %select_cont6

select_false8:                                    ; preds = %entry
  br label %select_cont6

select_cont6:                                     ; preds = %select_false8, %select_true7
  %2 = phi i1 [ %1, %select_true7 ], [ false, %select_false8 ]
  br i1 %2, label %select_true4, label %select_false5

select_true4:                                     ; preds = %select_cont6
  %3 = select i1 true, i1 true, i1 false
  br label %select_cont3

select_false5:                                    ; preds = %select_cont6
  br label %select_cont3

select_cont3:                                     ; preds = %select_false5, %select_true4
  %4 = phi i1 [ %3, %select_true4 ], [ false, %select_false5 ]
  br i1 %4, label %select_true1, label %select_false2

select_true1:                                     ; preds = %select_cont3
  %5 = select i1 true, i1 true, i1 false
  br label %select_cont0

select_false2:                                    ; preds = %select_cont3
  br label %select_cont0

select_cont0:                                     ; preds = %select_false2, %select_true1
  %6 = phi i1 [ %5, %select_true1 ], [ false, %select_false2 ]
  %7 = select i1 %6, ptr @printf_true_format, ptr @printf_false_format
  %8 = call i32 (ptr, ...) @printf(ptr %7)
  br label %exit

exit:                                             ; preds = %select_cont0
  ret i32 0
}

attributes #0 = { nounwind }
