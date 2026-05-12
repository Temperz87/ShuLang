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
  br i1 %6, label %select_true76, label %select_false77

select_true10:                                    ; preds = %then7
  %7 = icmp sgt i32 10, 3
  br i1 %7, label %select_true14, label %select_false15

select_false11:                                   ; preds = %then7
  %8 = icmp sgt i32 2, 3
  br i1 %8, label %select_true25, label %select_false26

select_true14:                                    ; preds = %select_true10
  %9 = mul i32 10, 2
  br label %select_cont16

select_false15:                                   ; preds = %select_true10
  %10 = mul i32 3, 2
  br label %select_cont16

select_cont16:                                    ; preds = %select_false15, %select_true14
  %11 = phi i32 [ 6, %select_false15 ], [ 6, %select_true14 ]
  %12 = phi i32 [ 2, %select_false15 ], [ 2, %select_true14 ]
  %13 = phi i32 [ 10, %select_false15 ], [ 10, %select_true14 ]
  %14 = phi i32 [ 6, %select_false15 ], [ 6, %select_true14 ]
  %15 = phi i32 [ 3, %select_false15 ], [ 3, %select_true14 ]
  %16 = phi i32 [ %9, %select_true14 ], [ %10, %select_false15 ]
  br label %select_cont12

select_cont12:                                    ; preds = %select_cont27, %select_cont16
  %17 = phi i32 [ %32, %select_cont27 ], [ %15, %select_cont16 ]
  %18 = phi i32 [ %31, %select_cont27 ], [ %14, %select_cont16 ]
  %19 = phi i32 [ %30, %select_cont27 ], [ %13, %select_cont16 ]
  %20 = phi i32 [ %29, %select_cont27 ], [ %12, %select_cont16 ]
  %21 = phi i32 [ %28, %select_cont27 ], [ %11, %select_cont16 ]
  %22 = phi i32 [ %16, %select_cont16 ], [ %33, %select_cont27 ]
  %23 = icmp sgt i32 %22, 10
  %24 = icmp slt i32 %21, %20
  %25 = icmp ne i1 %23, %24
  br i1 %25, label %then40, label %else41

select_true25:                                    ; preds = %select_false11
  %26 = add i32 2, 3
  br label %select_cont27

select_false26:                                   ; preds = %select_false11
  %27 = sub i32 3, 2
  br label %select_cont27

select_cont27:                                    ; preds = %select_false26, %select_true25
  %28 = phi i32 [ 6, %select_false26 ], [ 6, %select_true25 ]
  %29 = phi i32 [ 2, %select_false26 ], [ 2, %select_true25 ]
  %30 = phi i32 [ 10, %select_false26 ], [ 10, %select_true25 ]
  %31 = phi i32 [ 6, %select_false26 ], [ 6, %select_true25 ]
  %32 = phi i32 [ 3, %select_false26 ], [ 3, %select_true25 ]
  %33 = phi i32 [ %26, %select_true25 ], [ %27, %select_false26 ]
  br label %select_cont12

then40:                                           ; preds = %select_cont12
  %34 = icmp sgt i32 %21, %19
  br i1 %34, label %select_true46, label %select_false47

else41:                                           ; preds = %select_cont12
  %35 = icmp slt i32 %17, %18
  br i1 %35, label %select_true59, label %select_false60

select_true46:                                    ; preds = %then40
  br label %select_cont48

select_false47:                                   ; preds = %then40
  br label %select_cont48

select_cont48:                                    ; preds = %select_false47, %select_true46
  %36 = phi i32 [ %22, %select_false47 ], [ %22, %select_true46 ]
  %37 = phi i32 [ %21, %select_true46 ], [ %19, %select_false47 ]
  %38 = add i32 %36, %37
  br label %continuation6

continuation6:                                    ; preds = %select_cont75, %select_cont61, %select_cont48
  %39 = phi i32 [ %50, %select_cont75 ], [ %43, %select_cont61 ], [ %38, %select_cont48 ]
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %then92, label %else93

select_true59:                                    ; preds = %else41
  br label %select_cont61

select_false60:                                   ; preds = %else41
  br label %select_cont61

select_cont61:                                    ; preds = %select_false60, %select_true59
  %41 = phi i32 [ %22, %select_false60 ], [ %22, %select_true59 ]
  %42 = phi i32 [ %17, %select_true59 ], [ %18, %select_false60 ]
  %43 = sub i32 %41, %42
  br label %continuation6

select_true76:                                    ; preds = %else8
  %44 = icmp ne i1 true, false
  br label %select_cont78

select_false77:                                   ; preds = %else8
  br label %select_cont78

select_cont78:                                    ; preds = %select_false77, %select_true76
  %45 = phi i32 [ 10, %select_false77 ], [ 10, %select_true76 ]
  %46 = phi i32 [ 2, %select_false77 ], [ 2, %select_true76 ]
  %47 = phi i1 [ %44, %select_true76 ], [ false, %select_false77 ]
  br i1 %47, label %select_true73, label %select_false74

select_true73:                                    ; preds = %select_cont78
  %48 = sub i32 %45, %46
  br label %select_cont75

select_false74:                                   ; preds = %select_cont78
  %49 = mul i32 %46, %45
  br label %select_cont75

select_cont75:                                    ; preds = %select_false74, %select_true73
  %50 = phi i32 [ %48, %select_true73 ], [ %49, %select_false74 ]
  br label %continuation6

then92:                                           ; preds = %continuation6
  %51 = icmp sgt i32 %39, 20
  br i1 %51, label %select_true95, label %select_false96

else93:                                           ; preds = %continuation6
  %52 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %53 = call i32 (ptr, ...) @printf(ptr %52, i32 0)
  br label %continuation91

select_true95:                                    ; preds = %then92
  br label %select_cont97

select_false96:                                   ; preds = %then92
  %54 = add i32 %39, 100
  br label %select_cont97

select_cont97:                                    ; preds = %select_false96, %select_true95
  %55 = phi i32 [ %39, %select_true95 ], [ %54, %select_false96 ]
  %56 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %57 = call i32 (ptr, ...) @printf(ptr %56, i32 %55)
  br label %continuation91

continuation91:                                   ; preds = %select_cont97, %else93
  br label %exit

exit:                                             ; preds = %continuation91
  ret i32 0
}

attributes #0 = { nounwind }
