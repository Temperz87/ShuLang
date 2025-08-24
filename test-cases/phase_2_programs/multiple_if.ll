; ModuleID = 'Module'
source_filename = "phase_2_programs/multiple_if.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br i1 true, label %then1, label %continuation0

then1:                                            ; preds = %entry
  %0 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %1 = call i32 (ptr, ...) @printf(ptr %0, i32 0)
  br label %continuation0

continuation0:                                    ; preds = %then1, %entry
  br i1 true, label %then3, label %continuation2

then3:                                            ; preds = %continuation0
  %2 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %3 = call i32 (ptr, ...) @printf(ptr %2, i32 1)
  br label %continuation2

continuation2:                                    ; preds = %then3, %continuation0
  br label %exit

exit:                                             ; preds = %continuation2
  ret i32 0
}

attributes #0 = { nounwind }
