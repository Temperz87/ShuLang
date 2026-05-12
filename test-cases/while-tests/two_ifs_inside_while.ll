; ModuleID = 'Module'
source_filename = "while-tests/two_ifs_inside_while.sl"
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

loop_condition0:                                  ; preds = %continuation5, %entry
  br i1 false, label %loop_body1, label %loop_continuation2

loop_body1:                                       ; preds = %loop_condition0
  br i1 false, label %then4, label %continuation3

loop_continuation2:                               ; preds = %loop_condition0
  br label %exit

then4:                                            ; preds = %loop_body1
  %0 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %1 = call i32 (ptr, ...) @printf(ptr %0, i32 0)
  br label %continuation3

continuation3:                                    ; preds = %then4, %loop_body1
  br i1 false, label %then6, label %continuation5

then6:                                            ; preds = %continuation3
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 0)
  br label %continuation5

continuation5:                                    ; preds = %then6, %continuation3
  br label %loop_condition0

exit:                                             ; preds = %loop_continuation2
  ret i32 0
}

attributes #0 = { nounwind }
