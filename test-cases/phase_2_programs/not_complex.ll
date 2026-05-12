; ModuleID = 'Module'
source_filename = "phase_2_programs/not_complex.sl"
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
  %0 = select i1 false, i1 true, i1 false
  %1 = icmp eq i1 %0, false
  br i1 %1, label %then2, label %continuation1

then2:                                            ; preds = %entry
  %2 = add i32 0, 1
  br label %continuation1

continuation1:                                    ; preds = %then2, %entry
  %3 = phi i32 [ %2, %then2 ], [ 0, %entry ]
  %4 = select i1 true, i1 false, i1 false
  %5 = icmp eq i1 %4, false
  br i1 %5, label %then7, label %continuation6

then7:                                            ; preds = %continuation1
  %6 = add i32 %3, 1
  br label %continuation6

continuation6:                                    ; preds = %then7, %continuation1
  %7 = phi i32 [ %6, %then7 ], [ %3, %continuation1 ]
  %8 = select i1 false, i1 false, i1 false
  %9 = icmp eq i1 %8, false
  br i1 %9, label %then12, label %continuation11

then12:                                           ; preds = %continuation6
  %10 = add i32 %7, 1
  br label %continuation11

continuation11:                                   ; preds = %then12, %continuation6
  %11 = phi i32 [ %10, %then12 ], [ %7, %continuation6 ]
  %12 = select i1 true, i1 true, i1 false
  %13 = icmp eq i1 %12, false
  br i1 %13, label %then17, label %continuation16

then17:                                           ; preds = %continuation11
  %14 = sub i32 %11, 1
  br label %continuation16

continuation16:                                   ; preds = %then17, %continuation11
  %15 = phi i32 [ %14, %then17 ], [ %11, %continuation11 ]
  %16 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %17 = call i32 (ptr, ...) @printf(ptr %16, i32 %15)
  br label %exit

exit:                                             ; preds = %continuation16
  ret i32 0
}

attributes #0 = { nounwind }
