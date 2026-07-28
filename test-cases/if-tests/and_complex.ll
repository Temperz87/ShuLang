; ModuleID = 'Module'
source_filename = "if-tests/and_complex.sl"
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
  br i1 %0, label %then2, label %else3

then2:                                            ; preds = %entry
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 7)
  br label %continuation1

else3:                                            ; preds = %entry
  %3 = select i1 true, i1 false, i1 false
  br i1 %3, label %then6, label %else7

continuation1:                                    ; preds = %continuation5, %then2
  %4 = phi i32 [ %10, %continuation5 ], [ 2, %then2 ]
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 %4)
  br label %exit

then6:                                            ; preds = %else3
  %7 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @printf(ptr %7, i32 8)
  br label %continuation5

else7:                                            ; preds = %else3
  %9 = select i1 false, i1 false, i1 false
  br i1 %9, label %then10, label %else11

continuation5:                                    ; preds = %continuation9, %then6
  %10 = phi i32 [ %14, %continuation9 ], [ 3, %then6 ]
  br label %continuation1

then10:                                           ; preds = %else7
  %11 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %12 = call i32 (ptr, ...) @printf(ptr %11, i32 9)
  br label %continuation9

else11:                                           ; preds = %else7
  %13 = select i1 true, i1 true, i1 false
  br i1 %13, label %then14, label %else15

continuation9:                                    ; preds = %continuation13, %then10
  %14 = phi i32 [ %17, %continuation13 ], [ 4, %then10 ]
  br label %continuation5

then14:                                           ; preds = %else11
  br label %continuation13

else15:                                           ; preds = %else11
  %15 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %16 = call i32 (ptr, ...) @printf(ptr %15, i32 10)
  br label %continuation13

continuation13:                                   ; preds = %else15, %then14
  %17 = phi i32 [ 5, %else15 ], [ 1, %then14 ]
  br label %continuation9

exit:                                             ; preds = %continuation1
  ret i32 0
}

attributes #0 = { nounwind }
