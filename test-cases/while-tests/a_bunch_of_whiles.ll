; ModuleID = 'Module'
source_filename = "while-tests/a_bunch_of_whiles.sl"
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

loop_condition0:                                  ; preds = %loop_continuation62, %entry
  br i1 false, label %loop_body1, label %loop_continuation2

loop_body1:                                       ; preds = %loop_condition0
  br label %loop_condition3

loop_continuation2:                               ; preds = %loop_condition0
  %0 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %1 = call i32 (ptr, ...) @printf(ptr %0, i32 1)
  br label %exit

loop_condition3:                                  ; preds = %loop_body4, %loop_body1
  br i1 false, label %loop_body4, label %loop_continuation5

loop_body4:                                       ; preds = %loop_condition3
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 0)
  br label %loop_condition3

loop_continuation5:                               ; preds = %loop_condition3
  br label %loop_condition6

loop_condition6:                                  ; preds = %loop_body7, %loop_continuation5
  br i1 false, label %loop_body7, label %loop_continuation8

loop_body7:                                       ; preds = %loop_condition6
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 0)
  br label %loop_condition6

loop_continuation8:                               ; preds = %loop_condition6
  br label %loop_condition9

loop_condition9:                                  ; preds = %loop_body10, %loop_continuation8
  br i1 false, label %loop_body10, label %loop_continuation11

loop_body10:                                      ; preds = %loop_condition9
  %6 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @printf(ptr %6, i32 0)
  br label %loop_condition9

loop_continuation11:                              ; preds = %loop_condition9
  br label %loop_condition12

loop_condition12:                                 ; preds = %loop_body13, %loop_continuation11
  br i1 false, label %loop_body13, label %loop_continuation14

loop_body13:                                      ; preds = %loop_condition12
  %8 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %9 = call i32 (ptr, ...) @printf(ptr %8, i32 0)
  br label %loop_condition12

loop_continuation14:                              ; preds = %loop_condition12
  br label %loop_condition15

loop_condition15:                                 ; preds = %loop_body16, %loop_continuation14
  br i1 false, label %loop_body16, label %loop_continuation17

loop_body16:                                      ; preds = %loop_condition15
  %10 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %11 = call i32 (ptr, ...) @printf(ptr %10, i32 0)
  br label %loop_condition15

loop_continuation17:                              ; preds = %loop_condition15
  br label %loop_condition18

loop_condition18:                                 ; preds = %loop_body19, %loop_continuation17
  br i1 false, label %loop_body19, label %loop_continuation20

loop_body19:                                      ; preds = %loop_condition18
  %12 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %13 = call i32 (ptr, ...) @printf(ptr %12, i32 0)
  br label %loop_condition18

loop_continuation20:                              ; preds = %loop_condition18
  br label %loop_condition21

loop_condition21:                                 ; preds = %loop_body22, %loop_continuation20
  br i1 false, label %loop_body22, label %loop_continuation23

loop_body22:                                      ; preds = %loop_condition21
  %14 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %15 = call i32 (ptr, ...) @printf(ptr %14, i32 0)
  br label %loop_condition21

loop_continuation23:                              ; preds = %loop_condition21
  br label %loop_condition24

loop_condition24:                                 ; preds = %loop_body25, %loop_continuation23
  br i1 false, label %loop_body25, label %loop_continuation26

loop_body25:                                      ; preds = %loop_condition24
  %16 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %17 = call i32 (ptr, ...) @printf(ptr %16, i32 0)
  br label %loop_condition24

loop_continuation26:                              ; preds = %loop_condition24
  br label %loop_condition27

loop_condition27:                                 ; preds = %loop_body28, %loop_continuation26
  br i1 false, label %loop_body28, label %loop_continuation29

loop_body28:                                      ; preds = %loop_condition27
  %18 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %19 = call i32 (ptr, ...) @printf(ptr %18, i32 0)
  br label %loop_condition27

loop_continuation29:                              ; preds = %loop_condition27
  br label %loop_condition30

loop_condition30:                                 ; preds = %loop_body31, %loop_continuation29
  br i1 false, label %loop_body31, label %loop_continuation32

loop_body31:                                      ; preds = %loop_condition30
  %20 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %21 = call i32 (ptr, ...) @printf(ptr %20, i32 0)
  br label %loop_condition30

loop_continuation32:                              ; preds = %loop_condition30
  br label %loop_condition33

loop_condition33:                                 ; preds = %loop_body34, %loop_continuation32
  br i1 false, label %loop_body34, label %loop_continuation35

loop_body34:                                      ; preds = %loop_condition33
  %22 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %23 = call i32 (ptr, ...) @printf(ptr %22, i32 0)
  br label %loop_condition33

loop_continuation35:                              ; preds = %loop_condition33
  br label %loop_condition36

loop_condition36:                                 ; preds = %loop_body37, %loop_continuation35
  br i1 false, label %loop_body37, label %loop_continuation38

loop_body37:                                      ; preds = %loop_condition36
  %24 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %25 = call i32 (ptr, ...) @printf(ptr %24, i32 0)
  br label %loop_condition36

loop_continuation38:                              ; preds = %loop_condition36
  br label %loop_condition39

loop_condition39:                                 ; preds = %loop_body40, %loop_continuation38
  br i1 false, label %loop_body40, label %loop_continuation41

loop_body40:                                      ; preds = %loop_condition39
  %26 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %27 = call i32 (ptr, ...) @printf(ptr %26, i32 0)
  br label %loop_condition39

loop_continuation41:                              ; preds = %loop_condition39
  br label %loop_condition42

loop_condition42:                                 ; preds = %loop_body43, %loop_continuation41
  br i1 false, label %loop_body43, label %loop_continuation44

loop_body43:                                      ; preds = %loop_condition42
  %28 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %29 = call i32 (ptr, ...) @printf(ptr %28, i32 0)
  br label %loop_condition42

loop_continuation44:                              ; preds = %loop_condition42
  br label %loop_condition45

loop_condition45:                                 ; preds = %loop_body46, %loop_continuation44
  br i1 false, label %loop_body46, label %loop_continuation47

loop_body46:                                      ; preds = %loop_condition45
  %30 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %31 = call i32 (ptr, ...) @printf(ptr %30, i32 0)
  br label %loop_condition45

loop_continuation47:                              ; preds = %loop_condition45
  br label %loop_condition48

loop_condition48:                                 ; preds = %loop_body49, %loop_continuation47
  br i1 false, label %loop_body49, label %loop_continuation50

loop_body49:                                      ; preds = %loop_condition48
  %32 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %33 = call i32 (ptr, ...) @printf(ptr %32, i32 0)
  br label %loop_condition48

loop_continuation50:                              ; preds = %loop_condition48
  br label %loop_condition51

loop_condition51:                                 ; preds = %loop_body52, %loop_continuation50
  br i1 false, label %loop_body52, label %loop_continuation53

loop_body52:                                      ; preds = %loop_condition51
  %34 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %35 = call i32 (ptr, ...) @printf(ptr %34, i32 0)
  br label %loop_condition51

loop_continuation53:                              ; preds = %loop_condition51
  br label %loop_condition54

loop_condition54:                                 ; preds = %loop_body55, %loop_continuation53
  br i1 false, label %loop_body55, label %loop_continuation56

loop_body55:                                      ; preds = %loop_condition54
  %36 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %37 = call i32 (ptr, ...) @printf(ptr %36, i32 0)
  br label %loop_condition54

loop_continuation56:                              ; preds = %loop_condition54
  br label %loop_condition57

loop_condition57:                                 ; preds = %loop_body58, %loop_continuation56
  br i1 false, label %loop_body58, label %loop_continuation59

loop_body58:                                      ; preds = %loop_condition57
  %38 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %39 = call i32 (ptr, ...) @printf(ptr %38, i32 0)
  br label %loop_condition57

loop_continuation59:                              ; preds = %loop_condition57
  br label %loop_condition60

loop_condition60:                                 ; preds = %loop_body61, %loop_continuation59
  br i1 false, label %loop_body61, label %loop_continuation62

loop_body61:                                      ; preds = %loop_condition60
  %40 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %41 = call i32 (ptr, ...) @printf(ptr %40, i32 0)
  br label %loop_condition60

loop_continuation62:                              ; preds = %loop_condition60
  br label %loop_condition0

exit:                                             ; preds = %loop_continuation2
  ret i32 0
}

attributes #0 = { nounwind }
