; ModuleID = 'Module'
source_filename = "if-tests/and.sl"
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
  %0 = select i1 true, i1 true, i1 false
  br i1 %0, label %then2, label %else3

then2:                                            ; preds = %entry
  br label %continuation1

else3:                                            ; preds = %entry
  %1 = select i1 true, i1 false, i1 false
  br i1 %1, label %then6, label %else7

continuation1:                                    ; preds = %continuation5, %then2
  %2 = phi i32 [ %8, %continuation5 ], [ 1, %then2 ]
  %3 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %4 = call i32 (ptr, ...) @printf(ptr %3, i32 %2)
  br label %exit

then6:                                            ; preds = %else3
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 5)
  br label %continuation5

else7:                                            ; preds = %else3
  %7 = select i1 false, i1 true, i1 false
  br i1 %7, label %then10, label %else11

continuation5:                                    ; preds = %continuation9, %then6
  %8 = phi i32 [ %13, %continuation9 ], [ 2, %then6 ]
  br label %continuation1

then10:                                           ; preds = %else7
  %9 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %10 = call i32 (ptr, ...) @printf(ptr %9, i32 6)
  br label %continuation9

else11:                                           ; preds = %else7
  %11 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %12 = call i32 (ptr, ...) @printf(ptr %11, i32 7)
  br label %continuation9

continuation9:                                    ; preds = %else11, %then10
  %13 = phi i32 [ 4, %else11 ], [ 3, %then10 ]
  br label %continuation5

exit:                                             ; preds = %continuation1
  ret i32 0
}

attributes #0 = { nounwind }
