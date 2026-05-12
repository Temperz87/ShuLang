; ModuleID = 'Module'
source_filename = "while-tests/a_bunch_of_ifs.sl"
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

loop_condition0:                                  ; preds = %continuation41, %entry
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
  br i1 false, label %then22, label %continuation21

then22:                                           ; preds = %continuation19
  %20 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %21 = call i32 (ptr, ...) @printf(ptr %20, i32 0)
  br label %continuation21

continuation21:                                   ; preds = %then22, %continuation19
  br i1 false, label %then24, label %continuation23

then24:                                           ; preds = %continuation21
  %22 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %23 = call i32 (ptr, ...) @printf(ptr %22, i32 0)
  br label %continuation23

continuation23:                                   ; preds = %then24, %continuation21
  br i1 false, label %then26, label %continuation25

then26:                                           ; preds = %continuation23
  %24 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %25 = call i32 (ptr, ...) @printf(ptr %24, i32 0)
  br label %continuation25

continuation25:                                   ; preds = %then26, %continuation23
  br i1 false, label %then28, label %continuation27

then28:                                           ; preds = %continuation25
  %26 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %27 = call i32 (ptr, ...) @printf(ptr %26, i32 0)
  br label %continuation27

continuation27:                                   ; preds = %then28, %continuation25
  br i1 false, label %then30, label %continuation29

then30:                                           ; preds = %continuation27
  %28 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %29 = call i32 (ptr, ...) @printf(ptr %28, i32 0)
  br label %continuation29

continuation29:                                   ; preds = %then30, %continuation27
  br i1 false, label %then32, label %continuation31

then32:                                           ; preds = %continuation29
  %30 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %31 = call i32 (ptr, ...) @printf(ptr %30, i32 0)
  br label %continuation31

continuation31:                                   ; preds = %then32, %continuation29
  br i1 false, label %then34, label %continuation33

then34:                                           ; preds = %continuation31
  %32 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %33 = call i32 (ptr, ...) @printf(ptr %32, i32 0)
  br label %continuation33

continuation33:                                   ; preds = %then34, %continuation31
  br i1 false, label %then36, label %continuation35

then36:                                           ; preds = %continuation33
  %34 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %35 = call i32 (ptr, ...) @printf(ptr %34, i32 0)
  br label %continuation35

continuation35:                                   ; preds = %then36, %continuation33
  br i1 false, label %then38, label %continuation37

then38:                                           ; preds = %continuation35
  %36 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %37 = call i32 (ptr, ...) @printf(ptr %36, i32 0)
  br label %continuation37

continuation37:                                   ; preds = %then38, %continuation35
  br i1 false, label %then40, label %continuation39

then40:                                           ; preds = %continuation37
  %38 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %39 = call i32 (ptr, ...) @printf(ptr %38, i32 0)
  br label %continuation39

continuation39:                                   ; preds = %then40, %continuation37
  br i1 false, label %then42, label %continuation41

then42:                                           ; preds = %continuation39
  %40 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %41 = call i32 (ptr, ...) @printf(ptr %40, i32 0)
  br label %continuation41

continuation41:                                   ; preds = %then42, %continuation39
  br label %loop_condition0

exit:                                             ; preds = %loop_continuation2
  ret i32 0
}

attributes #0 = { nounwind }
