; ModuleID = 'Module'
source_filename = "select-tests/select_massive.sl"
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
  %0 = icmp sgt i32 10, 5
  br i1 %0, label %select_true5, label %select_false6

select_true5:                                     ; preds = %entry
  %1 = icmp sgt i32 5, 3
  br i1 %1, label %select_true8, label %select_false9

select_false6:                                    ; preds = %entry
  %2 = icmp slt i32 10, 2
  br i1 %2, label %select_true93, label %select_false94

select_true8:                                     ; preds = %select_true5
  %3 = icmp sgt i32 3, 8
  br i1 %3, label %select_true13, label %select_false14

select_false9:                                    ; preds = %select_true5
  %4 = icmp eq i32 10, 3
  br i1 %4, label %select_true58, label %select_false59

select_true13:                                    ; preds = %select_true8
  %5 = icmp sgt i32 8, 2
  br i1 %5, label %select_true18, label %select_false19

select_false14:                                   ; preds = %select_true8
  %6 = icmp sgt i32 2, 10
  br i1 %6, label %select_true41, label %select_false42

select_true18:                                    ; preds = %select_true13
  %7 = mul i32 5, 3
  %8 = add i32 10, %7
  %9 = sub i32 %8, 8
  br label %select_cont20

select_false19:                                   ; preds = %select_true13
  %10 = mul i32 10, 5
  %11 = mul i32 3, 8
  %12 = add i32 %10, %11
  %13 = sub i32 %12, 2
  br label %select_cont20

select_cont20:                                    ; preds = %select_false19, %select_true18
  %14 = phi i32 [ %9, %select_true18 ], [ %13, %select_false19 ]
  br label %select_cont15

select_cont15:                                    ; preds = %select_cont43, %select_cont20
  %15 = phi i32 [ %14, %select_cont20 ], [ %20, %select_cont43 ]
  br label %select_cont10

select_true41:                                    ; preds = %select_false14
  %16 = mul i32 2, 2
  %17 = add i32 %16, 10
  br label %select_cont43

select_false42:                                   ; preds = %select_false14
  %18 = mul i32 8, 8
  %19 = sub i32 %18, 5
  br label %select_cont43

select_cont43:                                    ; preds = %select_false42, %select_true41
  %20 = phi i32 [ %17, %select_true41 ], [ %19, %select_false42 ]
  br label %select_cont15

select_cont10:                                    ; preds = %select_cont60, %select_cont15
  %21 = phi i32 [ %15, %select_cont15 ], [ %25, %select_cont60 ]
  br label %select_cont7

select_true58:                                    ; preds = %select_false9
  %22 = mul i32 10, 10
  %23 = mul i32 %22, 10
  br label %select_cont60

select_false59:                                   ; preds = %select_false9
  %24 = icmp ne i32 5, 8
  br i1 %24, label %select_true66, label %select_false67

select_cont60:                                    ; preds = %select_cont68, %select_true58
  %25 = phi i32 [ %23, %select_true58 ], [ %33, %select_cont68 ]
  br label %select_cont10

select_true66:                                    ; preds = %select_false59
  %26 = mul i32 5, 3
  %27 = mul i32 8, 2
  %28 = add i32 %26, %27
  br label %select_cont68

select_false67:                                   ; preds = %select_false59
  %29 = add i32 10, 5
  %30 = add i32 %29, 3
  %31 = add i32 %30, 8
  %32 = add i32 %31, 2
  br label %select_cont68

select_cont68:                                    ; preds = %select_false67, %select_true66
  %33 = phi i32 [ %28, %select_true66 ], [ %32, %select_false67 ]
  br label %select_cont60

select_cont7:                                     ; preds = %select_cont95, %select_cont10
  %34 = phi i32 [ %21, %select_cont10 ], [ %39, %select_cont95 ]
  %35 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %36 = call i32 (ptr, ...) @printf(ptr %35, i32 %34)
  br label %exit

select_true93:                                    ; preds = %select_false6
  %37 = mul i32 2, 100
  br label %select_cont95

select_false94:                                   ; preds = %select_false6
  %38 = icmp sge i32 8, 5
  br i1 %38, label %select_true100, label %select_false101

select_cont95:                                    ; preds = %select_cont102, %select_true93
  %39 = phi i32 [ %37, %select_true93 ], [ %48, %select_cont102 ]
  br label %select_cont7

select_true100:                                   ; preds = %select_false94
  %40 = icmp slt i32 3, 5
  br i1 %40, label %select_true105, label %select_false106

select_false101:                                  ; preds = %select_false94
  %41 = add i32 10, 5
  %42 = icmp eq i32 %41, 5
  br i1 %42, label %select_true118, label %select_false119

select_true105:                                   ; preds = %select_true100
  %43 = add i32 3, 1
  br label %select_cont107

select_false106:                                  ; preds = %select_true100
  %44 = sub i32 3, 1
  br label %select_cont107

select_cont107:                                   ; preds = %select_false106, %select_true105
  %45 = phi i32 [ 8, %select_false106 ], [ 8, %select_true105 ]
  %46 = phi i32 [ %43, %select_true105 ], [ %44, %select_false106 ]
  %47 = mul i32 %45, %46
  br label %select_cont102

select_cont102:                                   ; preds = %select_cont120, %select_cont107
  %48 = phi i32 [ %47, %select_cont107 ], [ %51, %select_cont120 ]
  br label %select_cont95

select_true118:                                   ; preds = %select_false101
  %49 = mul i32 10, 42
  br label %select_cont120

select_false119:                                  ; preds = %select_false101
  %50 = mul i32 5, 24
  br label %select_cont120

select_cont120:                                   ; preds = %select_false119, %select_true118
  %51 = phi i32 [ %49, %select_true118 ], [ %50, %select_false119 ]
  br label %select_cont102

exit:                                             ; preds = %select_cont7
  ret i32 0
}

attributes #0 = { nounwind }
