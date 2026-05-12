; ModuleID = 'Module'
source_filename = "phase_2_programs/if_select_massive.sl"
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
  br i1 true, label %select_true3, label %select_false4

select_true3:                                     ; preds = %entry
  br i1 true, label %select_true6, label %select_false7

select_false4:                                    ; preds = %entry
  br label %select_cont5

select_true6:                                     ; preds = %select_true3
  br i1 true, label %select_true9, label %select_false10

select_false7:                                    ; preds = %select_true3
  br i1 true, label %select_true22, label %select_false23

select_true9:                                     ; preds = %select_true6
  br i1 true, label %select_true12, label %select_false13

select_false10:                                   ; preds = %select_true6
  br label %select_cont11

select_true12:                                    ; preds = %select_true9
  br label %select_cont14

select_false13:                                   ; preds = %select_true9
  br label %select_cont14

select_cont14:                                    ; preds = %select_false13, %select_true12
  %0 = phi i1 [ true, %select_true12 ], [ false, %select_false13 ]
  br label %select_cont11

select_cont11:                                    ; preds = %select_cont14, %select_false10
  %1 = phi i1 [ %0, %select_cont14 ], [ false, %select_false10 ]
  br label %select_cont8

select_cont8:                                     ; preds = %select_cont24, %select_cont11
  %2 = phi i1 [ %1, %select_cont11 ], [ %3, %select_cont24 ]
  br label %select_cont5

select_true22:                                    ; preds = %select_false7
  br label %select_cont24

select_false23:                                   ; preds = %select_false7
  br label %select_cont24

select_cont24:                                    ; preds = %select_false23, %select_true22
  %3 = phi i1 [ false, %select_true22 ], [ false, %select_false23 ]
  br label %select_cont8

select_cont5:                                     ; preds = %select_cont8, %select_false4
  %4 = phi i1 [ %2, %select_cont8 ], [ false, %select_false4 ]
  br i1 %4, label %select_true0, label %select_false1

select_true0:                                     ; preds = %select_cont5
  br i1 true, label %select_true36, label %select_false37

select_false1:                                    ; preds = %select_cont5
  br label %select_cont2

select_true36:                                    ; preds = %select_true0
  br i1 true, label %select_true39, label %select_false40

select_false37:                                   ; preds = %select_true0
  br label %select_cont38

select_true39:                                    ; preds = %select_true36
  br i1 true, label %select_true42, label %select_false43

select_false40:                                   ; preds = %select_true36
  br i1 true, label %select_true55, label %select_false56

select_true42:                                    ; preds = %select_true39
  br i1 true, label %select_true45, label %select_false46

select_false43:                                   ; preds = %select_true39
  br label %select_cont44

select_true45:                                    ; preds = %select_true42
  br label %select_cont47

select_false46:                                   ; preds = %select_true42
  br label %select_cont47

select_cont47:                                    ; preds = %select_false46, %select_true45
  %5 = phi i1 [ true, %select_true45 ], [ false, %select_false46 ]
  br label %select_cont44

select_cont44:                                    ; preds = %select_cont47, %select_false43
  %6 = phi i1 [ %5, %select_cont47 ], [ false, %select_false43 ]
  br label %select_cont41

select_cont41:                                    ; preds = %select_cont57, %select_cont44
  %7 = phi i1 [ %6, %select_cont44 ], [ %8, %select_cont57 ]
  br label %select_cont38

select_true55:                                    ; preds = %select_false40
  br label %select_cont57

select_false56:                                   ; preds = %select_false40
  br label %select_cont57

select_cont57:                                    ; preds = %select_false56, %select_true55
  %8 = phi i1 [ false, %select_true55 ], [ false, %select_false56 ]
  br label %select_cont41

select_cont38:                                    ; preds = %select_cont41, %select_false37
  %9 = phi i1 [ %7, %select_cont41 ], [ false, %select_false37 ]
  br i1 %9, label %select_true33, label %select_false34

select_true33:                                    ; preds = %select_cont38
  br i1 true, label %select_true69, label %select_false70

select_false34:                                   ; preds = %select_cont38
  br i1 true, label %select_true172, label %select_false173

select_true69:                                    ; preds = %select_true33
  br i1 true, label %select_true72, label %select_false73

select_false70:                                   ; preds = %select_true33
  br label %select_cont71

select_true72:                                    ; preds = %select_true69
  br i1 true, label %select_true75, label %select_false76

select_false73:                                   ; preds = %select_true69
  br i1 true, label %select_true88, label %select_false89

select_true75:                                    ; preds = %select_true72
  br i1 true, label %select_true78, label %select_false79

select_false76:                                   ; preds = %select_true72
  br label %select_cont77

select_true78:                                    ; preds = %select_true75
  br label %select_cont80

select_false79:                                   ; preds = %select_true75
  br label %select_cont80

select_cont80:                                    ; preds = %select_false79, %select_true78
  %10 = phi i1 [ true, %select_true78 ], [ false, %select_false79 ]
  br label %select_cont77

select_cont77:                                    ; preds = %select_cont80, %select_false76
  %11 = phi i1 [ %10, %select_cont80 ], [ false, %select_false76 ]
  br label %select_cont74

select_cont74:                                    ; preds = %select_cont90, %select_cont77
  %12 = phi i1 [ %11, %select_cont77 ], [ %13, %select_cont90 ]
  br label %select_cont71

select_true88:                                    ; preds = %select_false73
  br label %select_cont90

select_false89:                                   ; preds = %select_false73
  br label %select_cont90

select_cont90:                                    ; preds = %select_false89, %select_true88
  %13 = phi i1 [ false, %select_true88 ], [ false, %select_false89 ]
  br label %select_cont74

select_cont71:                                    ; preds = %select_cont74, %select_false70
  %14 = phi i1 [ %12, %select_cont74 ], [ false, %select_false70 ]
  br i1 %14, label %select_true66, label %select_false67

select_true66:                                    ; preds = %select_cont71
  br i1 true, label %select_true102, label %select_false103

select_false67:                                   ; preds = %select_cont71
  br label %select_cont68

select_true102:                                   ; preds = %select_true66
  br i1 true, label %select_true105, label %select_false106

select_false103:                                  ; preds = %select_true66
  br label %select_cont104

select_true105:                                   ; preds = %select_true102
  br i1 true, label %select_true108, label %select_false109

select_false106:                                  ; preds = %select_true102
  br i1 true, label %select_true121, label %select_false122

select_true108:                                   ; preds = %select_true105
  br i1 true, label %select_true111, label %select_false112

select_false109:                                  ; preds = %select_true105
  br label %select_cont110

select_true111:                                   ; preds = %select_true108
  br label %select_cont113

select_false112:                                  ; preds = %select_true108
  br label %select_cont113

select_cont113:                                   ; preds = %select_false112, %select_true111
  %15 = phi i1 [ true, %select_true111 ], [ false, %select_false112 ]
  br label %select_cont110

select_cont110:                                   ; preds = %select_cont113, %select_false109
  %16 = phi i1 [ %15, %select_cont113 ], [ false, %select_false109 ]
  br label %select_cont107

select_cont107:                                   ; preds = %select_cont123, %select_cont110
  %17 = phi i1 [ %16, %select_cont110 ], [ %18, %select_cont123 ]
  br label %select_cont104

select_true121:                                   ; preds = %select_false106
  br label %select_cont123

select_false122:                                  ; preds = %select_false106
  br label %select_cont123

select_cont123:                                   ; preds = %select_false122, %select_true121
  %18 = phi i1 [ false, %select_true121 ], [ false, %select_false122 ]
  br label %select_cont107

select_cont104:                                   ; preds = %select_cont107, %select_false103
  %19 = phi i1 [ %17, %select_cont107 ], [ false, %select_false103 ]
  br i1 %19, label %select_true99, label %select_false100

select_true99:                                    ; preds = %select_cont104
  br i1 true, label %select_true132, label %select_false133

select_false100:                                  ; preds = %select_cont104
  br label %select_cont101

select_true132:                                   ; preds = %select_true99
  br i1 true, label %select_true135, label %select_false136

select_false133:                                  ; preds = %select_true99
  br label %select_cont134

select_true135:                                   ; preds = %select_true132
  br i1 true, label %select_true138, label %select_false139

select_false136:                                  ; preds = %select_true132
  br i1 true, label %select_true151, label %select_false152

select_true138:                                   ; preds = %select_true135
  br i1 true, label %select_true141, label %select_false142

select_false139:                                  ; preds = %select_true135
  br label %select_cont140

select_true141:                                   ; preds = %select_true138
  br label %select_cont143

select_false142:                                  ; preds = %select_true138
  br label %select_cont143

select_cont143:                                   ; preds = %select_false142, %select_true141
  %20 = phi i1 [ true, %select_true141 ], [ false, %select_false142 ]
  br label %select_cont140

select_cont140:                                   ; preds = %select_cont143, %select_false139
  %21 = phi i1 [ %20, %select_cont143 ], [ false, %select_false139 ]
  br label %select_cont137

select_cont137:                                   ; preds = %select_cont153, %select_cont140
  %22 = phi i1 [ %21, %select_cont140 ], [ %23, %select_cont153 ]
  br label %select_cont134

select_true151:                                   ; preds = %select_false136
  br label %select_cont153

select_false152:                                  ; preds = %select_false136
  br label %select_cont153

select_cont153:                                   ; preds = %select_false152, %select_true151
  %23 = phi i1 [ false, %select_true151 ], [ false, %select_false152 ]
  br label %select_cont137

select_cont134:                                   ; preds = %select_cont137, %select_false133
  %24 = phi i1 [ %22, %select_cont137 ], [ false, %select_false133 ]
  br label %select_cont101

select_cont101:                                   ; preds = %select_cont134, %select_false100
  %25 = phi i1 [ %24, %select_cont134 ], [ false, %select_false100 ]
  br label %select_cont68

select_cont68:                                    ; preds = %select_cont101, %select_false67
  %26 = phi i1 [ %25, %select_cont101 ], [ false, %select_false67 ]
  br label %select_cont35

select_cont35:                                    ; preds = %select_cont171, %select_cont68
  %27 = phi i1 [ %26, %select_cont68 ], [ %33, %select_cont171 ]
  br label %select_cont2

select_true172:                                   ; preds = %select_false34
  br i1 true, label %select_true175, label %select_false176

select_false173:                                  ; preds = %select_false34
  br label %select_cont174

select_true175:                                   ; preds = %select_true172
  br i1 true, label %select_true178, label %select_false179

select_false176:                                  ; preds = %select_true172
  br i1 true, label %select_true191, label %select_false192

select_true178:                                   ; preds = %select_true175
  br i1 true, label %select_true181, label %select_false182

select_false179:                                  ; preds = %select_true175
  br label %select_cont180

select_true181:                                   ; preds = %select_true178
  br label %select_cont183

select_false182:                                  ; preds = %select_true178
  br label %select_cont183

select_cont183:                                   ; preds = %select_false182, %select_true181
  %28 = phi i1 [ true, %select_true181 ], [ false, %select_false182 ]
  br label %select_cont180

select_cont180:                                   ; preds = %select_cont183, %select_false179
  %29 = phi i1 [ %28, %select_cont183 ], [ false, %select_false179 ]
  br label %select_cont177

select_cont177:                                   ; preds = %select_cont193, %select_cont180
  %30 = phi i1 [ %29, %select_cont180 ], [ %31, %select_cont193 ]
  br label %select_cont174

select_true191:                                   ; preds = %select_false176
  br label %select_cont193

select_false192:                                  ; preds = %select_false176
  br label %select_cont193

select_cont193:                                   ; preds = %select_false192, %select_true191
  %31 = phi i1 [ false, %select_true191 ], [ false, %select_false192 ]
  br label %select_cont177

select_cont174:                                   ; preds = %select_cont177, %select_false173
  %32 = phi i1 [ %30, %select_cont177 ], [ false, %select_false173 ]
  br i1 %32, label %select_true169, label %select_false170

select_true169:                                   ; preds = %select_cont174
  br label %select_cont171

select_false170:                                  ; preds = %select_cont174
  br label %select_cont171

select_cont171:                                   ; preds = %select_false170, %select_true169
  %33 = phi i1 [ false, %select_true169 ], [ false, %select_false170 ]
  br label %select_cont35

select_cont2:                                     ; preds = %select_cont35, %select_false1
  %34 = phi i1 [ %27, %select_cont35 ], [ false, %select_false1 ]
  %35 = select i1 %34, ptr @printf_true_format, ptr @printf_false_format
  %36 = call i32 (ptr, ...) @printf(ptr %35)
  br label %exit

exit:                                             ; preds = %select_cont2
  ret i32 0
}

attributes #0 = { nounwind }
