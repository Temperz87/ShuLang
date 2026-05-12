; ModuleID = 'Module'
source_filename = "if_tests/if_select_massive.sl"
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
  br i1 true, label %select_true9, label %select_false10

select_true9:                                     ; preds = %select_cont2
  %4 = select i1 true, i1 true, i1 false
  %5 = select i1 true, i1 %4, i1 false
  br label %select_cont11

select_false10:                                   ; preds = %select_cont2
  %6 = select i1 true, i1 false, i1 false
  br label %select_cont11

select_cont11:                                    ; preds = %select_false10, %select_true9
  %7 = phi i1 [ %5, %select_true9 ], [ %6, %select_false10 ]
  %8 = select i1 true, i1 %7, i1 false
  br i1 %8, label %select_true6, label %select_false7

select_true6:                                     ; preds = %select_cont11
  br i1 true, label %select_true15, label %select_false16

select_false7:                                    ; preds = %select_cont11
  br i1 true, label %select_true34, label %select_false35

select_true15:                                    ; preds = %select_true6
  %9 = select i1 true, i1 true, i1 false
  %10 = select i1 true, i1 %9, i1 false
  br label %select_cont17

select_false16:                                   ; preds = %select_true6
  %11 = select i1 true, i1 false, i1 false
  br label %select_cont17

select_cont17:                                    ; preds = %select_false16, %select_true15
  %12 = phi i1 [ %10, %select_true15 ], [ %11, %select_false16 ]
  br i1 true, label %select_true21, label %select_false22

select_true21:                                    ; preds = %select_cont17
  %13 = select i1 true, i1 true, i1 false
  %14 = select i1 true, i1 %13, i1 false
  br label %select_cont23

select_false22:                                   ; preds = %select_cont17
  %15 = select i1 true, i1 false, i1 false
  br label %select_cont23

select_cont23:                                    ; preds = %select_false22, %select_true21
  %16 = phi i1 [ %14, %select_true21 ], [ %15, %select_false22 ]
  br i1 true, label %select_true27, label %select_false28

select_true27:                                    ; preds = %select_cont23
  %17 = select i1 true, i1 true, i1 false
  %18 = select i1 true, i1 %17, i1 false
  br label %select_cont29

select_false28:                                   ; preds = %select_cont23
  %19 = select i1 true, i1 false, i1 false
  br label %select_cont29

select_cont29:                                    ; preds = %select_false28, %select_true27
  %20 = phi i1 [ %18, %select_true27 ], [ %19, %select_false28 ]
  %21 = select i1 true, i1 %12, i1 false
  %22 = select i1 true, i1 %16, i1 false
  %23 = select i1 true, i1 %20, i1 false
  %24 = select i1 %22, i1 %23, i1 false
  %25 = select i1 %21, i1 %24, i1 false
  br label %select_cont8

select_cont8:                                     ; preds = %select_cont36, %select_cont29
  %26 = phi i1 [ %25, %select_cont29 ], [ %36, %select_cont36 ]
  %27 = select i1 true, i1 %3, i1 false
  %28 = select i1 %27, i1 %26, i1 false
  %29 = select i1 %28, ptr @printf_true_format, ptr @printf_false_format
  %30 = call i32 (ptr, ...) @printf(ptr %29)
  br label %exit

select_true34:                                    ; preds = %select_false7
  %31 = select i1 true, i1 true, i1 false
  %32 = select i1 true, i1 %31, i1 false
  br label %select_cont36

select_false35:                                   ; preds = %select_false7
  %33 = select i1 true, i1 false, i1 false
  br label %select_cont36

select_cont36:                                    ; preds = %select_false35, %select_true34
  %34 = phi i1 [ %32, %select_true34 ], [ %33, %select_false35 ]
  %35 = select i1 true, i1 %34, i1 false
  %36 = select i1 %35, i1 false, i1 false
  br label %select_cont8

exit:                                             ; preds = %select_cont8
  ret i32 0
}

attributes #0 = { nounwind }
