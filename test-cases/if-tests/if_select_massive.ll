; ModuleID = 'Module'
source_filename = "if-tests/if_select_massive.sl"
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
  br i1 true, label %select_true0, label %select_false1

select_true0:                                     ; preds = %entry
  %0 = select i1 true, i1 true, i1 false
  %1 = select i1 true, i1 %0, i1 false
  br label %select_cont2

select_false1:                                    ; preds = %entry
  %2 = select i1 true, i1 false, i1 false
  br label %select_cont2

select_cont2:                                     ; preds = %select_false1, %select_true0
  %3 = phi i1 [ %1, %select_true0 ], [ %2, %select_false1 ]
  %4 = select i1 true, i1 %3, i1 false
  br i1 true, label %select_true13, label %select_false14

select_true13:                                    ; preds = %select_cont2
  %5 = select i1 true, i1 true, i1 false
  %6 = select i1 true, i1 %5, i1 false
  br label %select_cont15

select_false14:                                   ; preds = %select_cont2
  %7 = select i1 true, i1 false, i1 false
  br label %select_cont15

select_cont15:                                    ; preds = %select_false14, %select_true13
  %8 = phi i1 [ %6, %select_true13 ], [ %7, %select_false14 ]
  %9 = select i1 true, i1 %8, i1 false
  br i1 %9, label %select_true10, label %select_false11

select_true10:                                    ; preds = %select_cont15
  br i1 true, label %select_true23, label %select_false24

select_false11:                                   ; preds = %select_cont15
  br i1 true, label %select_true56, label %select_false57

select_true23:                                    ; preds = %select_true10
  %10 = select i1 true, i1 true, i1 false
  %11 = select i1 true, i1 %10, i1 false
  br label %select_cont25

select_false24:                                   ; preds = %select_true10
  %12 = select i1 true, i1 false, i1 false
  br label %select_cont25

select_cont25:                                    ; preds = %select_false24, %select_true23
  %13 = phi i1 [ %11, %select_true23 ], [ %12, %select_false24 ]
  %14 = select i1 true, i1 %13, i1 false
  br i1 true, label %select_true33, label %select_false34

select_true33:                                    ; preds = %select_cont25
  %15 = select i1 true, i1 true, i1 false
  %16 = select i1 true, i1 %15, i1 false
  br label %select_cont35

select_false34:                                   ; preds = %select_cont25
  %17 = select i1 true, i1 false, i1 false
  br label %select_cont35

select_cont35:                                    ; preds = %select_false34, %select_true33
  %18 = phi i1 [ %16, %select_true33 ], [ %17, %select_false34 ]
  %19 = select i1 true, i1 %18, i1 false
  br i1 true, label %select_true43, label %select_false44

select_true43:                                    ; preds = %select_cont35
  %20 = select i1 true, i1 true, i1 false
  %21 = select i1 true, i1 %20, i1 false
  br label %select_cont45

select_false44:                                   ; preds = %select_cont35
  %22 = select i1 true, i1 false, i1 false
  br label %select_cont45

select_cont45:                                    ; preds = %select_false44, %select_true43
  %23 = phi i1 [ %21, %select_true43 ], [ %22, %select_false44 ]
  %24 = select i1 true, i1 %23, i1 false
  %25 = select i1 %19, i1 %24, i1 false
  %26 = select i1 %14, i1 %25, i1 false
  br label %select_cont12

select_cont12:                                    ; preds = %select_cont58, %select_cont45
  %27 = phi i1 [ %26, %select_cont45 ], [ %36, %select_cont58 ]
  %28 = select i1 %4, i1 %27, i1 false
  %29 = select i1 %28, ptr @printf_true_format, ptr @printf_false_format
  %30 = call i32 (ptr, ...) @printf(ptr %29)
  br label %exit

select_true56:                                    ; preds = %select_false11
  %31 = select i1 true, i1 true, i1 false
  %32 = select i1 true, i1 %31, i1 false
  br label %select_cont58

select_false57:                                   ; preds = %select_false11
  %33 = select i1 true, i1 false, i1 false
  br label %select_cont58

select_cont58:                                    ; preds = %select_false57, %select_true56
  %34 = phi i1 [ %32, %select_true56 ], [ %33, %select_false57 ]
  %35 = select i1 true, i1 %34, i1 false
  %36 = select i1 %35, i1 false, i1 false
  br label %select_cont12

exit:                                             ; preds = %select_cont12
  ret i32 0
}

attributes #0 = { nounwind }
