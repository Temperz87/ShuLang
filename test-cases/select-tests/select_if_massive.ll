; ModuleID = 'Module'
source_filename = "select-tests/select_if_massive.sl"
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
  %0 = icmp sge i32 6, 2
  br i1 %0, label %then7, label %else8

then7:                                            ; preds = %entry
  %1 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @printf(ptr %1, i32 6)
  %3 = icmp eq i32 6, 6
  br i1 %3, label %select_true10, label %select_false11

else8:                                            ; preds = %entry
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 2)
  %6 = icmp slt i32 2, 10
  %7 = icmp ne i1 true, false
  %8 = select i1 %6, i1 %7, i1 false
  br i1 %8, label %select_true58, label %select_false59

select_true10:                                    ; preds = %then7
  %9 = icmp sgt i32 10, 3
  br i1 %9, label %select_true14, label %select_false15

select_false11:                                   ; preds = %then7
  %10 = icmp sgt i32 2, 3
  br i1 %10, label %select_true25, label %select_false26

select_true14:                                    ; preds = %select_true10
  %11 = mul i32 10, 2
  br label %select_cont16

select_false15:                                   ; preds = %select_true10
  %12 = mul i32 3, 2
  br label %select_cont16

select_cont16:                                    ; preds = %select_false15, %select_true14
  %13 = phi i32 [ 6, %select_false15 ], [ 6, %select_true14 ]
  %14 = phi i32 [ 2, %select_false15 ], [ 2, %select_true14 ]
  %15 = phi i32 [ 10, %select_false15 ], [ 10, %select_true14 ]
  %16 = phi i32 [ 6, %select_false15 ], [ 6, %select_true14 ]
  %17 = phi i32 [ 3, %select_false15 ], [ 3, %select_true14 ]
  %18 = phi i32 [ %11, %select_true14 ], [ %12, %select_false15 ]
  br label %select_cont12

select_cont12:                                    ; preds = %select_cont27, %select_cont16
  %19 = phi i32 [ %34, %select_cont27 ], [ %17, %select_cont16 ]
  %20 = phi i32 [ %33, %select_cont27 ], [ %16, %select_cont16 ]
  %21 = phi i32 [ %32, %select_cont27 ], [ %15, %select_cont16 ]
  %22 = phi i32 [ %31, %select_cont27 ], [ %14, %select_cont16 ]
  %23 = phi i32 [ %30, %select_cont27 ], [ %13, %select_cont16 ]
  %24 = phi i32 [ %18, %select_cont16 ], [ %35, %select_cont27 ]
  %25 = icmp sgt i32 %24, 10
  %26 = icmp slt i32 %23, %22
  %27 = icmp ne i1 %25, %26
  br i1 %27, label %then41, label %else42

select_true25:                                    ; preds = %select_false11
  %28 = add i32 2, 3
  br label %select_cont27

select_false26:                                   ; preds = %select_false11
  %29 = sub i32 3, 2
  br label %select_cont27

select_cont27:                                    ; preds = %select_false26, %select_true25
  %30 = phi i32 [ 6, %select_false26 ], [ 6, %select_true25 ]
  %31 = phi i32 [ 2, %select_false26 ], [ 2, %select_true25 ]
  %32 = phi i32 [ 10, %select_false26 ], [ 10, %select_true25 ]
  %33 = phi i32 [ 6, %select_false26 ], [ 6, %select_true25 ]
  %34 = phi i32 [ 3, %select_false26 ], [ 3, %select_true25 ]
  %35 = phi i32 [ %28, %select_true25 ], [ %29, %select_false26 ]
  br label %select_cont12

then41:                                           ; preds = %select_cont12
  %36 = icmp sgt i32 %23, %21
  %37 = select i1 %36, i32 %23, i32 %21
  %38 = add i32 %24, %37
  br label %continuation40

else42:                                           ; preds = %select_cont12
  %39 = icmp slt i32 %19, %20
  %40 = select i1 %39, i32 %19, i32 %20
  %41 = sub i32 %24, %40
  br label %continuation40

continuation40:                                   ; preds = %else42, %then41
  %42 = phi i32 [ %41, %else42 ], [ %38, %then41 ]
  br label %continuation6

continuation6:                                    ; preds = %select_cont60, %continuation40
  %43 = phi i32 [ %47, %select_cont60 ], [ %42, %continuation40 ]
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %then71, label %else72

select_true58:                                    ; preds = %else8
  %45 = sub i32 10, 2
  br label %select_cont60

select_false59:                                   ; preds = %else8
  %46 = mul i32 2, 10
  br label %select_cont60

select_cont60:                                    ; preds = %select_false59, %select_true58
  %47 = phi i32 [ %45, %select_true58 ], [ %46, %select_false59 ]
  br label %continuation6

then71:                                           ; preds = %continuation6
  %48 = icmp sgt i32 %43, 20
  %49 = add i32 %43, 100
  %50 = select i1 %48, i32 %43, i32 %49
  %51 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %52 = call i32 (ptr, ...) @printf(ptr %51, i32 %50)
  br label %continuation70

else72:                                           ; preds = %continuation6
  %53 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %54 = call i32 (ptr, ...) @printf(ptr %53, i32 0)
  br label %continuation70

continuation70:                                   ; preds = %else72, %then71
  br label %exit

exit:                                             ; preds = %continuation70
  ret i32 0
}

attributes #0 = { nounwind }
