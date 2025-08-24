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
  br i1 %0, label %then2, label %continuation1

then2:                                            ; preds = %entry
  %1 = add i32 0, 1
  br label %continuation1

continuation1:                                    ; preds = %then2, %entry
  %2 = phi i32 [ %1, %then2 ], [ 0, %entry ]
  %3 = icmp ne i1 true, false
  br i1 %3, label %then6, label %continuation5

then6:                                            ; preds = %continuation1
  %4 = add i32 %2, 1
  br label %continuation5

continuation5:                                    ; preds = %then6, %continuation1
  %5 = phi i32 [ %4, %then6 ], [ %2, %continuation1 ]
  %6 = icmp ne i1 false, false
  br i1 %6, label %then10, label %continuation9

then10:                                           ; preds = %continuation5
  %7 = sub i32 %5, 1
  br label %continuation9

continuation9:                                    ; preds = %then10, %continuation5
  %8 = phi i32 [ %7, %then10 ], [ %5, %continuation5 ]
  %9 = icmp ne i1 true, true
  br i1 %9, label %then14, label %continuation13

then14:                                           ; preds = %continuation9
  %10 = sub i32 %8, 1
  br label %continuation13

continuation13:                                   ; preds = %then14, %continuation9
  %11 = phi i32 [ %10, %then14 ], [ %8, %continuation9 ]
  %12 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %13 = call i32 (ptr, ...) @printf(ptr %12, i32 %11)
  br label %exit

exit:                                             ; preds = %continuation13
  ret i32 0
}

attributes #0 = { nounwind }
