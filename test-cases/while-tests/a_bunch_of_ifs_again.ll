; ModuleID = 'Module'
source_filename = "while-tests/a_bunch_of_ifs_again.sl"
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
  br label %loop_condition0

loop_condition0:                                  ; preds = %continuation19, %entry
  br i1 false, label %loop_body1, label %loop_continuation2

loop_body1:                                       ; preds = %loop_condition0
  br i1 false, label %then4, label %continuation3

loop_continuation2:                               ; preds = %loop_condition0
  %0 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %1 = call i32 (ptr, ...) @printf(ptr %0, i32 1)
  br label %exit

then4:                                            ; preds = %loop_body1
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 0)
  br label %continuation3

continuation3:                                    ; preds = %then4, %loop_body1
  br i1 false, label %then6, label %continuation5

then6:                                            ; preds = %continuation3
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 0)
  br label %continuation5

continuation5:                                    ; preds = %then6, %continuation3
  br i1 false, label %then8, label %continuation7

then8:                                            ; preds = %continuation5
  %6 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @printf(ptr %6, i32 0)
  br label %continuation7

continuation7:                                    ; preds = %then8, %continuation5
  br i1 false, label %then10, label %continuation9

then10:                                           ; preds = %continuation7
  %8 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %9 = call i32 (ptr, ...) @printf(ptr %8, i32 0)
  br label %continuation9

continuation9:                                    ; preds = %then10, %continuation7
  br i1 false, label %then12, label %continuation11

then12:                                           ; preds = %continuation9
  %10 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %11 = call i32 (ptr, ...) @printf(ptr %10, i32 0)
  br label %continuation11

continuation11:                                   ; preds = %then12, %continuation9
  br i1 false, label %then14, label %continuation13

then14:                                           ; preds = %continuation11
  %12 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %13 = call i32 (ptr, ...) @printf(ptr %12, i32 0)
  br label %continuation13

continuation13:                                   ; preds = %then14, %continuation11
  br i1 false, label %then16, label %continuation15

then16:                                           ; preds = %continuation13
  %14 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %15 = call i32 (ptr, ...) @printf(ptr %14, i32 0)
  br label %continuation15

continuation15:                                   ; preds = %then16, %continuation13
  br i1 false, label %then18, label %continuation17

then18:                                           ; preds = %continuation15
  %16 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %17 = call i32 (ptr, ...) @printf(ptr %16, i32 0)
  br label %continuation17

continuation17:                                   ; preds = %then18, %continuation15
  br i1 false, label %then20, label %continuation19

then20:                                           ; preds = %continuation17
  %18 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %19 = call i32 (ptr, ...) @printf(ptr %18, i32 0)
  br label %continuation19

continuation19:                                   ; preds = %then20, %continuation17
  br label %loop_condition0

exit:                                             ; preds = %loop_continuation2
  ret i32 0
}

attributes #0 = { nounwind }
