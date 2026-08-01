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
  br i1 %3, label %select_true11, label %select_false12

else8:                                            ; preds = %entry
  %4 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %5 = call i32 (ptr, ...) @printf(ptr %4, i32 2)
  %6 = icmp slt i32 2, 10
  %7 = icmp ne i1 true, false
  %8 = select i1 %6, i1 %7, i1 false
  br i1 %8, label %select_true75, label %select_false76

select_true11:                                    ; preds = %then7
  %9 = icmp sgt i32 10, 3
  br i1 %9, label %select_true16, label %select_false17

select_false12:                                   ; preds = %then7
  %10 = icmp sgt i32 2, 3
  br i1 %10, label %select_true30, label %select_false31

select_true16:                                    ; preds = %select_true11
  %11 = mul i32 10, 2
  br label %select_cont18

select_false17:                                   ; preds = %select_true11
  %12 = mul i32 3, 2
  br label %select_cont18

select_cont18:                                    ; preds = %select_false17, %select_true16
  %13 = phi i32 [ 6, %select_false17 ], [ 6, %select_true16 ]
  %14 = phi i32 [ 2, %select_false17 ], [ 2, %select_true16 ]
  %15 = phi i32 [ 10, %select_false17 ], [ 10, %select_true16 ]
  %16 = phi i32 [ 6, %select_false17 ], [ 6, %select_true16 ]
  %17 = phi i32 [ 3, %select_false17 ], [ 3, %select_true16 ]
  %18 = phi i32 [ %11, %select_true16 ], [ %12, %select_false17 ]
  br label %select_cont13

select_cont13:                                    ; preds = %select_cont32, %select_cont18
  %19 = phi i32 [ %34, %select_cont32 ], [ %17, %select_cont18 ]
  %20 = phi i32 [ %33, %select_cont32 ], [ %16, %select_cont18 ]
  %21 = phi i32 [ %32, %select_cont32 ], [ %15, %select_cont18 ]
  %22 = phi i32 [ %31, %select_cont32 ], [ %14, %select_cont18 ]
  %23 = phi i32 [ %30, %select_cont32 ], [ %13, %select_cont18 ]
  %24 = phi i32 [ %18, %select_cont18 ], [ %35, %select_cont32 ]
  %25 = icmp sgt i32 %24, 10
  %26 = icmp slt i32 %23, %22
  %27 = icmp ne i1 %25, %26
  br i1 %27, label %then49, label %else50

select_true30:                                    ; preds = %select_false12
  %28 = add i32 2, 3
  br label %select_cont32

select_false31:                                   ; preds = %select_false12
  %29 = sub i32 3, 2
  br label %select_cont32

select_cont32:                                    ; preds = %select_false31, %select_true30
  %30 = phi i32 [ 6, %select_false31 ], [ 6, %select_true30 ]
  %31 = phi i32 [ 2, %select_false31 ], [ 2, %select_true30 ]
  %32 = phi i32 [ 10, %select_false31 ], [ 10, %select_true30 ]
  %33 = phi i32 [ 6, %select_false31 ], [ 6, %select_true30 ]
  %34 = phi i32 [ 3, %select_false31 ], [ 3, %select_true30 ]
  %35 = phi i32 [ %28, %select_true30 ], [ %29, %select_false31 ]
  br label %select_cont13

then49:                                           ; preds = %select_cont13
  %36 = icmp sgt i32 %23, %21
  %37 = select i1 %36, i32 %23, i32 %21
  %38 = add i32 %24, %37
  br label %continuation48

else50:                                           ; preds = %select_cont13
  %39 = icmp slt i32 %19, %20
  %40 = select i1 %39, i32 %19, i32 %20
  %41 = sub i32 %24, %40
  br label %continuation48

continuation48:                                   ; preds = %else50, %then49
  %42 = phi i32 [ %41, %else50 ], [ %38, %then49 ]
  br label %continuation6

continuation6:                                    ; preds = %select_cont77, %continuation48
  %43 = phi i32 [ %47, %select_cont77 ], [ %42, %continuation48 ]
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %then93, label %else94

select_true75:                                    ; preds = %else8
  %45 = sub i32 10, 2
  br label %select_cont77

select_false76:                                   ; preds = %else8
  %46 = mul i32 2, 10
  br label %select_cont77

select_cont77:                                    ; preds = %select_false76, %select_true75
  %47 = phi i32 [ %45, %select_true75 ], [ %46, %select_false76 ]
  br label %continuation6

then93:                                           ; preds = %continuation6
  %48 = icmp sgt i32 %43, 20
  %49 = add i32 %43, 100
  %50 = select i1 %48, i32 %43, i32 %49
  %51 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %52 = call i32 (ptr, ...) @printf(ptr %51, i32 %50)
  br label %continuation92

else94:                                           ; preds = %continuation6
  %53 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %54 = call i32 (ptr, ...) @printf(ptr %53, i32 0)
  br label %continuation92

continuation92:                                   ; preds = %else94, %then93
  br label %exit

exit:                                             ; preds = %continuation92
  ret i32 0
}

attributes #0 = { nounwind }
