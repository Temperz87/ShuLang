; ModuleID = 'Module'
source_filename = "if-tests/merge_unphi.sl"
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
  %0 = alloca i32, align 4
  %1 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @scanf(ptr %1, ptr %0)
  %3 = load i32, ptr %0, align 4
  %4 = alloca i32, align 4
  %5 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @scanf(ptr %5, ptr %4)
  %7 = load i32, ptr %4, align 4
  %8 = alloca i32, align 4
  %9 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %10 = call i32 (ptr, ...) @scanf(ptr %9, ptr %8)
  %11 = load i32, ptr %8, align 4
  %12 = add i32 2, %11
  br i1 true, label %then9, label %else10

then9:                                            ; preds = %entry
  %13 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %14 = call i32 (ptr, ...) @printf(ptr %13, i32 0)
  br label %continuation8

else10:                                           ; preds = %entry
  %15 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %16 = call i32 (ptr, ...) @printf(ptr %15, i32 1)
  br label %continuation8

continuation8:                                    ; preds = %else10, %then9
  %17 = phi i32 [ %12, %else10 ], [ %12, %then9 ]
  %18 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %19 = call i32 (ptr, ...) @printf(ptr %18, i32 %17)
  br label %exit

exit:                                             ; preds = %continuation8
  ret i32 0
}

attributes #0 = { nounwind }
