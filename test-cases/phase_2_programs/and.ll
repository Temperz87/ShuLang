; ModuleID = 'Module'
source_filename = "phase_2_programs/and.sl"
target triple = "x86_64-pc-linux-gnu"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@printf_true_format = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@printf_false_format = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

declare i32 @printf(ptr, ...)

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = select i1 true, i1 true, i1 false
  br i1 %0, label %then2, label %else3

then2:                                            ; preds = %entry
  br label %continuation1

else3:                                            ; preds = %entry
  %1 = select i1 true, i1 false, i1 false
  br i1 %1, label %then5, label %else6

continuation1:                                    ; preds = %else9, %then8, %then5, %then2
  %2 = phi i32 [ 4, %else9 ], [ 3, %then8 ], [ 2, %then5 ], [ 1, %then2 ]
  %3 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %4 = call i32 (ptr, ...) @printf(ptr %3, i32 %2)
  br label %exit

then5:                                            ; preds = %else3
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 5)
  br label %continuation1

else6:                                            ; preds = %else3
  %7 = select i1 false, i1 true, i1 false
  br i1 %7, label %then8, label %else9

then8:                                            ; preds = %else6
  %8 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %9 = call i32 (ptr, ...) @printf(ptr %8, i32 6)
  br label %continuation1

else9:                                            ; preds = %else6
  %10 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %11 = call i32 (ptr, ...) @printf(ptr %10, i32 7)
  br label %continuation1

exit:                                             ; preds = %continuation1
  ret i32 0
}

attributes #0 = { nounwind }
