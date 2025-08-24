; ModuleID = 'Module'
source_filename = "phase_2_programs/nested_if_else_continuation_into_else.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br i1 false, label %then1, label %continuation0

then1:                                            ; preds = %entry
  br i1 true, label %then2, label %else3

then2:                                            ; preds = %then1
  %0 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %1 = call i32 (ptr, ...) @printf(ptr %0, i32 1)
  br label %continuation0

else3:                                            ; preds = %then1
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 0)
  br label %continuation0

continuation0:                                    ; preds = %else3, %then2, %entry
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 2)
  br label %exit

exit:                                             ; preds = %continuation0
  ret i32 0
}

attributes #0 = { nounwind }
