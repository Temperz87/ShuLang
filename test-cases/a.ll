; ModuleID = 'Module'
source_filename = "phase_2_programs/xor.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = icmp ne i1 false, true
  br i1 %0, label %then697, label %continuation696

then697:                                          ; preds = %entry
  %1 = add i32 0, 1
  br label %continuation696

continuation696:                                  ; preds = %then697, %entry
  %2 = phi i32 [ %1, %then697 ], [ 0, %entry ]
  %3 = icmp ne i1 true, false
  br i1 %3, label %then702, label %continuation701

then702:                                          ; preds = %continuation696
  %4 = add i32 %2, 1
  br label %continuation701

continuation701:                                  ; preds = %then702, %continuation696
  %5 = phi i32 [ %4, %then702 ], [ %2, %continuation696 ]
  %6 = icmp ne i1 false, false
  br i1 %6, label %then707, label %continuation706

then707:                                          ; preds = %continuation701
  %7 = sub i32 %5, 1
  br label %continuation706

continuation706:                                  ; preds = %then707, %continuation701
  %8 = phi i32 [ %7, %then707 ], [ %5, %continuation701 ]
  %9 = icmp ne i1 true, true
  br i1 %9, label %then712, label %continuation711

then712:                                          ; preds = %continuation706
  %10 = sub i32 %8, 1
  br label %continuation711

continuation711:                                  ; preds = %then712, %continuation706
  %11 = phi i32 [ %10, %then712 ], [ %8, %continuation706 ]
  %12 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %13 = call i32 (ptr, ...) @printf(ptr %12, i32 %11)
  br label %exit

exit:                                             ; preds = %continuation711
  ret i32 0
}

attributes #0 = { nounwind }
