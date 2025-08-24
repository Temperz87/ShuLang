; ModuleID = 'Module'
source_filename = "phase_2_programs/geq.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = icmp sge i32 5, 4
  br i1 %0, label %then1, label %else2

then1:                                            ; preds = %entry
  %1 = icmp sge i32 5, 5
  br i1 %1, label %then3, label %else4

else2:                                            ; preds = %entry
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 2)
  br label %continuation0

then3:                                            ; preds = %then1
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 1)
  br label %continuation0

else4:                                            ; preds = %then1
  %6 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %7 = call i32 (ptr, ...) @printf(ptr %6, i32 0)
  br label %continuation0

continuation0:                                    ; preds = %else4, %then3, %else2
  br label %exit

exit:                                             ; preds = %continuation0
  ret i32 0
}

attributes #0 = { nounwind }
