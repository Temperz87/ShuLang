; ModuleID = 'Module'
source_filename = "function-tests/loop_input.sl"
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
  %0 = call i32 @add_five_inputs()
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 %0)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

define i32 @add_five_inputs() {
entry:
  br label %loop_condition2

loop_condition2:                                  ; preds = %loop_body3, %entry
  %0 = phi i32 [ %7, %loop_body3 ], [ 0, %entry ]
  %1 = phi i32 [ %8, %loop_body3 ], [ 0, %entry ]
  %2 = icmp ne i32 %1, 5
  br i1 %2, label %loop_body3, label %loop_continuation4

loop_body3:                                       ; preds = %loop_condition2
  %3 = alloca i32, align 4
  %4 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @scanf(ptr %4, ptr %3)
  %6 = load i32, ptr %3, align 4
  %7 = add i32 %0, %6
  %8 = add i32 %1, 1
  br label %loop_condition2

loop_continuation4:                               ; preds = %loop_condition2
  ret i32 %0
}

attributes #0 = { nounwind }
