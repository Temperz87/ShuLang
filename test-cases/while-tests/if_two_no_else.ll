; ModuleID = 'Module'
source_filename = "while-tests/if_two_no_else.sl"
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

loop_condition1:                                  ; preds = %continuation8, %entry
  %0 = phi i1 [ %4, %continuation8 ], [ true, %entry ]
  br i1 %0, label %loop_body2, label %loop_continuation3

loop_body2:                                       ; preds = %loop_condition1
  br i1 false, label %then6, label %continuation5

loop_continuation3:                               ; preds = %loop_condition1
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 1)
  br label %exit

then6:                                            ; preds = %loop_body2
  br label %continuation5

continuation5:                                    ; preds = %then6, %loop_body2
  %3 = phi i1 [ false, %then6 ], [ %0, %loop_body2 ]
  br i1 true, label %then9, label %continuation8

then9:                                            ; preds = %continuation5
  br label %continuation8

continuation8:                                    ; preds = %then9, %continuation5
  %4 = phi i1 [ false, %then9 ], [ %3, %continuation5 ]
  br label %loop_condition1

exit:                                             ; preds = %loop_continuation3
  ret i32 0
}

attributes #0 = { nounwind }
