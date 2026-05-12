; ModuleID = 'Module'
source_filename = "if_tests/really_complex_comparison.sl"
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
  %0 = icmp sgt i32 2, 5
  %1 = icmp sgt i32 3, 0
  %2 = select i1 %0, i1 true, i1 %1
  %3 = icmp slt i32 6, 4
  %4 = icmp slt i32 6, 9
  %5 = select i1 %3, i1 true, i1 %4
  %6 = select i1 %2, i1 %5, i1 false
  br i1 %6, label %then1, label %else2

then1:                                            ; preds = %entry
  %7 = select i1 true, ptr @printf_true_format, ptr @printf_false_format
  %8 = call i32 (ptr, ...) @printf(ptr %7)
  br label %continuation0

else2:                                            ; preds = %entry
  %9 = select i1 false, ptr @printf_true_format, ptr @printf_false_format
  %10 = call i32 (ptr, ...) @printf(ptr %9)
  br label %continuation0

continuation0:                                    ; preds = %else2, %then1
  br label %exit

exit:                                             ; preds = %continuation0
  ret i32 0
}

attributes #0 = { nounwind }
