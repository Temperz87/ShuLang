; ModuleID = 'Module'
source_filename = "factorial.sl"
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
  %0 = call i32 @factorial(i32 5)
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 %0)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

define i32 @factorial(i32 %0) {
entry:
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then1, label %else2

then1:                                            ; preds = %entry
  ret i32 1

else2:                                            ; preds = %entry
  %2 = sub i32 %0, 1
  %3 = call i32 @factorial(i32 %2)
  %4 = mul i32 %0, %3
  ret i32 %4
}

attributes #0 = { nounwind }
