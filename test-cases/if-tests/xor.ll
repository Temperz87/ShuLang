; ModuleID = 'Module'
source_filename = "if-tests/xor.sl"
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
  %0 = icmp ne i1 false, true
  br i1 %0, label %then2, label %continuation1

then2:                                            ; preds = %entry
  %1 = add i32 0, 1
  br label %continuation1

continuation1:                                    ; preds = %then2, %entry
  %2 = phi i32 [ %1, %then2 ], [ 0, %entry ]
  %3 = icmp ne i1 true, false
  br i1 %3, label %then8, label %continuation7

then8:                                            ; preds = %continuation1
  %4 = add i32 %2, 1
  br label %continuation7

continuation7:                                    ; preds = %then8, %continuation1
  %5 = phi i32 [ %4, %then8 ], [ %2, %continuation1 ]
  %6 = icmp ne i1 false, false
  br i1 %6, label %then14, label %continuation13

then14:                                           ; preds = %continuation7
  %7 = sub i32 %5, 1
  br label %continuation13

continuation13:                                   ; preds = %then14, %continuation7
  %8 = phi i32 [ %7, %then14 ], [ %5, %continuation7 ]
  %9 = icmp ne i1 true, true
  br i1 %9, label %then20, label %continuation19

then20:                                           ; preds = %continuation13
  %10 = sub i32 %8, 1
  br label %continuation19

continuation19:                                   ; preds = %then20, %continuation13
  %11 = phi i32 [ %10, %then20 ], [ %8, %continuation13 ]
  %12 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %13 = call i32 (ptr, ...) @printf(ptr %12, i32 %11)
  br label %exit

exit:                                             ; preds = %continuation19
  ret i32 0
}

attributes #0 = { nounwind }
