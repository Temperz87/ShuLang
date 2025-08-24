; ModuleID = 'Module'
source_filename = "phase_2_programs/not_complex.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = select i1 false, i1 true, i1 false
  %1 = icmp eq i1 %0, false
  br i1 %1, label %then3, label %continuation2

then3:                                            ; preds = %entry
  %2 = add i32 0, 1
  br label %continuation2

continuation2:                                    ; preds = %then3, %entry
  %3 = phi i32 [ %2, %then3 ], [ 0, %entry ]
  %4 = select i1 true, i1 false, i1 false
  %5 = icmp eq i1 %4, false
  br i1 %5, label %then8, label %continuation7

then8:                                            ; preds = %continuation2
  %6 = add i32 %3, 1
  br label %continuation7

continuation7:                                    ; preds = %then8, %continuation2
  %7 = phi i32 [ %6, %then8 ], [ %3, %continuation2 ]
  %8 = select i1 false, i1 false, i1 false
  %9 = icmp eq i1 %8, false
  br i1 %9, label %then13, label %continuation12

then13:                                           ; preds = %continuation7
  %10 = add i32 %7, 1
  br label %continuation12

continuation12:                                   ; preds = %then13, %continuation7
  %11 = phi i32 [ %10, %then13 ], [ %7, %continuation7 ]
  %12 = select i1 true, i1 true, i1 false
  %13 = icmp eq i1 %12, false
  br i1 %13, label %then18, label %continuation17

then18:                                           ; preds = %continuation12
  %14 = sub i32 %11, 1
  br label %continuation17

continuation17:                                   ; preds = %then18, %continuation12
  %15 = phi i32 [ %14, %then18 ], [ %11, %continuation12 ]
  %16 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %17 = call i32 (ptr, ...) @printf(ptr %16, i32 %15)
  br label %exit

exit:                                             ; preds = %continuation17
  ret i32 0
}

attributes #0 = { nounwind }
