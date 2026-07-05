; ModuleID = 'Module'
source_filename = "programs/huge-mixed-program.sl"
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
  %12 = alloca i32, align 4
  %13 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %14 = call i32 (ptr, ...) @scanf(ptr %13, ptr %12)
  %15 = load i32, ptr %12, align 4
  %16 = alloca i32, align 4
  %17 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %18 = call i32 (ptr, ...) @scanf(ptr %17, ptr %16)
  %19 = load i32, ptr %16, align 4
  %20 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %21 = call i32 (ptr, ...) @printf(ptr %20, i32 %3)
  %22 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %23 = call i32 (ptr, ...) @printf(ptr %22, i32 %7)
  %24 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %25 = call i32 (ptr, ...) @printf(ptr %24, i32 %11)
  %26 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %27 = call i32 (ptr, ...) @printf(ptr %26, i32 %15)
  %28 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %29 = call i32 (ptr, ...) @printf(ptr %28, i32 %19)
  %30 = add i32 %3, %7
  %31 = add i32 %11, %15
  %32 = add i32 %30, %31
  %33 = add i32 %32, %19
  %34 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %35 = call i32 (ptr, ...) @printf(ptr %34, i32 %33)
  %36 = sub i32 %33, %3
  %37 = sub i32 %36, %7
  %38 = sub i32 %37, %11
  %39 = sub i32 %38, %15
  %40 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %41 = call i32 (ptr, ...) @printf(ptr %40, i32 %39)
  %42 = mul i32 %3, %7
  %43 = mul i32 %11, %15
  %44 = mul i32 %42, %43
  %45 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %46 = call i32 (ptr, ...) @printf(ptr %45, i32 %44)
  %47 = icmp sgt i32 %33, 10
  %48 = icmp sge i32 %33, 15
  %49 = icmp slt i32 %3, %7
  %50 = icmp sle i32 %11, %15
  %51 = select i1 %47, ptr @printf_true_format, ptr @printf_false_format
  %52 = call i32 (ptr, ...) @printf(ptr %51)
  %53 = select i1 %48, ptr @printf_true_format, ptr @printf_false_format
  %54 = call i32 (ptr, ...) @printf(ptr %53)
  %55 = select i1 %49, ptr @printf_true_format, ptr @printf_false_format
  %56 = call i32 (ptr, ...) @printf(ptr %55)
  %57 = select i1 %50, ptr @printf_true_format, ptr @printf_false_format
  %58 = call i32 (ptr, ...) @printf(ptr %57)
  %59 = select i1 %47, i1 %48, i1 false
  %60 = select i1 %49, i1 true, i1 %50
  %61 = icmp ne i1 %59, %60
  %62 = select i1 %59, ptr @printf_true_format, ptr @printf_false_format
  %63 = call i32 (ptr, ...) @printf(ptr %62)
  %64 = select i1 %60, ptr @printf_true_format, ptr @printf_false_format
  %65 = call i32 (ptr, ...) @printf(ptr %64)
  %66 = select i1 %61, ptr @printf_true_format, ptr @printf_false_format
  %67 = call i32 (ptr, ...) @printf(ptr %66)
  %68 = select i1 %47, i32 %33, i32 %39
  %69 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %70 = call i32 (ptr, ...) @printf(ptr %69, i32 %68)
  %71 = select i1 %48, i32 %68, i32 %42
  %72 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %73 = call i32 (ptr, ...) @printf(ptr %72, i32 %71)
  br i1 %47, label %then31, label %else32

then31:                                           ; preds = %entry
  %74 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %75 = call i32 (ptr, ...) @printf(ptr %74, i32 111)
  br i1 %48, label %then33, label %else34

else32:                                           ; preds = %entry
  %76 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %77 = call i32 (ptr, ...) @printf(ptr %76, i32 666)
  br label %continuation30

then33:                                           ; preds = %then31
  %78 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %79 = call i32 (ptr, ...) @printf(ptr %78, i32 222)
  br i1 %61, label %then36, label %else37

else34:                                           ; preds = %then31
  %80 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %81 = call i32 (ptr, ...) @printf(ptr %80, i32 555)
  br label %continuation30

then36:                                           ; preds = %then33
  %82 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %83 = call i32 (ptr, ...) @printf(ptr %82, i32 333)
  br label %continuation30

else37:                                           ; preds = %then33
  %84 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %85 = call i32 (ptr, ...) @printf(ptr %84, i32 444)
  br label %continuation30

continuation30:                                   ; preds = %else37, %then36, %else34, %else32
  %86 = phi i32 [ %33, %else32 ], [ %33, %else34 ], [ %33, %else37 ], [ %33, %then36 ]
  %87 = phi i32 [ %19, %else32 ], [ %19, %else34 ], [ %19, %else37 ], [ %19, %then36 ]
  %88 = phi i32 [ %15, %else32 ], [ %15, %else34 ], [ %15, %else37 ], [ %15, %then36 ]
  %89 = phi i32 [ %11, %else32 ], [ %11, %else34 ], [ %11, %else37 ], [ %11, %then36 ]
  %90 = phi i32 [ %7, %else32 ], [ %7, %else34 ], [ %7, %else37 ], [ %7, %then36 ]
  %91 = phi i32 [ %3, %else32 ], [ %3, %else34 ], [ %3, %else37 ], [ %3, %then36 ]
  br label %loop_condition40

loop_condition40:                                 ; preds = %loop_body41, %continuation30
  %92 = phi i32 [ %92, %loop_body41 ], [ %91, %continuation30 ]
  %93 = phi i32 [ %93, %loop_body41 ], [ %90, %continuation30 ]
  %94 = phi i32 [ %94, %loop_body41 ], [ %89, %continuation30 ]
  %95 = phi i32 [ %95, %loop_body41 ], [ %88, %continuation30 ]
  %96 = phi i32 [ %96, %loop_body41 ], [ %87, %continuation30 ]
  %97 = phi i32 [ %97, %loop_body41 ], [ %86, %continuation30 ]
  %98 = phi i32 [ %102, %loop_body41 ], [ 0, %continuation30 ]
  %99 = icmp slt i32 %98, 10
  br i1 %99, label %loop_body41, label %loop_continuation42

loop_body41:                                      ; preds = %loop_condition40
  %100 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %101 = call i32 (ptr, ...) @printf(ptr %100, i32 %98)
  %102 = add i32 %98, 1
  br label %loop_condition40

loop_continuation42:                              ; preds = %loop_condition40
  %103 = add i32 %92, %93
  %104 = add i32 %103, %94
  %105 = add i32 %104, %95
  %106 = add i32 %105, %96
  %107 = mul i32 %92, %93
  %108 = mul i32 %107, %94
  %109 = mul i32 %108, %95
  %110 = mul i32 %109, %96
  %111 = sub i32 %110, %106
  %112 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %113 = call i32 (ptr, ...) @printf(ptr %112, i32 %106)
  %114 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %115 = call i32 (ptr, ...) @printf(ptr %114, i32 %110)
  %116 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %117 = call i32 (ptr, ...) @printf(ptr %116, i32 %111)
  %118 = icmp sgt i32 %106, %111
  %119 = icmp sgt i32 %111, %110
  %120 = icmp ne i1 %118, %119
  %121 = icmp eq i1 %120, false
  %122 = select i1 %118, ptr @printf_true_format, ptr @printf_false_format
  %123 = call i32 (ptr, ...) @printf(ptr %122)
  %124 = select i1 %119, ptr @printf_true_format, ptr @printf_false_format
  %125 = call i32 (ptr, ...) @printf(ptr %124)
  %126 = select i1 %120, ptr @printf_true_format, ptr @printf_false_format
  %127 = call i32 (ptr, ...) @printf(ptr %126)
  %128 = select i1 %121, ptr @printf_true_format, ptr @printf_false_format
  %129 = call i32 (ptr, ...) @printf(ptr %128)
  br i1 %118, label %select_true64, label %select_false65

select_true64:                                    ; preds = %loop_continuation42
  %130 = select i1 %120, i32 100, i32 200
  br label %select_cont66

select_false65:                                   ; preds = %loop_continuation42
  %131 = select i1 %121, i32 300, i32 400
  br label %select_cont66

select_cont66:                                    ; preds = %select_false65, %select_true64
  %132 = phi i32 [ %110, %select_false65 ], [ %110, %select_true64 ]
  %133 = phi i32 [ %106, %select_false65 ], [ %106, %select_true64 ]
  %134 = phi i32 [ %97, %select_false65 ], [ %97, %select_true64 ]
  %135 = phi i32 [ %130, %select_true64 ], [ %131, %select_false65 ]
  %136 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %137 = call i32 (ptr, ...) @printf(ptr %136, i32 %135)
  %138 = add i32 1, 1
  %139 = add i32 %138, 1
  %140 = add i32 %139, 1
  %141 = add i32 %140, 1
  %142 = add i32 %141, 1
  %143 = add i32 %142, 1
  %144 = add i32 %143, 1
  %145 = add i32 %144, 1
  %146 = add i32 %145, 1
  %147 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %148 = call i32 (ptr, ...) @printf(ptr %147, i32 %146)
  %149 = icmp sgt i32 %146, 5
  %150 = icmp slt i32 %146, 20
  %151 = select i1 %149, i1 %150, i1 false
  %152 = select i1 %149, ptr @printf_true_format, ptr @printf_false_format
  %153 = call i32 (ptr, ...) @printf(ptr %152)
  %154 = select i1 %150, ptr @printf_true_format, ptr @printf_false_format
  %155 = call i32 (ptr, ...) @printf(ptr %154)
  %156 = select i1 %151, ptr @printf_true_format, ptr @printf_false_format
  %157 = call i32 (ptr, ...) @printf(ptr %156)
  br i1 %151, label %then87, label %else88

then87:                                           ; preds = %select_cont66
  %158 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %159 = call i32 (ptr, ...) @printf(ptr %158, i32 777)
  br label %continuation86

else88:                                           ; preds = %select_cont66
  %160 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %161 = call i32 (ptr, ...) @printf(ptr %160, i32 888)
  br label %continuation86

continuation86:                                   ; preds = %else88, %then87
  %162 = phi i32 [ %132, %else88 ], [ %132, %then87 ]
  %163 = phi i32 [ %133, %else88 ], [ %133, %then87 ]
  %164 = phi i32 [ %134, %else88 ], [ %134, %then87 ]
  %165 = add i32 %164, %163
  %166 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %167 = call i32 (ptr, ...) @printf(ptr %166, i32 %165)
  %168 = sub i32 %162, %164
  %169 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %170 = call i32 (ptr, ...) @printf(ptr %169, i32 %168)
  %171 = add i32 %164, %163
  %172 = mul i32 %171, 2
  %173 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %174 = call i32 (ptr, ...) @printf(ptr %173, i32 %172)
  br label %exit

exit:                                             ; preds = %continuation86
  ret i32 0
}

attributes #0 = { nounwind }
