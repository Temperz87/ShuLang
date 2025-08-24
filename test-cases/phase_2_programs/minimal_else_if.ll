; ModuleID = 'Module'
source_filename = "phase_2_programs/minimal_else_if.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = select i1 true, i1 false, i1 false
  br i1 %0, label %then1, label %else2

then1:                                            ; preds = %entry
  %1 = select i1 false, ptr @printf_true_format, ptr @printf_false_format
  %2 = call i32 (ptr, ...) @printf(ptr %1)
  br label %continuation0

else2:                                            ; preds = %entry
  %3 = select i1 false, i1 true, i1 false
  br i1 %3, label %then3, label %else4

continuation0:                                    ; preds = %else4, %then3, %then1
  br label %exit

then3:                                            ; preds = %else2
  %4 = select i1 false, ptr @printf_true_format, ptr @printf_false_format
  %5 = call i32 (ptr, ...) @printf(ptr %4)
  br label %continuation0

else4:                                            ; preds = %else2
  %6 = select i1 true, ptr @printf_true_format, ptr @printf_false_format
  %7 = call i32 (ptr, ...) @printf(ptr %6)
  br label %continuation0

exit:                                             ; preds = %continuation0
  ret i32 0
}

attributes #0 = { nounwind }
