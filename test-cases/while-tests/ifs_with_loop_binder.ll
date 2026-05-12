; ModuleID = 'Module'
source_filename = "while-tests/ifs_with_loop_binder.sl"
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
  br label %loop_condition1

loop_condition1:                                  ; preds = %continuation21, %entry
  %0 = phi i1 [ false, %continuation21 ], [ true, %entry ]
  br i1 %0, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  br i1 false, label %then6, label %continuation5

loop_continuation3:                               ; preds = %loop_condition1
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 1)
  br label %exit

then6:                                            ; preds = %loop_body2
  %3 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %4 = call i32 (ptr, ...) @printf(ptr %3, i32 0)
  br label %continuation5

continuation5:                                    ; preds = %then6, %loop_body2
  br i1 false, label %then8, label %continuation7

then8:                                            ; preds = %continuation5
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 0)
  br label %continuation7

continuation7:                                    ; preds = %then8, %continuation5
  br i1 false, label %then10, label %continuation9

then10:                                           ; preds = %continuation7
  %7 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @printf(ptr %7, i32 0)
  br label %continuation9

continuation9:                                    ; preds = %then10, %continuation7
  br i1 false, label %then12, label %continuation11

then12:                                           ; preds = %continuation9
  %9 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %10 = call i32 (ptr, ...) @printf(ptr %9, i32 0)
  br label %continuation11

continuation11:                                   ; preds = %then12, %continuation9
  br i1 false, label %then14, label %continuation13

then14:                                           ; preds = %continuation11
  %11 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %12 = call i32 (ptr, ...) @printf(ptr %11, i32 0)
  br label %continuation13

continuation13:                                   ; preds = %then14, %continuation11
  br i1 false, label %then16, label %continuation15

then16:                                           ; preds = %continuation13
  %13 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %14 = call i32 (ptr, ...) @printf(ptr %13, i32 0)
  br label %continuation15

continuation15:                                   ; preds = %then16, %continuation13
  br i1 false, label %then18, label %continuation17

then18:                                           ; preds = %continuation15
  %15 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %16 = call i32 (ptr, ...) @printf(ptr %15, i32 0)
  br label %continuation17

continuation17:                                   ; preds = %then18, %continuation15
  br i1 false, label %then20, label %continuation19

then20:                                           ; preds = %continuation17
  %17 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %18 = call i32 (ptr, ...) @printf(ptr %17, i32 0)
  br label %continuation19

continuation19:                                   ; preds = %then20, %continuation17
  br i1 false, label %then22, label %continuation21

then22:                                           ; preds = %continuation19
  %19 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %20 = call i32 (ptr, ...) @printf(ptr %19, i32 0)
  br label %continuation21

continuation21:                                   ; preds = %then22, %continuation19
  br label %loop_condition1

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
