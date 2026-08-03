; ModuleID = 'Module'
source_filename = "function-tests/different_param_types.sl"
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
  %0 = call i32 @do_stuff(i32 5, i1 true)
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 %0)
  %3 = call i32 @do_stuff(i32 6, i1 false)
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 %3)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

define i32 @do_stuff(i32 %0, i1 %1) {
entry:
  br i1 %1, label %then1, label %else2

then1:                                            ; preds = %entry
  ret i32 %0

else2:                                            ; preds = %entry
  %2 = add i32 %0, 1
  ret i32 %2
}

attributes #0 = { nounwind }
