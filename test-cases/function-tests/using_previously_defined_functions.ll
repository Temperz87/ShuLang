; ModuleID = 'Module'
source_filename = "function-tests/using_previously_defined_functions.sl"
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
  %0 = call i32 @add(i32 6, i32 7)
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 %0)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

define i32 @add(i32 %0, i32 %1) {
entry:
  %2 = call i32 @wrap_id(i32 %0)
  %3 = call i32 @wrap_id(i32 %1)
  %4 = add i32 %2, %3
  ret i32 %4
}

define internal i32 @id(i32 %0) {
entry:
  ret i32 %0
}

define internal i32 @wrap_id(i32 %0) {
entry:
  %1 = call i32 @id(i32 %0)
  ret i32 %1
}

attributes #0 = { nounwind }
