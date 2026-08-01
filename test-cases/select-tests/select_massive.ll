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
  br i1 %1, label %select_true9, label %select_false10

select_false6:                                    ; preds = %entry
  %2 = icmp slt i32 10, 2
  br i1 %2, label %select_true120, label %select_false121

select_true9:                                     ; preds = %select_true5
  %3 = icmp sgt i32 3, 8
  br i1 %3, label %select_true15, label %select_false16

select_false10:                                   ; preds = %select_true5
  %4 = icmp eq i32 10, 3
  br i1 %4, label %select_true74, label %select_false75

select_true15:                                    ; preds = %select_true9
  %5 = icmp sgt i32 8, 2
  br i1 %5, label %select_true21, label %select_false22

select_false16:                                   ; preds = %select_true9
  %6 = icmp sgt i32 2, 10
  br i1 %6, label %select_true52, label %select_false53

select_true21:                                    ; preds = %select_true15
  %7 = mul i32 5, 3
  %8 = add i32 10, %7
  %9 = sub i32 %8, 8
  br label %select_cont23

select_false22:                                   ; preds = %select_true15
  %10 = mul i32 10, 5
  %11 = mul i32 3, 8
  %12 = add i32 %10, %11
  %13 = sub i32 %12, 2
  br label %select_cont23

select_cont23:                                    ; preds = %select_false22, %select_true21
  %14 = phi i32 [ %9, %select_true21 ], [ %13, %select_false22 ]
  br label %select_cont17

select_cont17:                                    ; preds = %select_cont54, %select_cont23
  %15 = phi i32 [ %14, %select_cont23 ], [ %20, %select_cont54 ]
  br label %select_cont11

select_true52:                                    ; preds = %select_false16
  %16 = mul i32 2, 2
  %17 = add i32 %16, 10
  br label %select_cont54

select_false53:                                   ; preds = %select_false16
  %18 = mul i32 8, 8
  %19 = sub i32 %18, 5
  br label %select_cont54

select_cont54:                                    ; preds = %select_false53, %select_true52
  %20 = phi i32 [ %17, %select_true52 ], [ %19, %select_false53 ]
  br label %select_cont17

select_cont11:                                    ; preds = %select_cont76, %select_cont17
  %21 = phi i32 [ %15, %select_cont17 ], [ %25, %select_cont76 ]
  br label %select_cont7

select_true74:                                    ; preds = %select_false10
  %22 = mul i32 10, 10
  %23 = mul i32 %22, 10
  br label %select_cont76

select_false75:                                   ; preds = %select_false10
  %24 = icmp ne i32 5, 8
  br i1 %24, label %select_true85, label %select_false86

select_cont76:                                    ; preds = %select_cont87, %select_true74
  %25 = phi i32 [ %23, %select_true74 ], [ %33, %select_cont87 ]
  br label %select_cont11

select_true85:                                    ; preds = %select_false75
  %26 = mul i32 5, 3
  %27 = mul i32 8, 2
  %28 = add i32 %26, %27
  br label %select_cont87

select_false86:                                   ; preds = %select_false75
  %29 = add i32 10, 5
  %30 = add i32 %29, 3
  %31 = add i32 %30, 8
  %32 = add i32 %31, 2
  br label %select_cont87

select_cont87:                                    ; preds = %select_false86, %select_true85
  %33 = phi i32 [ %28, %select_true85 ], [ %32, %select_false86 ]
  br label %select_cont76

select_cont7:                                     ; preds = %select_cont122, %select_cont11
  %34 = phi i32 [ %21, %select_cont11 ], [ %39, %select_cont122 ]
  %35 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %36 = call i32 (ptr, ...) @printf(ptr %35, i32 %34)
  br label %exit

select_true120:                                   ; preds = %select_false6
  %37 = mul i32 2, 100
  br label %select_cont122

select_false121:                                  ; preds = %select_false6
  %38 = icmp sge i32 8, 5
  br i1 %38, label %select_true129, label %select_false130

select_cont122:                                   ; preds = %select_cont131, %select_true120
  %39 = phi i32 [ %37, %select_true120 ], [ %48, %select_cont131 ]
  br label %select_cont7

select_true129:                                   ; preds = %select_false121
  %40 = icmp slt i32 3, 5
  br i1 %40, label %select_true135, label %select_false136

select_false130:                                  ; preds = %select_false121
  %41 = add i32 10, 5
  %42 = icmp eq i32 %41, 5
  br i1 %42, label %select_true152, label %select_false153

select_true135:                                   ; preds = %select_true129
  %43 = add i32 3, 1
  br label %select_cont137

select_false136:                                  ; preds = %select_true129
  %44 = sub i32 3, 1
  br label %select_cont137

select_cont137:                                   ; preds = %select_false136, %select_true135
  %45 = phi i32 [ 8, %select_false136 ], [ 8, %select_true135 ]
  %46 = phi i32 [ %43, %select_true135 ], [ %44, %select_false136 ]
  %47 = mul i32 %45, %46
  br label %select_cont131

select_cont131:                                   ; preds = %select_cont154, %select_cont137
  %48 = phi i32 [ %47, %select_cont137 ], [ %51, %select_cont154 ]
  br label %select_cont122

select_true152:                                   ; preds = %select_false130
  %49 = mul i32 10, 42
  br label %select_cont154

select_false153:                                  ; preds = %select_false130
  %50 = mul i32 5, 24
  br label %select_cont154

select_cont154:                                   ; preds = %select_false153, %select_true152
  %51 = phi i32 [ %49, %select_true152 ], [ %50, %select_false153 ]
  br label %select_cont131

exit:                                             ; preds = %select_cont7
  ret i32 0
}

attributes #0 = { nounwind }
