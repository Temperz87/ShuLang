; ModuleID = 'Module'
source_filename = "input-tests/binop_peephole_folds.sl"
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
  %4 = add i32 %3, 0
  %5 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6 = call i32 (ptr, ...) @printf(ptr %5, i32 %4)
  %7 = alloca i32, align 4
  %8 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %9 = call i32 (ptr, ...) @scanf(ptr %8, ptr %7)
  %10 = load i32, ptr %7, align 4
  %11 = add i32 0, %10
  %12 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %13 = call i32 (ptr, ...) @printf(ptr %12, i32 %11)
  %14 = alloca i32, align 4
  %15 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %16 = call i32 (ptr, ...) @scanf(ptr %15, ptr %14)
  %17 = load i32, ptr %14, align 4
  %18 = sub i32 %17, 0
  %19 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %20 = call i32 (ptr, ...) @printf(ptr %19, i32 %18)
  %21 = alloca i32, align 4
  %22 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %23 = call i32 (ptr, ...) @scanf(ptr %22, ptr %21)
  %24 = load i32, ptr %21, align 4
  %25 = mul i32 %24, 0
  %26 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %27 = call i32 (ptr, ...) @printf(ptr %26, i32 %25)
  %28 = alloca i32, align 4
  %29 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %30 = call i32 (ptr, ...) @scanf(ptr %29, ptr %28)
  %31 = load i32, ptr %28, align 4
  %32 = mul i32 0, %31
  %33 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %34 = call i32 (ptr, ...) @printf(ptr %33, i32 %32)
  %35 = alloca i32, align 4
  %36 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %37 = call i32 (ptr, ...) @scanf(ptr %36, ptr %35)
  %38 = load i32, ptr %35, align 4
  %39 = mul i32 %38, 1
  %40 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %41 = call i32 (ptr, ...) @printf(ptr %40, i32 %39)
  %42 = alloca i32, align 4
  %43 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %44 = call i32 (ptr, ...) @scanf(ptr %43, ptr %42)
  %45 = load i32, ptr %42, align 4
  %46 = mul i32 1, %45
  %47 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %48 = call i32 (ptr, ...) @printf(ptr %47, i32 %46)
  br label %exit

exit:                                             ; preds = %entry
  ret i32 0
}

attributes #0 = { nounwind }
