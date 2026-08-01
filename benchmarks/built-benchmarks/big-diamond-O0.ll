; ModuleID = 'Module'
source_filename = "programs/big-diamond.sl"
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
  br i1 true, label %then2, label %else3

then2:                                            ; preds = %entry
  br label %continuation1

else3:                                            ; preds = %entry
  %0 = alloca i32, align 4
  %1 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2 = call i32 (ptr, ...) @scanf(ptr %1, ptr %0)
  %3 = load i32, ptr %0, align 4
  %4 = icmp eq i32 %3, 0
  br label %continuation1

continuation1:                                    ; preds = %else3, %then2
  %5 = phi i1 [ %4, %else3 ], [ true, %then2 ]
  br i1 %5, label %then9, label %else10

then9:                                            ; preds = %continuation1
  br label %continuation8

else10:                                           ; preds = %continuation1
  %6 = alloca i32, align 4
  %7 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @scanf(ptr %7, ptr %6)
  %9 = load i32, ptr %6, align 4
  %10 = icmp eq i32 %9, 0
  br label %continuation8

continuation8:                                    ; preds = %else10, %then9
  %11 = phi i1 [ %10, %else10 ], [ true, %then9 ]
  br i1 %11, label %then17, label %else18

then17:                                           ; preds = %continuation8
  br label %continuation16

else18:                                           ; preds = %continuation8
  %12 = alloca i32, align 4
  %13 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %14 = call i32 (ptr, ...) @scanf(ptr %13, ptr %12)
  %15 = load i32, ptr %12, align 4
  %16 = icmp eq i32 %15, 0
  br label %continuation16

continuation16:                                   ; preds = %else18, %then17
  %17 = phi i1 [ %16, %else18 ], [ true, %then17 ]
  br i1 %17, label %then25, label %else26

then25:                                           ; preds = %continuation16
  br label %continuation24

else26:                                           ; preds = %continuation16
  %18 = alloca i32, align 4
  %19 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %20 = call i32 (ptr, ...) @scanf(ptr %19, ptr %18)
  %21 = load i32, ptr %18, align 4
  %22 = icmp eq i32 %21, 0
  br label %continuation24

continuation24:                                   ; preds = %else26, %then25
  %23 = phi i1 [ %22, %else26 ], [ true, %then25 ]
  br i1 %23, label %then33, label %else34

then33:                                           ; preds = %continuation24
  br label %continuation32

else34:                                           ; preds = %continuation24
  %24 = alloca i32, align 4
  %25 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %26 = call i32 (ptr, ...) @scanf(ptr %25, ptr %24)
  %27 = load i32, ptr %24, align 4
  %28 = icmp eq i32 %27, 0
  br label %continuation32

continuation32:                                   ; preds = %else34, %then33
  %29 = phi i1 [ %28, %else34 ], [ true, %then33 ]
  br i1 %29, label %then41, label %else42

then41:                                           ; preds = %continuation32
  br label %continuation40

else42:                                           ; preds = %continuation32
  %30 = alloca i32, align 4
  %31 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %32 = call i32 (ptr, ...) @scanf(ptr %31, ptr %30)
  %33 = load i32, ptr %30, align 4
  %34 = icmp eq i32 %33, 0
  br label %continuation40

continuation40:                                   ; preds = %else42, %then41
  %35 = phi i1 [ %34, %else42 ], [ true, %then41 ]
  br i1 %35, label %then49, label %else50

then49:                                           ; preds = %continuation40
  br label %continuation48

else50:                                           ; preds = %continuation40
  %36 = alloca i32, align 4
  %37 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %38 = call i32 (ptr, ...) @scanf(ptr %37, ptr %36)
  %39 = load i32, ptr %36, align 4
  %40 = icmp eq i32 %39, 0
  br label %continuation48

continuation48:                                   ; preds = %else50, %then49
  %41 = phi i1 [ %40, %else50 ], [ true, %then49 ]
  br i1 %41, label %then57, label %else58

then57:                                           ; preds = %continuation48
  br label %continuation56

else58:                                           ; preds = %continuation48
  %42 = alloca i32, align 4
  %43 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %44 = call i32 (ptr, ...) @scanf(ptr %43, ptr %42)
  %45 = load i32, ptr %42, align 4
  %46 = icmp eq i32 %45, 0
  br label %continuation56

continuation56:                                   ; preds = %else58, %then57
  %47 = phi i1 [ %46, %else58 ], [ true, %then57 ]
  br i1 %47, label %then65, label %else66

then65:                                           ; preds = %continuation56
  br label %continuation64

else66:                                           ; preds = %continuation56
  %48 = alloca i32, align 4
  %49 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %50 = call i32 (ptr, ...) @scanf(ptr %49, ptr %48)
  %51 = load i32, ptr %48, align 4
  %52 = icmp eq i32 %51, 0
  br label %continuation64

continuation64:                                   ; preds = %else66, %then65
  %53 = phi i1 [ %52, %else66 ], [ true, %then65 ]
  br i1 %53, label %then73, label %else74

then73:                                           ; preds = %continuation64
  br label %continuation72

else74:                                           ; preds = %continuation64
  %54 = alloca i32, align 4
  %55 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %56 = call i32 (ptr, ...) @scanf(ptr %55, ptr %54)
  %57 = load i32, ptr %54, align 4
  %58 = icmp eq i32 %57, 0
  br label %continuation72

continuation72:                                   ; preds = %else74, %then73
  %59 = phi i1 [ %58, %else74 ], [ true, %then73 ]
  br i1 %59, label %then81, label %else82

then81:                                           ; preds = %continuation72
  br label %continuation80

else82:                                           ; preds = %continuation72
  %60 = alloca i32, align 4
  %61 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %62 = call i32 (ptr, ...) @scanf(ptr %61, ptr %60)
  %63 = load i32, ptr %60, align 4
  %64 = icmp eq i32 %63, 0
  br label %continuation80

continuation80:                                   ; preds = %else82, %then81
  %65 = phi i1 [ %64, %else82 ], [ true, %then81 ]
  br i1 %65, label %then89, label %else90

then89:                                           ; preds = %continuation80
  br label %continuation88

else90:                                           ; preds = %continuation80
  %66 = alloca i32, align 4
  %67 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %68 = call i32 (ptr, ...) @scanf(ptr %67, ptr %66)
  %69 = load i32, ptr %66, align 4
  %70 = icmp eq i32 %69, 0
  br label %continuation88

continuation88:                                   ; preds = %else90, %then89
  %71 = phi i1 [ %70, %else90 ], [ true, %then89 ]
  br i1 %71, label %then97, label %else98

then97:                                           ; preds = %continuation88
  br label %continuation96

else98:                                           ; preds = %continuation88
  %72 = alloca i32, align 4
  %73 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %74 = call i32 (ptr, ...) @scanf(ptr %73, ptr %72)
  %75 = load i32, ptr %72, align 4
  %76 = icmp eq i32 %75, 0
  br label %continuation96

continuation96:                                   ; preds = %else98, %then97
  %77 = phi i1 [ %76, %else98 ], [ true, %then97 ]
  br i1 %77, label %then105, label %else106

then105:                                          ; preds = %continuation96
  br label %continuation104

else106:                                          ; preds = %continuation96
  %78 = alloca i32, align 4
  %79 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %80 = call i32 (ptr, ...) @scanf(ptr %79, ptr %78)
  %81 = load i32, ptr %78, align 4
  %82 = icmp eq i32 %81, 0
  br label %continuation104

continuation104:                                  ; preds = %else106, %then105
  %83 = phi i1 [ %82, %else106 ], [ true, %then105 ]
  br i1 %83, label %then113, label %else114

then113:                                          ; preds = %continuation104
  br label %continuation112

else114:                                          ; preds = %continuation104
  %84 = alloca i32, align 4
  %85 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %86 = call i32 (ptr, ...) @scanf(ptr %85, ptr %84)
  %87 = load i32, ptr %84, align 4
  %88 = icmp eq i32 %87, 0
  br label %continuation112

continuation112:                                  ; preds = %else114, %then113
  %89 = phi i1 [ %88, %else114 ], [ true, %then113 ]
  br i1 %89, label %then121, label %else122

then121:                                          ; preds = %continuation112
  br label %continuation120

else122:                                          ; preds = %continuation112
  %90 = alloca i32, align 4
  %91 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %92 = call i32 (ptr, ...) @scanf(ptr %91, ptr %90)
  %93 = load i32, ptr %90, align 4
  %94 = icmp eq i32 %93, 0
  br label %continuation120

continuation120:                                  ; preds = %else122, %then121
  %95 = phi i1 [ %94, %else122 ], [ true, %then121 ]
  br i1 %95, label %then129, label %else130

then129:                                          ; preds = %continuation120
  br label %continuation128

else130:                                          ; preds = %continuation120
  %96 = alloca i32, align 4
  %97 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %98 = call i32 (ptr, ...) @scanf(ptr %97, ptr %96)
  %99 = load i32, ptr %96, align 4
  %100 = icmp eq i32 %99, 0
  br label %continuation128

continuation128:                                  ; preds = %else130, %then129
  %101 = phi i1 [ %100, %else130 ], [ true, %then129 ]
  br i1 %101, label %then137, label %else138

then137:                                          ; preds = %continuation128
  br label %continuation136

else138:                                          ; preds = %continuation128
  %102 = alloca i32, align 4
  %103 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %104 = call i32 (ptr, ...) @scanf(ptr %103, ptr %102)
  %105 = load i32, ptr %102, align 4
  %106 = icmp eq i32 %105, 0
  br label %continuation136

continuation136:                                  ; preds = %else138, %then137
  %107 = phi i1 [ %106, %else138 ], [ true, %then137 ]
  br i1 %107, label %then145, label %else146

then145:                                          ; preds = %continuation136
  br label %continuation144

else146:                                          ; preds = %continuation136
  %108 = alloca i32, align 4
  %109 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %110 = call i32 (ptr, ...) @scanf(ptr %109, ptr %108)
  %111 = load i32, ptr %108, align 4
  %112 = icmp eq i32 %111, 0
  br label %continuation144

continuation144:                                  ; preds = %else146, %then145
  %113 = phi i1 [ %112, %else146 ], [ true, %then145 ]
  br i1 %113, label %then153, label %else154

then153:                                          ; preds = %continuation144
  br label %continuation152

else154:                                          ; preds = %continuation144
  %114 = alloca i32, align 4
  %115 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %116 = call i32 (ptr, ...) @scanf(ptr %115, ptr %114)
  %117 = load i32, ptr %114, align 4
  %118 = icmp eq i32 %117, 0
  br label %continuation152

continuation152:                                  ; preds = %else154, %then153
  %119 = phi i1 [ %118, %else154 ], [ true, %then153 ]
  br i1 %119, label %then161, label %else162

then161:                                          ; preds = %continuation152
  br label %continuation160

else162:                                          ; preds = %continuation152
  %120 = alloca i32, align 4
  %121 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %122 = call i32 (ptr, ...) @scanf(ptr %121, ptr %120)
  %123 = load i32, ptr %120, align 4
  %124 = icmp eq i32 %123, 0
  br label %continuation160

continuation160:                                  ; preds = %else162, %then161
  %125 = phi i1 [ %124, %else162 ], [ true, %then161 ]
  br i1 %125, label %then169, label %else170

then169:                                          ; preds = %continuation160
  br label %continuation168

else170:                                          ; preds = %continuation160
  %126 = alloca i32, align 4
  %127 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %128 = call i32 (ptr, ...) @scanf(ptr %127, ptr %126)
  %129 = load i32, ptr %126, align 4
  %130 = icmp eq i32 %129, 0
  br label %continuation168

continuation168:                                  ; preds = %else170, %then169
  %131 = phi i1 [ %130, %else170 ], [ true, %then169 ]
  br i1 %131, label %then177, label %else178

then177:                                          ; preds = %continuation168
  br label %continuation176

else178:                                          ; preds = %continuation168
  %132 = alloca i32, align 4
  %133 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %134 = call i32 (ptr, ...) @scanf(ptr %133, ptr %132)
  %135 = load i32, ptr %132, align 4
  %136 = icmp eq i32 %135, 0
  br label %continuation176

continuation176:                                  ; preds = %else178, %then177
  %137 = phi i1 [ %136, %else178 ], [ true, %then177 ]
  br i1 %137, label %then185, label %else186

then185:                                          ; preds = %continuation176
  br label %continuation184

else186:                                          ; preds = %continuation176
  %138 = alloca i32, align 4
  %139 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %140 = call i32 (ptr, ...) @scanf(ptr %139, ptr %138)
  %141 = load i32, ptr %138, align 4
  %142 = icmp eq i32 %141, 0
  br label %continuation184

continuation184:                                  ; preds = %else186, %then185
  %143 = phi i1 [ %142, %else186 ], [ true, %then185 ]
  br i1 %143, label %then193, label %else194

then193:                                          ; preds = %continuation184
  br label %continuation192

else194:                                          ; preds = %continuation184
  %144 = alloca i32, align 4
  %145 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %146 = call i32 (ptr, ...) @scanf(ptr %145, ptr %144)
  %147 = load i32, ptr %144, align 4
  %148 = icmp eq i32 %147, 0
  br label %continuation192

continuation192:                                  ; preds = %else194, %then193
  %149 = phi i1 [ %148, %else194 ], [ true, %then193 ]
  br i1 %149, label %then201, label %else202

then201:                                          ; preds = %continuation192
  br label %continuation200

else202:                                          ; preds = %continuation192
  %150 = alloca i32, align 4
  %151 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %152 = call i32 (ptr, ...) @scanf(ptr %151, ptr %150)
  %153 = load i32, ptr %150, align 4
  %154 = icmp eq i32 %153, 0
  br label %continuation200

continuation200:                                  ; preds = %else202, %then201
  %155 = phi i1 [ %154, %else202 ], [ true, %then201 ]
  br i1 %155, label %then209, label %else210

then209:                                          ; preds = %continuation200
  br label %continuation208

else210:                                          ; preds = %continuation200
  %156 = alloca i32, align 4
  %157 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %158 = call i32 (ptr, ...) @scanf(ptr %157, ptr %156)
  %159 = load i32, ptr %156, align 4
  %160 = icmp eq i32 %159, 0
  br label %continuation208

continuation208:                                  ; preds = %else210, %then209
  %161 = phi i1 [ %160, %else210 ], [ true, %then209 ]
  br i1 %161, label %then217, label %else218

then217:                                          ; preds = %continuation208
  br label %continuation216

else218:                                          ; preds = %continuation208
  %162 = alloca i32, align 4
  %163 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %164 = call i32 (ptr, ...) @scanf(ptr %163, ptr %162)
  %165 = load i32, ptr %162, align 4
  %166 = icmp eq i32 %165, 0
  br label %continuation216

continuation216:                                  ; preds = %else218, %then217
  %167 = phi i1 [ %166, %else218 ], [ true, %then217 ]
  br i1 %167, label %then225, label %else226

then225:                                          ; preds = %continuation216
  br label %continuation224

else226:                                          ; preds = %continuation216
  %168 = alloca i32, align 4
  %169 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %170 = call i32 (ptr, ...) @scanf(ptr %169, ptr %168)
  %171 = load i32, ptr %168, align 4
  %172 = icmp eq i32 %171, 0
  br label %continuation224

continuation224:                                  ; preds = %else226, %then225
  %173 = phi i1 [ %172, %else226 ], [ true, %then225 ]
  br i1 %173, label %then233, label %else234

then233:                                          ; preds = %continuation224
  br label %continuation232

else234:                                          ; preds = %continuation224
  %174 = alloca i32, align 4
  %175 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %176 = call i32 (ptr, ...) @scanf(ptr %175, ptr %174)
  %177 = load i32, ptr %174, align 4
  %178 = icmp eq i32 %177, 0
  br label %continuation232

continuation232:                                  ; preds = %else234, %then233
  %179 = phi i1 [ %178, %else234 ], [ true, %then233 ]
  br i1 %179, label %then241, label %else242

then241:                                          ; preds = %continuation232
  br label %continuation240

else242:                                          ; preds = %continuation232
  %180 = alloca i32, align 4
  %181 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %182 = call i32 (ptr, ...) @scanf(ptr %181, ptr %180)
  %183 = load i32, ptr %180, align 4
  %184 = icmp eq i32 %183, 0
  br label %continuation240

continuation240:                                  ; preds = %else242, %then241
  %185 = phi i1 [ %184, %else242 ], [ true, %then241 ]
  br i1 %185, label %then249, label %else250

then249:                                          ; preds = %continuation240
  br label %continuation248

else250:                                          ; preds = %continuation240
  %186 = alloca i32, align 4
  %187 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %188 = call i32 (ptr, ...) @scanf(ptr %187, ptr %186)
  %189 = load i32, ptr %186, align 4
  %190 = icmp eq i32 %189, 0
  br label %continuation248

continuation248:                                  ; preds = %else250, %then249
  %191 = phi i1 [ %190, %else250 ], [ true, %then249 ]
  br i1 %191, label %then257, label %else258

then257:                                          ; preds = %continuation248
  br label %continuation256

else258:                                          ; preds = %continuation248
  %192 = alloca i32, align 4
  %193 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %194 = call i32 (ptr, ...) @scanf(ptr %193, ptr %192)
  %195 = load i32, ptr %192, align 4
  %196 = icmp eq i32 %195, 0
  br label %continuation256

continuation256:                                  ; preds = %else258, %then257
  %197 = phi i1 [ %196, %else258 ], [ true, %then257 ]
  br i1 %197, label %then265, label %else266

then265:                                          ; preds = %continuation256
  br label %continuation264

else266:                                          ; preds = %continuation256
  %198 = alloca i32, align 4
  %199 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %200 = call i32 (ptr, ...) @scanf(ptr %199, ptr %198)
  %201 = load i32, ptr %198, align 4
  %202 = icmp eq i32 %201, 0
  br label %continuation264

continuation264:                                  ; preds = %else266, %then265
  %203 = phi i1 [ %202, %else266 ], [ true, %then265 ]
  br i1 %203, label %then273, label %else274

then273:                                          ; preds = %continuation264
  br label %continuation272

else274:                                          ; preds = %continuation264
  %204 = alloca i32, align 4
  %205 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %206 = call i32 (ptr, ...) @scanf(ptr %205, ptr %204)
  %207 = load i32, ptr %204, align 4
  %208 = icmp eq i32 %207, 0
  br label %continuation272

continuation272:                                  ; preds = %else274, %then273
  %209 = phi i1 [ %208, %else274 ], [ true, %then273 ]
  br i1 %209, label %then281, label %else282

then281:                                          ; preds = %continuation272
  br label %continuation280

else282:                                          ; preds = %continuation272
  %210 = alloca i32, align 4
  %211 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %212 = call i32 (ptr, ...) @scanf(ptr %211, ptr %210)
  %213 = load i32, ptr %210, align 4
  %214 = icmp eq i32 %213, 0
  br label %continuation280

continuation280:                                  ; preds = %else282, %then281
  %215 = phi i1 [ %214, %else282 ], [ true, %then281 ]
  br i1 %215, label %then289, label %else290

then289:                                          ; preds = %continuation280
  br label %continuation288

else290:                                          ; preds = %continuation280
  %216 = alloca i32, align 4
  %217 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %218 = call i32 (ptr, ...) @scanf(ptr %217, ptr %216)
  %219 = load i32, ptr %216, align 4
  %220 = icmp eq i32 %219, 0
  br label %continuation288

continuation288:                                  ; preds = %else290, %then289
  %221 = phi i1 [ %220, %else290 ], [ true, %then289 ]
  br i1 %221, label %then297, label %else298

then297:                                          ; preds = %continuation288
  br label %continuation296

else298:                                          ; preds = %continuation288
  %222 = alloca i32, align 4
  %223 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %224 = call i32 (ptr, ...) @scanf(ptr %223, ptr %222)
  %225 = load i32, ptr %222, align 4
  %226 = icmp eq i32 %225, 0
  br label %continuation296

continuation296:                                  ; preds = %else298, %then297
  %227 = phi i1 [ %226, %else298 ], [ true, %then297 ]
  br i1 %227, label %then305, label %else306

then305:                                          ; preds = %continuation296
  br label %continuation304

else306:                                          ; preds = %continuation296
  %228 = alloca i32, align 4
  %229 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %230 = call i32 (ptr, ...) @scanf(ptr %229, ptr %228)
  %231 = load i32, ptr %228, align 4
  %232 = icmp eq i32 %231, 0
  br label %continuation304

continuation304:                                  ; preds = %else306, %then305
  %233 = phi i1 [ %232, %else306 ], [ true, %then305 ]
  br i1 %233, label %then313, label %else314

then313:                                          ; preds = %continuation304
  br label %continuation312

else314:                                          ; preds = %continuation304
  %234 = alloca i32, align 4
  %235 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %236 = call i32 (ptr, ...) @scanf(ptr %235, ptr %234)
  %237 = load i32, ptr %234, align 4
  %238 = icmp eq i32 %237, 0
  br label %continuation312

continuation312:                                  ; preds = %else314, %then313
  %239 = phi i1 [ %238, %else314 ], [ true, %then313 ]
  br i1 %239, label %then321, label %else322

then321:                                          ; preds = %continuation312
  br label %continuation320

else322:                                          ; preds = %continuation312
  %240 = alloca i32, align 4
  %241 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %242 = call i32 (ptr, ...) @scanf(ptr %241, ptr %240)
  %243 = load i32, ptr %240, align 4
  %244 = icmp eq i32 %243, 0
  br label %continuation320

continuation320:                                  ; preds = %else322, %then321
  %245 = phi i1 [ %244, %else322 ], [ true, %then321 ]
  br i1 %245, label %then329, label %else330

then329:                                          ; preds = %continuation320
  br label %continuation328

else330:                                          ; preds = %continuation320
  %246 = alloca i32, align 4
  %247 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %248 = call i32 (ptr, ...) @scanf(ptr %247, ptr %246)
  %249 = load i32, ptr %246, align 4
  %250 = icmp eq i32 %249, 0
  br label %continuation328

continuation328:                                  ; preds = %else330, %then329
  %251 = phi i1 [ %250, %else330 ], [ true, %then329 ]
  br i1 %251, label %then337, label %else338

then337:                                          ; preds = %continuation328
  br label %continuation336

else338:                                          ; preds = %continuation328
  %252 = alloca i32, align 4
  %253 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %254 = call i32 (ptr, ...) @scanf(ptr %253, ptr %252)
  %255 = load i32, ptr %252, align 4
  %256 = icmp eq i32 %255, 0
  br label %continuation336

continuation336:                                  ; preds = %else338, %then337
  %257 = phi i1 [ %256, %else338 ], [ true, %then337 ]
  br i1 %257, label %then345, label %else346

then345:                                          ; preds = %continuation336
  br label %continuation344

else346:                                          ; preds = %continuation336
  %258 = alloca i32, align 4
  %259 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %260 = call i32 (ptr, ...) @scanf(ptr %259, ptr %258)
  %261 = load i32, ptr %258, align 4
  %262 = icmp eq i32 %261, 0
  br label %continuation344

continuation344:                                  ; preds = %else346, %then345
  %263 = phi i1 [ %262, %else346 ], [ true, %then345 ]
  br i1 %263, label %then353, label %else354

then353:                                          ; preds = %continuation344
  br label %continuation352

else354:                                          ; preds = %continuation344
  %264 = alloca i32, align 4
  %265 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %266 = call i32 (ptr, ...) @scanf(ptr %265, ptr %264)
  %267 = load i32, ptr %264, align 4
  %268 = icmp eq i32 %267, 0
  br label %continuation352

continuation352:                                  ; preds = %else354, %then353
  %269 = phi i1 [ %268, %else354 ], [ true, %then353 ]
  br i1 %269, label %then361, label %else362

then361:                                          ; preds = %continuation352
  br label %continuation360

else362:                                          ; preds = %continuation352
  %270 = alloca i32, align 4
  %271 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %272 = call i32 (ptr, ...) @scanf(ptr %271, ptr %270)
  %273 = load i32, ptr %270, align 4
  %274 = icmp eq i32 %273, 0
  br label %continuation360

continuation360:                                  ; preds = %else362, %then361
  %275 = phi i1 [ %274, %else362 ], [ true, %then361 ]
  br i1 %275, label %then369, label %else370

then369:                                          ; preds = %continuation360
  br label %continuation368

else370:                                          ; preds = %continuation360
  %276 = alloca i32, align 4
  %277 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %278 = call i32 (ptr, ...) @scanf(ptr %277, ptr %276)
  %279 = load i32, ptr %276, align 4
  %280 = icmp eq i32 %279, 0
  br label %continuation368

continuation368:                                  ; preds = %else370, %then369
  %281 = phi i1 [ %280, %else370 ], [ true, %then369 ]
  br i1 %281, label %then377, label %else378

then377:                                          ; preds = %continuation368
  br label %continuation376

else378:                                          ; preds = %continuation368
  %282 = alloca i32, align 4
  %283 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %284 = call i32 (ptr, ...) @scanf(ptr %283, ptr %282)
  %285 = load i32, ptr %282, align 4
  %286 = icmp eq i32 %285, 0
  br label %continuation376

continuation376:                                  ; preds = %else378, %then377
  %287 = phi i1 [ %286, %else378 ], [ true, %then377 ]
  br i1 %287, label %then385, label %else386

then385:                                          ; preds = %continuation376
  br label %continuation384

else386:                                          ; preds = %continuation376
  %288 = alloca i32, align 4
  %289 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %290 = call i32 (ptr, ...) @scanf(ptr %289, ptr %288)
  %291 = load i32, ptr %288, align 4
  %292 = icmp eq i32 %291, 0
  br label %continuation384

continuation384:                                  ; preds = %else386, %then385
  %293 = phi i1 [ %292, %else386 ], [ true, %then385 ]
  br i1 %293, label %then393, label %else394

then393:                                          ; preds = %continuation384
  br label %continuation392

else394:                                          ; preds = %continuation384
  %294 = alloca i32, align 4
  %295 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %296 = call i32 (ptr, ...) @scanf(ptr %295, ptr %294)
  %297 = load i32, ptr %294, align 4
  %298 = icmp eq i32 %297, 0
  br label %continuation392

continuation392:                                  ; preds = %else394, %then393
  %299 = phi i1 [ %298, %else394 ], [ true, %then393 ]
  br i1 %299, label %then401, label %else402

then401:                                          ; preds = %continuation392
  br label %continuation400

else402:                                          ; preds = %continuation392
  %300 = alloca i32, align 4
  %301 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %302 = call i32 (ptr, ...) @scanf(ptr %301, ptr %300)
  %303 = load i32, ptr %300, align 4
  %304 = icmp eq i32 %303, 0
  br label %continuation400

continuation400:                                  ; preds = %else402, %then401
  %305 = phi i1 [ %304, %else402 ], [ true, %then401 ]
  br i1 %305, label %then409, label %else410

then409:                                          ; preds = %continuation400
  br label %continuation408

else410:                                          ; preds = %continuation400
  %306 = alloca i32, align 4
  %307 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %308 = call i32 (ptr, ...) @scanf(ptr %307, ptr %306)
  %309 = load i32, ptr %306, align 4
  %310 = icmp eq i32 %309, 0
  br label %continuation408

continuation408:                                  ; preds = %else410, %then409
  %311 = phi i1 [ %310, %else410 ], [ true, %then409 ]
  br i1 %311, label %then417, label %else418

then417:                                          ; preds = %continuation408
  br label %continuation416

else418:                                          ; preds = %continuation408
  %312 = alloca i32, align 4
  %313 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %314 = call i32 (ptr, ...) @scanf(ptr %313, ptr %312)
  %315 = load i32, ptr %312, align 4
  %316 = icmp eq i32 %315, 0
  br label %continuation416

continuation416:                                  ; preds = %else418, %then417
  %317 = phi i1 [ %316, %else418 ], [ true, %then417 ]
  br i1 %317, label %then425, label %else426

then425:                                          ; preds = %continuation416
  br label %continuation424

else426:                                          ; preds = %continuation416
  %318 = alloca i32, align 4
  %319 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %320 = call i32 (ptr, ...) @scanf(ptr %319, ptr %318)
  %321 = load i32, ptr %318, align 4
  %322 = icmp eq i32 %321, 0
  br label %continuation424

continuation424:                                  ; preds = %else426, %then425
  %323 = phi i1 [ %322, %else426 ], [ true, %then425 ]
  br i1 %323, label %then433, label %else434

then433:                                          ; preds = %continuation424
  br label %continuation432

else434:                                          ; preds = %continuation424
  %324 = alloca i32, align 4
  %325 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %326 = call i32 (ptr, ...) @scanf(ptr %325, ptr %324)
  %327 = load i32, ptr %324, align 4
  %328 = icmp eq i32 %327, 0
  br label %continuation432

continuation432:                                  ; preds = %else434, %then433
  %329 = phi i1 [ %328, %else434 ], [ true, %then433 ]
  br i1 %329, label %then441, label %else442

then441:                                          ; preds = %continuation432
  br label %continuation440

else442:                                          ; preds = %continuation432
  %330 = alloca i32, align 4
  %331 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %332 = call i32 (ptr, ...) @scanf(ptr %331, ptr %330)
  %333 = load i32, ptr %330, align 4
  %334 = icmp eq i32 %333, 0
  br label %continuation440

continuation440:                                  ; preds = %else442, %then441
  %335 = phi i1 [ %334, %else442 ], [ true, %then441 ]
  br i1 %335, label %then449, label %else450

then449:                                          ; preds = %continuation440
  br label %continuation448

else450:                                          ; preds = %continuation440
  %336 = alloca i32, align 4
  %337 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %338 = call i32 (ptr, ...) @scanf(ptr %337, ptr %336)
  %339 = load i32, ptr %336, align 4
  %340 = icmp eq i32 %339, 0
  br label %continuation448

continuation448:                                  ; preds = %else450, %then449
  %341 = phi i1 [ %340, %else450 ], [ true, %then449 ]
  br i1 %341, label %then457, label %else458

then457:                                          ; preds = %continuation448
  br label %continuation456

else458:                                          ; preds = %continuation448
  %342 = alloca i32, align 4
  %343 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %344 = call i32 (ptr, ...) @scanf(ptr %343, ptr %342)
  %345 = load i32, ptr %342, align 4
  %346 = icmp eq i32 %345, 0
  br label %continuation456

continuation456:                                  ; preds = %else458, %then457
  %347 = phi i1 [ %346, %else458 ], [ true, %then457 ]
  br i1 %347, label %then465, label %else466

then465:                                          ; preds = %continuation456
  br label %continuation464

else466:                                          ; preds = %continuation456
  %348 = alloca i32, align 4
  %349 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %350 = call i32 (ptr, ...) @scanf(ptr %349, ptr %348)
  %351 = load i32, ptr %348, align 4
  %352 = icmp eq i32 %351, 0
  br label %continuation464

continuation464:                                  ; preds = %else466, %then465
  %353 = phi i1 [ %352, %else466 ], [ true, %then465 ]
  br i1 %353, label %then473, label %else474

then473:                                          ; preds = %continuation464
  br label %continuation472

else474:                                          ; preds = %continuation464
  %354 = alloca i32, align 4
  %355 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %356 = call i32 (ptr, ...) @scanf(ptr %355, ptr %354)
  %357 = load i32, ptr %354, align 4
  %358 = icmp eq i32 %357, 0
  br label %continuation472

continuation472:                                  ; preds = %else474, %then473
  %359 = phi i1 [ %358, %else474 ], [ true, %then473 ]
  br i1 %359, label %then481, label %else482

then481:                                          ; preds = %continuation472
  br label %continuation480

else482:                                          ; preds = %continuation472
  %360 = alloca i32, align 4
  %361 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %362 = call i32 (ptr, ...) @scanf(ptr %361, ptr %360)
  %363 = load i32, ptr %360, align 4
  %364 = icmp eq i32 %363, 0
  br label %continuation480

continuation480:                                  ; preds = %else482, %then481
  %365 = phi i1 [ %364, %else482 ], [ true, %then481 ]
  br i1 %365, label %then489, label %else490

then489:                                          ; preds = %continuation480
  br label %continuation488

else490:                                          ; preds = %continuation480
  %366 = alloca i32, align 4
  %367 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %368 = call i32 (ptr, ...) @scanf(ptr %367, ptr %366)
  %369 = load i32, ptr %366, align 4
  %370 = icmp eq i32 %369, 0
  br label %continuation488

continuation488:                                  ; preds = %else490, %then489
  %371 = phi i1 [ %370, %else490 ], [ true, %then489 ]
  br i1 %371, label %then497, label %else498

then497:                                          ; preds = %continuation488
  br label %continuation496

else498:                                          ; preds = %continuation488
  %372 = alloca i32, align 4
  %373 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %374 = call i32 (ptr, ...) @scanf(ptr %373, ptr %372)
  %375 = load i32, ptr %372, align 4
  %376 = icmp eq i32 %375, 0
  br label %continuation496

continuation496:                                  ; preds = %else498, %then497
  %377 = phi i1 [ %376, %else498 ], [ true, %then497 ]
  br i1 %377, label %then505, label %else506

then505:                                          ; preds = %continuation496
  br label %continuation504

else506:                                          ; preds = %continuation496
  %378 = alloca i32, align 4
  %379 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %380 = call i32 (ptr, ...) @scanf(ptr %379, ptr %378)
  %381 = load i32, ptr %378, align 4
  %382 = icmp eq i32 %381, 0
  br label %continuation504

continuation504:                                  ; preds = %else506, %then505
  %383 = phi i1 [ %382, %else506 ], [ true, %then505 ]
  br i1 %383, label %then513, label %else514

then513:                                          ; preds = %continuation504
  br label %continuation512

else514:                                          ; preds = %continuation504
  %384 = alloca i32, align 4
  %385 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %386 = call i32 (ptr, ...) @scanf(ptr %385, ptr %384)
  %387 = load i32, ptr %384, align 4
  %388 = icmp eq i32 %387, 0
  br label %continuation512

continuation512:                                  ; preds = %else514, %then513
  %389 = phi i1 [ %388, %else514 ], [ true, %then513 ]
  br i1 %389, label %then521, label %else522

then521:                                          ; preds = %continuation512
  br label %continuation520

else522:                                          ; preds = %continuation512
  %390 = alloca i32, align 4
  %391 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %392 = call i32 (ptr, ...) @scanf(ptr %391, ptr %390)
  %393 = load i32, ptr %390, align 4
  %394 = icmp eq i32 %393, 0
  br label %continuation520

continuation520:                                  ; preds = %else522, %then521
  %395 = phi i1 [ %394, %else522 ], [ true, %then521 ]
  br i1 %395, label %then529, label %else530

then529:                                          ; preds = %continuation520
  br label %continuation528

else530:                                          ; preds = %continuation520
  %396 = alloca i32, align 4
  %397 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %398 = call i32 (ptr, ...) @scanf(ptr %397, ptr %396)
  %399 = load i32, ptr %396, align 4
  %400 = icmp eq i32 %399, 0
  br label %continuation528

continuation528:                                  ; preds = %else530, %then529
  %401 = phi i1 [ %400, %else530 ], [ true, %then529 ]
  br i1 %401, label %then537, label %else538

then537:                                          ; preds = %continuation528
  br label %continuation536

else538:                                          ; preds = %continuation528
  %402 = alloca i32, align 4
  %403 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %404 = call i32 (ptr, ...) @scanf(ptr %403, ptr %402)
  %405 = load i32, ptr %402, align 4
  %406 = icmp eq i32 %405, 0
  br label %continuation536

continuation536:                                  ; preds = %else538, %then537
  %407 = phi i1 [ %406, %else538 ], [ true, %then537 ]
  br i1 %407, label %then545, label %else546

then545:                                          ; preds = %continuation536
  br label %continuation544

else546:                                          ; preds = %continuation536
  %408 = alloca i32, align 4
  %409 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %410 = call i32 (ptr, ...) @scanf(ptr %409, ptr %408)
  %411 = load i32, ptr %408, align 4
  %412 = icmp eq i32 %411, 0
  br label %continuation544

continuation544:                                  ; preds = %else546, %then545
  %413 = phi i1 [ %412, %else546 ], [ true, %then545 ]
  br i1 %413, label %then553, label %else554

then553:                                          ; preds = %continuation544
  br label %continuation552

else554:                                          ; preds = %continuation544
  %414 = alloca i32, align 4
  %415 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %416 = call i32 (ptr, ...) @scanf(ptr %415, ptr %414)
  %417 = load i32, ptr %414, align 4
  %418 = icmp eq i32 %417, 0
  br label %continuation552

continuation552:                                  ; preds = %else554, %then553
  %419 = phi i1 [ %418, %else554 ], [ true, %then553 ]
  br i1 %419, label %then561, label %else562

then561:                                          ; preds = %continuation552
  br label %continuation560

else562:                                          ; preds = %continuation552
  %420 = alloca i32, align 4
  %421 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %422 = call i32 (ptr, ...) @scanf(ptr %421, ptr %420)
  %423 = load i32, ptr %420, align 4
  %424 = icmp eq i32 %423, 0
  br label %continuation560

continuation560:                                  ; preds = %else562, %then561
  %425 = phi i1 [ %424, %else562 ], [ true, %then561 ]
  br i1 %425, label %then569, label %else570

then569:                                          ; preds = %continuation560
  br label %continuation568

else570:                                          ; preds = %continuation560
  %426 = alloca i32, align 4
  %427 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %428 = call i32 (ptr, ...) @scanf(ptr %427, ptr %426)
  %429 = load i32, ptr %426, align 4
  %430 = icmp eq i32 %429, 0
  br label %continuation568

continuation568:                                  ; preds = %else570, %then569
  %431 = phi i1 [ %430, %else570 ], [ true, %then569 ]
  br i1 %431, label %then577, label %else578

then577:                                          ; preds = %continuation568
  br label %continuation576

else578:                                          ; preds = %continuation568
  %432 = alloca i32, align 4
  %433 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %434 = call i32 (ptr, ...) @scanf(ptr %433, ptr %432)
  %435 = load i32, ptr %432, align 4
  %436 = icmp eq i32 %435, 0
  br label %continuation576

continuation576:                                  ; preds = %else578, %then577
  %437 = phi i1 [ %436, %else578 ], [ true, %then577 ]
  br i1 %437, label %then585, label %else586

then585:                                          ; preds = %continuation576
  br label %continuation584

else586:                                          ; preds = %continuation576
  %438 = alloca i32, align 4
  %439 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %440 = call i32 (ptr, ...) @scanf(ptr %439, ptr %438)
  %441 = load i32, ptr %438, align 4
  %442 = icmp eq i32 %441, 0
  br label %continuation584

continuation584:                                  ; preds = %else586, %then585
  %443 = phi i1 [ %442, %else586 ], [ true, %then585 ]
  br i1 %443, label %then593, label %else594

then593:                                          ; preds = %continuation584
  br label %continuation592

else594:                                          ; preds = %continuation584
  %444 = alloca i32, align 4
  %445 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %446 = call i32 (ptr, ...) @scanf(ptr %445, ptr %444)
  %447 = load i32, ptr %444, align 4
  %448 = icmp eq i32 %447, 0
  br label %continuation592

continuation592:                                  ; preds = %else594, %then593
  %449 = phi i1 [ %448, %else594 ], [ true, %then593 ]
  br i1 %449, label %then601, label %else602

then601:                                          ; preds = %continuation592
  br label %continuation600

else602:                                          ; preds = %continuation592
  %450 = alloca i32, align 4
  %451 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %452 = call i32 (ptr, ...) @scanf(ptr %451, ptr %450)
  %453 = load i32, ptr %450, align 4
  %454 = icmp eq i32 %453, 0
  br label %continuation600

continuation600:                                  ; preds = %else602, %then601
  %455 = phi i1 [ %454, %else602 ], [ true, %then601 ]
  br i1 %455, label %then609, label %else610

then609:                                          ; preds = %continuation600
  br label %continuation608

else610:                                          ; preds = %continuation600
  %456 = alloca i32, align 4
  %457 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %458 = call i32 (ptr, ...) @scanf(ptr %457, ptr %456)
  %459 = load i32, ptr %456, align 4
  %460 = icmp eq i32 %459, 0
  br label %continuation608

continuation608:                                  ; preds = %else610, %then609
  %461 = phi i1 [ %460, %else610 ], [ true, %then609 ]
  br i1 %461, label %then617, label %else618

then617:                                          ; preds = %continuation608
  br label %continuation616

else618:                                          ; preds = %continuation608
  %462 = alloca i32, align 4
  %463 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %464 = call i32 (ptr, ...) @scanf(ptr %463, ptr %462)
  %465 = load i32, ptr %462, align 4
  %466 = icmp eq i32 %465, 0
  br label %continuation616

continuation616:                                  ; preds = %else618, %then617
  %467 = phi i1 [ %466, %else618 ], [ true, %then617 ]
  br i1 %467, label %then625, label %else626

then625:                                          ; preds = %continuation616
  br label %continuation624

else626:                                          ; preds = %continuation616
  %468 = alloca i32, align 4
  %469 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %470 = call i32 (ptr, ...) @scanf(ptr %469, ptr %468)
  %471 = load i32, ptr %468, align 4
  %472 = icmp eq i32 %471, 0
  br label %continuation624

continuation624:                                  ; preds = %else626, %then625
  %473 = phi i1 [ %472, %else626 ], [ true, %then625 ]
  br i1 %473, label %then633, label %else634

then633:                                          ; preds = %continuation624
  br label %continuation632

else634:                                          ; preds = %continuation624
  %474 = alloca i32, align 4
  %475 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %476 = call i32 (ptr, ...) @scanf(ptr %475, ptr %474)
  %477 = load i32, ptr %474, align 4
  %478 = icmp eq i32 %477, 0
  br label %continuation632

continuation632:                                  ; preds = %else634, %then633
  %479 = phi i1 [ %478, %else634 ], [ true, %then633 ]
  br i1 %479, label %then641, label %else642

then641:                                          ; preds = %continuation632
  br label %continuation640

else642:                                          ; preds = %continuation632
  %480 = alloca i32, align 4
  %481 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %482 = call i32 (ptr, ...) @scanf(ptr %481, ptr %480)
  %483 = load i32, ptr %480, align 4
  %484 = icmp eq i32 %483, 0
  br label %continuation640

continuation640:                                  ; preds = %else642, %then641
  %485 = phi i1 [ %484, %else642 ], [ true, %then641 ]
  br i1 %485, label %then649, label %else650

then649:                                          ; preds = %continuation640
  br label %continuation648

else650:                                          ; preds = %continuation640
  %486 = alloca i32, align 4
  %487 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %488 = call i32 (ptr, ...) @scanf(ptr %487, ptr %486)
  %489 = load i32, ptr %486, align 4
  %490 = icmp eq i32 %489, 0
  br label %continuation648

continuation648:                                  ; preds = %else650, %then649
  %491 = phi i1 [ %490, %else650 ], [ true, %then649 ]
  br i1 %491, label %then657, label %else658

then657:                                          ; preds = %continuation648
  br label %continuation656

else658:                                          ; preds = %continuation648
  %492 = alloca i32, align 4
  %493 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %494 = call i32 (ptr, ...) @scanf(ptr %493, ptr %492)
  %495 = load i32, ptr %492, align 4
  %496 = icmp eq i32 %495, 0
  br label %continuation656

continuation656:                                  ; preds = %else658, %then657
  %497 = phi i1 [ %496, %else658 ], [ true, %then657 ]
  br i1 %497, label %then665, label %else666

then665:                                          ; preds = %continuation656
  br label %continuation664

else666:                                          ; preds = %continuation656
  %498 = alloca i32, align 4
  %499 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %500 = call i32 (ptr, ...) @scanf(ptr %499, ptr %498)
  %501 = load i32, ptr %498, align 4
  %502 = icmp eq i32 %501, 0
  br label %continuation664

continuation664:                                  ; preds = %else666, %then665
  %503 = phi i1 [ %502, %else666 ], [ true, %then665 ]
  br i1 %503, label %then673, label %else674

then673:                                          ; preds = %continuation664
  br label %continuation672

else674:                                          ; preds = %continuation664
  %504 = alloca i32, align 4
  %505 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %506 = call i32 (ptr, ...) @scanf(ptr %505, ptr %504)
  %507 = load i32, ptr %504, align 4
  %508 = icmp eq i32 %507, 0
  br label %continuation672

continuation672:                                  ; preds = %else674, %then673
  %509 = phi i1 [ %508, %else674 ], [ true, %then673 ]
  br i1 %509, label %then681, label %else682

then681:                                          ; preds = %continuation672
  br label %continuation680

else682:                                          ; preds = %continuation672
  %510 = alloca i32, align 4
  %511 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %512 = call i32 (ptr, ...) @scanf(ptr %511, ptr %510)
  %513 = load i32, ptr %510, align 4
  %514 = icmp eq i32 %513, 0
  br label %continuation680

continuation680:                                  ; preds = %else682, %then681
  %515 = phi i1 [ %514, %else682 ], [ true, %then681 ]
  br i1 %515, label %then689, label %else690

then689:                                          ; preds = %continuation680
  br label %continuation688

else690:                                          ; preds = %continuation680
  %516 = alloca i32, align 4
  %517 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %518 = call i32 (ptr, ...) @scanf(ptr %517, ptr %516)
  %519 = load i32, ptr %516, align 4
  %520 = icmp eq i32 %519, 0
  br label %continuation688

continuation688:                                  ; preds = %else690, %then689
  %521 = phi i1 [ %520, %else690 ], [ true, %then689 ]
  br i1 %521, label %then697, label %else698

then697:                                          ; preds = %continuation688
  br label %continuation696

else698:                                          ; preds = %continuation688
  %522 = alloca i32, align 4
  %523 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %524 = call i32 (ptr, ...) @scanf(ptr %523, ptr %522)
  %525 = load i32, ptr %522, align 4
  %526 = icmp eq i32 %525, 0
  br label %continuation696

continuation696:                                  ; preds = %else698, %then697
  %527 = phi i1 [ %526, %else698 ], [ true, %then697 ]
  br i1 %527, label %then705, label %else706

then705:                                          ; preds = %continuation696
  br label %continuation704

else706:                                          ; preds = %continuation696
  %528 = alloca i32, align 4
  %529 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %530 = call i32 (ptr, ...) @scanf(ptr %529, ptr %528)
  %531 = load i32, ptr %528, align 4
  %532 = icmp eq i32 %531, 0
  br label %continuation704

continuation704:                                  ; preds = %else706, %then705
  %533 = phi i1 [ %532, %else706 ], [ true, %then705 ]
  br i1 %533, label %then713, label %else714

then713:                                          ; preds = %continuation704
  br label %continuation712

else714:                                          ; preds = %continuation704
  %534 = alloca i32, align 4
  %535 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %536 = call i32 (ptr, ...) @scanf(ptr %535, ptr %534)
  %537 = load i32, ptr %534, align 4
  %538 = icmp eq i32 %537, 0
  br label %continuation712

continuation712:                                  ; preds = %else714, %then713
  %539 = phi i1 [ %538, %else714 ], [ true, %then713 ]
  br i1 %539, label %then721, label %else722

then721:                                          ; preds = %continuation712
  br label %continuation720

else722:                                          ; preds = %continuation712
  %540 = alloca i32, align 4
  %541 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %542 = call i32 (ptr, ...) @scanf(ptr %541, ptr %540)
  %543 = load i32, ptr %540, align 4
  %544 = icmp eq i32 %543, 0
  br label %continuation720

continuation720:                                  ; preds = %else722, %then721
  %545 = phi i1 [ %544, %else722 ], [ true, %then721 ]
  br i1 %545, label %then729, label %else730

then729:                                          ; preds = %continuation720
  br label %continuation728

else730:                                          ; preds = %continuation720
  %546 = alloca i32, align 4
  %547 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %548 = call i32 (ptr, ...) @scanf(ptr %547, ptr %546)
  %549 = load i32, ptr %546, align 4
  %550 = icmp eq i32 %549, 0
  br label %continuation728

continuation728:                                  ; preds = %else730, %then729
  %551 = phi i1 [ %550, %else730 ], [ true, %then729 ]
  br i1 %551, label %then737, label %else738

then737:                                          ; preds = %continuation728
  br label %continuation736

else738:                                          ; preds = %continuation728
  %552 = alloca i32, align 4
  %553 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %554 = call i32 (ptr, ...) @scanf(ptr %553, ptr %552)
  %555 = load i32, ptr %552, align 4
  %556 = icmp eq i32 %555, 0
  br label %continuation736

continuation736:                                  ; preds = %else738, %then737
  %557 = phi i1 [ %556, %else738 ], [ true, %then737 ]
  br i1 %557, label %then745, label %else746

then745:                                          ; preds = %continuation736
  br label %continuation744

else746:                                          ; preds = %continuation736
  %558 = alloca i32, align 4
  %559 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %560 = call i32 (ptr, ...) @scanf(ptr %559, ptr %558)
  %561 = load i32, ptr %558, align 4
  %562 = icmp eq i32 %561, 0
  br label %continuation744

continuation744:                                  ; preds = %else746, %then745
  %563 = phi i1 [ %562, %else746 ], [ true, %then745 ]
  br i1 %563, label %then753, label %else754

then753:                                          ; preds = %continuation744
  br label %continuation752

else754:                                          ; preds = %continuation744
  %564 = alloca i32, align 4
  %565 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %566 = call i32 (ptr, ...) @scanf(ptr %565, ptr %564)
  %567 = load i32, ptr %564, align 4
  %568 = icmp eq i32 %567, 0
  br label %continuation752

continuation752:                                  ; preds = %else754, %then753
  %569 = phi i1 [ %568, %else754 ], [ true, %then753 ]
  br i1 %569, label %then761, label %else762

then761:                                          ; preds = %continuation752
  br label %continuation760

else762:                                          ; preds = %continuation752
  %570 = alloca i32, align 4
  %571 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %572 = call i32 (ptr, ...) @scanf(ptr %571, ptr %570)
  %573 = load i32, ptr %570, align 4
  %574 = icmp eq i32 %573, 0
  br label %continuation760

continuation760:                                  ; preds = %else762, %then761
  %575 = phi i1 [ %574, %else762 ], [ true, %then761 ]
  br i1 %575, label %then769, label %else770

then769:                                          ; preds = %continuation760
  br label %continuation768

else770:                                          ; preds = %continuation760
  %576 = alloca i32, align 4
  %577 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %578 = call i32 (ptr, ...) @scanf(ptr %577, ptr %576)
  %579 = load i32, ptr %576, align 4
  %580 = icmp eq i32 %579, 0
  br label %continuation768

continuation768:                                  ; preds = %else770, %then769
  %581 = phi i1 [ %580, %else770 ], [ true, %then769 ]
  br i1 %581, label %then777, label %else778

then777:                                          ; preds = %continuation768
  br label %continuation776

else778:                                          ; preds = %continuation768
  %582 = alloca i32, align 4
  %583 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %584 = call i32 (ptr, ...) @scanf(ptr %583, ptr %582)
  %585 = load i32, ptr %582, align 4
  %586 = icmp eq i32 %585, 0
  br label %continuation776

continuation776:                                  ; preds = %else778, %then777
  %587 = phi i1 [ %586, %else778 ], [ true, %then777 ]
  br i1 %587, label %then785, label %else786

then785:                                          ; preds = %continuation776
  br label %continuation784

else786:                                          ; preds = %continuation776
  %588 = alloca i32, align 4
  %589 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %590 = call i32 (ptr, ...) @scanf(ptr %589, ptr %588)
  %591 = load i32, ptr %588, align 4
  %592 = icmp eq i32 %591, 0
  br label %continuation784

continuation784:                                  ; preds = %else786, %then785
  %593 = phi i1 [ %592, %else786 ], [ true, %then785 ]
  br i1 %593, label %then793, label %else794

then793:                                          ; preds = %continuation784
  br label %continuation792

else794:                                          ; preds = %continuation784
  %594 = alloca i32, align 4
  %595 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %596 = call i32 (ptr, ...) @scanf(ptr %595, ptr %594)
  %597 = load i32, ptr %594, align 4
  %598 = icmp eq i32 %597, 0
  br label %continuation792

continuation792:                                  ; preds = %else794, %then793
  %599 = phi i1 [ %598, %else794 ], [ true, %then793 ]
  br i1 %599, label %then801, label %else802

then801:                                          ; preds = %continuation792
  br label %continuation800

else802:                                          ; preds = %continuation792
  %600 = alloca i32, align 4
  %601 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %602 = call i32 (ptr, ...) @scanf(ptr %601, ptr %600)
  %603 = load i32, ptr %600, align 4
  %604 = icmp eq i32 %603, 0
  br label %continuation800

continuation800:                                  ; preds = %else802, %then801
  %605 = phi i1 [ %604, %else802 ], [ true, %then801 ]
  br i1 %605, label %then809, label %else810

then809:                                          ; preds = %continuation800
  br label %continuation808

else810:                                          ; preds = %continuation800
  %606 = alloca i32, align 4
  %607 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %608 = call i32 (ptr, ...) @scanf(ptr %607, ptr %606)
  %609 = load i32, ptr %606, align 4
  %610 = icmp eq i32 %609, 0
  br label %continuation808

continuation808:                                  ; preds = %else810, %then809
  %611 = phi i1 [ %610, %else810 ], [ true, %then809 ]
  br i1 %611, label %then817, label %else818

then817:                                          ; preds = %continuation808
  br label %continuation816

else818:                                          ; preds = %continuation808
  %612 = alloca i32, align 4
  %613 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %614 = call i32 (ptr, ...) @scanf(ptr %613, ptr %612)
  %615 = load i32, ptr %612, align 4
  %616 = icmp eq i32 %615, 0
  br label %continuation816

continuation816:                                  ; preds = %else818, %then817
  %617 = phi i1 [ %616, %else818 ], [ true, %then817 ]
  br i1 %617, label %then825, label %else826

then825:                                          ; preds = %continuation816
  br label %continuation824

else826:                                          ; preds = %continuation816
  %618 = alloca i32, align 4
  %619 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %620 = call i32 (ptr, ...) @scanf(ptr %619, ptr %618)
  %621 = load i32, ptr %618, align 4
  %622 = icmp eq i32 %621, 0
  br label %continuation824

continuation824:                                  ; preds = %else826, %then825
  %623 = phi i1 [ %622, %else826 ], [ true, %then825 ]
  br i1 %623, label %then833, label %else834

then833:                                          ; preds = %continuation824
  br label %continuation832

else834:                                          ; preds = %continuation824
  %624 = alloca i32, align 4
  %625 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %626 = call i32 (ptr, ...) @scanf(ptr %625, ptr %624)
  %627 = load i32, ptr %624, align 4
  %628 = icmp eq i32 %627, 0
  br label %continuation832

continuation832:                                  ; preds = %else834, %then833
  %629 = phi i1 [ %628, %else834 ], [ true, %then833 ]
  br i1 %629, label %then841, label %else842

then841:                                          ; preds = %continuation832
  br label %continuation840

else842:                                          ; preds = %continuation832
  %630 = alloca i32, align 4
  %631 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %632 = call i32 (ptr, ...) @scanf(ptr %631, ptr %630)
  %633 = load i32, ptr %630, align 4
  %634 = icmp eq i32 %633, 0
  br label %continuation840

continuation840:                                  ; preds = %else842, %then841
  %635 = phi i1 [ %634, %else842 ], [ true, %then841 ]
  br i1 %635, label %then849, label %else850

then849:                                          ; preds = %continuation840
  br label %continuation848

else850:                                          ; preds = %continuation840
  %636 = alloca i32, align 4
  %637 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %638 = call i32 (ptr, ...) @scanf(ptr %637, ptr %636)
  %639 = load i32, ptr %636, align 4
  %640 = icmp eq i32 %639, 0
  br label %continuation848

continuation848:                                  ; preds = %else850, %then849
  %641 = phi i1 [ %640, %else850 ], [ true, %then849 ]
  br i1 %641, label %then857, label %else858

then857:                                          ; preds = %continuation848
  br label %continuation856

else858:                                          ; preds = %continuation848
  %642 = alloca i32, align 4
  %643 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %644 = call i32 (ptr, ...) @scanf(ptr %643, ptr %642)
  %645 = load i32, ptr %642, align 4
  %646 = icmp eq i32 %645, 0
  br label %continuation856

continuation856:                                  ; preds = %else858, %then857
  %647 = phi i1 [ %646, %else858 ], [ true, %then857 ]
  br i1 %647, label %then865, label %else866

then865:                                          ; preds = %continuation856
  br label %continuation864

else866:                                          ; preds = %continuation856
  %648 = alloca i32, align 4
  %649 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %650 = call i32 (ptr, ...) @scanf(ptr %649, ptr %648)
  %651 = load i32, ptr %648, align 4
  %652 = icmp eq i32 %651, 0
  br label %continuation864

continuation864:                                  ; preds = %else866, %then865
  %653 = phi i1 [ %652, %else866 ], [ true, %then865 ]
  br i1 %653, label %then873, label %else874

then873:                                          ; preds = %continuation864
  br label %continuation872

else874:                                          ; preds = %continuation864
  %654 = alloca i32, align 4
  %655 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %656 = call i32 (ptr, ...) @scanf(ptr %655, ptr %654)
  %657 = load i32, ptr %654, align 4
  %658 = icmp eq i32 %657, 0
  br label %continuation872

continuation872:                                  ; preds = %else874, %then873
  %659 = phi i1 [ %658, %else874 ], [ true, %then873 ]
  br i1 %659, label %then881, label %else882

then881:                                          ; preds = %continuation872
  br label %continuation880

else882:                                          ; preds = %continuation872
  %660 = alloca i32, align 4
  %661 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %662 = call i32 (ptr, ...) @scanf(ptr %661, ptr %660)
  %663 = load i32, ptr %660, align 4
  %664 = icmp eq i32 %663, 0
  br label %continuation880

continuation880:                                  ; preds = %else882, %then881
  %665 = phi i1 [ %664, %else882 ], [ true, %then881 ]
  br i1 %665, label %then889, label %else890

then889:                                          ; preds = %continuation880
  br label %continuation888

else890:                                          ; preds = %continuation880
  %666 = alloca i32, align 4
  %667 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %668 = call i32 (ptr, ...) @scanf(ptr %667, ptr %666)
  %669 = load i32, ptr %666, align 4
  %670 = icmp eq i32 %669, 0
  br label %continuation888

continuation888:                                  ; preds = %else890, %then889
  %671 = phi i1 [ %670, %else890 ], [ true, %then889 ]
  br i1 %671, label %then897, label %else898

then897:                                          ; preds = %continuation888
  br label %continuation896

else898:                                          ; preds = %continuation888
  %672 = alloca i32, align 4
  %673 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %674 = call i32 (ptr, ...) @scanf(ptr %673, ptr %672)
  %675 = load i32, ptr %672, align 4
  %676 = icmp eq i32 %675, 0
  br label %continuation896

continuation896:                                  ; preds = %else898, %then897
  %677 = phi i1 [ %676, %else898 ], [ true, %then897 ]
  br i1 %677, label %then905, label %else906

then905:                                          ; preds = %continuation896
  br label %continuation904

else906:                                          ; preds = %continuation896
  %678 = alloca i32, align 4
  %679 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %680 = call i32 (ptr, ...) @scanf(ptr %679, ptr %678)
  %681 = load i32, ptr %678, align 4
  %682 = icmp eq i32 %681, 0
  br label %continuation904

continuation904:                                  ; preds = %else906, %then905
  %683 = phi i1 [ %682, %else906 ], [ true, %then905 ]
  br i1 %683, label %then913, label %else914

then913:                                          ; preds = %continuation904
  br label %continuation912

else914:                                          ; preds = %continuation904
  %684 = alloca i32, align 4
  %685 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %686 = call i32 (ptr, ...) @scanf(ptr %685, ptr %684)
  %687 = load i32, ptr %684, align 4
  %688 = icmp eq i32 %687, 0
  br label %continuation912

continuation912:                                  ; preds = %else914, %then913
  %689 = phi i1 [ %688, %else914 ], [ true, %then913 ]
  br i1 %689, label %then921, label %else922

then921:                                          ; preds = %continuation912
  br label %continuation920

else922:                                          ; preds = %continuation912
  %690 = alloca i32, align 4
  %691 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %692 = call i32 (ptr, ...) @scanf(ptr %691, ptr %690)
  %693 = load i32, ptr %690, align 4
  %694 = icmp eq i32 %693, 0
  br label %continuation920

continuation920:                                  ; preds = %else922, %then921
  %695 = phi i1 [ %694, %else922 ], [ true, %then921 ]
  br i1 %695, label %then929, label %else930

then929:                                          ; preds = %continuation920
  br label %continuation928

else930:                                          ; preds = %continuation920
  %696 = alloca i32, align 4
  %697 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %698 = call i32 (ptr, ...) @scanf(ptr %697, ptr %696)
  %699 = load i32, ptr %696, align 4
  %700 = icmp eq i32 %699, 0
  br label %continuation928

continuation928:                                  ; preds = %else930, %then929
  %701 = phi i1 [ %700, %else930 ], [ true, %then929 ]
  br i1 %701, label %then937, label %else938

then937:                                          ; preds = %continuation928
  br label %continuation936

else938:                                          ; preds = %continuation928
  %702 = alloca i32, align 4
  %703 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %704 = call i32 (ptr, ...) @scanf(ptr %703, ptr %702)
  %705 = load i32, ptr %702, align 4
  %706 = icmp eq i32 %705, 0
  br label %continuation936

continuation936:                                  ; preds = %else938, %then937
  %707 = phi i1 [ %706, %else938 ], [ true, %then937 ]
  br i1 %707, label %then945, label %else946

then945:                                          ; preds = %continuation936
  br label %continuation944

else946:                                          ; preds = %continuation936
  %708 = alloca i32, align 4
  %709 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %710 = call i32 (ptr, ...) @scanf(ptr %709, ptr %708)
  %711 = load i32, ptr %708, align 4
  %712 = icmp eq i32 %711, 0
  br label %continuation944

continuation944:                                  ; preds = %else946, %then945
  %713 = phi i1 [ %712, %else946 ], [ true, %then945 ]
  br i1 %713, label %then953, label %else954

then953:                                          ; preds = %continuation944
  br label %continuation952

else954:                                          ; preds = %continuation944
  %714 = alloca i32, align 4
  %715 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %716 = call i32 (ptr, ...) @scanf(ptr %715, ptr %714)
  %717 = load i32, ptr %714, align 4
  %718 = icmp eq i32 %717, 0
  br label %continuation952

continuation952:                                  ; preds = %else954, %then953
  %719 = phi i1 [ %718, %else954 ], [ true, %then953 ]
  br i1 %719, label %then961, label %else962

then961:                                          ; preds = %continuation952
  br label %continuation960

else962:                                          ; preds = %continuation952
  %720 = alloca i32, align 4
  %721 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %722 = call i32 (ptr, ...) @scanf(ptr %721, ptr %720)
  %723 = load i32, ptr %720, align 4
  %724 = icmp eq i32 %723, 0
  br label %continuation960

continuation960:                                  ; preds = %else962, %then961
  %725 = phi i1 [ %724, %else962 ], [ true, %then961 ]
  br i1 %725, label %then969, label %else970

then969:                                          ; preds = %continuation960
  br label %continuation968

else970:                                          ; preds = %continuation960
  %726 = alloca i32, align 4
  %727 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %728 = call i32 (ptr, ...) @scanf(ptr %727, ptr %726)
  %729 = load i32, ptr %726, align 4
  %730 = icmp eq i32 %729, 0
  br label %continuation968

continuation968:                                  ; preds = %else970, %then969
  %731 = phi i1 [ %730, %else970 ], [ true, %then969 ]
  br i1 %731, label %then977, label %else978

then977:                                          ; preds = %continuation968
  br label %continuation976

else978:                                          ; preds = %continuation968
  %732 = alloca i32, align 4
  %733 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %734 = call i32 (ptr, ...) @scanf(ptr %733, ptr %732)
  %735 = load i32, ptr %732, align 4
  %736 = icmp eq i32 %735, 0
  br label %continuation976

continuation976:                                  ; preds = %else978, %then977
  %737 = phi i1 [ %736, %else978 ], [ true, %then977 ]
  br i1 %737, label %then985, label %else986

then985:                                          ; preds = %continuation976
  br label %continuation984

else986:                                          ; preds = %continuation976
  %738 = alloca i32, align 4
  %739 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %740 = call i32 (ptr, ...) @scanf(ptr %739, ptr %738)
  %741 = load i32, ptr %738, align 4
  %742 = icmp eq i32 %741, 0
  br label %continuation984

continuation984:                                  ; preds = %else986, %then985
  %743 = phi i1 [ %742, %else986 ], [ true, %then985 ]
  br i1 %743, label %then993, label %else994

then993:                                          ; preds = %continuation984
  br label %continuation992

else994:                                          ; preds = %continuation984
  %744 = alloca i32, align 4
  %745 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %746 = call i32 (ptr, ...) @scanf(ptr %745, ptr %744)
  %747 = load i32, ptr %744, align 4
  %748 = icmp eq i32 %747, 0
  br label %continuation992

continuation992:                                  ; preds = %else994, %then993
  %749 = phi i1 [ %748, %else994 ], [ true, %then993 ]
  br i1 %749, label %then1001, label %else1002

then1001:                                         ; preds = %continuation992
  br label %continuation1000

else1002:                                         ; preds = %continuation992
  %750 = alloca i32, align 4
  %751 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %752 = call i32 (ptr, ...) @scanf(ptr %751, ptr %750)
  %753 = load i32, ptr %750, align 4
  %754 = icmp eq i32 %753, 0
  br label %continuation1000

continuation1000:                                 ; preds = %else1002, %then1001
  %755 = phi i1 [ %754, %else1002 ], [ true, %then1001 ]
  br i1 %755, label %then1009, label %else1010

then1009:                                         ; preds = %continuation1000
  br label %continuation1008

else1010:                                         ; preds = %continuation1000
  %756 = alloca i32, align 4
  %757 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %758 = call i32 (ptr, ...) @scanf(ptr %757, ptr %756)
  %759 = load i32, ptr %756, align 4
  %760 = icmp eq i32 %759, 0
  br label %continuation1008

continuation1008:                                 ; preds = %else1010, %then1009
  %761 = phi i1 [ %760, %else1010 ], [ true, %then1009 ]
  br i1 %761, label %then1017, label %else1018

then1017:                                         ; preds = %continuation1008
  br label %continuation1016

else1018:                                         ; preds = %continuation1008
  %762 = alloca i32, align 4
  %763 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %764 = call i32 (ptr, ...) @scanf(ptr %763, ptr %762)
  %765 = load i32, ptr %762, align 4
  %766 = icmp eq i32 %765, 0
  br label %continuation1016

continuation1016:                                 ; preds = %else1018, %then1017
  %767 = phi i1 [ %766, %else1018 ], [ true, %then1017 ]
  br i1 %767, label %then1025, label %else1026

then1025:                                         ; preds = %continuation1016
  br label %continuation1024

else1026:                                         ; preds = %continuation1016
  %768 = alloca i32, align 4
  %769 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %770 = call i32 (ptr, ...) @scanf(ptr %769, ptr %768)
  %771 = load i32, ptr %768, align 4
  %772 = icmp eq i32 %771, 0
  br label %continuation1024

continuation1024:                                 ; preds = %else1026, %then1025
  %773 = phi i1 [ %772, %else1026 ], [ true, %then1025 ]
  br i1 %773, label %then1033, label %else1034

then1033:                                         ; preds = %continuation1024
  br label %continuation1032

else1034:                                         ; preds = %continuation1024
  %774 = alloca i32, align 4
  %775 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %776 = call i32 (ptr, ...) @scanf(ptr %775, ptr %774)
  %777 = load i32, ptr %774, align 4
  %778 = icmp eq i32 %777, 0
  br label %continuation1032

continuation1032:                                 ; preds = %else1034, %then1033
  %779 = phi i1 [ %778, %else1034 ], [ true, %then1033 ]
  br i1 %779, label %then1041, label %else1042

then1041:                                         ; preds = %continuation1032
  br label %continuation1040

else1042:                                         ; preds = %continuation1032
  %780 = alloca i32, align 4
  %781 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %782 = call i32 (ptr, ...) @scanf(ptr %781, ptr %780)
  %783 = load i32, ptr %780, align 4
  %784 = icmp eq i32 %783, 0
  br label %continuation1040

continuation1040:                                 ; preds = %else1042, %then1041
  %785 = phi i1 [ %784, %else1042 ], [ true, %then1041 ]
  br i1 %785, label %then1049, label %else1050

then1049:                                         ; preds = %continuation1040
  br label %continuation1048

else1050:                                         ; preds = %continuation1040
  %786 = alloca i32, align 4
  %787 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %788 = call i32 (ptr, ...) @scanf(ptr %787, ptr %786)
  %789 = load i32, ptr %786, align 4
  %790 = icmp eq i32 %789, 0
  br label %continuation1048

continuation1048:                                 ; preds = %else1050, %then1049
  %791 = phi i1 [ %790, %else1050 ], [ true, %then1049 ]
  br i1 %791, label %then1057, label %else1058

then1057:                                         ; preds = %continuation1048
  br label %continuation1056

else1058:                                         ; preds = %continuation1048
  %792 = alloca i32, align 4
  %793 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %794 = call i32 (ptr, ...) @scanf(ptr %793, ptr %792)
  %795 = load i32, ptr %792, align 4
  %796 = icmp eq i32 %795, 0
  br label %continuation1056

continuation1056:                                 ; preds = %else1058, %then1057
  %797 = phi i1 [ %796, %else1058 ], [ true, %then1057 ]
  br i1 %797, label %then1065, label %else1066

then1065:                                         ; preds = %continuation1056
  br label %continuation1064

else1066:                                         ; preds = %continuation1056
  %798 = alloca i32, align 4
  %799 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %800 = call i32 (ptr, ...) @scanf(ptr %799, ptr %798)
  %801 = load i32, ptr %798, align 4
  %802 = icmp eq i32 %801, 0
  br label %continuation1064

continuation1064:                                 ; preds = %else1066, %then1065
  %803 = phi i1 [ %802, %else1066 ], [ true, %then1065 ]
  br i1 %803, label %then1073, label %else1074

then1073:                                         ; preds = %continuation1064
  br label %continuation1072

else1074:                                         ; preds = %continuation1064
  %804 = alloca i32, align 4
  %805 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %806 = call i32 (ptr, ...) @scanf(ptr %805, ptr %804)
  %807 = load i32, ptr %804, align 4
  %808 = icmp eq i32 %807, 0
  br label %continuation1072

continuation1072:                                 ; preds = %else1074, %then1073
  %809 = phi i1 [ %808, %else1074 ], [ true, %then1073 ]
  br i1 %809, label %then1081, label %else1082

then1081:                                         ; preds = %continuation1072
  br label %continuation1080

else1082:                                         ; preds = %continuation1072
  %810 = alloca i32, align 4
  %811 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %812 = call i32 (ptr, ...) @scanf(ptr %811, ptr %810)
  %813 = load i32, ptr %810, align 4
  %814 = icmp eq i32 %813, 0
  br label %continuation1080

continuation1080:                                 ; preds = %else1082, %then1081
  %815 = phi i1 [ %814, %else1082 ], [ true, %then1081 ]
  br i1 %815, label %then1089, label %else1090

then1089:                                         ; preds = %continuation1080
  br label %continuation1088

else1090:                                         ; preds = %continuation1080
  %816 = alloca i32, align 4
  %817 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %818 = call i32 (ptr, ...) @scanf(ptr %817, ptr %816)
  %819 = load i32, ptr %816, align 4
  %820 = icmp eq i32 %819, 0
  br label %continuation1088

continuation1088:                                 ; preds = %else1090, %then1089
  %821 = phi i1 [ %820, %else1090 ], [ true, %then1089 ]
  br i1 %821, label %then1097, label %else1098

then1097:                                         ; preds = %continuation1088
  br label %continuation1096

else1098:                                         ; preds = %continuation1088
  %822 = alloca i32, align 4
  %823 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %824 = call i32 (ptr, ...) @scanf(ptr %823, ptr %822)
  %825 = load i32, ptr %822, align 4
  %826 = icmp eq i32 %825, 0
  br label %continuation1096

continuation1096:                                 ; preds = %else1098, %then1097
  %827 = phi i1 [ %826, %else1098 ], [ true, %then1097 ]
  br i1 %827, label %then1105, label %else1106

then1105:                                         ; preds = %continuation1096
  br label %continuation1104

else1106:                                         ; preds = %continuation1096
  %828 = alloca i32, align 4
  %829 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %830 = call i32 (ptr, ...) @scanf(ptr %829, ptr %828)
  %831 = load i32, ptr %828, align 4
  %832 = icmp eq i32 %831, 0
  br label %continuation1104

continuation1104:                                 ; preds = %else1106, %then1105
  %833 = phi i1 [ %832, %else1106 ], [ true, %then1105 ]
  br i1 %833, label %then1113, label %else1114

then1113:                                         ; preds = %continuation1104
  br label %continuation1112

else1114:                                         ; preds = %continuation1104
  %834 = alloca i32, align 4
  %835 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %836 = call i32 (ptr, ...) @scanf(ptr %835, ptr %834)
  %837 = load i32, ptr %834, align 4
  %838 = icmp eq i32 %837, 0
  br label %continuation1112

continuation1112:                                 ; preds = %else1114, %then1113
  %839 = phi i1 [ %838, %else1114 ], [ true, %then1113 ]
  br i1 %839, label %then1121, label %else1122

then1121:                                         ; preds = %continuation1112
  br label %continuation1120

else1122:                                         ; preds = %continuation1112
  %840 = alloca i32, align 4
  %841 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %842 = call i32 (ptr, ...) @scanf(ptr %841, ptr %840)
  %843 = load i32, ptr %840, align 4
  %844 = icmp eq i32 %843, 0
  br label %continuation1120

continuation1120:                                 ; preds = %else1122, %then1121
  %845 = phi i1 [ %844, %else1122 ], [ true, %then1121 ]
  br i1 %845, label %then1129, label %else1130

then1129:                                         ; preds = %continuation1120
  br label %continuation1128

else1130:                                         ; preds = %continuation1120
  %846 = alloca i32, align 4
  %847 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %848 = call i32 (ptr, ...) @scanf(ptr %847, ptr %846)
  %849 = load i32, ptr %846, align 4
  %850 = icmp eq i32 %849, 0
  br label %continuation1128

continuation1128:                                 ; preds = %else1130, %then1129
  %851 = phi i1 [ %850, %else1130 ], [ true, %then1129 ]
  br i1 %851, label %then1137, label %else1138

then1137:                                         ; preds = %continuation1128
  br label %continuation1136

else1138:                                         ; preds = %continuation1128
  %852 = alloca i32, align 4
  %853 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %854 = call i32 (ptr, ...) @scanf(ptr %853, ptr %852)
  %855 = load i32, ptr %852, align 4
  %856 = icmp eq i32 %855, 0
  br label %continuation1136

continuation1136:                                 ; preds = %else1138, %then1137
  %857 = phi i1 [ %856, %else1138 ], [ true, %then1137 ]
  br i1 %857, label %then1145, label %else1146

then1145:                                         ; preds = %continuation1136
  br label %continuation1144

else1146:                                         ; preds = %continuation1136
  %858 = alloca i32, align 4
  %859 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %860 = call i32 (ptr, ...) @scanf(ptr %859, ptr %858)
  %861 = load i32, ptr %858, align 4
  %862 = icmp eq i32 %861, 0
  br label %continuation1144

continuation1144:                                 ; preds = %else1146, %then1145
  %863 = phi i1 [ %862, %else1146 ], [ true, %then1145 ]
  br i1 %863, label %then1153, label %else1154

then1153:                                         ; preds = %continuation1144
  br label %continuation1152

else1154:                                         ; preds = %continuation1144
  %864 = alloca i32, align 4
  %865 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %866 = call i32 (ptr, ...) @scanf(ptr %865, ptr %864)
  %867 = load i32, ptr %864, align 4
  %868 = icmp eq i32 %867, 0
  br label %continuation1152

continuation1152:                                 ; preds = %else1154, %then1153
  %869 = phi i1 [ %868, %else1154 ], [ true, %then1153 ]
  br i1 %869, label %then1161, label %else1162

then1161:                                         ; preds = %continuation1152
  br label %continuation1160

else1162:                                         ; preds = %continuation1152
  %870 = alloca i32, align 4
  %871 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %872 = call i32 (ptr, ...) @scanf(ptr %871, ptr %870)
  %873 = load i32, ptr %870, align 4
  %874 = icmp eq i32 %873, 0
  br label %continuation1160

continuation1160:                                 ; preds = %else1162, %then1161
  %875 = phi i1 [ %874, %else1162 ], [ true, %then1161 ]
  br i1 %875, label %then1169, label %else1170

then1169:                                         ; preds = %continuation1160
  br label %continuation1168

else1170:                                         ; preds = %continuation1160
  %876 = alloca i32, align 4
  %877 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %878 = call i32 (ptr, ...) @scanf(ptr %877, ptr %876)
  %879 = load i32, ptr %876, align 4
  %880 = icmp eq i32 %879, 0
  br label %continuation1168

continuation1168:                                 ; preds = %else1170, %then1169
  %881 = phi i1 [ %880, %else1170 ], [ true, %then1169 ]
  br i1 %881, label %then1177, label %else1178

then1177:                                         ; preds = %continuation1168
  br label %continuation1176

else1178:                                         ; preds = %continuation1168
  %882 = alloca i32, align 4
  %883 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %884 = call i32 (ptr, ...) @scanf(ptr %883, ptr %882)
  %885 = load i32, ptr %882, align 4
  %886 = icmp eq i32 %885, 0
  br label %continuation1176

continuation1176:                                 ; preds = %else1178, %then1177
  %887 = phi i1 [ %886, %else1178 ], [ true, %then1177 ]
  br i1 %887, label %then1185, label %else1186

then1185:                                         ; preds = %continuation1176
  br label %continuation1184

else1186:                                         ; preds = %continuation1176
  %888 = alloca i32, align 4
  %889 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %890 = call i32 (ptr, ...) @scanf(ptr %889, ptr %888)
  %891 = load i32, ptr %888, align 4
  %892 = icmp eq i32 %891, 0
  br label %continuation1184

continuation1184:                                 ; preds = %else1186, %then1185
  %893 = phi i1 [ %892, %else1186 ], [ true, %then1185 ]
  br i1 %893, label %then1193, label %else1194

then1193:                                         ; preds = %continuation1184
  br label %continuation1192

else1194:                                         ; preds = %continuation1184
  %894 = alloca i32, align 4
  %895 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %896 = call i32 (ptr, ...) @scanf(ptr %895, ptr %894)
  %897 = load i32, ptr %894, align 4
  %898 = icmp eq i32 %897, 0
  br label %continuation1192

continuation1192:                                 ; preds = %else1194, %then1193
  %899 = phi i1 [ %898, %else1194 ], [ true, %then1193 ]
  br i1 %899, label %then1201, label %else1202

then1201:                                         ; preds = %continuation1192
  br label %continuation1200

else1202:                                         ; preds = %continuation1192
  %900 = alloca i32, align 4
  %901 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %902 = call i32 (ptr, ...) @scanf(ptr %901, ptr %900)
  %903 = load i32, ptr %900, align 4
  %904 = icmp eq i32 %903, 0
  br label %continuation1200

continuation1200:                                 ; preds = %else1202, %then1201
  %905 = phi i1 [ %904, %else1202 ], [ true, %then1201 ]
  br i1 %905, label %then1209, label %else1210

then1209:                                         ; preds = %continuation1200
  br label %continuation1208

else1210:                                         ; preds = %continuation1200
  %906 = alloca i32, align 4
  %907 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %908 = call i32 (ptr, ...) @scanf(ptr %907, ptr %906)
  %909 = load i32, ptr %906, align 4
  %910 = icmp eq i32 %909, 0
  br label %continuation1208

continuation1208:                                 ; preds = %else1210, %then1209
  %911 = phi i1 [ %910, %else1210 ], [ true, %then1209 ]
  br i1 %911, label %then1217, label %else1218

then1217:                                         ; preds = %continuation1208
  br label %continuation1216

else1218:                                         ; preds = %continuation1208
  %912 = alloca i32, align 4
  %913 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %914 = call i32 (ptr, ...) @scanf(ptr %913, ptr %912)
  %915 = load i32, ptr %912, align 4
  %916 = icmp eq i32 %915, 0
  br label %continuation1216

continuation1216:                                 ; preds = %else1218, %then1217
  %917 = phi i1 [ %916, %else1218 ], [ true, %then1217 ]
  br i1 %917, label %then1225, label %else1226

then1225:                                         ; preds = %continuation1216
  br label %continuation1224

else1226:                                         ; preds = %continuation1216
  %918 = alloca i32, align 4
  %919 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %920 = call i32 (ptr, ...) @scanf(ptr %919, ptr %918)
  %921 = load i32, ptr %918, align 4
  %922 = icmp eq i32 %921, 0
  br label %continuation1224

continuation1224:                                 ; preds = %else1226, %then1225
  %923 = phi i1 [ %922, %else1226 ], [ true, %then1225 ]
  br i1 %923, label %then1233, label %else1234

then1233:                                         ; preds = %continuation1224
  br label %continuation1232

else1234:                                         ; preds = %continuation1224
  %924 = alloca i32, align 4
  %925 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %926 = call i32 (ptr, ...) @scanf(ptr %925, ptr %924)
  %927 = load i32, ptr %924, align 4
  %928 = icmp eq i32 %927, 0
  br label %continuation1232

continuation1232:                                 ; preds = %else1234, %then1233
  %929 = phi i1 [ %928, %else1234 ], [ true, %then1233 ]
  br i1 %929, label %then1241, label %else1242

then1241:                                         ; preds = %continuation1232
  br label %continuation1240

else1242:                                         ; preds = %continuation1232
  %930 = alloca i32, align 4
  %931 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %932 = call i32 (ptr, ...) @scanf(ptr %931, ptr %930)
  %933 = load i32, ptr %930, align 4
  %934 = icmp eq i32 %933, 0
  br label %continuation1240

continuation1240:                                 ; preds = %else1242, %then1241
  %935 = phi i1 [ %934, %else1242 ], [ true, %then1241 ]
  br i1 %935, label %then1249, label %else1250

then1249:                                         ; preds = %continuation1240
  br label %continuation1248

else1250:                                         ; preds = %continuation1240
  %936 = alloca i32, align 4
  %937 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %938 = call i32 (ptr, ...) @scanf(ptr %937, ptr %936)
  %939 = load i32, ptr %936, align 4
  %940 = icmp eq i32 %939, 0
  br label %continuation1248

continuation1248:                                 ; preds = %else1250, %then1249
  %941 = phi i1 [ %940, %else1250 ], [ true, %then1249 ]
  br i1 %941, label %then1257, label %else1258

then1257:                                         ; preds = %continuation1248
  br label %continuation1256

else1258:                                         ; preds = %continuation1248
  %942 = alloca i32, align 4
  %943 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %944 = call i32 (ptr, ...) @scanf(ptr %943, ptr %942)
  %945 = load i32, ptr %942, align 4
  %946 = icmp eq i32 %945, 0
  br label %continuation1256

continuation1256:                                 ; preds = %else1258, %then1257
  %947 = phi i1 [ %946, %else1258 ], [ true, %then1257 ]
  br i1 %947, label %then1265, label %else1266

then1265:                                         ; preds = %continuation1256
  br label %continuation1264

else1266:                                         ; preds = %continuation1256
  %948 = alloca i32, align 4
  %949 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %950 = call i32 (ptr, ...) @scanf(ptr %949, ptr %948)
  %951 = load i32, ptr %948, align 4
  %952 = icmp eq i32 %951, 0
  br label %continuation1264

continuation1264:                                 ; preds = %else1266, %then1265
  %953 = phi i1 [ %952, %else1266 ], [ true, %then1265 ]
  br i1 %953, label %then1273, label %else1274

then1273:                                         ; preds = %continuation1264
  br label %continuation1272

else1274:                                         ; preds = %continuation1264
  %954 = alloca i32, align 4
  %955 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %956 = call i32 (ptr, ...) @scanf(ptr %955, ptr %954)
  %957 = load i32, ptr %954, align 4
  %958 = icmp eq i32 %957, 0
  br label %continuation1272

continuation1272:                                 ; preds = %else1274, %then1273
  %959 = phi i1 [ %958, %else1274 ], [ true, %then1273 ]
  br i1 %959, label %then1281, label %else1282

then1281:                                         ; preds = %continuation1272
  br label %continuation1280

else1282:                                         ; preds = %continuation1272
  %960 = alloca i32, align 4
  %961 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %962 = call i32 (ptr, ...) @scanf(ptr %961, ptr %960)
  %963 = load i32, ptr %960, align 4
  %964 = icmp eq i32 %963, 0
  br label %continuation1280

continuation1280:                                 ; preds = %else1282, %then1281
  %965 = phi i1 [ %964, %else1282 ], [ true, %then1281 ]
  br i1 %965, label %then1289, label %else1290

then1289:                                         ; preds = %continuation1280
  br label %continuation1288

else1290:                                         ; preds = %continuation1280
  %966 = alloca i32, align 4
  %967 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %968 = call i32 (ptr, ...) @scanf(ptr %967, ptr %966)
  %969 = load i32, ptr %966, align 4
  %970 = icmp eq i32 %969, 0
  br label %continuation1288

continuation1288:                                 ; preds = %else1290, %then1289
  %971 = phi i1 [ %970, %else1290 ], [ true, %then1289 ]
  br i1 %971, label %then1297, label %else1298

then1297:                                         ; preds = %continuation1288
  br label %continuation1296

else1298:                                         ; preds = %continuation1288
  %972 = alloca i32, align 4
  %973 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %974 = call i32 (ptr, ...) @scanf(ptr %973, ptr %972)
  %975 = load i32, ptr %972, align 4
  %976 = icmp eq i32 %975, 0
  br label %continuation1296

continuation1296:                                 ; preds = %else1298, %then1297
  %977 = phi i1 [ %976, %else1298 ], [ true, %then1297 ]
  br i1 %977, label %then1305, label %else1306

then1305:                                         ; preds = %continuation1296
  br label %continuation1304

else1306:                                         ; preds = %continuation1296
  %978 = alloca i32, align 4
  %979 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %980 = call i32 (ptr, ...) @scanf(ptr %979, ptr %978)
  %981 = load i32, ptr %978, align 4
  %982 = icmp eq i32 %981, 0
  br label %continuation1304

continuation1304:                                 ; preds = %else1306, %then1305
  %983 = phi i1 [ %982, %else1306 ], [ true, %then1305 ]
  br i1 %983, label %then1313, label %else1314

then1313:                                         ; preds = %continuation1304
  br label %continuation1312

else1314:                                         ; preds = %continuation1304
  %984 = alloca i32, align 4
  %985 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %986 = call i32 (ptr, ...) @scanf(ptr %985, ptr %984)
  %987 = load i32, ptr %984, align 4
  %988 = icmp eq i32 %987, 0
  br label %continuation1312

continuation1312:                                 ; preds = %else1314, %then1313
  %989 = phi i1 [ %988, %else1314 ], [ true, %then1313 ]
  br i1 %989, label %then1321, label %else1322

then1321:                                         ; preds = %continuation1312
  br label %continuation1320

else1322:                                         ; preds = %continuation1312
  %990 = alloca i32, align 4
  %991 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %992 = call i32 (ptr, ...) @scanf(ptr %991, ptr %990)
  %993 = load i32, ptr %990, align 4
  %994 = icmp eq i32 %993, 0
  br label %continuation1320

continuation1320:                                 ; preds = %else1322, %then1321
  %995 = phi i1 [ %994, %else1322 ], [ true, %then1321 ]
  br i1 %995, label %then1329, label %else1330

then1329:                                         ; preds = %continuation1320
  br label %continuation1328

else1330:                                         ; preds = %continuation1320
  %996 = alloca i32, align 4
  %997 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %998 = call i32 (ptr, ...) @scanf(ptr %997, ptr %996)
  %999 = load i32, ptr %996, align 4
  %1000 = icmp eq i32 %999, 0
  br label %continuation1328

continuation1328:                                 ; preds = %else1330, %then1329
  %1001 = phi i1 [ %1000, %else1330 ], [ true, %then1329 ]
  br i1 %1001, label %then1337, label %else1338

then1337:                                         ; preds = %continuation1328
  br label %continuation1336

else1338:                                         ; preds = %continuation1328
  %1002 = alloca i32, align 4
  %1003 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1004 = call i32 (ptr, ...) @scanf(ptr %1003, ptr %1002)
  %1005 = load i32, ptr %1002, align 4
  %1006 = icmp eq i32 %1005, 0
  br label %continuation1336

continuation1336:                                 ; preds = %else1338, %then1337
  %1007 = phi i1 [ %1006, %else1338 ], [ true, %then1337 ]
  br i1 %1007, label %then1345, label %else1346

then1345:                                         ; preds = %continuation1336
  br label %continuation1344

else1346:                                         ; preds = %continuation1336
  %1008 = alloca i32, align 4
  %1009 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1010 = call i32 (ptr, ...) @scanf(ptr %1009, ptr %1008)
  %1011 = load i32, ptr %1008, align 4
  %1012 = icmp eq i32 %1011, 0
  br label %continuation1344

continuation1344:                                 ; preds = %else1346, %then1345
  %1013 = phi i1 [ %1012, %else1346 ], [ true, %then1345 ]
  br i1 %1013, label %then1353, label %else1354

then1353:                                         ; preds = %continuation1344
  br label %continuation1352

else1354:                                         ; preds = %continuation1344
  %1014 = alloca i32, align 4
  %1015 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1016 = call i32 (ptr, ...) @scanf(ptr %1015, ptr %1014)
  %1017 = load i32, ptr %1014, align 4
  %1018 = icmp eq i32 %1017, 0
  br label %continuation1352

continuation1352:                                 ; preds = %else1354, %then1353
  %1019 = phi i1 [ %1018, %else1354 ], [ true, %then1353 ]
  br i1 %1019, label %then1361, label %else1362

then1361:                                         ; preds = %continuation1352
  br label %continuation1360

else1362:                                         ; preds = %continuation1352
  %1020 = alloca i32, align 4
  %1021 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1022 = call i32 (ptr, ...) @scanf(ptr %1021, ptr %1020)
  %1023 = load i32, ptr %1020, align 4
  %1024 = icmp eq i32 %1023, 0
  br label %continuation1360

continuation1360:                                 ; preds = %else1362, %then1361
  %1025 = phi i1 [ %1024, %else1362 ], [ true, %then1361 ]
  br i1 %1025, label %then1369, label %else1370

then1369:                                         ; preds = %continuation1360
  br label %continuation1368

else1370:                                         ; preds = %continuation1360
  %1026 = alloca i32, align 4
  %1027 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1028 = call i32 (ptr, ...) @scanf(ptr %1027, ptr %1026)
  %1029 = load i32, ptr %1026, align 4
  %1030 = icmp eq i32 %1029, 0
  br label %continuation1368

continuation1368:                                 ; preds = %else1370, %then1369
  %1031 = phi i1 [ %1030, %else1370 ], [ true, %then1369 ]
  br i1 %1031, label %then1377, label %else1378

then1377:                                         ; preds = %continuation1368
  br label %continuation1376

else1378:                                         ; preds = %continuation1368
  %1032 = alloca i32, align 4
  %1033 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1034 = call i32 (ptr, ...) @scanf(ptr %1033, ptr %1032)
  %1035 = load i32, ptr %1032, align 4
  %1036 = icmp eq i32 %1035, 0
  br label %continuation1376

continuation1376:                                 ; preds = %else1378, %then1377
  %1037 = phi i1 [ %1036, %else1378 ], [ true, %then1377 ]
  br i1 %1037, label %then1385, label %else1386

then1385:                                         ; preds = %continuation1376
  br label %continuation1384

else1386:                                         ; preds = %continuation1376
  %1038 = alloca i32, align 4
  %1039 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1040 = call i32 (ptr, ...) @scanf(ptr %1039, ptr %1038)
  %1041 = load i32, ptr %1038, align 4
  %1042 = icmp eq i32 %1041, 0
  br label %continuation1384

continuation1384:                                 ; preds = %else1386, %then1385
  %1043 = phi i1 [ %1042, %else1386 ], [ true, %then1385 ]
  br i1 %1043, label %then1393, label %else1394

then1393:                                         ; preds = %continuation1384
  br label %continuation1392

else1394:                                         ; preds = %continuation1384
  %1044 = alloca i32, align 4
  %1045 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1046 = call i32 (ptr, ...) @scanf(ptr %1045, ptr %1044)
  %1047 = load i32, ptr %1044, align 4
  %1048 = icmp eq i32 %1047, 0
  br label %continuation1392

continuation1392:                                 ; preds = %else1394, %then1393
  %1049 = phi i1 [ %1048, %else1394 ], [ true, %then1393 ]
  br i1 %1049, label %then1401, label %else1402

then1401:                                         ; preds = %continuation1392
  br label %continuation1400

else1402:                                         ; preds = %continuation1392
  %1050 = alloca i32, align 4
  %1051 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1052 = call i32 (ptr, ...) @scanf(ptr %1051, ptr %1050)
  %1053 = load i32, ptr %1050, align 4
  %1054 = icmp eq i32 %1053, 0
  br label %continuation1400

continuation1400:                                 ; preds = %else1402, %then1401
  %1055 = phi i1 [ %1054, %else1402 ], [ true, %then1401 ]
  br i1 %1055, label %then1409, label %else1410

then1409:                                         ; preds = %continuation1400
  br label %continuation1408

else1410:                                         ; preds = %continuation1400
  %1056 = alloca i32, align 4
  %1057 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1058 = call i32 (ptr, ...) @scanf(ptr %1057, ptr %1056)
  %1059 = load i32, ptr %1056, align 4
  %1060 = icmp eq i32 %1059, 0
  br label %continuation1408

continuation1408:                                 ; preds = %else1410, %then1409
  %1061 = phi i1 [ %1060, %else1410 ], [ true, %then1409 ]
  br i1 %1061, label %then1417, label %else1418

then1417:                                         ; preds = %continuation1408
  br label %continuation1416

else1418:                                         ; preds = %continuation1408
  %1062 = alloca i32, align 4
  %1063 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1064 = call i32 (ptr, ...) @scanf(ptr %1063, ptr %1062)
  %1065 = load i32, ptr %1062, align 4
  %1066 = icmp eq i32 %1065, 0
  br label %continuation1416

continuation1416:                                 ; preds = %else1418, %then1417
  %1067 = phi i1 [ %1066, %else1418 ], [ true, %then1417 ]
  br i1 %1067, label %then1425, label %else1426

then1425:                                         ; preds = %continuation1416
  br label %continuation1424

else1426:                                         ; preds = %continuation1416
  %1068 = alloca i32, align 4
  %1069 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1070 = call i32 (ptr, ...) @scanf(ptr %1069, ptr %1068)
  %1071 = load i32, ptr %1068, align 4
  %1072 = icmp eq i32 %1071, 0
  br label %continuation1424

continuation1424:                                 ; preds = %else1426, %then1425
  %1073 = phi i1 [ %1072, %else1426 ], [ true, %then1425 ]
  br i1 %1073, label %then1433, label %else1434

then1433:                                         ; preds = %continuation1424
  br label %continuation1432

else1434:                                         ; preds = %continuation1424
  %1074 = alloca i32, align 4
  %1075 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1076 = call i32 (ptr, ...) @scanf(ptr %1075, ptr %1074)
  %1077 = load i32, ptr %1074, align 4
  %1078 = icmp eq i32 %1077, 0
  br label %continuation1432

continuation1432:                                 ; preds = %else1434, %then1433
  %1079 = phi i1 [ %1078, %else1434 ], [ true, %then1433 ]
  br i1 %1079, label %then1441, label %else1442

then1441:                                         ; preds = %continuation1432
  br label %continuation1440

else1442:                                         ; preds = %continuation1432
  %1080 = alloca i32, align 4
  %1081 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1082 = call i32 (ptr, ...) @scanf(ptr %1081, ptr %1080)
  %1083 = load i32, ptr %1080, align 4
  %1084 = icmp eq i32 %1083, 0
  br label %continuation1440

continuation1440:                                 ; preds = %else1442, %then1441
  %1085 = phi i1 [ %1084, %else1442 ], [ true, %then1441 ]
  br i1 %1085, label %then1449, label %else1450

then1449:                                         ; preds = %continuation1440
  br label %continuation1448

else1450:                                         ; preds = %continuation1440
  %1086 = alloca i32, align 4
  %1087 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1088 = call i32 (ptr, ...) @scanf(ptr %1087, ptr %1086)
  %1089 = load i32, ptr %1086, align 4
  %1090 = icmp eq i32 %1089, 0
  br label %continuation1448

continuation1448:                                 ; preds = %else1450, %then1449
  %1091 = phi i1 [ %1090, %else1450 ], [ true, %then1449 ]
  br i1 %1091, label %then1457, label %else1458

then1457:                                         ; preds = %continuation1448
  br label %continuation1456

else1458:                                         ; preds = %continuation1448
  %1092 = alloca i32, align 4
  %1093 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1094 = call i32 (ptr, ...) @scanf(ptr %1093, ptr %1092)
  %1095 = load i32, ptr %1092, align 4
  %1096 = icmp eq i32 %1095, 0
  br label %continuation1456

continuation1456:                                 ; preds = %else1458, %then1457
  %1097 = phi i1 [ %1096, %else1458 ], [ true, %then1457 ]
  br i1 %1097, label %then1465, label %else1466

then1465:                                         ; preds = %continuation1456
  br label %continuation1464

else1466:                                         ; preds = %continuation1456
  %1098 = alloca i32, align 4
  %1099 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1100 = call i32 (ptr, ...) @scanf(ptr %1099, ptr %1098)
  %1101 = load i32, ptr %1098, align 4
  %1102 = icmp eq i32 %1101, 0
  br label %continuation1464

continuation1464:                                 ; preds = %else1466, %then1465
  %1103 = phi i1 [ %1102, %else1466 ], [ true, %then1465 ]
  br i1 %1103, label %then1473, label %else1474

then1473:                                         ; preds = %continuation1464
  br label %continuation1472

else1474:                                         ; preds = %continuation1464
  %1104 = alloca i32, align 4
  %1105 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1106 = call i32 (ptr, ...) @scanf(ptr %1105, ptr %1104)
  %1107 = load i32, ptr %1104, align 4
  %1108 = icmp eq i32 %1107, 0
  br label %continuation1472

continuation1472:                                 ; preds = %else1474, %then1473
  %1109 = phi i1 [ %1108, %else1474 ], [ true, %then1473 ]
  br i1 %1109, label %then1481, label %else1482

then1481:                                         ; preds = %continuation1472
  br label %continuation1480

else1482:                                         ; preds = %continuation1472
  %1110 = alloca i32, align 4
  %1111 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1112 = call i32 (ptr, ...) @scanf(ptr %1111, ptr %1110)
  %1113 = load i32, ptr %1110, align 4
  %1114 = icmp eq i32 %1113, 0
  br label %continuation1480

continuation1480:                                 ; preds = %else1482, %then1481
  %1115 = phi i1 [ %1114, %else1482 ], [ true, %then1481 ]
  br i1 %1115, label %then1489, label %else1490

then1489:                                         ; preds = %continuation1480
  br label %continuation1488

else1490:                                         ; preds = %continuation1480
  %1116 = alloca i32, align 4
  %1117 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1118 = call i32 (ptr, ...) @scanf(ptr %1117, ptr %1116)
  %1119 = load i32, ptr %1116, align 4
  %1120 = icmp eq i32 %1119, 0
  br label %continuation1488

continuation1488:                                 ; preds = %else1490, %then1489
  %1121 = phi i1 [ %1120, %else1490 ], [ true, %then1489 ]
  br i1 %1121, label %then1497, label %else1498

then1497:                                         ; preds = %continuation1488
  br label %continuation1496

else1498:                                         ; preds = %continuation1488
  %1122 = alloca i32, align 4
  %1123 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1124 = call i32 (ptr, ...) @scanf(ptr %1123, ptr %1122)
  %1125 = load i32, ptr %1122, align 4
  %1126 = icmp eq i32 %1125, 0
  br label %continuation1496

continuation1496:                                 ; preds = %else1498, %then1497
  %1127 = phi i1 [ %1126, %else1498 ], [ true, %then1497 ]
  br i1 %1127, label %then1505, label %else1506

then1505:                                         ; preds = %continuation1496
  br label %continuation1504

else1506:                                         ; preds = %continuation1496
  %1128 = alloca i32, align 4
  %1129 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1130 = call i32 (ptr, ...) @scanf(ptr %1129, ptr %1128)
  %1131 = load i32, ptr %1128, align 4
  %1132 = icmp eq i32 %1131, 0
  br label %continuation1504

continuation1504:                                 ; preds = %else1506, %then1505
  %1133 = phi i1 [ %1132, %else1506 ], [ true, %then1505 ]
  br i1 %1133, label %then1513, label %else1514

then1513:                                         ; preds = %continuation1504
  br label %continuation1512

else1514:                                         ; preds = %continuation1504
  %1134 = alloca i32, align 4
  %1135 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1136 = call i32 (ptr, ...) @scanf(ptr %1135, ptr %1134)
  %1137 = load i32, ptr %1134, align 4
  %1138 = icmp eq i32 %1137, 0
  br label %continuation1512

continuation1512:                                 ; preds = %else1514, %then1513
  %1139 = phi i1 [ %1138, %else1514 ], [ true, %then1513 ]
  br i1 %1139, label %then1521, label %else1522

then1521:                                         ; preds = %continuation1512
  br label %continuation1520

else1522:                                         ; preds = %continuation1512
  %1140 = alloca i32, align 4
  %1141 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1142 = call i32 (ptr, ...) @scanf(ptr %1141, ptr %1140)
  %1143 = load i32, ptr %1140, align 4
  %1144 = icmp eq i32 %1143, 0
  br label %continuation1520

continuation1520:                                 ; preds = %else1522, %then1521
  %1145 = phi i1 [ %1144, %else1522 ], [ true, %then1521 ]
  br i1 %1145, label %then1529, label %else1530

then1529:                                         ; preds = %continuation1520
  br label %continuation1528

else1530:                                         ; preds = %continuation1520
  %1146 = alloca i32, align 4
  %1147 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1148 = call i32 (ptr, ...) @scanf(ptr %1147, ptr %1146)
  %1149 = load i32, ptr %1146, align 4
  %1150 = icmp eq i32 %1149, 0
  br label %continuation1528

continuation1528:                                 ; preds = %else1530, %then1529
  %1151 = phi i1 [ %1150, %else1530 ], [ true, %then1529 ]
  br i1 %1151, label %then1537, label %else1538

then1537:                                         ; preds = %continuation1528
  br label %continuation1536

else1538:                                         ; preds = %continuation1528
  %1152 = alloca i32, align 4
  %1153 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1154 = call i32 (ptr, ...) @scanf(ptr %1153, ptr %1152)
  %1155 = load i32, ptr %1152, align 4
  %1156 = icmp eq i32 %1155, 0
  br label %continuation1536

continuation1536:                                 ; preds = %else1538, %then1537
  %1157 = phi i1 [ %1156, %else1538 ], [ true, %then1537 ]
  br i1 %1157, label %then1545, label %else1546

then1545:                                         ; preds = %continuation1536
  br label %continuation1544

else1546:                                         ; preds = %continuation1536
  %1158 = alloca i32, align 4
  %1159 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1160 = call i32 (ptr, ...) @scanf(ptr %1159, ptr %1158)
  %1161 = load i32, ptr %1158, align 4
  %1162 = icmp eq i32 %1161, 0
  br label %continuation1544

continuation1544:                                 ; preds = %else1546, %then1545
  %1163 = phi i1 [ %1162, %else1546 ], [ true, %then1545 ]
  br i1 %1163, label %then1553, label %else1554

then1553:                                         ; preds = %continuation1544
  br label %continuation1552

else1554:                                         ; preds = %continuation1544
  %1164 = alloca i32, align 4
  %1165 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1166 = call i32 (ptr, ...) @scanf(ptr %1165, ptr %1164)
  %1167 = load i32, ptr %1164, align 4
  %1168 = icmp eq i32 %1167, 0
  br label %continuation1552

continuation1552:                                 ; preds = %else1554, %then1553
  %1169 = phi i1 [ %1168, %else1554 ], [ true, %then1553 ]
  br i1 %1169, label %then1561, label %else1562

then1561:                                         ; preds = %continuation1552
  br label %continuation1560

else1562:                                         ; preds = %continuation1552
  %1170 = alloca i32, align 4
  %1171 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1172 = call i32 (ptr, ...) @scanf(ptr %1171, ptr %1170)
  %1173 = load i32, ptr %1170, align 4
  %1174 = icmp eq i32 %1173, 0
  br label %continuation1560

continuation1560:                                 ; preds = %else1562, %then1561
  %1175 = phi i1 [ %1174, %else1562 ], [ true, %then1561 ]
  br i1 %1175, label %then1569, label %else1570

then1569:                                         ; preds = %continuation1560
  br label %continuation1568

else1570:                                         ; preds = %continuation1560
  %1176 = alloca i32, align 4
  %1177 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1178 = call i32 (ptr, ...) @scanf(ptr %1177, ptr %1176)
  %1179 = load i32, ptr %1176, align 4
  %1180 = icmp eq i32 %1179, 0
  br label %continuation1568

continuation1568:                                 ; preds = %else1570, %then1569
  %1181 = phi i1 [ %1180, %else1570 ], [ true, %then1569 ]
  br i1 %1181, label %then1577, label %else1578

then1577:                                         ; preds = %continuation1568
  br label %continuation1576

else1578:                                         ; preds = %continuation1568
  %1182 = alloca i32, align 4
  %1183 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1184 = call i32 (ptr, ...) @scanf(ptr %1183, ptr %1182)
  %1185 = load i32, ptr %1182, align 4
  %1186 = icmp eq i32 %1185, 0
  br label %continuation1576

continuation1576:                                 ; preds = %else1578, %then1577
  %1187 = phi i1 [ %1186, %else1578 ], [ true, %then1577 ]
  br i1 %1187, label %then1585, label %else1586

then1585:                                         ; preds = %continuation1576
  br label %continuation1584

else1586:                                         ; preds = %continuation1576
  %1188 = alloca i32, align 4
  %1189 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1190 = call i32 (ptr, ...) @scanf(ptr %1189, ptr %1188)
  %1191 = load i32, ptr %1188, align 4
  %1192 = icmp eq i32 %1191, 0
  br label %continuation1584

continuation1584:                                 ; preds = %else1586, %then1585
  %1193 = phi i1 [ %1192, %else1586 ], [ true, %then1585 ]
  br i1 %1193, label %then1593, label %else1594

then1593:                                         ; preds = %continuation1584
  br label %continuation1592

else1594:                                         ; preds = %continuation1584
  %1194 = alloca i32, align 4
  %1195 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1196 = call i32 (ptr, ...) @scanf(ptr %1195, ptr %1194)
  %1197 = load i32, ptr %1194, align 4
  %1198 = icmp eq i32 %1197, 0
  br label %continuation1592

continuation1592:                                 ; preds = %else1594, %then1593
  %1199 = phi i1 [ %1198, %else1594 ], [ true, %then1593 ]
  br i1 %1199, label %then1601, label %else1602

then1601:                                         ; preds = %continuation1592
  br label %continuation1600

else1602:                                         ; preds = %continuation1592
  %1200 = alloca i32, align 4
  %1201 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1202 = call i32 (ptr, ...) @scanf(ptr %1201, ptr %1200)
  %1203 = load i32, ptr %1200, align 4
  %1204 = icmp eq i32 %1203, 0
  br label %continuation1600

continuation1600:                                 ; preds = %else1602, %then1601
  %1205 = phi i1 [ %1204, %else1602 ], [ true, %then1601 ]
  br i1 %1205, label %then1609, label %else1610

then1609:                                         ; preds = %continuation1600
  br label %continuation1608

else1610:                                         ; preds = %continuation1600
  %1206 = alloca i32, align 4
  %1207 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1208 = call i32 (ptr, ...) @scanf(ptr %1207, ptr %1206)
  %1209 = load i32, ptr %1206, align 4
  %1210 = icmp eq i32 %1209, 0
  br label %continuation1608

continuation1608:                                 ; preds = %else1610, %then1609
  %1211 = phi i1 [ %1210, %else1610 ], [ true, %then1609 ]
  br i1 %1211, label %then1617, label %else1618

then1617:                                         ; preds = %continuation1608
  br label %continuation1616

else1618:                                         ; preds = %continuation1608
  %1212 = alloca i32, align 4
  %1213 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1214 = call i32 (ptr, ...) @scanf(ptr %1213, ptr %1212)
  %1215 = load i32, ptr %1212, align 4
  %1216 = icmp eq i32 %1215, 0
  br label %continuation1616

continuation1616:                                 ; preds = %else1618, %then1617
  %1217 = phi i1 [ %1216, %else1618 ], [ true, %then1617 ]
  br i1 %1217, label %then1625, label %else1626

then1625:                                         ; preds = %continuation1616
  br label %continuation1624

else1626:                                         ; preds = %continuation1616
  %1218 = alloca i32, align 4
  %1219 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1220 = call i32 (ptr, ...) @scanf(ptr %1219, ptr %1218)
  %1221 = load i32, ptr %1218, align 4
  %1222 = icmp eq i32 %1221, 0
  br label %continuation1624

continuation1624:                                 ; preds = %else1626, %then1625
  %1223 = phi i1 [ %1222, %else1626 ], [ true, %then1625 ]
  br i1 %1223, label %then1633, label %else1634

then1633:                                         ; preds = %continuation1624
  br label %continuation1632

else1634:                                         ; preds = %continuation1624
  %1224 = alloca i32, align 4
  %1225 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1226 = call i32 (ptr, ...) @scanf(ptr %1225, ptr %1224)
  %1227 = load i32, ptr %1224, align 4
  %1228 = icmp eq i32 %1227, 0
  br label %continuation1632

continuation1632:                                 ; preds = %else1634, %then1633
  %1229 = phi i1 [ %1228, %else1634 ], [ true, %then1633 ]
  br i1 %1229, label %then1641, label %else1642

then1641:                                         ; preds = %continuation1632
  br label %continuation1640

else1642:                                         ; preds = %continuation1632
  %1230 = alloca i32, align 4
  %1231 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1232 = call i32 (ptr, ...) @scanf(ptr %1231, ptr %1230)
  %1233 = load i32, ptr %1230, align 4
  %1234 = icmp eq i32 %1233, 0
  br label %continuation1640

continuation1640:                                 ; preds = %else1642, %then1641
  %1235 = phi i1 [ %1234, %else1642 ], [ true, %then1641 ]
  br i1 %1235, label %then1649, label %else1650

then1649:                                         ; preds = %continuation1640
  br label %continuation1648

else1650:                                         ; preds = %continuation1640
  %1236 = alloca i32, align 4
  %1237 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1238 = call i32 (ptr, ...) @scanf(ptr %1237, ptr %1236)
  %1239 = load i32, ptr %1236, align 4
  %1240 = icmp eq i32 %1239, 0
  br label %continuation1648

continuation1648:                                 ; preds = %else1650, %then1649
  %1241 = phi i1 [ %1240, %else1650 ], [ true, %then1649 ]
  br i1 %1241, label %then1657, label %else1658

then1657:                                         ; preds = %continuation1648
  br label %continuation1656

else1658:                                         ; preds = %continuation1648
  %1242 = alloca i32, align 4
  %1243 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1244 = call i32 (ptr, ...) @scanf(ptr %1243, ptr %1242)
  %1245 = load i32, ptr %1242, align 4
  %1246 = icmp eq i32 %1245, 0
  br label %continuation1656

continuation1656:                                 ; preds = %else1658, %then1657
  %1247 = phi i1 [ %1246, %else1658 ], [ true, %then1657 ]
  br i1 %1247, label %then1665, label %else1666

then1665:                                         ; preds = %continuation1656
  br label %continuation1664

else1666:                                         ; preds = %continuation1656
  %1248 = alloca i32, align 4
  %1249 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1250 = call i32 (ptr, ...) @scanf(ptr %1249, ptr %1248)
  %1251 = load i32, ptr %1248, align 4
  %1252 = icmp eq i32 %1251, 0
  br label %continuation1664

continuation1664:                                 ; preds = %else1666, %then1665
  %1253 = phi i1 [ %1252, %else1666 ], [ true, %then1665 ]
  br i1 %1253, label %then1673, label %else1674

then1673:                                         ; preds = %continuation1664
  br label %continuation1672

else1674:                                         ; preds = %continuation1664
  %1254 = alloca i32, align 4
  %1255 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1256 = call i32 (ptr, ...) @scanf(ptr %1255, ptr %1254)
  %1257 = load i32, ptr %1254, align 4
  %1258 = icmp eq i32 %1257, 0
  br label %continuation1672

continuation1672:                                 ; preds = %else1674, %then1673
  %1259 = phi i1 [ %1258, %else1674 ], [ true, %then1673 ]
  br i1 %1259, label %then1681, label %else1682

then1681:                                         ; preds = %continuation1672
  br label %continuation1680

else1682:                                         ; preds = %continuation1672
  %1260 = alloca i32, align 4
  %1261 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1262 = call i32 (ptr, ...) @scanf(ptr %1261, ptr %1260)
  %1263 = load i32, ptr %1260, align 4
  %1264 = icmp eq i32 %1263, 0
  br label %continuation1680

continuation1680:                                 ; preds = %else1682, %then1681
  %1265 = phi i1 [ %1264, %else1682 ], [ true, %then1681 ]
  br i1 %1265, label %then1689, label %else1690

then1689:                                         ; preds = %continuation1680
  br label %continuation1688

else1690:                                         ; preds = %continuation1680
  %1266 = alloca i32, align 4
  %1267 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1268 = call i32 (ptr, ...) @scanf(ptr %1267, ptr %1266)
  %1269 = load i32, ptr %1266, align 4
  %1270 = icmp eq i32 %1269, 0
  br label %continuation1688

continuation1688:                                 ; preds = %else1690, %then1689
  %1271 = phi i1 [ %1270, %else1690 ], [ true, %then1689 ]
  br i1 %1271, label %then1697, label %else1698

then1697:                                         ; preds = %continuation1688
  br label %continuation1696

else1698:                                         ; preds = %continuation1688
  %1272 = alloca i32, align 4
  %1273 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1274 = call i32 (ptr, ...) @scanf(ptr %1273, ptr %1272)
  %1275 = load i32, ptr %1272, align 4
  %1276 = icmp eq i32 %1275, 0
  br label %continuation1696

continuation1696:                                 ; preds = %else1698, %then1697
  %1277 = phi i1 [ %1276, %else1698 ], [ true, %then1697 ]
  br i1 %1277, label %then1705, label %else1706

then1705:                                         ; preds = %continuation1696
  br label %continuation1704

else1706:                                         ; preds = %continuation1696
  %1278 = alloca i32, align 4
  %1279 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1280 = call i32 (ptr, ...) @scanf(ptr %1279, ptr %1278)
  %1281 = load i32, ptr %1278, align 4
  %1282 = icmp eq i32 %1281, 0
  br label %continuation1704

continuation1704:                                 ; preds = %else1706, %then1705
  %1283 = phi i1 [ %1282, %else1706 ], [ true, %then1705 ]
  br i1 %1283, label %then1713, label %else1714

then1713:                                         ; preds = %continuation1704
  br label %continuation1712

else1714:                                         ; preds = %continuation1704
  %1284 = alloca i32, align 4
  %1285 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1286 = call i32 (ptr, ...) @scanf(ptr %1285, ptr %1284)
  %1287 = load i32, ptr %1284, align 4
  %1288 = icmp eq i32 %1287, 0
  br label %continuation1712

continuation1712:                                 ; preds = %else1714, %then1713
  %1289 = phi i1 [ %1288, %else1714 ], [ true, %then1713 ]
  br i1 %1289, label %then1721, label %else1722

then1721:                                         ; preds = %continuation1712
  br label %continuation1720

else1722:                                         ; preds = %continuation1712
  %1290 = alloca i32, align 4
  %1291 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1292 = call i32 (ptr, ...) @scanf(ptr %1291, ptr %1290)
  %1293 = load i32, ptr %1290, align 4
  %1294 = icmp eq i32 %1293, 0
  br label %continuation1720

continuation1720:                                 ; preds = %else1722, %then1721
  %1295 = phi i1 [ %1294, %else1722 ], [ true, %then1721 ]
  br i1 %1295, label %then1729, label %else1730

then1729:                                         ; preds = %continuation1720
  br label %continuation1728

else1730:                                         ; preds = %continuation1720
  %1296 = alloca i32, align 4
  %1297 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1298 = call i32 (ptr, ...) @scanf(ptr %1297, ptr %1296)
  %1299 = load i32, ptr %1296, align 4
  %1300 = icmp eq i32 %1299, 0
  br label %continuation1728

continuation1728:                                 ; preds = %else1730, %then1729
  %1301 = phi i1 [ %1300, %else1730 ], [ true, %then1729 ]
  br i1 %1301, label %then1737, label %else1738

then1737:                                         ; preds = %continuation1728
  br label %continuation1736

else1738:                                         ; preds = %continuation1728
  %1302 = alloca i32, align 4
  %1303 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1304 = call i32 (ptr, ...) @scanf(ptr %1303, ptr %1302)
  %1305 = load i32, ptr %1302, align 4
  %1306 = icmp eq i32 %1305, 0
  br label %continuation1736

continuation1736:                                 ; preds = %else1738, %then1737
  %1307 = phi i1 [ %1306, %else1738 ], [ true, %then1737 ]
  br i1 %1307, label %then1745, label %else1746

then1745:                                         ; preds = %continuation1736
  br label %continuation1744

else1746:                                         ; preds = %continuation1736
  %1308 = alloca i32, align 4
  %1309 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1310 = call i32 (ptr, ...) @scanf(ptr %1309, ptr %1308)
  %1311 = load i32, ptr %1308, align 4
  %1312 = icmp eq i32 %1311, 0
  br label %continuation1744

continuation1744:                                 ; preds = %else1746, %then1745
  %1313 = phi i1 [ %1312, %else1746 ], [ true, %then1745 ]
  br i1 %1313, label %then1753, label %else1754

then1753:                                         ; preds = %continuation1744
  br label %continuation1752

else1754:                                         ; preds = %continuation1744
  %1314 = alloca i32, align 4
  %1315 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1316 = call i32 (ptr, ...) @scanf(ptr %1315, ptr %1314)
  %1317 = load i32, ptr %1314, align 4
  %1318 = icmp eq i32 %1317, 0
  br label %continuation1752

continuation1752:                                 ; preds = %else1754, %then1753
  %1319 = phi i1 [ %1318, %else1754 ], [ true, %then1753 ]
  br i1 %1319, label %then1761, label %else1762

then1761:                                         ; preds = %continuation1752
  br label %continuation1760

else1762:                                         ; preds = %continuation1752
  %1320 = alloca i32, align 4
  %1321 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1322 = call i32 (ptr, ...) @scanf(ptr %1321, ptr %1320)
  %1323 = load i32, ptr %1320, align 4
  %1324 = icmp eq i32 %1323, 0
  br label %continuation1760

continuation1760:                                 ; preds = %else1762, %then1761
  %1325 = phi i1 [ %1324, %else1762 ], [ true, %then1761 ]
  br i1 %1325, label %then1769, label %else1770

then1769:                                         ; preds = %continuation1760
  br label %continuation1768

else1770:                                         ; preds = %continuation1760
  %1326 = alloca i32, align 4
  %1327 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1328 = call i32 (ptr, ...) @scanf(ptr %1327, ptr %1326)
  %1329 = load i32, ptr %1326, align 4
  %1330 = icmp eq i32 %1329, 0
  br label %continuation1768

continuation1768:                                 ; preds = %else1770, %then1769
  %1331 = phi i1 [ %1330, %else1770 ], [ true, %then1769 ]
  br i1 %1331, label %then1777, label %else1778

then1777:                                         ; preds = %continuation1768
  br label %continuation1776

else1778:                                         ; preds = %continuation1768
  %1332 = alloca i32, align 4
  %1333 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1334 = call i32 (ptr, ...) @scanf(ptr %1333, ptr %1332)
  %1335 = load i32, ptr %1332, align 4
  %1336 = icmp eq i32 %1335, 0
  br label %continuation1776

continuation1776:                                 ; preds = %else1778, %then1777
  %1337 = phi i1 [ %1336, %else1778 ], [ true, %then1777 ]
  br i1 %1337, label %then1785, label %else1786

then1785:                                         ; preds = %continuation1776
  br label %continuation1784

else1786:                                         ; preds = %continuation1776
  %1338 = alloca i32, align 4
  %1339 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1340 = call i32 (ptr, ...) @scanf(ptr %1339, ptr %1338)
  %1341 = load i32, ptr %1338, align 4
  %1342 = icmp eq i32 %1341, 0
  br label %continuation1784

continuation1784:                                 ; preds = %else1786, %then1785
  %1343 = phi i1 [ %1342, %else1786 ], [ true, %then1785 ]
  br i1 %1343, label %then1793, label %else1794

then1793:                                         ; preds = %continuation1784
  br label %continuation1792

else1794:                                         ; preds = %continuation1784
  %1344 = alloca i32, align 4
  %1345 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1346 = call i32 (ptr, ...) @scanf(ptr %1345, ptr %1344)
  %1347 = load i32, ptr %1344, align 4
  %1348 = icmp eq i32 %1347, 0
  br label %continuation1792

continuation1792:                                 ; preds = %else1794, %then1793
  %1349 = phi i1 [ %1348, %else1794 ], [ true, %then1793 ]
  br i1 %1349, label %then1801, label %else1802

then1801:                                         ; preds = %continuation1792
  br label %continuation1800

else1802:                                         ; preds = %continuation1792
  %1350 = alloca i32, align 4
  %1351 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1352 = call i32 (ptr, ...) @scanf(ptr %1351, ptr %1350)
  %1353 = load i32, ptr %1350, align 4
  %1354 = icmp eq i32 %1353, 0
  br label %continuation1800

continuation1800:                                 ; preds = %else1802, %then1801
  %1355 = phi i1 [ %1354, %else1802 ], [ true, %then1801 ]
  br i1 %1355, label %then1809, label %else1810

then1809:                                         ; preds = %continuation1800
  br label %continuation1808

else1810:                                         ; preds = %continuation1800
  %1356 = alloca i32, align 4
  %1357 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1358 = call i32 (ptr, ...) @scanf(ptr %1357, ptr %1356)
  %1359 = load i32, ptr %1356, align 4
  %1360 = icmp eq i32 %1359, 0
  br label %continuation1808

continuation1808:                                 ; preds = %else1810, %then1809
  %1361 = phi i1 [ %1360, %else1810 ], [ true, %then1809 ]
  br i1 %1361, label %then1817, label %else1818

then1817:                                         ; preds = %continuation1808
  br label %continuation1816

else1818:                                         ; preds = %continuation1808
  %1362 = alloca i32, align 4
  %1363 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1364 = call i32 (ptr, ...) @scanf(ptr %1363, ptr %1362)
  %1365 = load i32, ptr %1362, align 4
  %1366 = icmp eq i32 %1365, 0
  br label %continuation1816

continuation1816:                                 ; preds = %else1818, %then1817
  %1367 = phi i1 [ %1366, %else1818 ], [ true, %then1817 ]
  br i1 %1367, label %then1825, label %else1826

then1825:                                         ; preds = %continuation1816
  br label %continuation1824

else1826:                                         ; preds = %continuation1816
  %1368 = alloca i32, align 4
  %1369 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1370 = call i32 (ptr, ...) @scanf(ptr %1369, ptr %1368)
  %1371 = load i32, ptr %1368, align 4
  %1372 = icmp eq i32 %1371, 0
  br label %continuation1824

continuation1824:                                 ; preds = %else1826, %then1825
  %1373 = phi i1 [ %1372, %else1826 ], [ true, %then1825 ]
  br i1 %1373, label %then1833, label %else1834

then1833:                                         ; preds = %continuation1824
  br label %continuation1832

else1834:                                         ; preds = %continuation1824
  %1374 = alloca i32, align 4
  %1375 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1376 = call i32 (ptr, ...) @scanf(ptr %1375, ptr %1374)
  %1377 = load i32, ptr %1374, align 4
  %1378 = icmp eq i32 %1377, 0
  br label %continuation1832

continuation1832:                                 ; preds = %else1834, %then1833
  %1379 = phi i1 [ %1378, %else1834 ], [ true, %then1833 ]
  br i1 %1379, label %then1841, label %else1842

then1841:                                         ; preds = %continuation1832
  br label %continuation1840

else1842:                                         ; preds = %continuation1832
  %1380 = alloca i32, align 4
  %1381 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1382 = call i32 (ptr, ...) @scanf(ptr %1381, ptr %1380)
  %1383 = load i32, ptr %1380, align 4
  %1384 = icmp eq i32 %1383, 0
  br label %continuation1840

continuation1840:                                 ; preds = %else1842, %then1841
  %1385 = phi i1 [ %1384, %else1842 ], [ true, %then1841 ]
  br i1 %1385, label %then1849, label %else1850

then1849:                                         ; preds = %continuation1840
  br label %continuation1848

else1850:                                         ; preds = %continuation1840
  %1386 = alloca i32, align 4
  %1387 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1388 = call i32 (ptr, ...) @scanf(ptr %1387, ptr %1386)
  %1389 = load i32, ptr %1386, align 4
  %1390 = icmp eq i32 %1389, 0
  br label %continuation1848

continuation1848:                                 ; preds = %else1850, %then1849
  %1391 = phi i1 [ %1390, %else1850 ], [ true, %then1849 ]
  br i1 %1391, label %then1857, label %else1858

then1857:                                         ; preds = %continuation1848
  br label %continuation1856

else1858:                                         ; preds = %continuation1848
  %1392 = alloca i32, align 4
  %1393 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1394 = call i32 (ptr, ...) @scanf(ptr %1393, ptr %1392)
  %1395 = load i32, ptr %1392, align 4
  %1396 = icmp eq i32 %1395, 0
  br label %continuation1856

continuation1856:                                 ; preds = %else1858, %then1857
  %1397 = phi i1 [ %1396, %else1858 ], [ true, %then1857 ]
  br i1 %1397, label %then1865, label %else1866

then1865:                                         ; preds = %continuation1856
  br label %continuation1864

else1866:                                         ; preds = %continuation1856
  %1398 = alloca i32, align 4
  %1399 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1400 = call i32 (ptr, ...) @scanf(ptr %1399, ptr %1398)
  %1401 = load i32, ptr %1398, align 4
  %1402 = icmp eq i32 %1401, 0
  br label %continuation1864

continuation1864:                                 ; preds = %else1866, %then1865
  %1403 = phi i1 [ %1402, %else1866 ], [ true, %then1865 ]
  br i1 %1403, label %then1873, label %else1874

then1873:                                         ; preds = %continuation1864
  br label %continuation1872

else1874:                                         ; preds = %continuation1864
  %1404 = alloca i32, align 4
  %1405 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1406 = call i32 (ptr, ...) @scanf(ptr %1405, ptr %1404)
  %1407 = load i32, ptr %1404, align 4
  %1408 = icmp eq i32 %1407, 0
  br label %continuation1872

continuation1872:                                 ; preds = %else1874, %then1873
  %1409 = phi i1 [ %1408, %else1874 ], [ true, %then1873 ]
  br i1 %1409, label %then1881, label %else1882

then1881:                                         ; preds = %continuation1872
  br label %continuation1880

else1882:                                         ; preds = %continuation1872
  %1410 = alloca i32, align 4
  %1411 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1412 = call i32 (ptr, ...) @scanf(ptr %1411, ptr %1410)
  %1413 = load i32, ptr %1410, align 4
  %1414 = icmp eq i32 %1413, 0
  br label %continuation1880

continuation1880:                                 ; preds = %else1882, %then1881
  %1415 = phi i1 [ %1414, %else1882 ], [ true, %then1881 ]
  br i1 %1415, label %then1889, label %else1890

then1889:                                         ; preds = %continuation1880
  br label %continuation1888

else1890:                                         ; preds = %continuation1880
  %1416 = alloca i32, align 4
  %1417 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1418 = call i32 (ptr, ...) @scanf(ptr %1417, ptr %1416)
  %1419 = load i32, ptr %1416, align 4
  %1420 = icmp eq i32 %1419, 0
  br label %continuation1888

continuation1888:                                 ; preds = %else1890, %then1889
  %1421 = phi i1 [ %1420, %else1890 ], [ true, %then1889 ]
  br i1 %1421, label %then1897, label %else1898

then1897:                                         ; preds = %continuation1888
  br label %continuation1896

else1898:                                         ; preds = %continuation1888
  %1422 = alloca i32, align 4
  %1423 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1424 = call i32 (ptr, ...) @scanf(ptr %1423, ptr %1422)
  %1425 = load i32, ptr %1422, align 4
  %1426 = icmp eq i32 %1425, 0
  br label %continuation1896

continuation1896:                                 ; preds = %else1898, %then1897
  %1427 = phi i1 [ %1426, %else1898 ], [ true, %then1897 ]
  br i1 %1427, label %then1905, label %else1906

then1905:                                         ; preds = %continuation1896
  br label %continuation1904

else1906:                                         ; preds = %continuation1896
  %1428 = alloca i32, align 4
  %1429 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1430 = call i32 (ptr, ...) @scanf(ptr %1429, ptr %1428)
  %1431 = load i32, ptr %1428, align 4
  %1432 = icmp eq i32 %1431, 0
  br label %continuation1904

continuation1904:                                 ; preds = %else1906, %then1905
  %1433 = phi i1 [ %1432, %else1906 ], [ true, %then1905 ]
  br i1 %1433, label %then1913, label %else1914

then1913:                                         ; preds = %continuation1904
  br label %continuation1912

else1914:                                         ; preds = %continuation1904
  %1434 = alloca i32, align 4
  %1435 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1436 = call i32 (ptr, ...) @scanf(ptr %1435, ptr %1434)
  %1437 = load i32, ptr %1434, align 4
  %1438 = icmp eq i32 %1437, 0
  br label %continuation1912

continuation1912:                                 ; preds = %else1914, %then1913
  %1439 = phi i1 [ %1438, %else1914 ], [ true, %then1913 ]
  br i1 %1439, label %then1921, label %else1922

then1921:                                         ; preds = %continuation1912
  br label %continuation1920

else1922:                                         ; preds = %continuation1912
  %1440 = alloca i32, align 4
  %1441 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1442 = call i32 (ptr, ...) @scanf(ptr %1441, ptr %1440)
  %1443 = load i32, ptr %1440, align 4
  %1444 = icmp eq i32 %1443, 0
  br label %continuation1920

continuation1920:                                 ; preds = %else1922, %then1921
  %1445 = phi i1 [ %1444, %else1922 ], [ true, %then1921 ]
  br i1 %1445, label %then1929, label %else1930

then1929:                                         ; preds = %continuation1920
  br label %continuation1928

else1930:                                         ; preds = %continuation1920
  %1446 = alloca i32, align 4
  %1447 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1448 = call i32 (ptr, ...) @scanf(ptr %1447, ptr %1446)
  %1449 = load i32, ptr %1446, align 4
  %1450 = icmp eq i32 %1449, 0
  br label %continuation1928

continuation1928:                                 ; preds = %else1930, %then1929
  %1451 = phi i1 [ %1450, %else1930 ], [ true, %then1929 ]
  br i1 %1451, label %then1937, label %else1938

then1937:                                         ; preds = %continuation1928
  br label %continuation1936

else1938:                                         ; preds = %continuation1928
  %1452 = alloca i32, align 4
  %1453 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1454 = call i32 (ptr, ...) @scanf(ptr %1453, ptr %1452)
  %1455 = load i32, ptr %1452, align 4
  %1456 = icmp eq i32 %1455, 0
  br label %continuation1936

continuation1936:                                 ; preds = %else1938, %then1937
  %1457 = phi i1 [ %1456, %else1938 ], [ true, %then1937 ]
  br i1 %1457, label %then1945, label %else1946

then1945:                                         ; preds = %continuation1936
  br label %continuation1944

else1946:                                         ; preds = %continuation1936
  %1458 = alloca i32, align 4
  %1459 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1460 = call i32 (ptr, ...) @scanf(ptr %1459, ptr %1458)
  %1461 = load i32, ptr %1458, align 4
  %1462 = icmp eq i32 %1461, 0
  br label %continuation1944

continuation1944:                                 ; preds = %else1946, %then1945
  %1463 = phi i1 [ %1462, %else1946 ], [ true, %then1945 ]
  br i1 %1463, label %then1953, label %else1954

then1953:                                         ; preds = %continuation1944
  br label %continuation1952

else1954:                                         ; preds = %continuation1944
  %1464 = alloca i32, align 4
  %1465 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1466 = call i32 (ptr, ...) @scanf(ptr %1465, ptr %1464)
  %1467 = load i32, ptr %1464, align 4
  %1468 = icmp eq i32 %1467, 0
  br label %continuation1952

continuation1952:                                 ; preds = %else1954, %then1953
  %1469 = phi i1 [ %1468, %else1954 ], [ true, %then1953 ]
  br i1 %1469, label %then1961, label %else1962

then1961:                                         ; preds = %continuation1952
  br label %continuation1960

else1962:                                         ; preds = %continuation1952
  %1470 = alloca i32, align 4
  %1471 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1472 = call i32 (ptr, ...) @scanf(ptr %1471, ptr %1470)
  %1473 = load i32, ptr %1470, align 4
  %1474 = icmp eq i32 %1473, 0
  br label %continuation1960

continuation1960:                                 ; preds = %else1962, %then1961
  %1475 = phi i1 [ %1474, %else1962 ], [ true, %then1961 ]
  br i1 %1475, label %then1969, label %else1970

then1969:                                         ; preds = %continuation1960
  br label %continuation1968

else1970:                                         ; preds = %continuation1960
  %1476 = alloca i32, align 4
  %1477 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1478 = call i32 (ptr, ...) @scanf(ptr %1477, ptr %1476)
  %1479 = load i32, ptr %1476, align 4
  %1480 = icmp eq i32 %1479, 0
  br label %continuation1968

continuation1968:                                 ; preds = %else1970, %then1969
  %1481 = phi i1 [ %1480, %else1970 ], [ true, %then1969 ]
  br i1 %1481, label %then1977, label %else1978

then1977:                                         ; preds = %continuation1968
  br label %continuation1976

else1978:                                         ; preds = %continuation1968
  %1482 = alloca i32, align 4
  %1483 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1484 = call i32 (ptr, ...) @scanf(ptr %1483, ptr %1482)
  %1485 = load i32, ptr %1482, align 4
  %1486 = icmp eq i32 %1485, 0
  br label %continuation1976

continuation1976:                                 ; preds = %else1978, %then1977
  %1487 = phi i1 [ %1486, %else1978 ], [ true, %then1977 ]
  br i1 %1487, label %then1985, label %else1986

then1985:                                         ; preds = %continuation1976
  br label %continuation1984

else1986:                                         ; preds = %continuation1976
  %1488 = alloca i32, align 4
  %1489 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1490 = call i32 (ptr, ...) @scanf(ptr %1489, ptr %1488)
  %1491 = load i32, ptr %1488, align 4
  %1492 = icmp eq i32 %1491, 0
  br label %continuation1984

continuation1984:                                 ; preds = %else1986, %then1985
  %1493 = phi i1 [ %1492, %else1986 ], [ true, %then1985 ]
  br i1 %1493, label %then1993, label %else1994

then1993:                                         ; preds = %continuation1984
  br label %continuation1992

else1994:                                         ; preds = %continuation1984
  %1494 = alloca i32, align 4
  %1495 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1496 = call i32 (ptr, ...) @scanf(ptr %1495, ptr %1494)
  %1497 = load i32, ptr %1494, align 4
  %1498 = icmp eq i32 %1497, 0
  br label %continuation1992

continuation1992:                                 ; preds = %else1994, %then1993
  %1499 = phi i1 [ %1498, %else1994 ], [ true, %then1993 ]
  br i1 %1499, label %then2001, label %else2002

then2001:                                         ; preds = %continuation1992
  br label %continuation2000

else2002:                                         ; preds = %continuation1992
  %1500 = alloca i32, align 4
  %1501 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1502 = call i32 (ptr, ...) @scanf(ptr %1501, ptr %1500)
  %1503 = load i32, ptr %1500, align 4
  %1504 = icmp eq i32 %1503, 0
  br label %continuation2000

continuation2000:                                 ; preds = %else2002, %then2001
  %1505 = phi i1 [ %1504, %else2002 ], [ true, %then2001 ]
  br i1 %1505, label %then2009, label %else2010

then2009:                                         ; preds = %continuation2000
  br label %continuation2008

else2010:                                         ; preds = %continuation2000
  %1506 = alloca i32, align 4
  %1507 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1508 = call i32 (ptr, ...) @scanf(ptr %1507, ptr %1506)
  %1509 = load i32, ptr %1506, align 4
  %1510 = icmp eq i32 %1509, 0
  br label %continuation2008

continuation2008:                                 ; preds = %else2010, %then2009
  %1511 = phi i1 [ %1510, %else2010 ], [ true, %then2009 ]
  br i1 %1511, label %then2017, label %else2018

then2017:                                         ; preds = %continuation2008
  br label %continuation2016

else2018:                                         ; preds = %continuation2008
  %1512 = alloca i32, align 4
  %1513 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1514 = call i32 (ptr, ...) @scanf(ptr %1513, ptr %1512)
  %1515 = load i32, ptr %1512, align 4
  %1516 = icmp eq i32 %1515, 0
  br label %continuation2016

continuation2016:                                 ; preds = %else2018, %then2017
  %1517 = phi i1 [ %1516, %else2018 ], [ true, %then2017 ]
  br i1 %1517, label %then2025, label %else2026

then2025:                                         ; preds = %continuation2016
  br label %continuation2024

else2026:                                         ; preds = %continuation2016
  %1518 = alloca i32, align 4
  %1519 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1520 = call i32 (ptr, ...) @scanf(ptr %1519, ptr %1518)
  %1521 = load i32, ptr %1518, align 4
  %1522 = icmp eq i32 %1521, 0
  br label %continuation2024

continuation2024:                                 ; preds = %else2026, %then2025
  %1523 = phi i1 [ %1522, %else2026 ], [ true, %then2025 ]
  br i1 %1523, label %then2033, label %else2034

then2033:                                         ; preds = %continuation2024
  br label %continuation2032

else2034:                                         ; preds = %continuation2024
  %1524 = alloca i32, align 4
  %1525 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1526 = call i32 (ptr, ...) @scanf(ptr %1525, ptr %1524)
  %1527 = load i32, ptr %1524, align 4
  %1528 = icmp eq i32 %1527, 0
  br label %continuation2032

continuation2032:                                 ; preds = %else2034, %then2033
  %1529 = phi i1 [ %1528, %else2034 ], [ true, %then2033 ]
  br i1 %1529, label %then2041, label %else2042

then2041:                                         ; preds = %continuation2032
  br label %continuation2040

else2042:                                         ; preds = %continuation2032
  %1530 = alloca i32, align 4
  %1531 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1532 = call i32 (ptr, ...) @scanf(ptr %1531, ptr %1530)
  %1533 = load i32, ptr %1530, align 4
  %1534 = icmp eq i32 %1533, 0
  br label %continuation2040

continuation2040:                                 ; preds = %else2042, %then2041
  %1535 = phi i1 [ %1534, %else2042 ], [ true, %then2041 ]
  br i1 %1535, label %then2049, label %else2050

then2049:                                         ; preds = %continuation2040
  br label %continuation2048

else2050:                                         ; preds = %continuation2040
  %1536 = alloca i32, align 4
  %1537 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1538 = call i32 (ptr, ...) @scanf(ptr %1537, ptr %1536)
  %1539 = load i32, ptr %1536, align 4
  %1540 = icmp eq i32 %1539, 0
  br label %continuation2048

continuation2048:                                 ; preds = %else2050, %then2049
  %1541 = phi i1 [ %1540, %else2050 ], [ true, %then2049 ]
  br i1 %1541, label %then2057, label %else2058

then2057:                                         ; preds = %continuation2048
  br label %continuation2056

else2058:                                         ; preds = %continuation2048
  %1542 = alloca i32, align 4
  %1543 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1544 = call i32 (ptr, ...) @scanf(ptr %1543, ptr %1542)
  %1545 = load i32, ptr %1542, align 4
  %1546 = icmp eq i32 %1545, 0
  br label %continuation2056

continuation2056:                                 ; preds = %else2058, %then2057
  %1547 = phi i1 [ %1546, %else2058 ], [ true, %then2057 ]
  br i1 %1547, label %then2065, label %else2066

then2065:                                         ; preds = %continuation2056
  br label %continuation2064

else2066:                                         ; preds = %continuation2056
  %1548 = alloca i32, align 4
  %1549 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1550 = call i32 (ptr, ...) @scanf(ptr %1549, ptr %1548)
  %1551 = load i32, ptr %1548, align 4
  %1552 = icmp eq i32 %1551, 0
  br label %continuation2064

continuation2064:                                 ; preds = %else2066, %then2065
  %1553 = phi i1 [ %1552, %else2066 ], [ true, %then2065 ]
  br i1 %1553, label %then2073, label %else2074

then2073:                                         ; preds = %continuation2064
  br label %continuation2072

else2074:                                         ; preds = %continuation2064
  %1554 = alloca i32, align 4
  %1555 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1556 = call i32 (ptr, ...) @scanf(ptr %1555, ptr %1554)
  %1557 = load i32, ptr %1554, align 4
  %1558 = icmp eq i32 %1557, 0
  br label %continuation2072

continuation2072:                                 ; preds = %else2074, %then2073
  %1559 = phi i1 [ %1558, %else2074 ], [ true, %then2073 ]
  br i1 %1559, label %then2081, label %else2082

then2081:                                         ; preds = %continuation2072
  br label %continuation2080

else2082:                                         ; preds = %continuation2072
  %1560 = alloca i32, align 4
  %1561 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1562 = call i32 (ptr, ...) @scanf(ptr %1561, ptr %1560)
  %1563 = load i32, ptr %1560, align 4
  %1564 = icmp eq i32 %1563, 0
  br label %continuation2080

continuation2080:                                 ; preds = %else2082, %then2081
  %1565 = phi i1 [ %1564, %else2082 ], [ true, %then2081 ]
  br i1 %1565, label %then2089, label %else2090

then2089:                                         ; preds = %continuation2080
  br label %continuation2088

else2090:                                         ; preds = %continuation2080
  %1566 = alloca i32, align 4
  %1567 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1568 = call i32 (ptr, ...) @scanf(ptr %1567, ptr %1566)
  %1569 = load i32, ptr %1566, align 4
  %1570 = icmp eq i32 %1569, 0
  br label %continuation2088

continuation2088:                                 ; preds = %else2090, %then2089
  %1571 = phi i1 [ %1570, %else2090 ], [ true, %then2089 ]
  br i1 %1571, label %then2097, label %else2098

then2097:                                         ; preds = %continuation2088
  br label %continuation2096

else2098:                                         ; preds = %continuation2088
  %1572 = alloca i32, align 4
  %1573 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1574 = call i32 (ptr, ...) @scanf(ptr %1573, ptr %1572)
  %1575 = load i32, ptr %1572, align 4
  %1576 = icmp eq i32 %1575, 0
  br label %continuation2096

continuation2096:                                 ; preds = %else2098, %then2097
  %1577 = phi i1 [ %1576, %else2098 ], [ true, %then2097 ]
  br i1 %1577, label %then2105, label %else2106

then2105:                                         ; preds = %continuation2096
  br label %continuation2104

else2106:                                         ; preds = %continuation2096
  %1578 = alloca i32, align 4
  %1579 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1580 = call i32 (ptr, ...) @scanf(ptr %1579, ptr %1578)
  %1581 = load i32, ptr %1578, align 4
  %1582 = icmp eq i32 %1581, 0
  br label %continuation2104

continuation2104:                                 ; preds = %else2106, %then2105
  %1583 = phi i1 [ %1582, %else2106 ], [ true, %then2105 ]
  br i1 %1583, label %then2113, label %else2114

then2113:                                         ; preds = %continuation2104
  br label %continuation2112

else2114:                                         ; preds = %continuation2104
  %1584 = alloca i32, align 4
  %1585 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1586 = call i32 (ptr, ...) @scanf(ptr %1585, ptr %1584)
  %1587 = load i32, ptr %1584, align 4
  %1588 = icmp eq i32 %1587, 0
  br label %continuation2112

continuation2112:                                 ; preds = %else2114, %then2113
  %1589 = phi i1 [ %1588, %else2114 ], [ true, %then2113 ]
  br i1 %1589, label %then2121, label %else2122

then2121:                                         ; preds = %continuation2112
  br label %continuation2120

else2122:                                         ; preds = %continuation2112
  %1590 = alloca i32, align 4
  %1591 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1592 = call i32 (ptr, ...) @scanf(ptr %1591, ptr %1590)
  %1593 = load i32, ptr %1590, align 4
  %1594 = icmp eq i32 %1593, 0
  br label %continuation2120

continuation2120:                                 ; preds = %else2122, %then2121
  %1595 = phi i1 [ %1594, %else2122 ], [ true, %then2121 ]
  br i1 %1595, label %then2129, label %else2130

then2129:                                         ; preds = %continuation2120
  br label %continuation2128

else2130:                                         ; preds = %continuation2120
  %1596 = alloca i32, align 4
  %1597 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1598 = call i32 (ptr, ...) @scanf(ptr %1597, ptr %1596)
  %1599 = load i32, ptr %1596, align 4
  %1600 = icmp eq i32 %1599, 0
  br label %continuation2128

continuation2128:                                 ; preds = %else2130, %then2129
  %1601 = phi i1 [ %1600, %else2130 ], [ true, %then2129 ]
  br i1 %1601, label %then2137, label %else2138

then2137:                                         ; preds = %continuation2128
  br label %continuation2136

else2138:                                         ; preds = %continuation2128
  %1602 = alloca i32, align 4
  %1603 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1604 = call i32 (ptr, ...) @scanf(ptr %1603, ptr %1602)
  %1605 = load i32, ptr %1602, align 4
  %1606 = icmp eq i32 %1605, 0
  br label %continuation2136

continuation2136:                                 ; preds = %else2138, %then2137
  %1607 = phi i1 [ %1606, %else2138 ], [ true, %then2137 ]
  br i1 %1607, label %then2145, label %else2146

then2145:                                         ; preds = %continuation2136
  br label %continuation2144

else2146:                                         ; preds = %continuation2136
  %1608 = alloca i32, align 4
  %1609 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1610 = call i32 (ptr, ...) @scanf(ptr %1609, ptr %1608)
  %1611 = load i32, ptr %1608, align 4
  %1612 = icmp eq i32 %1611, 0
  br label %continuation2144

continuation2144:                                 ; preds = %else2146, %then2145
  %1613 = phi i1 [ %1612, %else2146 ], [ true, %then2145 ]
  br i1 %1613, label %then2153, label %else2154

then2153:                                         ; preds = %continuation2144
  br label %continuation2152

else2154:                                         ; preds = %continuation2144
  %1614 = alloca i32, align 4
  %1615 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1616 = call i32 (ptr, ...) @scanf(ptr %1615, ptr %1614)
  %1617 = load i32, ptr %1614, align 4
  %1618 = icmp eq i32 %1617, 0
  br label %continuation2152

continuation2152:                                 ; preds = %else2154, %then2153
  %1619 = phi i1 [ %1618, %else2154 ], [ true, %then2153 ]
  br i1 %1619, label %then2161, label %else2162

then2161:                                         ; preds = %continuation2152
  br label %continuation2160

else2162:                                         ; preds = %continuation2152
  %1620 = alloca i32, align 4
  %1621 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1622 = call i32 (ptr, ...) @scanf(ptr %1621, ptr %1620)
  %1623 = load i32, ptr %1620, align 4
  %1624 = icmp eq i32 %1623, 0
  br label %continuation2160

continuation2160:                                 ; preds = %else2162, %then2161
  %1625 = phi i1 [ %1624, %else2162 ], [ true, %then2161 ]
  br i1 %1625, label %then2169, label %else2170

then2169:                                         ; preds = %continuation2160
  br label %continuation2168

else2170:                                         ; preds = %continuation2160
  %1626 = alloca i32, align 4
  %1627 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1628 = call i32 (ptr, ...) @scanf(ptr %1627, ptr %1626)
  %1629 = load i32, ptr %1626, align 4
  %1630 = icmp eq i32 %1629, 0
  br label %continuation2168

continuation2168:                                 ; preds = %else2170, %then2169
  %1631 = phi i1 [ %1630, %else2170 ], [ true, %then2169 ]
  br i1 %1631, label %then2177, label %else2178

then2177:                                         ; preds = %continuation2168
  br label %continuation2176

else2178:                                         ; preds = %continuation2168
  %1632 = alloca i32, align 4
  %1633 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1634 = call i32 (ptr, ...) @scanf(ptr %1633, ptr %1632)
  %1635 = load i32, ptr %1632, align 4
  %1636 = icmp eq i32 %1635, 0
  br label %continuation2176

continuation2176:                                 ; preds = %else2178, %then2177
  %1637 = phi i1 [ %1636, %else2178 ], [ true, %then2177 ]
  br i1 %1637, label %then2185, label %else2186

then2185:                                         ; preds = %continuation2176
  br label %continuation2184

else2186:                                         ; preds = %continuation2176
  %1638 = alloca i32, align 4
  %1639 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1640 = call i32 (ptr, ...) @scanf(ptr %1639, ptr %1638)
  %1641 = load i32, ptr %1638, align 4
  %1642 = icmp eq i32 %1641, 0
  br label %continuation2184

continuation2184:                                 ; preds = %else2186, %then2185
  %1643 = phi i1 [ %1642, %else2186 ], [ true, %then2185 ]
  br i1 %1643, label %then2193, label %else2194

then2193:                                         ; preds = %continuation2184
  br label %continuation2192

else2194:                                         ; preds = %continuation2184
  %1644 = alloca i32, align 4
  %1645 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1646 = call i32 (ptr, ...) @scanf(ptr %1645, ptr %1644)
  %1647 = load i32, ptr %1644, align 4
  %1648 = icmp eq i32 %1647, 0
  br label %continuation2192

continuation2192:                                 ; preds = %else2194, %then2193
  %1649 = phi i1 [ %1648, %else2194 ], [ true, %then2193 ]
  br i1 %1649, label %then2201, label %else2202

then2201:                                         ; preds = %continuation2192
  br label %continuation2200

else2202:                                         ; preds = %continuation2192
  %1650 = alloca i32, align 4
  %1651 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1652 = call i32 (ptr, ...) @scanf(ptr %1651, ptr %1650)
  %1653 = load i32, ptr %1650, align 4
  %1654 = icmp eq i32 %1653, 0
  br label %continuation2200

continuation2200:                                 ; preds = %else2202, %then2201
  %1655 = phi i1 [ %1654, %else2202 ], [ true, %then2201 ]
  br i1 %1655, label %then2209, label %else2210

then2209:                                         ; preds = %continuation2200
  br label %continuation2208

else2210:                                         ; preds = %continuation2200
  %1656 = alloca i32, align 4
  %1657 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1658 = call i32 (ptr, ...) @scanf(ptr %1657, ptr %1656)
  %1659 = load i32, ptr %1656, align 4
  %1660 = icmp eq i32 %1659, 0
  br label %continuation2208

continuation2208:                                 ; preds = %else2210, %then2209
  %1661 = phi i1 [ %1660, %else2210 ], [ true, %then2209 ]
  br i1 %1661, label %then2217, label %else2218

then2217:                                         ; preds = %continuation2208
  br label %continuation2216

else2218:                                         ; preds = %continuation2208
  %1662 = alloca i32, align 4
  %1663 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1664 = call i32 (ptr, ...) @scanf(ptr %1663, ptr %1662)
  %1665 = load i32, ptr %1662, align 4
  %1666 = icmp eq i32 %1665, 0
  br label %continuation2216

continuation2216:                                 ; preds = %else2218, %then2217
  %1667 = phi i1 [ %1666, %else2218 ], [ true, %then2217 ]
  br i1 %1667, label %then2225, label %else2226

then2225:                                         ; preds = %continuation2216
  br label %continuation2224

else2226:                                         ; preds = %continuation2216
  %1668 = alloca i32, align 4
  %1669 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1670 = call i32 (ptr, ...) @scanf(ptr %1669, ptr %1668)
  %1671 = load i32, ptr %1668, align 4
  %1672 = icmp eq i32 %1671, 0
  br label %continuation2224

continuation2224:                                 ; preds = %else2226, %then2225
  %1673 = phi i1 [ %1672, %else2226 ], [ true, %then2225 ]
  br i1 %1673, label %then2233, label %else2234

then2233:                                         ; preds = %continuation2224
  br label %continuation2232

else2234:                                         ; preds = %continuation2224
  %1674 = alloca i32, align 4
  %1675 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1676 = call i32 (ptr, ...) @scanf(ptr %1675, ptr %1674)
  %1677 = load i32, ptr %1674, align 4
  %1678 = icmp eq i32 %1677, 0
  br label %continuation2232

continuation2232:                                 ; preds = %else2234, %then2233
  %1679 = phi i1 [ %1678, %else2234 ], [ true, %then2233 ]
  br i1 %1679, label %then2241, label %else2242

then2241:                                         ; preds = %continuation2232
  br label %continuation2240

else2242:                                         ; preds = %continuation2232
  %1680 = alloca i32, align 4
  %1681 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1682 = call i32 (ptr, ...) @scanf(ptr %1681, ptr %1680)
  %1683 = load i32, ptr %1680, align 4
  %1684 = icmp eq i32 %1683, 0
  br label %continuation2240

continuation2240:                                 ; preds = %else2242, %then2241
  %1685 = phi i1 [ %1684, %else2242 ], [ true, %then2241 ]
  br i1 %1685, label %then2249, label %else2250

then2249:                                         ; preds = %continuation2240
  br label %continuation2248

else2250:                                         ; preds = %continuation2240
  %1686 = alloca i32, align 4
  %1687 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1688 = call i32 (ptr, ...) @scanf(ptr %1687, ptr %1686)
  %1689 = load i32, ptr %1686, align 4
  %1690 = icmp eq i32 %1689, 0
  br label %continuation2248

continuation2248:                                 ; preds = %else2250, %then2249
  %1691 = phi i1 [ %1690, %else2250 ], [ true, %then2249 ]
  br i1 %1691, label %then2257, label %else2258

then2257:                                         ; preds = %continuation2248
  br label %continuation2256

else2258:                                         ; preds = %continuation2248
  %1692 = alloca i32, align 4
  %1693 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1694 = call i32 (ptr, ...) @scanf(ptr %1693, ptr %1692)
  %1695 = load i32, ptr %1692, align 4
  %1696 = icmp eq i32 %1695, 0
  br label %continuation2256

continuation2256:                                 ; preds = %else2258, %then2257
  %1697 = phi i1 [ %1696, %else2258 ], [ true, %then2257 ]
  br i1 %1697, label %then2265, label %else2266

then2265:                                         ; preds = %continuation2256
  br label %continuation2264

else2266:                                         ; preds = %continuation2256
  %1698 = alloca i32, align 4
  %1699 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1700 = call i32 (ptr, ...) @scanf(ptr %1699, ptr %1698)
  %1701 = load i32, ptr %1698, align 4
  %1702 = icmp eq i32 %1701, 0
  br label %continuation2264

continuation2264:                                 ; preds = %else2266, %then2265
  %1703 = phi i1 [ %1702, %else2266 ], [ true, %then2265 ]
  br i1 %1703, label %then2273, label %else2274

then2273:                                         ; preds = %continuation2264
  br label %continuation2272

else2274:                                         ; preds = %continuation2264
  %1704 = alloca i32, align 4
  %1705 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1706 = call i32 (ptr, ...) @scanf(ptr %1705, ptr %1704)
  %1707 = load i32, ptr %1704, align 4
  %1708 = icmp eq i32 %1707, 0
  br label %continuation2272

continuation2272:                                 ; preds = %else2274, %then2273
  %1709 = phi i1 [ %1708, %else2274 ], [ true, %then2273 ]
  br i1 %1709, label %then2281, label %else2282

then2281:                                         ; preds = %continuation2272
  br label %continuation2280

else2282:                                         ; preds = %continuation2272
  %1710 = alloca i32, align 4
  %1711 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1712 = call i32 (ptr, ...) @scanf(ptr %1711, ptr %1710)
  %1713 = load i32, ptr %1710, align 4
  %1714 = icmp eq i32 %1713, 0
  br label %continuation2280

continuation2280:                                 ; preds = %else2282, %then2281
  %1715 = phi i1 [ %1714, %else2282 ], [ true, %then2281 ]
  br i1 %1715, label %then2289, label %else2290

then2289:                                         ; preds = %continuation2280
  br label %continuation2288

else2290:                                         ; preds = %continuation2280
  %1716 = alloca i32, align 4
  %1717 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1718 = call i32 (ptr, ...) @scanf(ptr %1717, ptr %1716)
  %1719 = load i32, ptr %1716, align 4
  %1720 = icmp eq i32 %1719, 0
  br label %continuation2288

continuation2288:                                 ; preds = %else2290, %then2289
  %1721 = phi i1 [ %1720, %else2290 ], [ true, %then2289 ]
  br i1 %1721, label %then2297, label %else2298

then2297:                                         ; preds = %continuation2288
  br label %continuation2296

else2298:                                         ; preds = %continuation2288
  %1722 = alloca i32, align 4
  %1723 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1724 = call i32 (ptr, ...) @scanf(ptr %1723, ptr %1722)
  %1725 = load i32, ptr %1722, align 4
  %1726 = icmp eq i32 %1725, 0
  br label %continuation2296

continuation2296:                                 ; preds = %else2298, %then2297
  %1727 = phi i1 [ %1726, %else2298 ], [ true, %then2297 ]
  br i1 %1727, label %then2305, label %else2306

then2305:                                         ; preds = %continuation2296
  br label %continuation2304

else2306:                                         ; preds = %continuation2296
  %1728 = alloca i32, align 4
  %1729 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1730 = call i32 (ptr, ...) @scanf(ptr %1729, ptr %1728)
  %1731 = load i32, ptr %1728, align 4
  %1732 = icmp eq i32 %1731, 0
  br label %continuation2304

continuation2304:                                 ; preds = %else2306, %then2305
  %1733 = phi i1 [ %1732, %else2306 ], [ true, %then2305 ]
  br i1 %1733, label %then2313, label %else2314

then2313:                                         ; preds = %continuation2304
  br label %continuation2312

else2314:                                         ; preds = %continuation2304
  %1734 = alloca i32, align 4
  %1735 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1736 = call i32 (ptr, ...) @scanf(ptr %1735, ptr %1734)
  %1737 = load i32, ptr %1734, align 4
  %1738 = icmp eq i32 %1737, 0
  br label %continuation2312

continuation2312:                                 ; preds = %else2314, %then2313
  %1739 = phi i1 [ %1738, %else2314 ], [ true, %then2313 ]
  br i1 %1739, label %then2321, label %else2322

then2321:                                         ; preds = %continuation2312
  br label %continuation2320

else2322:                                         ; preds = %continuation2312
  %1740 = alloca i32, align 4
  %1741 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1742 = call i32 (ptr, ...) @scanf(ptr %1741, ptr %1740)
  %1743 = load i32, ptr %1740, align 4
  %1744 = icmp eq i32 %1743, 0
  br label %continuation2320

continuation2320:                                 ; preds = %else2322, %then2321
  %1745 = phi i1 [ %1744, %else2322 ], [ true, %then2321 ]
  br i1 %1745, label %then2329, label %else2330

then2329:                                         ; preds = %continuation2320
  br label %continuation2328

else2330:                                         ; preds = %continuation2320
  %1746 = alloca i32, align 4
  %1747 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1748 = call i32 (ptr, ...) @scanf(ptr %1747, ptr %1746)
  %1749 = load i32, ptr %1746, align 4
  %1750 = icmp eq i32 %1749, 0
  br label %continuation2328

continuation2328:                                 ; preds = %else2330, %then2329
  %1751 = phi i1 [ %1750, %else2330 ], [ true, %then2329 ]
  br i1 %1751, label %then2337, label %else2338

then2337:                                         ; preds = %continuation2328
  br label %continuation2336

else2338:                                         ; preds = %continuation2328
  %1752 = alloca i32, align 4
  %1753 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1754 = call i32 (ptr, ...) @scanf(ptr %1753, ptr %1752)
  %1755 = load i32, ptr %1752, align 4
  %1756 = icmp eq i32 %1755, 0
  br label %continuation2336

continuation2336:                                 ; preds = %else2338, %then2337
  %1757 = phi i1 [ %1756, %else2338 ], [ true, %then2337 ]
  br i1 %1757, label %then2345, label %else2346

then2345:                                         ; preds = %continuation2336
  br label %continuation2344

else2346:                                         ; preds = %continuation2336
  %1758 = alloca i32, align 4
  %1759 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1760 = call i32 (ptr, ...) @scanf(ptr %1759, ptr %1758)
  %1761 = load i32, ptr %1758, align 4
  %1762 = icmp eq i32 %1761, 0
  br label %continuation2344

continuation2344:                                 ; preds = %else2346, %then2345
  %1763 = phi i1 [ %1762, %else2346 ], [ true, %then2345 ]
  br i1 %1763, label %then2353, label %else2354

then2353:                                         ; preds = %continuation2344
  br label %continuation2352

else2354:                                         ; preds = %continuation2344
  %1764 = alloca i32, align 4
  %1765 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1766 = call i32 (ptr, ...) @scanf(ptr %1765, ptr %1764)
  %1767 = load i32, ptr %1764, align 4
  %1768 = icmp eq i32 %1767, 0
  br label %continuation2352

continuation2352:                                 ; preds = %else2354, %then2353
  %1769 = phi i1 [ %1768, %else2354 ], [ true, %then2353 ]
  br i1 %1769, label %then2361, label %else2362

then2361:                                         ; preds = %continuation2352
  br label %continuation2360

else2362:                                         ; preds = %continuation2352
  %1770 = alloca i32, align 4
  %1771 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1772 = call i32 (ptr, ...) @scanf(ptr %1771, ptr %1770)
  %1773 = load i32, ptr %1770, align 4
  %1774 = icmp eq i32 %1773, 0
  br label %continuation2360

continuation2360:                                 ; preds = %else2362, %then2361
  %1775 = phi i1 [ %1774, %else2362 ], [ true, %then2361 ]
  br i1 %1775, label %then2369, label %else2370

then2369:                                         ; preds = %continuation2360
  br label %continuation2368

else2370:                                         ; preds = %continuation2360
  %1776 = alloca i32, align 4
  %1777 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1778 = call i32 (ptr, ...) @scanf(ptr %1777, ptr %1776)
  %1779 = load i32, ptr %1776, align 4
  %1780 = icmp eq i32 %1779, 0
  br label %continuation2368

continuation2368:                                 ; preds = %else2370, %then2369
  %1781 = phi i1 [ %1780, %else2370 ], [ true, %then2369 ]
  br i1 %1781, label %then2377, label %else2378

then2377:                                         ; preds = %continuation2368
  br label %continuation2376

else2378:                                         ; preds = %continuation2368
  %1782 = alloca i32, align 4
  %1783 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1784 = call i32 (ptr, ...) @scanf(ptr %1783, ptr %1782)
  %1785 = load i32, ptr %1782, align 4
  %1786 = icmp eq i32 %1785, 0
  br label %continuation2376

continuation2376:                                 ; preds = %else2378, %then2377
  %1787 = phi i1 [ %1786, %else2378 ], [ true, %then2377 ]
  br i1 %1787, label %then2385, label %else2386

then2385:                                         ; preds = %continuation2376
  br label %continuation2384

else2386:                                         ; preds = %continuation2376
  %1788 = alloca i32, align 4
  %1789 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1790 = call i32 (ptr, ...) @scanf(ptr %1789, ptr %1788)
  %1791 = load i32, ptr %1788, align 4
  %1792 = icmp eq i32 %1791, 0
  br label %continuation2384

continuation2384:                                 ; preds = %else2386, %then2385
  %1793 = phi i1 [ %1792, %else2386 ], [ true, %then2385 ]
  br i1 %1793, label %then2393, label %else2394

then2393:                                         ; preds = %continuation2384
  br label %continuation2392

else2394:                                         ; preds = %continuation2384
  %1794 = alloca i32, align 4
  %1795 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1796 = call i32 (ptr, ...) @scanf(ptr %1795, ptr %1794)
  %1797 = load i32, ptr %1794, align 4
  %1798 = icmp eq i32 %1797, 0
  br label %continuation2392

continuation2392:                                 ; preds = %else2394, %then2393
  %1799 = phi i1 [ %1798, %else2394 ], [ true, %then2393 ]
  br i1 %1799, label %then2401, label %else2402

then2401:                                         ; preds = %continuation2392
  br label %continuation2400

else2402:                                         ; preds = %continuation2392
  %1800 = alloca i32, align 4
  %1801 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1802 = call i32 (ptr, ...) @scanf(ptr %1801, ptr %1800)
  %1803 = load i32, ptr %1800, align 4
  %1804 = icmp eq i32 %1803, 0
  br label %continuation2400

continuation2400:                                 ; preds = %else2402, %then2401
  %1805 = phi i1 [ %1804, %else2402 ], [ true, %then2401 ]
  br i1 %1805, label %then2409, label %else2410

then2409:                                         ; preds = %continuation2400
  br label %continuation2408

else2410:                                         ; preds = %continuation2400
  %1806 = alloca i32, align 4
  %1807 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1808 = call i32 (ptr, ...) @scanf(ptr %1807, ptr %1806)
  %1809 = load i32, ptr %1806, align 4
  %1810 = icmp eq i32 %1809, 0
  br label %continuation2408

continuation2408:                                 ; preds = %else2410, %then2409
  %1811 = phi i1 [ %1810, %else2410 ], [ true, %then2409 ]
  br i1 %1811, label %then2417, label %else2418

then2417:                                         ; preds = %continuation2408
  br label %continuation2416

else2418:                                         ; preds = %continuation2408
  %1812 = alloca i32, align 4
  %1813 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1814 = call i32 (ptr, ...) @scanf(ptr %1813, ptr %1812)
  %1815 = load i32, ptr %1812, align 4
  %1816 = icmp eq i32 %1815, 0
  br label %continuation2416

continuation2416:                                 ; preds = %else2418, %then2417
  %1817 = phi i1 [ %1816, %else2418 ], [ true, %then2417 ]
  br i1 %1817, label %then2425, label %else2426

then2425:                                         ; preds = %continuation2416
  br label %continuation2424

else2426:                                         ; preds = %continuation2416
  %1818 = alloca i32, align 4
  %1819 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1820 = call i32 (ptr, ...) @scanf(ptr %1819, ptr %1818)
  %1821 = load i32, ptr %1818, align 4
  %1822 = icmp eq i32 %1821, 0
  br label %continuation2424

continuation2424:                                 ; preds = %else2426, %then2425
  %1823 = phi i1 [ %1822, %else2426 ], [ true, %then2425 ]
  br i1 %1823, label %then2433, label %else2434

then2433:                                         ; preds = %continuation2424
  br label %continuation2432

else2434:                                         ; preds = %continuation2424
  %1824 = alloca i32, align 4
  %1825 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1826 = call i32 (ptr, ...) @scanf(ptr %1825, ptr %1824)
  %1827 = load i32, ptr %1824, align 4
  %1828 = icmp eq i32 %1827, 0
  br label %continuation2432

continuation2432:                                 ; preds = %else2434, %then2433
  %1829 = phi i1 [ %1828, %else2434 ], [ true, %then2433 ]
  br i1 %1829, label %then2441, label %else2442

then2441:                                         ; preds = %continuation2432
  br label %continuation2440

else2442:                                         ; preds = %continuation2432
  %1830 = alloca i32, align 4
  %1831 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1832 = call i32 (ptr, ...) @scanf(ptr %1831, ptr %1830)
  %1833 = load i32, ptr %1830, align 4
  %1834 = icmp eq i32 %1833, 0
  br label %continuation2440

continuation2440:                                 ; preds = %else2442, %then2441
  %1835 = phi i1 [ %1834, %else2442 ], [ true, %then2441 ]
  br i1 %1835, label %then2449, label %else2450

then2449:                                         ; preds = %continuation2440
  br label %continuation2448

else2450:                                         ; preds = %continuation2440
  %1836 = alloca i32, align 4
  %1837 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1838 = call i32 (ptr, ...) @scanf(ptr %1837, ptr %1836)
  %1839 = load i32, ptr %1836, align 4
  %1840 = icmp eq i32 %1839, 0
  br label %continuation2448

continuation2448:                                 ; preds = %else2450, %then2449
  %1841 = phi i1 [ %1840, %else2450 ], [ true, %then2449 ]
  br i1 %1841, label %then2457, label %else2458

then2457:                                         ; preds = %continuation2448
  br label %continuation2456

else2458:                                         ; preds = %continuation2448
  %1842 = alloca i32, align 4
  %1843 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1844 = call i32 (ptr, ...) @scanf(ptr %1843, ptr %1842)
  %1845 = load i32, ptr %1842, align 4
  %1846 = icmp eq i32 %1845, 0
  br label %continuation2456

continuation2456:                                 ; preds = %else2458, %then2457
  %1847 = phi i1 [ %1846, %else2458 ], [ true, %then2457 ]
  br i1 %1847, label %then2465, label %else2466

then2465:                                         ; preds = %continuation2456
  br label %continuation2464

else2466:                                         ; preds = %continuation2456
  %1848 = alloca i32, align 4
  %1849 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1850 = call i32 (ptr, ...) @scanf(ptr %1849, ptr %1848)
  %1851 = load i32, ptr %1848, align 4
  %1852 = icmp eq i32 %1851, 0
  br label %continuation2464

continuation2464:                                 ; preds = %else2466, %then2465
  %1853 = phi i1 [ %1852, %else2466 ], [ true, %then2465 ]
  br i1 %1853, label %then2473, label %else2474

then2473:                                         ; preds = %continuation2464
  br label %continuation2472

else2474:                                         ; preds = %continuation2464
  %1854 = alloca i32, align 4
  %1855 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1856 = call i32 (ptr, ...) @scanf(ptr %1855, ptr %1854)
  %1857 = load i32, ptr %1854, align 4
  %1858 = icmp eq i32 %1857, 0
  br label %continuation2472

continuation2472:                                 ; preds = %else2474, %then2473
  %1859 = phi i1 [ %1858, %else2474 ], [ true, %then2473 ]
  br i1 %1859, label %then2481, label %else2482

then2481:                                         ; preds = %continuation2472
  br label %continuation2480

else2482:                                         ; preds = %continuation2472
  %1860 = alloca i32, align 4
  %1861 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1862 = call i32 (ptr, ...) @scanf(ptr %1861, ptr %1860)
  %1863 = load i32, ptr %1860, align 4
  %1864 = icmp eq i32 %1863, 0
  br label %continuation2480

continuation2480:                                 ; preds = %else2482, %then2481
  %1865 = phi i1 [ %1864, %else2482 ], [ true, %then2481 ]
  br i1 %1865, label %then2489, label %else2490

then2489:                                         ; preds = %continuation2480
  br label %continuation2488

else2490:                                         ; preds = %continuation2480
  %1866 = alloca i32, align 4
  %1867 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1868 = call i32 (ptr, ...) @scanf(ptr %1867, ptr %1866)
  %1869 = load i32, ptr %1866, align 4
  %1870 = icmp eq i32 %1869, 0
  br label %continuation2488

continuation2488:                                 ; preds = %else2490, %then2489
  %1871 = phi i1 [ %1870, %else2490 ], [ true, %then2489 ]
  br i1 %1871, label %then2497, label %else2498

then2497:                                         ; preds = %continuation2488
  br label %continuation2496

else2498:                                         ; preds = %continuation2488
  %1872 = alloca i32, align 4
  %1873 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1874 = call i32 (ptr, ...) @scanf(ptr %1873, ptr %1872)
  %1875 = load i32, ptr %1872, align 4
  %1876 = icmp eq i32 %1875, 0
  br label %continuation2496

continuation2496:                                 ; preds = %else2498, %then2497
  %1877 = phi i1 [ %1876, %else2498 ], [ true, %then2497 ]
  br i1 %1877, label %then2505, label %else2506

then2505:                                         ; preds = %continuation2496
  br label %continuation2504

else2506:                                         ; preds = %continuation2496
  %1878 = alloca i32, align 4
  %1879 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1880 = call i32 (ptr, ...) @scanf(ptr %1879, ptr %1878)
  %1881 = load i32, ptr %1878, align 4
  %1882 = icmp eq i32 %1881, 0
  br label %continuation2504

continuation2504:                                 ; preds = %else2506, %then2505
  %1883 = phi i1 [ %1882, %else2506 ], [ true, %then2505 ]
  br i1 %1883, label %then2513, label %else2514

then2513:                                         ; preds = %continuation2504
  br label %continuation2512

else2514:                                         ; preds = %continuation2504
  %1884 = alloca i32, align 4
  %1885 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1886 = call i32 (ptr, ...) @scanf(ptr %1885, ptr %1884)
  %1887 = load i32, ptr %1884, align 4
  %1888 = icmp eq i32 %1887, 0
  br label %continuation2512

continuation2512:                                 ; preds = %else2514, %then2513
  %1889 = phi i1 [ %1888, %else2514 ], [ true, %then2513 ]
  br i1 %1889, label %then2521, label %else2522

then2521:                                         ; preds = %continuation2512
  br label %continuation2520

else2522:                                         ; preds = %continuation2512
  %1890 = alloca i32, align 4
  %1891 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1892 = call i32 (ptr, ...) @scanf(ptr %1891, ptr %1890)
  %1893 = load i32, ptr %1890, align 4
  %1894 = icmp eq i32 %1893, 0
  br label %continuation2520

continuation2520:                                 ; preds = %else2522, %then2521
  %1895 = phi i1 [ %1894, %else2522 ], [ true, %then2521 ]
  br i1 %1895, label %then2529, label %else2530

then2529:                                         ; preds = %continuation2520
  br label %continuation2528

else2530:                                         ; preds = %continuation2520
  %1896 = alloca i32, align 4
  %1897 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1898 = call i32 (ptr, ...) @scanf(ptr %1897, ptr %1896)
  %1899 = load i32, ptr %1896, align 4
  %1900 = icmp eq i32 %1899, 0
  br label %continuation2528

continuation2528:                                 ; preds = %else2530, %then2529
  %1901 = phi i1 [ %1900, %else2530 ], [ true, %then2529 ]
  br i1 %1901, label %then2537, label %else2538

then2537:                                         ; preds = %continuation2528
  br label %continuation2536

else2538:                                         ; preds = %continuation2528
  %1902 = alloca i32, align 4
  %1903 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1904 = call i32 (ptr, ...) @scanf(ptr %1903, ptr %1902)
  %1905 = load i32, ptr %1902, align 4
  %1906 = icmp eq i32 %1905, 0
  br label %continuation2536

continuation2536:                                 ; preds = %else2538, %then2537
  %1907 = phi i1 [ %1906, %else2538 ], [ true, %then2537 ]
  br i1 %1907, label %then2545, label %else2546

then2545:                                         ; preds = %continuation2536
  br label %continuation2544

else2546:                                         ; preds = %continuation2536
  %1908 = alloca i32, align 4
  %1909 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1910 = call i32 (ptr, ...) @scanf(ptr %1909, ptr %1908)
  %1911 = load i32, ptr %1908, align 4
  %1912 = icmp eq i32 %1911, 0
  br label %continuation2544

continuation2544:                                 ; preds = %else2546, %then2545
  %1913 = phi i1 [ %1912, %else2546 ], [ true, %then2545 ]
  br i1 %1913, label %then2553, label %else2554

then2553:                                         ; preds = %continuation2544
  br label %continuation2552

else2554:                                         ; preds = %continuation2544
  %1914 = alloca i32, align 4
  %1915 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1916 = call i32 (ptr, ...) @scanf(ptr %1915, ptr %1914)
  %1917 = load i32, ptr %1914, align 4
  %1918 = icmp eq i32 %1917, 0
  br label %continuation2552

continuation2552:                                 ; preds = %else2554, %then2553
  %1919 = phi i1 [ %1918, %else2554 ], [ true, %then2553 ]
  br i1 %1919, label %then2561, label %else2562

then2561:                                         ; preds = %continuation2552
  br label %continuation2560

else2562:                                         ; preds = %continuation2552
  %1920 = alloca i32, align 4
  %1921 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1922 = call i32 (ptr, ...) @scanf(ptr %1921, ptr %1920)
  %1923 = load i32, ptr %1920, align 4
  %1924 = icmp eq i32 %1923, 0
  br label %continuation2560

continuation2560:                                 ; preds = %else2562, %then2561
  %1925 = phi i1 [ %1924, %else2562 ], [ true, %then2561 ]
  br i1 %1925, label %then2569, label %else2570

then2569:                                         ; preds = %continuation2560
  br label %continuation2568

else2570:                                         ; preds = %continuation2560
  %1926 = alloca i32, align 4
  %1927 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1928 = call i32 (ptr, ...) @scanf(ptr %1927, ptr %1926)
  %1929 = load i32, ptr %1926, align 4
  %1930 = icmp eq i32 %1929, 0
  br label %continuation2568

continuation2568:                                 ; preds = %else2570, %then2569
  %1931 = phi i1 [ %1930, %else2570 ], [ true, %then2569 ]
  br i1 %1931, label %then2577, label %else2578

then2577:                                         ; preds = %continuation2568
  br label %continuation2576

else2578:                                         ; preds = %continuation2568
  %1932 = alloca i32, align 4
  %1933 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1934 = call i32 (ptr, ...) @scanf(ptr %1933, ptr %1932)
  %1935 = load i32, ptr %1932, align 4
  %1936 = icmp eq i32 %1935, 0
  br label %continuation2576

continuation2576:                                 ; preds = %else2578, %then2577
  %1937 = phi i1 [ %1936, %else2578 ], [ true, %then2577 ]
  br i1 %1937, label %then2585, label %else2586

then2585:                                         ; preds = %continuation2576
  br label %continuation2584

else2586:                                         ; preds = %continuation2576
  %1938 = alloca i32, align 4
  %1939 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1940 = call i32 (ptr, ...) @scanf(ptr %1939, ptr %1938)
  %1941 = load i32, ptr %1938, align 4
  %1942 = icmp eq i32 %1941, 0
  br label %continuation2584

continuation2584:                                 ; preds = %else2586, %then2585
  %1943 = phi i1 [ %1942, %else2586 ], [ true, %then2585 ]
  br i1 %1943, label %then2593, label %else2594

then2593:                                         ; preds = %continuation2584
  br label %continuation2592

else2594:                                         ; preds = %continuation2584
  %1944 = alloca i32, align 4
  %1945 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1946 = call i32 (ptr, ...) @scanf(ptr %1945, ptr %1944)
  %1947 = load i32, ptr %1944, align 4
  %1948 = icmp eq i32 %1947, 0
  br label %continuation2592

continuation2592:                                 ; preds = %else2594, %then2593
  %1949 = phi i1 [ %1948, %else2594 ], [ true, %then2593 ]
  br i1 %1949, label %then2601, label %else2602

then2601:                                         ; preds = %continuation2592
  br label %continuation2600

else2602:                                         ; preds = %continuation2592
  %1950 = alloca i32, align 4
  %1951 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1952 = call i32 (ptr, ...) @scanf(ptr %1951, ptr %1950)
  %1953 = load i32, ptr %1950, align 4
  %1954 = icmp eq i32 %1953, 0
  br label %continuation2600

continuation2600:                                 ; preds = %else2602, %then2601
  %1955 = phi i1 [ %1954, %else2602 ], [ true, %then2601 ]
  br i1 %1955, label %then2609, label %else2610

then2609:                                         ; preds = %continuation2600
  br label %continuation2608

else2610:                                         ; preds = %continuation2600
  %1956 = alloca i32, align 4
  %1957 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1958 = call i32 (ptr, ...) @scanf(ptr %1957, ptr %1956)
  %1959 = load i32, ptr %1956, align 4
  %1960 = icmp eq i32 %1959, 0
  br label %continuation2608

continuation2608:                                 ; preds = %else2610, %then2609
  %1961 = phi i1 [ %1960, %else2610 ], [ true, %then2609 ]
  br i1 %1961, label %then2617, label %else2618

then2617:                                         ; preds = %continuation2608
  br label %continuation2616

else2618:                                         ; preds = %continuation2608
  %1962 = alloca i32, align 4
  %1963 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1964 = call i32 (ptr, ...) @scanf(ptr %1963, ptr %1962)
  %1965 = load i32, ptr %1962, align 4
  %1966 = icmp eq i32 %1965, 0
  br label %continuation2616

continuation2616:                                 ; preds = %else2618, %then2617
  %1967 = phi i1 [ %1966, %else2618 ], [ true, %then2617 ]
  br i1 %1967, label %then2625, label %else2626

then2625:                                         ; preds = %continuation2616
  br label %continuation2624

else2626:                                         ; preds = %continuation2616
  %1968 = alloca i32, align 4
  %1969 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1970 = call i32 (ptr, ...) @scanf(ptr %1969, ptr %1968)
  %1971 = load i32, ptr %1968, align 4
  %1972 = icmp eq i32 %1971, 0
  br label %continuation2624

continuation2624:                                 ; preds = %else2626, %then2625
  %1973 = phi i1 [ %1972, %else2626 ], [ true, %then2625 ]
  br i1 %1973, label %then2633, label %else2634

then2633:                                         ; preds = %continuation2624
  br label %continuation2632

else2634:                                         ; preds = %continuation2624
  %1974 = alloca i32, align 4
  %1975 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1976 = call i32 (ptr, ...) @scanf(ptr %1975, ptr %1974)
  %1977 = load i32, ptr %1974, align 4
  %1978 = icmp eq i32 %1977, 0
  br label %continuation2632

continuation2632:                                 ; preds = %else2634, %then2633
  %1979 = phi i1 [ %1978, %else2634 ], [ true, %then2633 ]
  br i1 %1979, label %then2641, label %else2642

then2641:                                         ; preds = %continuation2632
  br label %continuation2640

else2642:                                         ; preds = %continuation2632
  %1980 = alloca i32, align 4
  %1981 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1982 = call i32 (ptr, ...) @scanf(ptr %1981, ptr %1980)
  %1983 = load i32, ptr %1980, align 4
  %1984 = icmp eq i32 %1983, 0
  br label %continuation2640

continuation2640:                                 ; preds = %else2642, %then2641
  %1985 = phi i1 [ %1984, %else2642 ], [ true, %then2641 ]
  br i1 %1985, label %then2649, label %else2650

then2649:                                         ; preds = %continuation2640
  br label %continuation2648

else2650:                                         ; preds = %continuation2640
  %1986 = alloca i32, align 4
  %1987 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1988 = call i32 (ptr, ...) @scanf(ptr %1987, ptr %1986)
  %1989 = load i32, ptr %1986, align 4
  %1990 = icmp eq i32 %1989, 0
  br label %continuation2648

continuation2648:                                 ; preds = %else2650, %then2649
  %1991 = phi i1 [ %1990, %else2650 ], [ true, %then2649 ]
  br i1 %1991, label %then2657, label %else2658

then2657:                                         ; preds = %continuation2648
  br label %continuation2656

else2658:                                         ; preds = %continuation2648
  %1992 = alloca i32, align 4
  %1993 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1994 = call i32 (ptr, ...) @scanf(ptr %1993, ptr %1992)
  %1995 = load i32, ptr %1992, align 4
  %1996 = icmp eq i32 %1995, 0
  br label %continuation2656

continuation2656:                                 ; preds = %else2658, %then2657
  %1997 = phi i1 [ %1996, %else2658 ], [ true, %then2657 ]
  br i1 %1997, label %then2665, label %else2666

then2665:                                         ; preds = %continuation2656
  br label %continuation2664

else2666:                                         ; preds = %continuation2656
  %1998 = alloca i32, align 4
  %1999 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2000 = call i32 (ptr, ...) @scanf(ptr %1999, ptr %1998)
  %2001 = load i32, ptr %1998, align 4
  %2002 = icmp eq i32 %2001, 0
  br label %continuation2664

continuation2664:                                 ; preds = %else2666, %then2665
  %2003 = phi i1 [ %2002, %else2666 ], [ true, %then2665 ]
  br i1 %2003, label %then2673, label %else2674

then2673:                                         ; preds = %continuation2664
  br label %continuation2672

else2674:                                         ; preds = %continuation2664
  %2004 = alloca i32, align 4
  %2005 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2006 = call i32 (ptr, ...) @scanf(ptr %2005, ptr %2004)
  %2007 = load i32, ptr %2004, align 4
  %2008 = icmp eq i32 %2007, 0
  br label %continuation2672

continuation2672:                                 ; preds = %else2674, %then2673
  %2009 = phi i1 [ %2008, %else2674 ], [ true, %then2673 ]
  br i1 %2009, label %then2681, label %else2682

then2681:                                         ; preds = %continuation2672
  br label %continuation2680

else2682:                                         ; preds = %continuation2672
  %2010 = alloca i32, align 4
  %2011 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2012 = call i32 (ptr, ...) @scanf(ptr %2011, ptr %2010)
  %2013 = load i32, ptr %2010, align 4
  %2014 = icmp eq i32 %2013, 0
  br label %continuation2680

continuation2680:                                 ; preds = %else2682, %then2681
  %2015 = phi i1 [ %2014, %else2682 ], [ true, %then2681 ]
  br i1 %2015, label %then2689, label %else2690

then2689:                                         ; preds = %continuation2680
  br label %continuation2688

else2690:                                         ; preds = %continuation2680
  %2016 = alloca i32, align 4
  %2017 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2018 = call i32 (ptr, ...) @scanf(ptr %2017, ptr %2016)
  %2019 = load i32, ptr %2016, align 4
  %2020 = icmp eq i32 %2019, 0
  br label %continuation2688

continuation2688:                                 ; preds = %else2690, %then2689
  %2021 = phi i1 [ %2020, %else2690 ], [ true, %then2689 ]
  br i1 %2021, label %then2697, label %else2698

then2697:                                         ; preds = %continuation2688
  br label %continuation2696

else2698:                                         ; preds = %continuation2688
  %2022 = alloca i32, align 4
  %2023 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2024 = call i32 (ptr, ...) @scanf(ptr %2023, ptr %2022)
  %2025 = load i32, ptr %2022, align 4
  %2026 = icmp eq i32 %2025, 0
  br label %continuation2696

continuation2696:                                 ; preds = %else2698, %then2697
  %2027 = phi i1 [ %2026, %else2698 ], [ true, %then2697 ]
  br i1 %2027, label %then2705, label %else2706

then2705:                                         ; preds = %continuation2696
  br label %continuation2704

else2706:                                         ; preds = %continuation2696
  %2028 = alloca i32, align 4
  %2029 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2030 = call i32 (ptr, ...) @scanf(ptr %2029, ptr %2028)
  %2031 = load i32, ptr %2028, align 4
  %2032 = icmp eq i32 %2031, 0
  br label %continuation2704

continuation2704:                                 ; preds = %else2706, %then2705
  %2033 = phi i1 [ %2032, %else2706 ], [ true, %then2705 ]
  br i1 %2033, label %then2713, label %else2714

then2713:                                         ; preds = %continuation2704
  br label %continuation2712

else2714:                                         ; preds = %continuation2704
  %2034 = alloca i32, align 4
  %2035 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2036 = call i32 (ptr, ...) @scanf(ptr %2035, ptr %2034)
  %2037 = load i32, ptr %2034, align 4
  %2038 = icmp eq i32 %2037, 0
  br label %continuation2712

continuation2712:                                 ; preds = %else2714, %then2713
  %2039 = phi i1 [ %2038, %else2714 ], [ true, %then2713 ]
  br i1 %2039, label %then2721, label %else2722

then2721:                                         ; preds = %continuation2712
  br label %continuation2720

else2722:                                         ; preds = %continuation2712
  %2040 = alloca i32, align 4
  %2041 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2042 = call i32 (ptr, ...) @scanf(ptr %2041, ptr %2040)
  %2043 = load i32, ptr %2040, align 4
  %2044 = icmp eq i32 %2043, 0
  br label %continuation2720

continuation2720:                                 ; preds = %else2722, %then2721
  %2045 = phi i1 [ %2044, %else2722 ], [ true, %then2721 ]
  br i1 %2045, label %then2729, label %else2730

then2729:                                         ; preds = %continuation2720
  br label %continuation2728

else2730:                                         ; preds = %continuation2720
  %2046 = alloca i32, align 4
  %2047 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2048 = call i32 (ptr, ...) @scanf(ptr %2047, ptr %2046)
  %2049 = load i32, ptr %2046, align 4
  %2050 = icmp eq i32 %2049, 0
  br label %continuation2728

continuation2728:                                 ; preds = %else2730, %then2729
  %2051 = phi i1 [ %2050, %else2730 ], [ true, %then2729 ]
  br i1 %2051, label %then2737, label %else2738

then2737:                                         ; preds = %continuation2728
  br label %continuation2736

else2738:                                         ; preds = %continuation2728
  %2052 = alloca i32, align 4
  %2053 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2054 = call i32 (ptr, ...) @scanf(ptr %2053, ptr %2052)
  %2055 = load i32, ptr %2052, align 4
  %2056 = icmp eq i32 %2055, 0
  br label %continuation2736

continuation2736:                                 ; preds = %else2738, %then2737
  %2057 = phi i1 [ %2056, %else2738 ], [ true, %then2737 ]
  br i1 %2057, label %then2745, label %else2746

then2745:                                         ; preds = %continuation2736
  br label %continuation2744

else2746:                                         ; preds = %continuation2736
  %2058 = alloca i32, align 4
  %2059 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2060 = call i32 (ptr, ...) @scanf(ptr %2059, ptr %2058)
  %2061 = load i32, ptr %2058, align 4
  %2062 = icmp eq i32 %2061, 0
  br label %continuation2744

continuation2744:                                 ; preds = %else2746, %then2745
  %2063 = phi i1 [ %2062, %else2746 ], [ true, %then2745 ]
  br i1 %2063, label %then2753, label %else2754

then2753:                                         ; preds = %continuation2744
  br label %continuation2752

else2754:                                         ; preds = %continuation2744
  %2064 = alloca i32, align 4
  %2065 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2066 = call i32 (ptr, ...) @scanf(ptr %2065, ptr %2064)
  %2067 = load i32, ptr %2064, align 4
  %2068 = icmp eq i32 %2067, 0
  br label %continuation2752

continuation2752:                                 ; preds = %else2754, %then2753
  %2069 = phi i1 [ %2068, %else2754 ], [ true, %then2753 ]
  br i1 %2069, label %then2761, label %else2762

then2761:                                         ; preds = %continuation2752
  br label %continuation2760

else2762:                                         ; preds = %continuation2752
  %2070 = alloca i32, align 4
  %2071 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2072 = call i32 (ptr, ...) @scanf(ptr %2071, ptr %2070)
  %2073 = load i32, ptr %2070, align 4
  %2074 = icmp eq i32 %2073, 0
  br label %continuation2760

continuation2760:                                 ; preds = %else2762, %then2761
  %2075 = phi i1 [ %2074, %else2762 ], [ true, %then2761 ]
  br i1 %2075, label %then2769, label %else2770

then2769:                                         ; preds = %continuation2760
  br label %continuation2768

else2770:                                         ; preds = %continuation2760
  %2076 = alloca i32, align 4
  %2077 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2078 = call i32 (ptr, ...) @scanf(ptr %2077, ptr %2076)
  %2079 = load i32, ptr %2076, align 4
  %2080 = icmp eq i32 %2079, 0
  br label %continuation2768

continuation2768:                                 ; preds = %else2770, %then2769
  %2081 = phi i1 [ %2080, %else2770 ], [ true, %then2769 ]
  br i1 %2081, label %then2777, label %else2778

then2777:                                         ; preds = %continuation2768
  br label %continuation2776

else2778:                                         ; preds = %continuation2768
  %2082 = alloca i32, align 4
  %2083 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2084 = call i32 (ptr, ...) @scanf(ptr %2083, ptr %2082)
  %2085 = load i32, ptr %2082, align 4
  %2086 = icmp eq i32 %2085, 0
  br label %continuation2776

continuation2776:                                 ; preds = %else2778, %then2777
  %2087 = phi i1 [ %2086, %else2778 ], [ true, %then2777 ]
  br i1 %2087, label %then2785, label %else2786

then2785:                                         ; preds = %continuation2776
  br label %continuation2784

else2786:                                         ; preds = %continuation2776
  %2088 = alloca i32, align 4
  %2089 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2090 = call i32 (ptr, ...) @scanf(ptr %2089, ptr %2088)
  %2091 = load i32, ptr %2088, align 4
  %2092 = icmp eq i32 %2091, 0
  br label %continuation2784

continuation2784:                                 ; preds = %else2786, %then2785
  %2093 = phi i1 [ %2092, %else2786 ], [ true, %then2785 ]
  br i1 %2093, label %then2793, label %else2794

then2793:                                         ; preds = %continuation2784
  br label %continuation2792

else2794:                                         ; preds = %continuation2784
  %2094 = alloca i32, align 4
  %2095 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2096 = call i32 (ptr, ...) @scanf(ptr %2095, ptr %2094)
  %2097 = load i32, ptr %2094, align 4
  %2098 = icmp eq i32 %2097, 0
  br label %continuation2792

continuation2792:                                 ; preds = %else2794, %then2793
  %2099 = phi i1 [ %2098, %else2794 ], [ true, %then2793 ]
  br i1 %2099, label %then2801, label %else2802

then2801:                                         ; preds = %continuation2792
  br label %continuation2800

else2802:                                         ; preds = %continuation2792
  %2100 = alloca i32, align 4
  %2101 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2102 = call i32 (ptr, ...) @scanf(ptr %2101, ptr %2100)
  %2103 = load i32, ptr %2100, align 4
  %2104 = icmp eq i32 %2103, 0
  br label %continuation2800

continuation2800:                                 ; preds = %else2802, %then2801
  %2105 = phi i1 [ %2104, %else2802 ], [ true, %then2801 ]
  br i1 %2105, label %then2809, label %else2810

then2809:                                         ; preds = %continuation2800
  br label %continuation2808

else2810:                                         ; preds = %continuation2800
  %2106 = alloca i32, align 4
  %2107 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2108 = call i32 (ptr, ...) @scanf(ptr %2107, ptr %2106)
  %2109 = load i32, ptr %2106, align 4
  %2110 = icmp eq i32 %2109, 0
  br label %continuation2808

continuation2808:                                 ; preds = %else2810, %then2809
  %2111 = phi i1 [ %2110, %else2810 ], [ true, %then2809 ]
  br i1 %2111, label %then2817, label %else2818

then2817:                                         ; preds = %continuation2808
  br label %continuation2816

else2818:                                         ; preds = %continuation2808
  %2112 = alloca i32, align 4
  %2113 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2114 = call i32 (ptr, ...) @scanf(ptr %2113, ptr %2112)
  %2115 = load i32, ptr %2112, align 4
  %2116 = icmp eq i32 %2115, 0
  br label %continuation2816

continuation2816:                                 ; preds = %else2818, %then2817
  %2117 = phi i1 [ %2116, %else2818 ], [ true, %then2817 ]
  br i1 %2117, label %then2825, label %else2826

then2825:                                         ; preds = %continuation2816
  br label %continuation2824

else2826:                                         ; preds = %continuation2816
  %2118 = alloca i32, align 4
  %2119 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2120 = call i32 (ptr, ...) @scanf(ptr %2119, ptr %2118)
  %2121 = load i32, ptr %2118, align 4
  %2122 = icmp eq i32 %2121, 0
  br label %continuation2824

continuation2824:                                 ; preds = %else2826, %then2825
  %2123 = phi i1 [ %2122, %else2826 ], [ true, %then2825 ]
  br i1 %2123, label %then2833, label %else2834

then2833:                                         ; preds = %continuation2824
  br label %continuation2832

else2834:                                         ; preds = %continuation2824
  %2124 = alloca i32, align 4
  %2125 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2126 = call i32 (ptr, ...) @scanf(ptr %2125, ptr %2124)
  %2127 = load i32, ptr %2124, align 4
  %2128 = icmp eq i32 %2127, 0
  br label %continuation2832

continuation2832:                                 ; preds = %else2834, %then2833
  %2129 = phi i1 [ %2128, %else2834 ], [ true, %then2833 ]
  br i1 %2129, label %then2841, label %else2842

then2841:                                         ; preds = %continuation2832
  br label %continuation2840

else2842:                                         ; preds = %continuation2832
  %2130 = alloca i32, align 4
  %2131 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2132 = call i32 (ptr, ...) @scanf(ptr %2131, ptr %2130)
  %2133 = load i32, ptr %2130, align 4
  %2134 = icmp eq i32 %2133, 0
  br label %continuation2840

continuation2840:                                 ; preds = %else2842, %then2841
  %2135 = phi i1 [ %2134, %else2842 ], [ true, %then2841 ]
  br i1 %2135, label %then2849, label %else2850

then2849:                                         ; preds = %continuation2840
  br label %continuation2848

else2850:                                         ; preds = %continuation2840
  %2136 = alloca i32, align 4
  %2137 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2138 = call i32 (ptr, ...) @scanf(ptr %2137, ptr %2136)
  %2139 = load i32, ptr %2136, align 4
  %2140 = icmp eq i32 %2139, 0
  br label %continuation2848

continuation2848:                                 ; preds = %else2850, %then2849
  %2141 = phi i1 [ %2140, %else2850 ], [ true, %then2849 ]
  br i1 %2141, label %then2857, label %else2858

then2857:                                         ; preds = %continuation2848
  br label %continuation2856

else2858:                                         ; preds = %continuation2848
  %2142 = alloca i32, align 4
  %2143 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2144 = call i32 (ptr, ...) @scanf(ptr %2143, ptr %2142)
  %2145 = load i32, ptr %2142, align 4
  %2146 = icmp eq i32 %2145, 0
  br label %continuation2856

continuation2856:                                 ; preds = %else2858, %then2857
  %2147 = phi i1 [ %2146, %else2858 ], [ true, %then2857 ]
  br i1 %2147, label %then2865, label %else2866

then2865:                                         ; preds = %continuation2856
  br label %continuation2864

else2866:                                         ; preds = %continuation2856
  %2148 = alloca i32, align 4
  %2149 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2150 = call i32 (ptr, ...) @scanf(ptr %2149, ptr %2148)
  %2151 = load i32, ptr %2148, align 4
  %2152 = icmp eq i32 %2151, 0
  br label %continuation2864

continuation2864:                                 ; preds = %else2866, %then2865
  %2153 = phi i1 [ %2152, %else2866 ], [ true, %then2865 ]
  br i1 %2153, label %then2873, label %else2874

then2873:                                         ; preds = %continuation2864
  br label %continuation2872

else2874:                                         ; preds = %continuation2864
  %2154 = alloca i32, align 4
  %2155 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2156 = call i32 (ptr, ...) @scanf(ptr %2155, ptr %2154)
  %2157 = load i32, ptr %2154, align 4
  %2158 = icmp eq i32 %2157, 0
  br label %continuation2872

continuation2872:                                 ; preds = %else2874, %then2873
  %2159 = phi i1 [ %2158, %else2874 ], [ true, %then2873 ]
  br i1 %2159, label %then2881, label %else2882

then2881:                                         ; preds = %continuation2872
  br label %continuation2880

else2882:                                         ; preds = %continuation2872
  %2160 = alloca i32, align 4
  %2161 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2162 = call i32 (ptr, ...) @scanf(ptr %2161, ptr %2160)
  %2163 = load i32, ptr %2160, align 4
  %2164 = icmp eq i32 %2163, 0
  br label %continuation2880

continuation2880:                                 ; preds = %else2882, %then2881
  %2165 = phi i1 [ %2164, %else2882 ], [ true, %then2881 ]
  br i1 %2165, label %then2889, label %else2890

then2889:                                         ; preds = %continuation2880
  br label %continuation2888

else2890:                                         ; preds = %continuation2880
  %2166 = alloca i32, align 4
  %2167 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2168 = call i32 (ptr, ...) @scanf(ptr %2167, ptr %2166)
  %2169 = load i32, ptr %2166, align 4
  %2170 = icmp eq i32 %2169, 0
  br label %continuation2888

continuation2888:                                 ; preds = %else2890, %then2889
  %2171 = phi i1 [ %2170, %else2890 ], [ true, %then2889 ]
  br i1 %2171, label %then2897, label %else2898

then2897:                                         ; preds = %continuation2888
  br label %continuation2896

else2898:                                         ; preds = %continuation2888
  %2172 = alloca i32, align 4
  %2173 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2174 = call i32 (ptr, ...) @scanf(ptr %2173, ptr %2172)
  %2175 = load i32, ptr %2172, align 4
  %2176 = icmp eq i32 %2175, 0
  br label %continuation2896

continuation2896:                                 ; preds = %else2898, %then2897
  %2177 = phi i1 [ %2176, %else2898 ], [ true, %then2897 ]
  br i1 %2177, label %then2905, label %else2906

then2905:                                         ; preds = %continuation2896
  br label %continuation2904

else2906:                                         ; preds = %continuation2896
  %2178 = alloca i32, align 4
  %2179 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2180 = call i32 (ptr, ...) @scanf(ptr %2179, ptr %2178)
  %2181 = load i32, ptr %2178, align 4
  %2182 = icmp eq i32 %2181, 0
  br label %continuation2904

continuation2904:                                 ; preds = %else2906, %then2905
  %2183 = phi i1 [ %2182, %else2906 ], [ true, %then2905 ]
  br i1 %2183, label %then2913, label %else2914

then2913:                                         ; preds = %continuation2904
  br label %continuation2912

else2914:                                         ; preds = %continuation2904
  %2184 = alloca i32, align 4
  %2185 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2186 = call i32 (ptr, ...) @scanf(ptr %2185, ptr %2184)
  %2187 = load i32, ptr %2184, align 4
  %2188 = icmp eq i32 %2187, 0
  br label %continuation2912

continuation2912:                                 ; preds = %else2914, %then2913
  %2189 = phi i1 [ %2188, %else2914 ], [ true, %then2913 ]
  br i1 %2189, label %then2921, label %else2922

then2921:                                         ; preds = %continuation2912
  br label %continuation2920

else2922:                                         ; preds = %continuation2912
  %2190 = alloca i32, align 4
  %2191 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2192 = call i32 (ptr, ...) @scanf(ptr %2191, ptr %2190)
  %2193 = load i32, ptr %2190, align 4
  %2194 = icmp eq i32 %2193, 0
  br label %continuation2920

continuation2920:                                 ; preds = %else2922, %then2921
  %2195 = phi i1 [ %2194, %else2922 ], [ true, %then2921 ]
  br i1 %2195, label %then2929, label %else2930

then2929:                                         ; preds = %continuation2920
  br label %continuation2928

else2930:                                         ; preds = %continuation2920
  %2196 = alloca i32, align 4
  %2197 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2198 = call i32 (ptr, ...) @scanf(ptr %2197, ptr %2196)
  %2199 = load i32, ptr %2196, align 4
  %2200 = icmp eq i32 %2199, 0
  br label %continuation2928

continuation2928:                                 ; preds = %else2930, %then2929
  %2201 = phi i1 [ %2200, %else2930 ], [ true, %then2929 ]
  br i1 %2201, label %then2937, label %else2938

then2937:                                         ; preds = %continuation2928
  br label %continuation2936

else2938:                                         ; preds = %continuation2928
  %2202 = alloca i32, align 4
  %2203 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2204 = call i32 (ptr, ...) @scanf(ptr %2203, ptr %2202)
  %2205 = load i32, ptr %2202, align 4
  %2206 = icmp eq i32 %2205, 0
  br label %continuation2936

continuation2936:                                 ; preds = %else2938, %then2937
  %2207 = phi i1 [ %2206, %else2938 ], [ true, %then2937 ]
  br i1 %2207, label %then2945, label %else2946

then2945:                                         ; preds = %continuation2936
  br label %continuation2944

else2946:                                         ; preds = %continuation2936
  %2208 = alloca i32, align 4
  %2209 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2210 = call i32 (ptr, ...) @scanf(ptr %2209, ptr %2208)
  %2211 = load i32, ptr %2208, align 4
  %2212 = icmp eq i32 %2211, 0
  br label %continuation2944

continuation2944:                                 ; preds = %else2946, %then2945
  %2213 = phi i1 [ %2212, %else2946 ], [ true, %then2945 ]
  br i1 %2213, label %then2953, label %else2954

then2953:                                         ; preds = %continuation2944
  br label %continuation2952

else2954:                                         ; preds = %continuation2944
  %2214 = alloca i32, align 4
  %2215 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2216 = call i32 (ptr, ...) @scanf(ptr %2215, ptr %2214)
  %2217 = load i32, ptr %2214, align 4
  %2218 = icmp eq i32 %2217, 0
  br label %continuation2952

continuation2952:                                 ; preds = %else2954, %then2953
  %2219 = phi i1 [ %2218, %else2954 ], [ true, %then2953 ]
  br i1 %2219, label %then2961, label %else2962

then2961:                                         ; preds = %continuation2952
  br label %continuation2960

else2962:                                         ; preds = %continuation2952
  %2220 = alloca i32, align 4
  %2221 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2222 = call i32 (ptr, ...) @scanf(ptr %2221, ptr %2220)
  %2223 = load i32, ptr %2220, align 4
  %2224 = icmp eq i32 %2223, 0
  br label %continuation2960

continuation2960:                                 ; preds = %else2962, %then2961
  %2225 = phi i1 [ %2224, %else2962 ], [ true, %then2961 ]
  br i1 %2225, label %then2969, label %else2970

then2969:                                         ; preds = %continuation2960
  br label %continuation2968

else2970:                                         ; preds = %continuation2960
  %2226 = alloca i32, align 4
  %2227 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2228 = call i32 (ptr, ...) @scanf(ptr %2227, ptr %2226)
  %2229 = load i32, ptr %2226, align 4
  %2230 = icmp eq i32 %2229, 0
  br label %continuation2968

continuation2968:                                 ; preds = %else2970, %then2969
  %2231 = phi i1 [ %2230, %else2970 ], [ true, %then2969 ]
  br i1 %2231, label %then2977, label %else2978

then2977:                                         ; preds = %continuation2968
  br label %continuation2976

else2978:                                         ; preds = %continuation2968
  %2232 = alloca i32, align 4
  %2233 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2234 = call i32 (ptr, ...) @scanf(ptr %2233, ptr %2232)
  %2235 = load i32, ptr %2232, align 4
  %2236 = icmp eq i32 %2235, 0
  br label %continuation2976

continuation2976:                                 ; preds = %else2978, %then2977
  %2237 = phi i1 [ %2236, %else2978 ], [ true, %then2977 ]
  br i1 %2237, label %then2985, label %else2986

then2985:                                         ; preds = %continuation2976
  br label %continuation2984

else2986:                                         ; preds = %continuation2976
  %2238 = alloca i32, align 4
  %2239 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2240 = call i32 (ptr, ...) @scanf(ptr %2239, ptr %2238)
  %2241 = load i32, ptr %2238, align 4
  %2242 = icmp eq i32 %2241, 0
  br label %continuation2984

continuation2984:                                 ; preds = %else2986, %then2985
  %2243 = phi i1 [ %2242, %else2986 ], [ true, %then2985 ]
  br i1 %2243, label %then2993, label %else2994

then2993:                                         ; preds = %continuation2984
  br label %continuation2992

else2994:                                         ; preds = %continuation2984
  %2244 = alloca i32, align 4
  %2245 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2246 = call i32 (ptr, ...) @scanf(ptr %2245, ptr %2244)
  %2247 = load i32, ptr %2244, align 4
  %2248 = icmp eq i32 %2247, 0
  br label %continuation2992

continuation2992:                                 ; preds = %else2994, %then2993
  %2249 = phi i1 [ %2248, %else2994 ], [ true, %then2993 ]
  br i1 %2249, label %then3001, label %else3002

then3001:                                         ; preds = %continuation2992
  br label %continuation3000

else3002:                                         ; preds = %continuation2992
  %2250 = alloca i32, align 4
  %2251 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2252 = call i32 (ptr, ...) @scanf(ptr %2251, ptr %2250)
  %2253 = load i32, ptr %2250, align 4
  %2254 = icmp eq i32 %2253, 0
  br label %continuation3000

continuation3000:                                 ; preds = %else3002, %then3001
  %2255 = phi i1 [ %2254, %else3002 ], [ true, %then3001 ]
  br i1 %2255, label %then3009, label %else3010

then3009:                                         ; preds = %continuation3000
  br label %continuation3008

else3010:                                         ; preds = %continuation3000
  %2256 = alloca i32, align 4
  %2257 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2258 = call i32 (ptr, ...) @scanf(ptr %2257, ptr %2256)
  %2259 = load i32, ptr %2256, align 4
  %2260 = icmp eq i32 %2259, 0
  br label %continuation3008

continuation3008:                                 ; preds = %else3010, %then3009
  %2261 = phi i1 [ %2260, %else3010 ], [ true, %then3009 ]
  br i1 %2261, label %then3017, label %else3018

then3017:                                         ; preds = %continuation3008
  br label %continuation3016

else3018:                                         ; preds = %continuation3008
  %2262 = alloca i32, align 4
  %2263 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2264 = call i32 (ptr, ...) @scanf(ptr %2263, ptr %2262)
  %2265 = load i32, ptr %2262, align 4
  %2266 = icmp eq i32 %2265, 0
  br label %continuation3016

continuation3016:                                 ; preds = %else3018, %then3017
  %2267 = phi i1 [ %2266, %else3018 ], [ true, %then3017 ]
  br i1 %2267, label %then3025, label %else3026

then3025:                                         ; preds = %continuation3016
  br label %continuation3024

else3026:                                         ; preds = %continuation3016
  %2268 = alloca i32, align 4
  %2269 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2270 = call i32 (ptr, ...) @scanf(ptr %2269, ptr %2268)
  %2271 = load i32, ptr %2268, align 4
  %2272 = icmp eq i32 %2271, 0
  br label %continuation3024

continuation3024:                                 ; preds = %else3026, %then3025
  %2273 = phi i1 [ %2272, %else3026 ], [ true, %then3025 ]
  br i1 %2273, label %then3033, label %else3034

then3033:                                         ; preds = %continuation3024
  br label %continuation3032

else3034:                                         ; preds = %continuation3024
  %2274 = alloca i32, align 4
  %2275 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2276 = call i32 (ptr, ...) @scanf(ptr %2275, ptr %2274)
  %2277 = load i32, ptr %2274, align 4
  %2278 = icmp eq i32 %2277, 0
  br label %continuation3032

continuation3032:                                 ; preds = %else3034, %then3033
  %2279 = phi i1 [ %2278, %else3034 ], [ true, %then3033 ]
  br i1 %2279, label %then3041, label %else3042

then3041:                                         ; preds = %continuation3032
  br label %continuation3040

else3042:                                         ; preds = %continuation3032
  %2280 = alloca i32, align 4
  %2281 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2282 = call i32 (ptr, ...) @scanf(ptr %2281, ptr %2280)
  %2283 = load i32, ptr %2280, align 4
  %2284 = icmp eq i32 %2283, 0
  br label %continuation3040

continuation3040:                                 ; preds = %else3042, %then3041
  %2285 = phi i1 [ %2284, %else3042 ], [ true, %then3041 ]
  br i1 %2285, label %then3049, label %else3050

then3049:                                         ; preds = %continuation3040
  br label %continuation3048

else3050:                                         ; preds = %continuation3040
  %2286 = alloca i32, align 4
  %2287 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2288 = call i32 (ptr, ...) @scanf(ptr %2287, ptr %2286)
  %2289 = load i32, ptr %2286, align 4
  %2290 = icmp eq i32 %2289, 0
  br label %continuation3048

continuation3048:                                 ; preds = %else3050, %then3049
  %2291 = phi i1 [ %2290, %else3050 ], [ true, %then3049 ]
  br i1 %2291, label %then3057, label %else3058

then3057:                                         ; preds = %continuation3048
  br label %continuation3056

else3058:                                         ; preds = %continuation3048
  %2292 = alloca i32, align 4
  %2293 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2294 = call i32 (ptr, ...) @scanf(ptr %2293, ptr %2292)
  %2295 = load i32, ptr %2292, align 4
  %2296 = icmp eq i32 %2295, 0
  br label %continuation3056

continuation3056:                                 ; preds = %else3058, %then3057
  %2297 = phi i1 [ %2296, %else3058 ], [ true, %then3057 ]
  br i1 %2297, label %then3065, label %else3066

then3065:                                         ; preds = %continuation3056
  br label %continuation3064

else3066:                                         ; preds = %continuation3056
  %2298 = alloca i32, align 4
  %2299 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2300 = call i32 (ptr, ...) @scanf(ptr %2299, ptr %2298)
  %2301 = load i32, ptr %2298, align 4
  %2302 = icmp eq i32 %2301, 0
  br label %continuation3064

continuation3064:                                 ; preds = %else3066, %then3065
  %2303 = phi i1 [ %2302, %else3066 ], [ true, %then3065 ]
  br i1 %2303, label %then3073, label %else3074

then3073:                                         ; preds = %continuation3064
  br label %continuation3072

else3074:                                         ; preds = %continuation3064
  %2304 = alloca i32, align 4
  %2305 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2306 = call i32 (ptr, ...) @scanf(ptr %2305, ptr %2304)
  %2307 = load i32, ptr %2304, align 4
  %2308 = icmp eq i32 %2307, 0
  br label %continuation3072

continuation3072:                                 ; preds = %else3074, %then3073
  %2309 = phi i1 [ %2308, %else3074 ], [ true, %then3073 ]
  br i1 %2309, label %then3081, label %else3082

then3081:                                         ; preds = %continuation3072
  br label %continuation3080

else3082:                                         ; preds = %continuation3072
  %2310 = alloca i32, align 4
  %2311 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2312 = call i32 (ptr, ...) @scanf(ptr %2311, ptr %2310)
  %2313 = load i32, ptr %2310, align 4
  %2314 = icmp eq i32 %2313, 0
  br label %continuation3080

continuation3080:                                 ; preds = %else3082, %then3081
  %2315 = phi i1 [ %2314, %else3082 ], [ true, %then3081 ]
  br i1 %2315, label %then3089, label %else3090

then3089:                                         ; preds = %continuation3080
  br label %continuation3088

else3090:                                         ; preds = %continuation3080
  %2316 = alloca i32, align 4
  %2317 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2318 = call i32 (ptr, ...) @scanf(ptr %2317, ptr %2316)
  %2319 = load i32, ptr %2316, align 4
  %2320 = icmp eq i32 %2319, 0
  br label %continuation3088

continuation3088:                                 ; preds = %else3090, %then3089
  %2321 = phi i1 [ %2320, %else3090 ], [ true, %then3089 ]
  br i1 %2321, label %then3097, label %else3098

then3097:                                         ; preds = %continuation3088
  br label %continuation3096

else3098:                                         ; preds = %continuation3088
  %2322 = alloca i32, align 4
  %2323 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2324 = call i32 (ptr, ...) @scanf(ptr %2323, ptr %2322)
  %2325 = load i32, ptr %2322, align 4
  %2326 = icmp eq i32 %2325, 0
  br label %continuation3096

continuation3096:                                 ; preds = %else3098, %then3097
  %2327 = phi i1 [ %2326, %else3098 ], [ true, %then3097 ]
  br i1 %2327, label %then3105, label %else3106

then3105:                                         ; preds = %continuation3096
  br label %continuation3104

else3106:                                         ; preds = %continuation3096
  %2328 = alloca i32, align 4
  %2329 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2330 = call i32 (ptr, ...) @scanf(ptr %2329, ptr %2328)
  %2331 = load i32, ptr %2328, align 4
  %2332 = icmp eq i32 %2331, 0
  br label %continuation3104

continuation3104:                                 ; preds = %else3106, %then3105
  %2333 = phi i1 [ %2332, %else3106 ], [ true, %then3105 ]
  br i1 %2333, label %then3113, label %else3114

then3113:                                         ; preds = %continuation3104
  br label %continuation3112

else3114:                                         ; preds = %continuation3104
  %2334 = alloca i32, align 4
  %2335 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2336 = call i32 (ptr, ...) @scanf(ptr %2335, ptr %2334)
  %2337 = load i32, ptr %2334, align 4
  %2338 = icmp eq i32 %2337, 0
  br label %continuation3112

continuation3112:                                 ; preds = %else3114, %then3113
  %2339 = phi i1 [ %2338, %else3114 ], [ true, %then3113 ]
  br i1 %2339, label %then3121, label %else3122

then3121:                                         ; preds = %continuation3112
  br label %continuation3120

else3122:                                         ; preds = %continuation3112
  %2340 = alloca i32, align 4
  %2341 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2342 = call i32 (ptr, ...) @scanf(ptr %2341, ptr %2340)
  %2343 = load i32, ptr %2340, align 4
  %2344 = icmp eq i32 %2343, 0
  br label %continuation3120

continuation3120:                                 ; preds = %else3122, %then3121
  %2345 = phi i1 [ %2344, %else3122 ], [ true, %then3121 ]
  br i1 %2345, label %then3129, label %else3130

then3129:                                         ; preds = %continuation3120
  br label %continuation3128

else3130:                                         ; preds = %continuation3120
  %2346 = alloca i32, align 4
  %2347 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2348 = call i32 (ptr, ...) @scanf(ptr %2347, ptr %2346)
  %2349 = load i32, ptr %2346, align 4
  %2350 = icmp eq i32 %2349, 0
  br label %continuation3128

continuation3128:                                 ; preds = %else3130, %then3129
  %2351 = phi i1 [ %2350, %else3130 ], [ true, %then3129 ]
  br i1 %2351, label %then3137, label %else3138

then3137:                                         ; preds = %continuation3128
  br label %continuation3136

else3138:                                         ; preds = %continuation3128
  %2352 = alloca i32, align 4
  %2353 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2354 = call i32 (ptr, ...) @scanf(ptr %2353, ptr %2352)
  %2355 = load i32, ptr %2352, align 4
  %2356 = icmp eq i32 %2355, 0
  br label %continuation3136

continuation3136:                                 ; preds = %else3138, %then3137
  %2357 = phi i1 [ %2356, %else3138 ], [ true, %then3137 ]
  br i1 %2357, label %then3145, label %else3146

then3145:                                         ; preds = %continuation3136
  br label %continuation3144

else3146:                                         ; preds = %continuation3136
  %2358 = alloca i32, align 4
  %2359 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2360 = call i32 (ptr, ...) @scanf(ptr %2359, ptr %2358)
  %2361 = load i32, ptr %2358, align 4
  %2362 = icmp eq i32 %2361, 0
  br label %continuation3144

continuation3144:                                 ; preds = %else3146, %then3145
  %2363 = phi i1 [ %2362, %else3146 ], [ true, %then3145 ]
  br i1 %2363, label %then3153, label %else3154

then3153:                                         ; preds = %continuation3144
  br label %continuation3152

else3154:                                         ; preds = %continuation3144
  %2364 = alloca i32, align 4
  %2365 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2366 = call i32 (ptr, ...) @scanf(ptr %2365, ptr %2364)
  %2367 = load i32, ptr %2364, align 4
  %2368 = icmp eq i32 %2367, 0
  br label %continuation3152

continuation3152:                                 ; preds = %else3154, %then3153
  %2369 = phi i1 [ %2368, %else3154 ], [ true, %then3153 ]
  br i1 %2369, label %then3161, label %else3162

then3161:                                         ; preds = %continuation3152
  br label %continuation3160

else3162:                                         ; preds = %continuation3152
  %2370 = alloca i32, align 4
  %2371 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2372 = call i32 (ptr, ...) @scanf(ptr %2371, ptr %2370)
  %2373 = load i32, ptr %2370, align 4
  %2374 = icmp eq i32 %2373, 0
  br label %continuation3160

continuation3160:                                 ; preds = %else3162, %then3161
  %2375 = phi i1 [ %2374, %else3162 ], [ true, %then3161 ]
  br i1 %2375, label %then3169, label %else3170

then3169:                                         ; preds = %continuation3160
  br label %continuation3168

else3170:                                         ; preds = %continuation3160
  %2376 = alloca i32, align 4
  %2377 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2378 = call i32 (ptr, ...) @scanf(ptr %2377, ptr %2376)
  %2379 = load i32, ptr %2376, align 4
  %2380 = icmp eq i32 %2379, 0
  br label %continuation3168

continuation3168:                                 ; preds = %else3170, %then3169
  %2381 = phi i1 [ %2380, %else3170 ], [ true, %then3169 ]
  br i1 %2381, label %then3177, label %else3178

then3177:                                         ; preds = %continuation3168
  br label %continuation3176

else3178:                                         ; preds = %continuation3168
  %2382 = alloca i32, align 4
  %2383 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2384 = call i32 (ptr, ...) @scanf(ptr %2383, ptr %2382)
  %2385 = load i32, ptr %2382, align 4
  %2386 = icmp eq i32 %2385, 0
  br label %continuation3176

continuation3176:                                 ; preds = %else3178, %then3177
  %2387 = phi i1 [ %2386, %else3178 ], [ true, %then3177 ]
  br i1 %2387, label %then3185, label %else3186

then3185:                                         ; preds = %continuation3176
  br label %continuation3184

else3186:                                         ; preds = %continuation3176
  %2388 = alloca i32, align 4
  %2389 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2390 = call i32 (ptr, ...) @scanf(ptr %2389, ptr %2388)
  %2391 = load i32, ptr %2388, align 4
  %2392 = icmp eq i32 %2391, 0
  br label %continuation3184

continuation3184:                                 ; preds = %else3186, %then3185
  %2393 = phi i1 [ %2392, %else3186 ], [ true, %then3185 ]
  br i1 %2393, label %then3193, label %else3194

then3193:                                         ; preds = %continuation3184
  br label %continuation3192

else3194:                                         ; preds = %continuation3184
  %2394 = alloca i32, align 4
  %2395 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2396 = call i32 (ptr, ...) @scanf(ptr %2395, ptr %2394)
  %2397 = load i32, ptr %2394, align 4
  %2398 = icmp eq i32 %2397, 0
  br label %continuation3192

continuation3192:                                 ; preds = %else3194, %then3193
  %2399 = phi i1 [ %2398, %else3194 ], [ true, %then3193 ]
  br i1 %2399, label %then3201, label %else3202

then3201:                                         ; preds = %continuation3192
  br label %continuation3200

else3202:                                         ; preds = %continuation3192
  %2400 = alloca i32, align 4
  %2401 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2402 = call i32 (ptr, ...) @scanf(ptr %2401, ptr %2400)
  %2403 = load i32, ptr %2400, align 4
  %2404 = icmp eq i32 %2403, 0
  br label %continuation3200

continuation3200:                                 ; preds = %else3202, %then3201
  %2405 = phi i1 [ %2404, %else3202 ], [ true, %then3201 ]
  br i1 %2405, label %then3209, label %else3210

then3209:                                         ; preds = %continuation3200
  br label %continuation3208

else3210:                                         ; preds = %continuation3200
  %2406 = alloca i32, align 4
  %2407 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2408 = call i32 (ptr, ...) @scanf(ptr %2407, ptr %2406)
  %2409 = load i32, ptr %2406, align 4
  %2410 = icmp eq i32 %2409, 0
  br label %continuation3208

continuation3208:                                 ; preds = %else3210, %then3209
  %2411 = phi i1 [ %2410, %else3210 ], [ true, %then3209 ]
  br i1 %2411, label %then3217, label %else3218

then3217:                                         ; preds = %continuation3208
  br label %continuation3216

else3218:                                         ; preds = %continuation3208
  %2412 = alloca i32, align 4
  %2413 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2414 = call i32 (ptr, ...) @scanf(ptr %2413, ptr %2412)
  %2415 = load i32, ptr %2412, align 4
  %2416 = icmp eq i32 %2415, 0
  br label %continuation3216

continuation3216:                                 ; preds = %else3218, %then3217
  %2417 = phi i1 [ %2416, %else3218 ], [ true, %then3217 ]
  br i1 %2417, label %then3225, label %else3226

then3225:                                         ; preds = %continuation3216
  br label %continuation3224

else3226:                                         ; preds = %continuation3216
  %2418 = alloca i32, align 4
  %2419 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2420 = call i32 (ptr, ...) @scanf(ptr %2419, ptr %2418)
  %2421 = load i32, ptr %2418, align 4
  %2422 = icmp eq i32 %2421, 0
  br label %continuation3224

continuation3224:                                 ; preds = %else3226, %then3225
  %2423 = phi i1 [ %2422, %else3226 ], [ true, %then3225 ]
  br i1 %2423, label %then3233, label %else3234

then3233:                                         ; preds = %continuation3224
  br label %continuation3232

else3234:                                         ; preds = %continuation3224
  %2424 = alloca i32, align 4
  %2425 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2426 = call i32 (ptr, ...) @scanf(ptr %2425, ptr %2424)
  %2427 = load i32, ptr %2424, align 4
  %2428 = icmp eq i32 %2427, 0
  br label %continuation3232

continuation3232:                                 ; preds = %else3234, %then3233
  %2429 = phi i1 [ %2428, %else3234 ], [ true, %then3233 ]
  br i1 %2429, label %then3241, label %else3242

then3241:                                         ; preds = %continuation3232
  br label %continuation3240

else3242:                                         ; preds = %continuation3232
  %2430 = alloca i32, align 4
  %2431 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2432 = call i32 (ptr, ...) @scanf(ptr %2431, ptr %2430)
  %2433 = load i32, ptr %2430, align 4
  %2434 = icmp eq i32 %2433, 0
  br label %continuation3240

continuation3240:                                 ; preds = %else3242, %then3241
  %2435 = phi i1 [ %2434, %else3242 ], [ true, %then3241 ]
  br i1 %2435, label %then3249, label %else3250

then3249:                                         ; preds = %continuation3240
  br label %continuation3248

else3250:                                         ; preds = %continuation3240
  %2436 = alloca i32, align 4
  %2437 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2438 = call i32 (ptr, ...) @scanf(ptr %2437, ptr %2436)
  %2439 = load i32, ptr %2436, align 4
  %2440 = icmp eq i32 %2439, 0
  br label %continuation3248

continuation3248:                                 ; preds = %else3250, %then3249
  %2441 = phi i1 [ %2440, %else3250 ], [ true, %then3249 ]
  br i1 %2441, label %then3257, label %else3258

then3257:                                         ; preds = %continuation3248
  br label %continuation3256

else3258:                                         ; preds = %continuation3248
  %2442 = alloca i32, align 4
  %2443 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2444 = call i32 (ptr, ...) @scanf(ptr %2443, ptr %2442)
  %2445 = load i32, ptr %2442, align 4
  %2446 = icmp eq i32 %2445, 0
  br label %continuation3256

continuation3256:                                 ; preds = %else3258, %then3257
  %2447 = phi i1 [ %2446, %else3258 ], [ true, %then3257 ]
  br i1 %2447, label %then3265, label %else3266

then3265:                                         ; preds = %continuation3256
  br label %continuation3264

else3266:                                         ; preds = %continuation3256
  %2448 = alloca i32, align 4
  %2449 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2450 = call i32 (ptr, ...) @scanf(ptr %2449, ptr %2448)
  %2451 = load i32, ptr %2448, align 4
  %2452 = icmp eq i32 %2451, 0
  br label %continuation3264

continuation3264:                                 ; preds = %else3266, %then3265
  %2453 = phi i1 [ %2452, %else3266 ], [ true, %then3265 ]
  br i1 %2453, label %then3273, label %else3274

then3273:                                         ; preds = %continuation3264
  br label %continuation3272

else3274:                                         ; preds = %continuation3264
  %2454 = alloca i32, align 4
  %2455 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2456 = call i32 (ptr, ...) @scanf(ptr %2455, ptr %2454)
  %2457 = load i32, ptr %2454, align 4
  %2458 = icmp eq i32 %2457, 0
  br label %continuation3272

continuation3272:                                 ; preds = %else3274, %then3273
  %2459 = phi i1 [ %2458, %else3274 ], [ true, %then3273 ]
  br i1 %2459, label %then3281, label %else3282

then3281:                                         ; preds = %continuation3272
  br label %continuation3280

else3282:                                         ; preds = %continuation3272
  %2460 = alloca i32, align 4
  %2461 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2462 = call i32 (ptr, ...) @scanf(ptr %2461, ptr %2460)
  %2463 = load i32, ptr %2460, align 4
  %2464 = icmp eq i32 %2463, 0
  br label %continuation3280

continuation3280:                                 ; preds = %else3282, %then3281
  %2465 = phi i1 [ %2464, %else3282 ], [ true, %then3281 ]
  br i1 %2465, label %then3289, label %else3290

then3289:                                         ; preds = %continuation3280
  br label %continuation3288

else3290:                                         ; preds = %continuation3280
  %2466 = alloca i32, align 4
  %2467 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2468 = call i32 (ptr, ...) @scanf(ptr %2467, ptr %2466)
  %2469 = load i32, ptr %2466, align 4
  %2470 = icmp eq i32 %2469, 0
  br label %continuation3288

continuation3288:                                 ; preds = %else3290, %then3289
  %2471 = phi i1 [ %2470, %else3290 ], [ true, %then3289 ]
  br i1 %2471, label %then3297, label %else3298

then3297:                                         ; preds = %continuation3288
  br label %continuation3296

else3298:                                         ; preds = %continuation3288
  %2472 = alloca i32, align 4
  %2473 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2474 = call i32 (ptr, ...) @scanf(ptr %2473, ptr %2472)
  %2475 = load i32, ptr %2472, align 4
  %2476 = icmp eq i32 %2475, 0
  br label %continuation3296

continuation3296:                                 ; preds = %else3298, %then3297
  %2477 = phi i1 [ %2476, %else3298 ], [ true, %then3297 ]
  br i1 %2477, label %then3305, label %else3306

then3305:                                         ; preds = %continuation3296
  br label %continuation3304

else3306:                                         ; preds = %continuation3296
  %2478 = alloca i32, align 4
  %2479 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2480 = call i32 (ptr, ...) @scanf(ptr %2479, ptr %2478)
  %2481 = load i32, ptr %2478, align 4
  %2482 = icmp eq i32 %2481, 0
  br label %continuation3304

continuation3304:                                 ; preds = %else3306, %then3305
  %2483 = phi i1 [ %2482, %else3306 ], [ true, %then3305 ]
  br i1 %2483, label %then3313, label %else3314

then3313:                                         ; preds = %continuation3304
  br label %continuation3312

else3314:                                         ; preds = %continuation3304
  %2484 = alloca i32, align 4
  %2485 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2486 = call i32 (ptr, ...) @scanf(ptr %2485, ptr %2484)
  %2487 = load i32, ptr %2484, align 4
  %2488 = icmp eq i32 %2487, 0
  br label %continuation3312

continuation3312:                                 ; preds = %else3314, %then3313
  %2489 = phi i1 [ %2488, %else3314 ], [ true, %then3313 ]
  br i1 %2489, label %then3321, label %else3322

then3321:                                         ; preds = %continuation3312
  br label %continuation3320

else3322:                                         ; preds = %continuation3312
  %2490 = alloca i32, align 4
  %2491 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2492 = call i32 (ptr, ...) @scanf(ptr %2491, ptr %2490)
  %2493 = load i32, ptr %2490, align 4
  %2494 = icmp eq i32 %2493, 0
  br label %continuation3320

continuation3320:                                 ; preds = %else3322, %then3321
  %2495 = phi i1 [ %2494, %else3322 ], [ true, %then3321 ]
  br i1 %2495, label %then3329, label %else3330

then3329:                                         ; preds = %continuation3320
  br label %continuation3328

else3330:                                         ; preds = %continuation3320
  %2496 = alloca i32, align 4
  %2497 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2498 = call i32 (ptr, ...) @scanf(ptr %2497, ptr %2496)
  %2499 = load i32, ptr %2496, align 4
  %2500 = icmp eq i32 %2499, 0
  br label %continuation3328

continuation3328:                                 ; preds = %else3330, %then3329
  %2501 = phi i1 [ %2500, %else3330 ], [ true, %then3329 ]
  br i1 %2501, label %then3337, label %else3338

then3337:                                         ; preds = %continuation3328
  br label %continuation3336

else3338:                                         ; preds = %continuation3328
  %2502 = alloca i32, align 4
  %2503 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2504 = call i32 (ptr, ...) @scanf(ptr %2503, ptr %2502)
  %2505 = load i32, ptr %2502, align 4
  %2506 = icmp eq i32 %2505, 0
  br label %continuation3336

continuation3336:                                 ; preds = %else3338, %then3337
  %2507 = phi i1 [ %2506, %else3338 ], [ true, %then3337 ]
  br i1 %2507, label %then3345, label %else3346

then3345:                                         ; preds = %continuation3336
  br label %continuation3344

else3346:                                         ; preds = %continuation3336
  %2508 = alloca i32, align 4
  %2509 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2510 = call i32 (ptr, ...) @scanf(ptr %2509, ptr %2508)
  %2511 = load i32, ptr %2508, align 4
  %2512 = icmp eq i32 %2511, 0
  br label %continuation3344

continuation3344:                                 ; preds = %else3346, %then3345
  %2513 = phi i1 [ %2512, %else3346 ], [ true, %then3345 ]
  br i1 %2513, label %then3353, label %else3354

then3353:                                         ; preds = %continuation3344
  br label %continuation3352

else3354:                                         ; preds = %continuation3344
  %2514 = alloca i32, align 4
  %2515 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2516 = call i32 (ptr, ...) @scanf(ptr %2515, ptr %2514)
  %2517 = load i32, ptr %2514, align 4
  %2518 = icmp eq i32 %2517, 0
  br label %continuation3352

continuation3352:                                 ; preds = %else3354, %then3353
  %2519 = phi i1 [ %2518, %else3354 ], [ true, %then3353 ]
  br i1 %2519, label %then3361, label %else3362

then3361:                                         ; preds = %continuation3352
  br label %continuation3360

else3362:                                         ; preds = %continuation3352
  %2520 = alloca i32, align 4
  %2521 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2522 = call i32 (ptr, ...) @scanf(ptr %2521, ptr %2520)
  %2523 = load i32, ptr %2520, align 4
  %2524 = icmp eq i32 %2523, 0
  br label %continuation3360

continuation3360:                                 ; preds = %else3362, %then3361
  %2525 = phi i1 [ %2524, %else3362 ], [ true, %then3361 ]
  br i1 %2525, label %then3369, label %else3370

then3369:                                         ; preds = %continuation3360
  br label %continuation3368

else3370:                                         ; preds = %continuation3360
  %2526 = alloca i32, align 4
  %2527 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2528 = call i32 (ptr, ...) @scanf(ptr %2527, ptr %2526)
  %2529 = load i32, ptr %2526, align 4
  %2530 = icmp eq i32 %2529, 0
  br label %continuation3368

continuation3368:                                 ; preds = %else3370, %then3369
  %2531 = phi i1 [ %2530, %else3370 ], [ true, %then3369 ]
  br i1 %2531, label %then3377, label %else3378

then3377:                                         ; preds = %continuation3368
  br label %continuation3376

else3378:                                         ; preds = %continuation3368
  %2532 = alloca i32, align 4
  %2533 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2534 = call i32 (ptr, ...) @scanf(ptr %2533, ptr %2532)
  %2535 = load i32, ptr %2532, align 4
  %2536 = icmp eq i32 %2535, 0
  br label %continuation3376

continuation3376:                                 ; preds = %else3378, %then3377
  %2537 = phi i1 [ %2536, %else3378 ], [ true, %then3377 ]
  br i1 %2537, label %then3385, label %else3386

then3385:                                         ; preds = %continuation3376
  br label %continuation3384

else3386:                                         ; preds = %continuation3376
  %2538 = alloca i32, align 4
  %2539 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2540 = call i32 (ptr, ...) @scanf(ptr %2539, ptr %2538)
  %2541 = load i32, ptr %2538, align 4
  %2542 = icmp eq i32 %2541, 0
  br label %continuation3384

continuation3384:                                 ; preds = %else3386, %then3385
  %2543 = phi i1 [ %2542, %else3386 ], [ true, %then3385 ]
  br i1 %2543, label %then3393, label %else3394

then3393:                                         ; preds = %continuation3384
  br label %continuation3392

else3394:                                         ; preds = %continuation3384
  %2544 = alloca i32, align 4
  %2545 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2546 = call i32 (ptr, ...) @scanf(ptr %2545, ptr %2544)
  %2547 = load i32, ptr %2544, align 4
  %2548 = icmp eq i32 %2547, 0
  br label %continuation3392

continuation3392:                                 ; preds = %else3394, %then3393
  %2549 = phi i1 [ %2548, %else3394 ], [ true, %then3393 ]
  br i1 %2549, label %then3401, label %else3402

then3401:                                         ; preds = %continuation3392
  br label %continuation3400

else3402:                                         ; preds = %continuation3392
  %2550 = alloca i32, align 4
  %2551 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2552 = call i32 (ptr, ...) @scanf(ptr %2551, ptr %2550)
  %2553 = load i32, ptr %2550, align 4
  %2554 = icmp eq i32 %2553, 0
  br label %continuation3400

continuation3400:                                 ; preds = %else3402, %then3401
  %2555 = phi i1 [ %2554, %else3402 ], [ true, %then3401 ]
  br i1 %2555, label %then3409, label %else3410

then3409:                                         ; preds = %continuation3400
  br label %continuation3408

else3410:                                         ; preds = %continuation3400
  %2556 = alloca i32, align 4
  %2557 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2558 = call i32 (ptr, ...) @scanf(ptr %2557, ptr %2556)
  %2559 = load i32, ptr %2556, align 4
  %2560 = icmp eq i32 %2559, 0
  br label %continuation3408

continuation3408:                                 ; preds = %else3410, %then3409
  %2561 = phi i1 [ %2560, %else3410 ], [ true, %then3409 ]
  br i1 %2561, label %then3417, label %else3418

then3417:                                         ; preds = %continuation3408
  br label %continuation3416

else3418:                                         ; preds = %continuation3408
  %2562 = alloca i32, align 4
  %2563 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2564 = call i32 (ptr, ...) @scanf(ptr %2563, ptr %2562)
  %2565 = load i32, ptr %2562, align 4
  %2566 = icmp eq i32 %2565, 0
  br label %continuation3416

continuation3416:                                 ; preds = %else3418, %then3417
  %2567 = phi i1 [ %2566, %else3418 ], [ true, %then3417 ]
  br i1 %2567, label %then3425, label %else3426

then3425:                                         ; preds = %continuation3416
  br label %continuation3424

else3426:                                         ; preds = %continuation3416
  %2568 = alloca i32, align 4
  %2569 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2570 = call i32 (ptr, ...) @scanf(ptr %2569, ptr %2568)
  %2571 = load i32, ptr %2568, align 4
  %2572 = icmp eq i32 %2571, 0
  br label %continuation3424

continuation3424:                                 ; preds = %else3426, %then3425
  %2573 = phi i1 [ %2572, %else3426 ], [ true, %then3425 ]
  br i1 %2573, label %then3433, label %else3434

then3433:                                         ; preds = %continuation3424
  br label %continuation3432

else3434:                                         ; preds = %continuation3424
  %2574 = alloca i32, align 4
  %2575 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2576 = call i32 (ptr, ...) @scanf(ptr %2575, ptr %2574)
  %2577 = load i32, ptr %2574, align 4
  %2578 = icmp eq i32 %2577, 0
  br label %continuation3432

continuation3432:                                 ; preds = %else3434, %then3433
  %2579 = phi i1 [ %2578, %else3434 ], [ true, %then3433 ]
  br i1 %2579, label %then3441, label %else3442

then3441:                                         ; preds = %continuation3432
  br label %continuation3440

else3442:                                         ; preds = %continuation3432
  %2580 = alloca i32, align 4
  %2581 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2582 = call i32 (ptr, ...) @scanf(ptr %2581, ptr %2580)
  %2583 = load i32, ptr %2580, align 4
  %2584 = icmp eq i32 %2583, 0
  br label %continuation3440

continuation3440:                                 ; preds = %else3442, %then3441
  %2585 = phi i1 [ %2584, %else3442 ], [ true, %then3441 ]
  br i1 %2585, label %then3449, label %else3450

then3449:                                         ; preds = %continuation3440
  br label %continuation3448

else3450:                                         ; preds = %continuation3440
  %2586 = alloca i32, align 4
  %2587 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2588 = call i32 (ptr, ...) @scanf(ptr %2587, ptr %2586)
  %2589 = load i32, ptr %2586, align 4
  %2590 = icmp eq i32 %2589, 0
  br label %continuation3448

continuation3448:                                 ; preds = %else3450, %then3449
  %2591 = phi i1 [ %2590, %else3450 ], [ true, %then3449 ]
  br i1 %2591, label %then3457, label %else3458

then3457:                                         ; preds = %continuation3448
  br label %continuation3456

else3458:                                         ; preds = %continuation3448
  %2592 = alloca i32, align 4
  %2593 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2594 = call i32 (ptr, ...) @scanf(ptr %2593, ptr %2592)
  %2595 = load i32, ptr %2592, align 4
  %2596 = icmp eq i32 %2595, 0
  br label %continuation3456

continuation3456:                                 ; preds = %else3458, %then3457
  %2597 = phi i1 [ %2596, %else3458 ], [ true, %then3457 ]
  br i1 %2597, label %then3465, label %else3466

then3465:                                         ; preds = %continuation3456
  br label %continuation3464

else3466:                                         ; preds = %continuation3456
  %2598 = alloca i32, align 4
  %2599 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2600 = call i32 (ptr, ...) @scanf(ptr %2599, ptr %2598)
  %2601 = load i32, ptr %2598, align 4
  %2602 = icmp eq i32 %2601, 0
  br label %continuation3464

continuation3464:                                 ; preds = %else3466, %then3465
  %2603 = phi i1 [ %2602, %else3466 ], [ true, %then3465 ]
  br i1 %2603, label %then3473, label %else3474

then3473:                                         ; preds = %continuation3464
  br label %continuation3472

else3474:                                         ; preds = %continuation3464
  %2604 = alloca i32, align 4
  %2605 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2606 = call i32 (ptr, ...) @scanf(ptr %2605, ptr %2604)
  %2607 = load i32, ptr %2604, align 4
  %2608 = icmp eq i32 %2607, 0
  br label %continuation3472

continuation3472:                                 ; preds = %else3474, %then3473
  %2609 = phi i1 [ %2608, %else3474 ], [ true, %then3473 ]
  br i1 %2609, label %then3481, label %else3482

then3481:                                         ; preds = %continuation3472
  br label %continuation3480

else3482:                                         ; preds = %continuation3472
  %2610 = alloca i32, align 4
  %2611 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2612 = call i32 (ptr, ...) @scanf(ptr %2611, ptr %2610)
  %2613 = load i32, ptr %2610, align 4
  %2614 = icmp eq i32 %2613, 0
  br label %continuation3480

continuation3480:                                 ; preds = %else3482, %then3481
  %2615 = phi i1 [ %2614, %else3482 ], [ true, %then3481 ]
  br i1 %2615, label %then3489, label %else3490

then3489:                                         ; preds = %continuation3480
  br label %continuation3488

else3490:                                         ; preds = %continuation3480
  %2616 = alloca i32, align 4
  %2617 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2618 = call i32 (ptr, ...) @scanf(ptr %2617, ptr %2616)
  %2619 = load i32, ptr %2616, align 4
  %2620 = icmp eq i32 %2619, 0
  br label %continuation3488

continuation3488:                                 ; preds = %else3490, %then3489
  %2621 = phi i1 [ %2620, %else3490 ], [ true, %then3489 ]
  br i1 %2621, label %then3497, label %else3498

then3497:                                         ; preds = %continuation3488
  br label %continuation3496

else3498:                                         ; preds = %continuation3488
  %2622 = alloca i32, align 4
  %2623 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2624 = call i32 (ptr, ...) @scanf(ptr %2623, ptr %2622)
  %2625 = load i32, ptr %2622, align 4
  %2626 = icmp eq i32 %2625, 0
  br label %continuation3496

continuation3496:                                 ; preds = %else3498, %then3497
  %2627 = phi i1 [ %2626, %else3498 ], [ true, %then3497 ]
  br i1 %2627, label %then3505, label %else3506

then3505:                                         ; preds = %continuation3496
  br label %continuation3504

else3506:                                         ; preds = %continuation3496
  %2628 = alloca i32, align 4
  %2629 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2630 = call i32 (ptr, ...) @scanf(ptr %2629, ptr %2628)
  %2631 = load i32, ptr %2628, align 4
  %2632 = icmp eq i32 %2631, 0
  br label %continuation3504

continuation3504:                                 ; preds = %else3506, %then3505
  %2633 = phi i1 [ %2632, %else3506 ], [ true, %then3505 ]
  br i1 %2633, label %then3513, label %else3514

then3513:                                         ; preds = %continuation3504
  br label %continuation3512

else3514:                                         ; preds = %continuation3504
  %2634 = alloca i32, align 4
  %2635 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2636 = call i32 (ptr, ...) @scanf(ptr %2635, ptr %2634)
  %2637 = load i32, ptr %2634, align 4
  %2638 = icmp eq i32 %2637, 0
  br label %continuation3512

continuation3512:                                 ; preds = %else3514, %then3513
  %2639 = phi i1 [ %2638, %else3514 ], [ true, %then3513 ]
  br i1 %2639, label %then3521, label %else3522

then3521:                                         ; preds = %continuation3512
  br label %continuation3520

else3522:                                         ; preds = %continuation3512
  %2640 = alloca i32, align 4
  %2641 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2642 = call i32 (ptr, ...) @scanf(ptr %2641, ptr %2640)
  %2643 = load i32, ptr %2640, align 4
  %2644 = icmp eq i32 %2643, 0
  br label %continuation3520

continuation3520:                                 ; preds = %else3522, %then3521
  %2645 = phi i1 [ %2644, %else3522 ], [ true, %then3521 ]
  br i1 %2645, label %then3529, label %else3530

then3529:                                         ; preds = %continuation3520
  br label %continuation3528

else3530:                                         ; preds = %continuation3520
  %2646 = alloca i32, align 4
  %2647 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2648 = call i32 (ptr, ...) @scanf(ptr %2647, ptr %2646)
  %2649 = load i32, ptr %2646, align 4
  %2650 = icmp eq i32 %2649, 0
  br label %continuation3528

continuation3528:                                 ; preds = %else3530, %then3529
  %2651 = phi i1 [ %2650, %else3530 ], [ true, %then3529 ]
  br i1 %2651, label %then3537, label %else3538

then3537:                                         ; preds = %continuation3528
  br label %continuation3536

else3538:                                         ; preds = %continuation3528
  %2652 = alloca i32, align 4
  %2653 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2654 = call i32 (ptr, ...) @scanf(ptr %2653, ptr %2652)
  %2655 = load i32, ptr %2652, align 4
  %2656 = icmp eq i32 %2655, 0
  br label %continuation3536

continuation3536:                                 ; preds = %else3538, %then3537
  %2657 = phi i1 [ %2656, %else3538 ], [ true, %then3537 ]
  br i1 %2657, label %then3545, label %else3546

then3545:                                         ; preds = %continuation3536
  br label %continuation3544

else3546:                                         ; preds = %continuation3536
  %2658 = alloca i32, align 4
  %2659 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2660 = call i32 (ptr, ...) @scanf(ptr %2659, ptr %2658)
  %2661 = load i32, ptr %2658, align 4
  %2662 = icmp eq i32 %2661, 0
  br label %continuation3544

continuation3544:                                 ; preds = %else3546, %then3545
  %2663 = phi i1 [ %2662, %else3546 ], [ true, %then3545 ]
  br i1 %2663, label %then3553, label %else3554

then3553:                                         ; preds = %continuation3544
  br label %continuation3552

else3554:                                         ; preds = %continuation3544
  %2664 = alloca i32, align 4
  %2665 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2666 = call i32 (ptr, ...) @scanf(ptr %2665, ptr %2664)
  %2667 = load i32, ptr %2664, align 4
  %2668 = icmp eq i32 %2667, 0
  br label %continuation3552

continuation3552:                                 ; preds = %else3554, %then3553
  %2669 = phi i1 [ %2668, %else3554 ], [ true, %then3553 ]
  br i1 %2669, label %then3561, label %else3562

then3561:                                         ; preds = %continuation3552
  br label %continuation3560

else3562:                                         ; preds = %continuation3552
  %2670 = alloca i32, align 4
  %2671 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2672 = call i32 (ptr, ...) @scanf(ptr %2671, ptr %2670)
  %2673 = load i32, ptr %2670, align 4
  %2674 = icmp eq i32 %2673, 0
  br label %continuation3560

continuation3560:                                 ; preds = %else3562, %then3561
  %2675 = phi i1 [ %2674, %else3562 ], [ true, %then3561 ]
  br i1 %2675, label %then3569, label %else3570

then3569:                                         ; preds = %continuation3560
  br label %continuation3568

else3570:                                         ; preds = %continuation3560
  %2676 = alloca i32, align 4
  %2677 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2678 = call i32 (ptr, ...) @scanf(ptr %2677, ptr %2676)
  %2679 = load i32, ptr %2676, align 4
  %2680 = icmp eq i32 %2679, 0
  br label %continuation3568

continuation3568:                                 ; preds = %else3570, %then3569
  %2681 = phi i1 [ %2680, %else3570 ], [ true, %then3569 ]
  br i1 %2681, label %then3577, label %else3578

then3577:                                         ; preds = %continuation3568
  br label %continuation3576

else3578:                                         ; preds = %continuation3568
  %2682 = alloca i32, align 4
  %2683 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2684 = call i32 (ptr, ...) @scanf(ptr %2683, ptr %2682)
  %2685 = load i32, ptr %2682, align 4
  %2686 = icmp eq i32 %2685, 0
  br label %continuation3576

continuation3576:                                 ; preds = %else3578, %then3577
  %2687 = phi i1 [ %2686, %else3578 ], [ true, %then3577 ]
  br i1 %2687, label %then3585, label %else3586

then3585:                                         ; preds = %continuation3576
  br label %continuation3584

else3586:                                         ; preds = %continuation3576
  %2688 = alloca i32, align 4
  %2689 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2690 = call i32 (ptr, ...) @scanf(ptr %2689, ptr %2688)
  %2691 = load i32, ptr %2688, align 4
  %2692 = icmp eq i32 %2691, 0
  br label %continuation3584

continuation3584:                                 ; preds = %else3586, %then3585
  %2693 = phi i1 [ %2692, %else3586 ], [ true, %then3585 ]
  br i1 %2693, label %then3593, label %else3594

then3593:                                         ; preds = %continuation3584
  br label %continuation3592

else3594:                                         ; preds = %continuation3584
  %2694 = alloca i32, align 4
  %2695 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2696 = call i32 (ptr, ...) @scanf(ptr %2695, ptr %2694)
  %2697 = load i32, ptr %2694, align 4
  %2698 = icmp eq i32 %2697, 0
  br label %continuation3592

continuation3592:                                 ; preds = %else3594, %then3593
  %2699 = phi i1 [ %2698, %else3594 ], [ true, %then3593 ]
  br i1 %2699, label %then3601, label %else3602

then3601:                                         ; preds = %continuation3592
  br label %continuation3600

else3602:                                         ; preds = %continuation3592
  %2700 = alloca i32, align 4
  %2701 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2702 = call i32 (ptr, ...) @scanf(ptr %2701, ptr %2700)
  %2703 = load i32, ptr %2700, align 4
  %2704 = icmp eq i32 %2703, 0
  br label %continuation3600

continuation3600:                                 ; preds = %else3602, %then3601
  %2705 = phi i1 [ %2704, %else3602 ], [ true, %then3601 ]
  br i1 %2705, label %then3609, label %else3610

then3609:                                         ; preds = %continuation3600
  br label %continuation3608

else3610:                                         ; preds = %continuation3600
  %2706 = alloca i32, align 4
  %2707 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2708 = call i32 (ptr, ...) @scanf(ptr %2707, ptr %2706)
  %2709 = load i32, ptr %2706, align 4
  %2710 = icmp eq i32 %2709, 0
  br label %continuation3608

continuation3608:                                 ; preds = %else3610, %then3609
  %2711 = phi i1 [ %2710, %else3610 ], [ true, %then3609 ]
  br i1 %2711, label %then3617, label %else3618

then3617:                                         ; preds = %continuation3608
  br label %continuation3616

else3618:                                         ; preds = %continuation3608
  %2712 = alloca i32, align 4
  %2713 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2714 = call i32 (ptr, ...) @scanf(ptr %2713, ptr %2712)
  %2715 = load i32, ptr %2712, align 4
  %2716 = icmp eq i32 %2715, 0
  br label %continuation3616

continuation3616:                                 ; preds = %else3618, %then3617
  %2717 = phi i1 [ %2716, %else3618 ], [ true, %then3617 ]
  br i1 %2717, label %then3625, label %else3626

then3625:                                         ; preds = %continuation3616
  br label %continuation3624

else3626:                                         ; preds = %continuation3616
  %2718 = alloca i32, align 4
  %2719 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2720 = call i32 (ptr, ...) @scanf(ptr %2719, ptr %2718)
  %2721 = load i32, ptr %2718, align 4
  %2722 = icmp eq i32 %2721, 0
  br label %continuation3624

continuation3624:                                 ; preds = %else3626, %then3625
  %2723 = phi i1 [ %2722, %else3626 ], [ true, %then3625 ]
  br i1 %2723, label %then3633, label %else3634

then3633:                                         ; preds = %continuation3624
  br label %continuation3632

else3634:                                         ; preds = %continuation3624
  %2724 = alloca i32, align 4
  %2725 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2726 = call i32 (ptr, ...) @scanf(ptr %2725, ptr %2724)
  %2727 = load i32, ptr %2724, align 4
  %2728 = icmp eq i32 %2727, 0
  br label %continuation3632

continuation3632:                                 ; preds = %else3634, %then3633
  %2729 = phi i1 [ %2728, %else3634 ], [ true, %then3633 ]
  br i1 %2729, label %then3641, label %else3642

then3641:                                         ; preds = %continuation3632
  br label %continuation3640

else3642:                                         ; preds = %continuation3632
  %2730 = alloca i32, align 4
  %2731 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2732 = call i32 (ptr, ...) @scanf(ptr %2731, ptr %2730)
  %2733 = load i32, ptr %2730, align 4
  %2734 = icmp eq i32 %2733, 0
  br label %continuation3640

continuation3640:                                 ; preds = %else3642, %then3641
  %2735 = phi i1 [ %2734, %else3642 ], [ true, %then3641 ]
  br i1 %2735, label %then3649, label %else3650

then3649:                                         ; preds = %continuation3640
  br label %continuation3648

else3650:                                         ; preds = %continuation3640
  %2736 = alloca i32, align 4
  %2737 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2738 = call i32 (ptr, ...) @scanf(ptr %2737, ptr %2736)
  %2739 = load i32, ptr %2736, align 4
  %2740 = icmp eq i32 %2739, 0
  br label %continuation3648

continuation3648:                                 ; preds = %else3650, %then3649
  %2741 = phi i1 [ %2740, %else3650 ], [ true, %then3649 ]
  br i1 %2741, label %then3657, label %else3658

then3657:                                         ; preds = %continuation3648
  br label %continuation3656

else3658:                                         ; preds = %continuation3648
  %2742 = alloca i32, align 4
  %2743 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2744 = call i32 (ptr, ...) @scanf(ptr %2743, ptr %2742)
  %2745 = load i32, ptr %2742, align 4
  %2746 = icmp eq i32 %2745, 0
  br label %continuation3656

continuation3656:                                 ; preds = %else3658, %then3657
  %2747 = phi i1 [ %2746, %else3658 ], [ true, %then3657 ]
  br i1 %2747, label %then3665, label %else3666

then3665:                                         ; preds = %continuation3656
  br label %continuation3664

else3666:                                         ; preds = %continuation3656
  %2748 = alloca i32, align 4
  %2749 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2750 = call i32 (ptr, ...) @scanf(ptr %2749, ptr %2748)
  %2751 = load i32, ptr %2748, align 4
  %2752 = icmp eq i32 %2751, 0
  br label %continuation3664

continuation3664:                                 ; preds = %else3666, %then3665
  %2753 = phi i1 [ %2752, %else3666 ], [ true, %then3665 ]
  br i1 %2753, label %then3673, label %else3674

then3673:                                         ; preds = %continuation3664
  br label %continuation3672

else3674:                                         ; preds = %continuation3664
  %2754 = alloca i32, align 4
  %2755 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2756 = call i32 (ptr, ...) @scanf(ptr %2755, ptr %2754)
  %2757 = load i32, ptr %2754, align 4
  %2758 = icmp eq i32 %2757, 0
  br label %continuation3672

continuation3672:                                 ; preds = %else3674, %then3673
  %2759 = phi i1 [ %2758, %else3674 ], [ true, %then3673 ]
  br i1 %2759, label %then3681, label %else3682

then3681:                                         ; preds = %continuation3672
  br label %continuation3680

else3682:                                         ; preds = %continuation3672
  %2760 = alloca i32, align 4
  %2761 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2762 = call i32 (ptr, ...) @scanf(ptr %2761, ptr %2760)
  %2763 = load i32, ptr %2760, align 4
  %2764 = icmp eq i32 %2763, 0
  br label %continuation3680

continuation3680:                                 ; preds = %else3682, %then3681
  %2765 = phi i1 [ %2764, %else3682 ], [ true, %then3681 ]
  br i1 %2765, label %then3689, label %else3690

then3689:                                         ; preds = %continuation3680
  br label %continuation3688

else3690:                                         ; preds = %continuation3680
  %2766 = alloca i32, align 4
  %2767 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2768 = call i32 (ptr, ...) @scanf(ptr %2767, ptr %2766)
  %2769 = load i32, ptr %2766, align 4
  %2770 = icmp eq i32 %2769, 0
  br label %continuation3688

continuation3688:                                 ; preds = %else3690, %then3689
  %2771 = phi i1 [ %2770, %else3690 ], [ true, %then3689 ]
  br i1 %2771, label %then3697, label %else3698

then3697:                                         ; preds = %continuation3688
  br label %continuation3696

else3698:                                         ; preds = %continuation3688
  %2772 = alloca i32, align 4
  %2773 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2774 = call i32 (ptr, ...) @scanf(ptr %2773, ptr %2772)
  %2775 = load i32, ptr %2772, align 4
  %2776 = icmp eq i32 %2775, 0
  br label %continuation3696

continuation3696:                                 ; preds = %else3698, %then3697
  %2777 = phi i1 [ %2776, %else3698 ], [ true, %then3697 ]
  br i1 %2777, label %then3705, label %else3706

then3705:                                         ; preds = %continuation3696
  br label %continuation3704

else3706:                                         ; preds = %continuation3696
  %2778 = alloca i32, align 4
  %2779 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2780 = call i32 (ptr, ...) @scanf(ptr %2779, ptr %2778)
  %2781 = load i32, ptr %2778, align 4
  %2782 = icmp eq i32 %2781, 0
  br label %continuation3704

continuation3704:                                 ; preds = %else3706, %then3705
  %2783 = phi i1 [ %2782, %else3706 ], [ true, %then3705 ]
  br i1 %2783, label %then3713, label %else3714

then3713:                                         ; preds = %continuation3704
  br label %continuation3712

else3714:                                         ; preds = %continuation3704
  %2784 = alloca i32, align 4
  %2785 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2786 = call i32 (ptr, ...) @scanf(ptr %2785, ptr %2784)
  %2787 = load i32, ptr %2784, align 4
  %2788 = icmp eq i32 %2787, 0
  br label %continuation3712

continuation3712:                                 ; preds = %else3714, %then3713
  %2789 = phi i1 [ %2788, %else3714 ], [ true, %then3713 ]
  br i1 %2789, label %then3721, label %else3722

then3721:                                         ; preds = %continuation3712
  br label %continuation3720

else3722:                                         ; preds = %continuation3712
  %2790 = alloca i32, align 4
  %2791 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2792 = call i32 (ptr, ...) @scanf(ptr %2791, ptr %2790)
  %2793 = load i32, ptr %2790, align 4
  %2794 = icmp eq i32 %2793, 0
  br label %continuation3720

continuation3720:                                 ; preds = %else3722, %then3721
  %2795 = phi i1 [ %2794, %else3722 ], [ true, %then3721 ]
  br i1 %2795, label %then3729, label %else3730

then3729:                                         ; preds = %continuation3720
  br label %continuation3728

else3730:                                         ; preds = %continuation3720
  %2796 = alloca i32, align 4
  %2797 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2798 = call i32 (ptr, ...) @scanf(ptr %2797, ptr %2796)
  %2799 = load i32, ptr %2796, align 4
  %2800 = icmp eq i32 %2799, 0
  br label %continuation3728

continuation3728:                                 ; preds = %else3730, %then3729
  %2801 = phi i1 [ %2800, %else3730 ], [ true, %then3729 ]
  br i1 %2801, label %then3737, label %else3738

then3737:                                         ; preds = %continuation3728
  br label %continuation3736

else3738:                                         ; preds = %continuation3728
  %2802 = alloca i32, align 4
  %2803 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2804 = call i32 (ptr, ...) @scanf(ptr %2803, ptr %2802)
  %2805 = load i32, ptr %2802, align 4
  %2806 = icmp eq i32 %2805, 0
  br label %continuation3736

continuation3736:                                 ; preds = %else3738, %then3737
  %2807 = phi i1 [ %2806, %else3738 ], [ true, %then3737 ]
  br i1 %2807, label %then3745, label %else3746

then3745:                                         ; preds = %continuation3736
  br label %continuation3744

else3746:                                         ; preds = %continuation3736
  %2808 = alloca i32, align 4
  %2809 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2810 = call i32 (ptr, ...) @scanf(ptr %2809, ptr %2808)
  %2811 = load i32, ptr %2808, align 4
  %2812 = icmp eq i32 %2811, 0
  br label %continuation3744

continuation3744:                                 ; preds = %else3746, %then3745
  %2813 = phi i1 [ %2812, %else3746 ], [ true, %then3745 ]
  br i1 %2813, label %then3753, label %else3754

then3753:                                         ; preds = %continuation3744
  br label %continuation3752

else3754:                                         ; preds = %continuation3744
  %2814 = alloca i32, align 4
  %2815 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2816 = call i32 (ptr, ...) @scanf(ptr %2815, ptr %2814)
  %2817 = load i32, ptr %2814, align 4
  %2818 = icmp eq i32 %2817, 0
  br label %continuation3752

continuation3752:                                 ; preds = %else3754, %then3753
  %2819 = phi i1 [ %2818, %else3754 ], [ true, %then3753 ]
  br i1 %2819, label %then3761, label %else3762

then3761:                                         ; preds = %continuation3752
  br label %continuation3760

else3762:                                         ; preds = %continuation3752
  %2820 = alloca i32, align 4
  %2821 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2822 = call i32 (ptr, ...) @scanf(ptr %2821, ptr %2820)
  %2823 = load i32, ptr %2820, align 4
  %2824 = icmp eq i32 %2823, 0
  br label %continuation3760

continuation3760:                                 ; preds = %else3762, %then3761
  %2825 = phi i1 [ %2824, %else3762 ], [ true, %then3761 ]
  br i1 %2825, label %then3769, label %else3770

then3769:                                         ; preds = %continuation3760
  br label %continuation3768

else3770:                                         ; preds = %continuation3760
  %2826 = alloca i32, align 4
  %2827 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2828 = call i32 (ptr, ...) @scanf(ptr %2827, ptr %2826)
  %2829 = load i32, ptr %2826, align 4
  %2830 = icmp eq i32 %2829, 0
  br label %continuation3768

continuation3768:                                 ; preds = %else3770, %then3769
  %2831 = phi i1 [ %2830, %else3770 ], [ true, %then3769 ]
  br i1 %2831, label %then3777, label %else3778

then3777:                                         ; preds = %continuation3768
  br label %continuation3776

else3778:                                         ; preds = %continuation3768
  %2832 = alloca i32, align 4
  %2833 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2834 = call i32 (ptr, ...) @scanf(ptr %2833, ptr %2832)
  %2835 = load i32, ptr %2832, align 4
  %2836 = icmp eq i32 %2835, 0
  br label %continuation3776

continuation3776:                                 ; preds = %else3778, %then3777
  %2837 = phi i1 [ %2836, %else3778 ], [ true, %then3777 ]
  br i1 %2837, label %then3785, label %else3786

then3785:                                         ; preds = %continuation3776
  br label %continuation3784

else3786:                                         ; preds = %continuation3776
  %2838 = alloca i32, align 4
  %2839 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2840 = call i32 (ptr, ...) @scanf(ptr %2839, ptr %2838)
  %2841 = load i32, ptr %2838, align 4
  %2842 = icmp eq i32 %2841, 0
  br label %continuation3784

continuation3784:                                 ; preds = %else3786, %then3785
  %2843 = phi i1 [ %2842, %else3786 ], [ true, %then3785 ]
  br i1 %2843, label %then3793, label %else3794

then3793:                                         ; preds = %continuation3784
  br label %continuation3792

else3794:                                         ; preds = %continuation3784
  %2844 = alloca i32, align 4
  %2845 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2846 = call i32 (ptr, ...) @scanf(ptr %2845, ptr %2844)
  %2847 = load i32, ptr %2844, align 4
  %2848 = icmp eq i32 %2847, 0
  br label %continuation3792

continuation3792:                                 ; preds = %else3794, %then3793
  %2849 = phi i1 [ %2848, %else3794 ], [ true, %then3793 ]
  br i1 %2849, label %then3801, label %else3802

then3801:                                         ; preds = %continuation3792
  br label %continuation3800

else3802:                                         ; preds = %continuation3792
  %2850 = alloca i32, align 4
  %2851 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2852 = call i32 (ptr, ...) @scanf(ptr %2851, ptr %2850)
  %2853 = load i32, ptr %2850, align 4
  %2854 = icmp eq i32 %2853, 0
  br label %continuation3800

continuation3800:                                 ; preds = %else3802, %then3801
  %2855 = phi i1 [ %2854, %else3802 ], [ true, %then3801 ]
  br i1 %2855, label %then3809, label %else3810

then3809:                                         ; preds = %continuation3800
  br label %continuation3808

else3810:                                         ; preds = %continuation3800
  %2856 = alloca i32, align 4
  %2857 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2858 = call i32 (ptr, ...) @scanf(ptr %2857, ptr %2856)
  %2859 = load i32, ptr %2856, align 4
  %2860 = icmp eq i32 %2859, 0
  br label %continuation3808

continuation3808:                                 ; preds = %else3810, %then3809
  %2861 = phi i1 [ %2860, %else3810 ], [ true, %then3809 ]
  br i1 %2861, label %then3817, label %else3818

then3817:                                         ; preds = %continuation3808
  br label %continuation3816

else3818:                                         ; preds = %continuation3808
  %2862 = alloca i32, align 4
  %2863 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2864 = call i32 (ptr, ...) @scanf(ptr %2863, ptr %2862)
  %2865 = load i32, ptr %2862, align 4
  %2866 = icmp eq i32 %2865, 0
  br label %continuation3816

continuation3816:                                 ; preds = %else3818, %then3817
  %2867 = phi i1 [ %2866, %else3818 ], [ true, %then3817 ]
  br i1 %2867, label %then3825, label %else3826

then3825:                                         ; preds = %continuation3816
  br label %continuation3824

else3826:                                         ; preds = %continuation3816
  %2868 = alloca i32, align 4
  %2869 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2870 = call i32 (ptr, ...) @scanf(ptr %2869, ptr %2868)
  %2871 = load i32, ptr %2868, align 4
  %2872 = icmp eq i32 %2871, 0
  br label %continuation3824

continuation3824:                                 ; preds = %else3826, %then3825
  %2873 = phi i1 [ %2872, %else3826 ], [ true, %then3825 ]
  br i1 %2873, label %then3833, label %else3834

then3833:                                         ; preds = %continuation3824
  br label %continuation3832

else3834:                                         ; preds = %continuation3824
  %2874 = alloca i32, align 4
  %2875 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2876 = call i32 (ptr, ...) @scanf(ptr %2875, ptr %2874)
  %2877 = load i32, ptr %2874, align 4
  %2878 = icmp eq i32 %2877, 0
  br label %continuation3832

continuation3832:                                 ; preds = %else3834, %then3833
  %2879 = phi i1 [ %2878, %else3834 ], [ true, %then3833 ]
  br i1 %2879, label %then3841, label %else3842

then3841:                                         ; preds = %continuation3832
  br label %continuation3840

else3842:                                         ; preds = %continuation3832
  %2880 = alloca i32, align 4
  %2881 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2882 = call i32 (ptr, ...) @scanf(ptr %2881, ptr %2880)
  %2883 = load i32, ptr %2880, align 4
  %2884 = icmp eq i32 %2883, 0
  br label %continuation3840

continuation3840:                                 ; preds = %else3842, %then3841
  %2885 = phi i1 [ %2884, %else3842 ], [ true, %then3841 ]
  br i1 %2885, label %then3849, label %else3850

then3849:                                         ; preds = %continuation3840
  br label %continuation3848

else3850:                                         ; preds = %continuation3840
  %2886 = alloca i32, align 4
  %2887 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2888 = call i32 (ptr, ...) @scanf(ptr %2887, ptr %2886)
  %2889 = load i32, ptr %2886, align 4
  %2890 = icmp eq i32 %2889, 0
  br label %continuation3848

continuation3848:                                 ; preds = %else3850, %then3849
  %2891 = phi i1 [ %2890, %else3850 ], [ true, %then3849 ]
  br i1 %2891, label %then3857, label %else3858

then3857:                                         ; preds = %continuation3848
  br label %continuation3856

else3858:                                         ; preds = %continuation3848
  %2892 = alloca i32, align 4
  %2893 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2894 = call i32 (ptr, ...) @scanf(ptr %2893, ptr %2892)
  %2895 = load i32, ptr %2892, align 4
  %2896 = icmp eq i32 %2895, 0
  br label %continuation3856

continuation3856:                                 ; preds = %else3858, %then3857
  %2897 = phi i1 [ %2896, %else3858 ], [ true, %then3857 ]
  br i1 %2897, label %then3865, label %else3866

then3865:                                         ; preds = %continuation3856
  br label %continuation3864

else3866:                                         ; preds = %continuation3856
  %2898 = alloca i32, align 4
  %2899 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2900 = call i32 (ptr, ...) @scanf(ptr %2899, ptr %2898)
  %2901 = load i32, ptr %2898, align 4
  %2902 = icmp eq i32 %2901, 0
  br label %continuation3864

continuation3864:                                 ; preds = %else3866, %then3865
  %2903 = phi i1 [ %2902, %else3866 ], [ true, %then3865 ]
  br i1 %2903, label %then3873, label %else3874

then3873:                                         ; preds = %continuation3864
  br label %continuation3872

else3874:                                         ; preds = %continuation3864
  %2904 = alloca i32, align 4
  %2905 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2906 = call i32 (ptr, ...) @scanf(ptr %2905, ptr %2904)
  %2907 = load i32, ptr %2904, align 4
  %2908 = icmp eq i32 %2907, 0
  br label %continuation3872

continuation3872:                                 ; preds = %else3874, %then3873
  %2909 = phi i1 [ %2908, %else3874 ], [ true, %then3873 ]
  br i1 %2909, label %then3881, label %else3882

then3881:                                         ; preds = %continuation3872
  br label %continuation3880

else3882:                                         ; preds = %continuation3872
  %2910 = alloca i32, align 4
  %2911 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2912 = call i32 (ptr, ...) @scanf(ptr %2911, ptr %2910)
  %2913 = load i32, ptr %2910, align 4
  %2914 = icmp eq i32 %2913, 0
  br label %continuation3880

continuation3880:                                 ; preds = %else3882, %then3881
  %2915 = phi i1 [ %2914, %else3882 ], [ true, %then3881 ]
  br i1 %2915, label %then3889, label %else3890

then3889:                                         ; preds = %continuation3880
  br label %continuation3888

else3890:                                         ; preds = %continuation3880
  %2916 = alloca i32, align 4
  %2917 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2918 = call i32 (ptr, ...) @scanf(ptr %2917, ptr %2916)
  %2919 = load i32, ptr %2916, align 4
  %2920 = icmp eq i32 %2919, 0
  br label %continuation3888

continuation3888:                                 ; preds = %else3890, %then3889
  %2921 = phi i1 [ %2920, %else3890 ], [ true, %then3889 ]
  br i1 %2921, label %then3897, label %else3898

then3897:                                         ; preds = %continuation3888
  br label %continuation3896

else3898:                                         ; preds = %continuation3888
  %2922 = alloca i32, align 4
  %2923 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2924 = call i32 (ptr, ...) @scanf(ptr %2923, ptr %2922)
  %2925 = load i32, ptr %2922, align 4
  %2926 = icmp eq i32 %2925, 0
  br label %continuation3896

continuation3896:                                 ; preds = %else3898, %then3897
  %2927 = phi i1 [ %2926, %else3898 ], [ true, %then3897 ]
  br i1 %2927, label %then3905, label %else3906

then3905:                                         ; preds = %continuation3896
  br label %continuation3904

else3906:                                         ; preds = %continuation3896
  %2928 = alloca i32, align 4
  %2929 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2930 = call i32 (ptr, ...) @scanf(ptr %2929, ptr %2928)
  %2931 = load i32, ptr %2928, align 4
  %2932 = icmp eq i32 %2931, 0
  br label %continuation3904

continuation3904:                                 ; preds = %else3906, %then3905
  %2933 = phi i1 [ %2932, %else3906 ], [ true, %then3905 ]
  br i1 %2933, label %then3913, label %else3914

then3913:                                         ; preds = %continuation3904
  br label %continuation3912

else3914:                                         ; preds = %continuation3904
  %2934 = alloca i32, align 4
  %2935 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2936 = call i32 (ptr, ...) @scanf(ptr %2935, ptr %2934)
  %2937 = load i32, ptr %2934, align 4
  %2938 = icmp eq i32 %2937, 0
  br label %continuation3912

continuation3912:                                 ; preds = %else3914, %then3913
  %2939 = phi i1 [ %2938, %else3914 ], [ true, %then3913 ]
  br i1 %2939, label %then3921, label %else3922

then3921:                                         ; preds = %continuation3912
  br label %continuation3920

else3922:                                         ; preds = %continuation3912
  %2940 = alloca i32, align 4
  %2941 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2942 = call i32 (ptr, ...) @scanf(ptr %2941, ptr %2940)
  %2943 = load i32, ptr %2940, align 4
  %2944 = icmp eq i32 %2943, 0
  br label %continuation3920

continuation3920:                                 ; preds = %else3922, %then3921
  %2945 = phi i1 [ %2944, %else3922 ], [ true, %then3921 ]
  br i1 %2945, label %then3929, label %else3930

then3929:                                         ; preds = %continuation3920
  br label %continuation3928

else3930:                                         ; preds = %continuation3920
  %2946 = alloca i32, align 4
  %2947 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2948 = call i32 (ptr, ...) @scanf(ptr %2947, ptr %2946)
  %2949 = load i32, ptr %2946, align 4
  %2950 = icmp eq i32 %2949, 0
  br label %continuation3928

continuation3928:                                 ; preds = %else3930, %then3929
  %2951 = phi i1 [ %2950, %else3930 ], [ true, %then3929 ]
  br i1 %2951, label %then3937, label %else3938

then3937:                                         ; preds = %continuation3928
  br label %continuation3936

else3938:                                         ; preds = %continuation3928
  %2952 = alloca i32, align 4
  %2953 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2954 = call i32 (ptr, ...) @scanf(ptr %2953, ptr %2952)
  %2955 = load i32, ptr %2952, align 4
  %2956 = icmp eq i32 %2955, 0
  br label %continuation3936

continuation3936:                                 ; preds = %else3938, %then3937
  %2957 = phi i1 [ %2956, %else3938 ], [ true, %then3937 ]
  br i1 %2957, label %then3945, label %else3946

then3945:                                         ; preds = %continuation3936
  br label %continuation3944

else3946:                                         ; preds = %continuation3936
  %2958 = alloca i32, align 4
  %2959 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2960 = call i32 (ptr, ...) @scanf(ptr %2959, ptr %2958)
  %2961 = load i32, ptr %2958, align 4
  %2962 = icmp eq i32 %2961, 0
  br label %continuation3944

continuation3944:                                 ; preds = %else3946, %then3945
  %2963 = phi i1 [ %2962, %else3946 ], [ true, %then3945 ]
  br i1 %2963, label %then3953, label %else3954

then3953:                                         ; preds = %continuation3944
  br label %continuation3952

else3954:                                         ; preds = %continuation3944
  %2964 = alloca i32, align 4
  %2965 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2966 = call i32 (ptr, ...) @scanf(ptr %2965, ptr %2964)
  %2967 = load i32, ptr %2964, align 4
  %2968 = icmp eq i32 %2967, 0
  br label %continuation3952

continuation3952:                                 ; preds = %else3954, %then3953
  %2969 = phi i1 [ %2968, %else3954 ], [ true, %then3953 ]
  br i1 %2969, label %then3961, label %else3962

then3961:                                         ; preds = %continuation3952
  br label %continuation3960

else3962:                                         ; preds = %continuation3952
  %2970 = alloca i32, align 4
  %2971 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2972 = call i32 (ptr, ...) @scanf(ptr %2971, ptr %2970)
  %2973 = load i32, ptr %2970, align 4
  %2974 = icmp eq i32 %2973, 0
  br label %continuation3960

continuation3960:                                 ; preds = %else3962, %then3961
  %2975 = phi i1 [ %2974, %else3962 ], [ true, %then3961 ]
  br i1 %2975, label %then3969, label %else3970

then3969:                                         ; preds = %continuation3960
  br label %continuation3968

else3970:                                         ; preds = %continuation3960
  %2976 = alloca i32, align 4
  %2977 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2978 = call i32 (ptr, ...) @scanf(ptr %2977, ptr %2976)
  %2979 = load i32, ptr %2976, align 4
  %2980 = icmp eq i32 %2979, 0
  br label %continuation3968

continuation3968:                                 ; preds = %else3970, %then3969
  %2981 = phi i1 [ %2980, %else3970 ], [ true, %then3969 ]
  br i1 %2981, label %then3977, label %else3978

then3977:                                         ; preds = %continuation3968
  br label %continuation3976

else3978:                                         ; preds = %continuation3968
  %2982 = alloca i32, align 4
  %2983 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2984 = call i32 (ptr, ...) @scanf(ptr %2983, ptr %2982)
  %2985 = load i32, ptr %2982, align 4
  %2986 = icmp eq i32 %2985, 0
  br label %continuation3976

continuation3976:                                 ; preds = %else3978, %then3977
  %2987 = phi i1 [ %2986, %else3978 ], [ true, %then3977 ]
  br i1 %2987, label %then3985, label %else3986

then3985:                                         ; preds = %continuation3976
  br label %continuation3984

else3986:                                         ; preds = %continuation3976
  %2988 = alloca i32, align 4
  %2989 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2990 = call i32 (ptr, ...) @scanf(ptr %2989, ptr %2988)
  %2991 = load i32, ptr %2988, align 4
  %2992 = icmp eq i32 %2991, 0
  br label %continuation3984

continuation3984:                                 ; preds = %else3986, %then3985
  %2993 = phi i1 [ %2992, %else3986 ], [ true, %then3985 ]
  br i1 %2993, label %then3993, label %else3994

then3993:                                         ; preds = %continuation3984
  br label %continuation3992

else3994:                                         ; preds = %continuation3984
  %2994 = alloca i32, align 4
  %2995 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2996 = call i32 (ptr, ...) @scanf(ptr %2995, ptr %2994)
  %2997 = load i32, ptr %2994, align 4
  %2998 = icmp eq i32 %2997, 0
  br label %continuation3992

continuation3992:                                 ; preds = %else3994, %then3993
  %2999 = phi i1 [ %2998, %else3994 ], [ true, %then3993 ]
  br i1 %2999, label %then4001, label %else4002

then4001:                                         ; preds = %continuation3992
  br label %continuation4000

else4002:                                         ; preds = %continuation3992
  %3000 = alloca i32, align 4
  %3001 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3002 = call i32 (ptr, ...) @scanf(ptr %3001, ptr %3000)
  %3003 = load i32, ptr %3000, align 4
  %3004 = icmp eq i32 %3003, 0
  br label %continuation4000

continuation4000:                                 ; preds = %else4002, %then4001
  %3005 = phi i1 [ %3004, %else4002 ], [ true, %then4001 ]
  br i1 %3005, label %then4009, label %else4010

then4009:                                         ; preds = %continuation4000
  br label %continuation4008

else4010:                                         ; preds = %continuation4000
  %3006 = alloca i32, align 4
  %3007 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3008 = call i32 (ptr, ...) @scanf(ptr %3007, ptr %3006)
  %3009 = load i32, ptr %3006, align 4
  %3010 = icmp eq i32 %3009, 0
  br label %continuation4008

continuation4008:                                 ; preds = %else4010, %then4009
  %3011 = phi i1 [ %3010, %else4010 ], [ true, %then4009 ]
  br i1 %3011, label %then4017, label %else4018

then4017:                                         ; preds = %continuation4008
  br label %continuation4016

else4018:                                         ; preds = %continuation4008
  %3012 = alloca i32, align 4
  %3013 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3014 = call i32 (ptr, ...) @scanf(ptr %3013, ptr %3012)
  %3015 = load i32, ptr %3012, align 4
  %3016 = icmp eq i32 %3015, 0
  br label %continuation4016

continuation4016:                                 ; preds = %else4018, %then4017
  %3017 = phi i1 [ %3016, %else4018 ], [ true, %then4017 ]
  br i1 %3017, label %then4025, label %else4026

then4025:                                         ; preds = %continuation4016
  br label %continuation4024

else4026:                                         ; preds = %continuation4016
  %3018 = alloca i32, align 4
  %3019 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3020 = call i32 (ptr, ...) @scanf(ptr %3019, ptr %3018)
  %3021 = load i32, ptr %3018, align 4
  %3022 = icmp eq i32 %3021, 0
  br label %continuation4024

continuation4024:                                 ; preds = %else4026, %then4025
  %3023 = phi i1 [ %3022, %else4026 ], [ true, %then4025 ]
  br i1 %3023, label %then4033, label %else4034

then4033:                                         ; preds = %continuation4024
  br label %continuation4032

else4034:                                         ; preds = %continuation4024
  %3024 = alloca i32, align 4
  %3025 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3026 = call i32 (ptr, ...) @scanf(ptr %3025, ptr %3024)
  %3027 = load i32, ptr %3024, align 4
  %3028 = icmp eq i32 %3027, 0
  br label %continuation4032

continuation4032:                                 ; preds = %else4034, %then4033
  %3029 = phi i1 [ %3028, %else4034 ], [ true, %then4033 ]
  br i1 %3029, label %then4041, label %else4042

then4041:                                         ; preds = %continuation4032
  br label %continuation4040

else4042:                                         ; preds = %continuation4032
  %3030 = alloca i32, align 4
  %3031 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3032 = call i32 (ptr, ...) @scanf(ptr %3031, ptr %3030)
  %3033 = load i32, ptr %3030, align 4
  %3034 = icmp eq i32 %3033, 0
  br label %continuation4040

continuation4040:                                 ; preds = %else4042, %then4041
  %3035 = phi i1 [ %3034, %else4042 ], [ true, %then4041 ]
  br i1 %3035, label %then4049, label %else4050

then4049:                                         ; preds = %continuation4040
  br label %continuation4048

else4050:                                         ; preds = %continuation4040
  %3036 = alloca i32, align 4
  %3037 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3038 = call i32 (ptr, ...) @scanf(ptr %3037, ptr %3036)
  %3039 = load i32, ptr %3036, align 4
  %3040 = icmp eq i32 %3039, 0
  br label %continuation4048

continuation4048:                                 ; preds = %else4050, %then4049
  %3041 = phi i1 [ %3040, %else4050 ], [ true, %then4049 ]
  br i1 %3041, label %then4057, label %else4058

then4057:                                         ; preds = %continuation4048
  br label %continuation4056

else4058:                                         ; preds = %continuation4048
  %3042 = alloca i32, align 4
  %3043 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3044 = call i32 (ptr, ...) @scanf(ptr %3043, ptr %3042)
  %3045 = load i32, ptr %3042, align 4
  %3046 = icmp eq i32 %3045, 0
  br label %continuation4056

continuation4056:                                 ; preds = %else4058, %then4057
  %3047 = phi i1 [ %3046, %else4058 ], [ true, %then4057 ]
  br i1 %3047, label %then4065, label %else4066

then4065:                                         ; preds = %continuation4056
  br label %continuation4064

else4066:                                         ; preds = %continuation4056
  %3048 = alloca i32, align 4
  %3049 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3050 = call i32 (ptr, ...) @scanf(ptr %3049, ptr %3048)
  %3051 = load i32, ptr %3048, align 4
  %3052 = icmp eq i32 %3051, 0
  br label %continuation4064

continuation4064:                                 ; preds = %else4066, %then4065
  %3053 = phi i1 [ %3052, %else4066 ], [ true, %then4065 ]
  br i1 %3053, label %then4073, label %else4074

then4073:                                         ; preds = %continuation4064
  br label %continuation4072

else4074:                                         ; preds = %continuation4064
  %3054 = alloca i32, align 4
  %3055 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3056 = call i32 (ptr, ...) @scanf(ptr %3055, ptr %3054)
  %3057 = load i32, ptr %3054, align 4
  %3058 = icmp eq i32 %3057, 0
  br label %continuation4072

continuation4072:                                 ; preds = %else4074, %then4073
  %3059 = phi i1 [ %3058, %else4074 ], [ true, %then4073 ]
  br i1 %3059, label %then4081, label %else4082

then4081:                                         ; preds = %continuation4072
  br label %continuation4080

else4082:                                         ; preds = %continuation4072
  %3060 = alloca i32, align 4
  %3061 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3062 = call i32 (ptr, ...) @scanf(ptr %3061, ptr %3060)
  %3063 = load i32, ptr %3060, align 4
  %3064 = icmp eq i32 %3063, 0
  br label %continuation4080

continuation4080:                                 ; preds = %else4082, %then4081
  %3065 = phi i1 [ %3064, %else4082 ], [ true, %then4081 ]
  br i1 %3065, label %then4089, label %else4090

then4089:                                         ; preds = %continuation4080
  br label %continuation4088

else4090:                                         ; preds = %continuation4080
  %3066 = alloca i32, align 4
  %3067 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3068 = call i32 (ptr, ...) @scanf(ptr %3067, ptr %3066)
  %3069 = load i32, ptr %3066, align 4
  %3070 = icmp eq i32 %3069, 0
  br label %continuation4088

continuation4088:                                 ; preds = %else4090, %then4089
  %3071 = phi i1 [ %3070, %else4090 ], [ true, %then4089 ]
  br i1 %3071, label %then4097, label %else4098

then4097:                                         ; preds = %continuation4088
  br label %continuation4096

else4098:                                         ; preds = %continuation4088
  %3072 = alloca i32, align 4
  %3073 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3074 = call i32 (ptr, ...) @scanf(ptr %3073, ptr %3072)
  %3075 = load i32, ptr %3072, align 4
  %3076 = icmp eq i32 %3075, 0
  br label %continuation4096

continuation4096:                                 ; preds = %else4098, %then4097
  %3077 = phi i1 [ %3076, %else4098 ], [ true, %then4097 ]
  br i1 %3077, label %then4105, label %else4106

then4105:                                         ; preds = %continuation4096
  br label %continuation4104

else4106:                                         ; preds = %continuation4096
  %3078 = alloca i32, align 4
  %3079 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3080 = call i32 (ptr, ...) @scanf(ptr %3079, ptr %3078)
  %3081 = load i32, ptr %3078, align 4
  %3082 = icmp eq i32 %3081, 0
  br label %continuation4104

continuation4104:                                 ; preds = %else4106, %then4105
  %3083 = phi i1 [ %3082, %else4106 ], [ true, %then4105 ]
  br i1 %3083, label %then4113, label %else4114

then4113:                                         ; preds = %continuation4104
  br label %continuation4112

else4114:                                         ; preds = %continuation4104
  %3084 = alloca i32, align 4
  %3085 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3086 = call i32 (ptr, ...) @scanf(ptr %3085, ptr %3084)
  %3087 = load i32, ptr %3084, align 4
  %3088 = icmp eq i32 %3087, 0
  br label %continuation4112

continuation4112:                                 ; preds = %else4114, %then4113
  %3089 = phi i1 [ %3088, %else4114 ], [ true, %then4113 ]
  br i1 %3089, label %then4121, label %else4122

then4121:                                         ; preds = %continuation4112
  br label %continuation4120

else4122:                                         ; preds = %continuation4112
  %3090 = alloca i32, align 4
  %3091 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3092 = call i32 (ptr, ...) @scanf(ptr %3091, ptr %3090)
  %3093 = load i32, ptr %3090, align 4
  %3094 = icmp eq i32 %3093, 0
  br label %continuation4120

continuation4120:                                 ; preds = %else4122, %then4121
  %3095 = phi i1 [ %3094, %else4122 ], [ true, %then4121 ]
  br i1 %3095, label %then4129, label %else4130

then4129:                                         ; preds = %continuation4120
  br label %continuation4128

else4130:                                         ; preds = %continuation4120
  %3096 = alloca i32, align 4
  %3097 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3098 = call i32 (ptr, ...) @scanf(ptr %3097, ptr %3096)
  %3099 = load i32, ptr %3096, align 4
  %3100 = icmp eq i32 %3099, 0
  br label %continuation4128

continuation4128:                                 ; preds = %else4130, %then4129
  %3101 = phi i1 [ %3100, %else4130 ], [ true, %then4129 ]
  br i1 %3101, label %then4137, label %else4138

then4137:                                         ; preds = %continuation4128
  br label %continuation4136

else4138:                                         ; preds = %continuation4128
  %3102 = alloca i32, align 4
  %3103 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3104 = call i32 (ptr, ...) @scanf(ptr %3103, ptr %3102)
  %3105 = load i32, ptr %3102, align 4
  %3106 = icmp eq i32 %3105, 0
  br label %continuation4136

continuation4136:                                 ; preds = %else4138, %then4137
  %3107 = phi i1 [ %3106, %else4138 ], [ true, %then4137 ]
  br i1 %3107, label %then4145, label %else4146

then4145:                                         ; preds = %continuation4136
  br label %continuation4144

else4146:                                         ; preds = %continuation4136
  %3108 = alloca i32, align 4
  %3109 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3110 = call i32 (ptr, ...) @scanf(ptr %3109, ptr %3108)
  %3111 = load i32, ptr %3108, align 4
  %3112 = icmp eq i32 %3111, 0
  br label %continuation4144

continuation4144:                                 ; preds = %else4146, %then4145
  %3113 = phi i1 [ %3112, %else4146 ], [ true, %then4145 ]
  br i1 %3113, label %then4153, label %else4154

then4153:                                         ; preds = %continuation4144
  br label %continuation4152

else4154:                                         ; preds = %continuation4144
  %3114 = alloca i32, align 4
  %3115 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3116 = call i32 (ptr, ...) @scanf(ptr %3115, ptr %3114)
  %3117 = load i32, ptr %3114, align 4
  %3118 = icmp eq i32 %3117, 0
  br label %continuation4152

continuation4152:                                 ; preds = %else4154, %then4153
  %3119 = phi i1 [ %3118, %else4154 ], [ true, %then4153 ]
  br i1 %3119, label %then4161, label %else4162

then4161:                                         ; preds = %continuation4152
  br label %continuation4160

else4162:                                         ; preds = %continuation4152
  %3120 = alloca i32, align 4
  %3121 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3122 = call i32 (ptr, ...) @scanf(ptr %3121, ptr %3120)
  %3123 = load i32, ptr %3120, align 4
  %3124 = icmp eq i32 %3123, 0
  br label %continuation4160

continuation4160:                                 ; preds = %else4162, %then4161
  %3125 = phi i1 [ %3124, %else4162 ], [ true, %then4161 ]
  br i1 %3125, label %then4169, label %else4170

then4169:                                         ; preds = %continuation4160
  br label %continuation4168

else4170:                                         ; preds = %continuation4160
  %3126 = alloca i32, align 4
  %3127 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3128 = call i32 (ptr, ...) @scanf(ptr %3127, ptr %3126)
  %3129 = load i32, ptr %3126, align 4
  %3130 = icmp eq i32 %3129, 0
  br label %continuation4168

continuation4168:                                 ; preds = %else4170, %then4169
  %3131 = phi i1 [ %3130, %else4170 ], [ true, %then4169 ]
  br i1 %3131, label %then4177, label %else4178

then4177:                                         ; preds = %continuation4168
  br label %continuation4176

else4178:                                         ; preds = %continuation4168
  %3132 = alloca i32, align 4
  %3133 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3134 = call i32 (ptr, ...) @scanf(ptr %3133, ptr %3132)
  %3135 = load i32, ptr %3132, align 4
  %3136 = icmp eq i32 %3135, 0
  br label %continuation4176

continuation4176:                                 ; preds = %else4178, %then4177
  %3137 = phi i1 [ %3136, %else4178 ], [ true, %then4177 ]
  br i1 %3137, label %then4185, label %else4186

then4185:                                         ; preds = %continuation4176
  br label %continuation4184

else4186:                                         ; preds = %continuation4176
  %3138 = alloca i32, align 4
  %3139 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3140 = call i32 (ptr, ...) @scanf(ptr %3139, ptr %3138)
  %3141 = load i32, ptr %3138, align 4
  %3142 = icmp eq i32 %3141, 0
  br label %continuation4184

continuation4184:                                 ; preds = %else4186, %then4185
  %3143 = phi i1 [ %3142, %else4186 ], [ true, %then4185 ]
  br i1 %3143, label %then4193, label %else4194

then4193:                                         ; preds = %continuation4184
  br label %continuation4192

else4194:                                         ; preds = %continuation4184
  %3144 = alloca i32, align 4
  %3145 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3146 = call i32 (ptr, ...) @scanf(ptr %3145, ptr %3144)
  %3147 = load i32, ptr %3144, align 4
  %3148 = icmp eq i32 %3147, 0
  br label %continuation4192

continuation4192:                                 ; preds = %else4194, %then4193
  %3149 = phi i1 [ %3148, %else4194 ], [ true, %then4193 ]
  br i1 %3149, label %then4201, label %else4202

then4201:                                         ; preds = %continuation4192
  br label %continuation4200

else4202:                                         ; preds = %continuation4192
  %3150 = alloca i32, align 4
  %3151 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3152 = call i32 (ptr, ...) @scanf(ptr %3151, ptr %3150)
  %3153 = load i32, ptr %3150, align 4
  %3154 = icmp eq i32 %3153, 0
  br label %continuation4200

continuation4200:                                 ; preds = %else4202, %then4201
  %3155 = phi i1 [ %3154, %else4202 ], [ true, %then4201 ]
  br i1 %3155, label %then4209, label %else4210

then4209:                                         ; preds = %continuation4200
  br label %continuation4208

else4210:                                         ; preds = %continuation4200
  %3156 = alloca i32, align 4
  %3157 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3158 = call i32 (ptr, ...) @scanf(ptr %3157, ptr %3156)
  %3159 = load i32, ptr %3156, align 4
  %3160 = icmp eq i32 %3159, 0
  br label %continuation4208

continuation4208:                                 ; preds = %else4210, %then4209
  %3161 = phi i1 [ %3160, %else4210 ], [ true, %then4209 ]
  br i1 %3161, label %then4217, label %else4218

then4217:                                         ; preds = %continuation4208
  br label %continuation4216

else4218:                                         ; preds = %continuation4208
  %3162 = alloca i32, align 4
  %3163 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3164 = call i32 (ptr, ...) @scanf(ptr %3163, ptr %3162)
  %3165 = load i32, ptr %3162, align 4
  %3166 = icmp eq i32 %3165, 0
  br label %continuation4216

continuation4216:                                 ; preds = %else4218, %then4217
  %3167 = phi i1 [ %3166, %else4218 ], [ true, %then4217 ]
  br i1 %3167, label %then4225, label %else4226

then4225:                                         ; preds = %continuation4216
  br label %continuation4224

else4226:                                         ; preds = %continuation4216
  %3168 = alloca i32, align 4
  %3169 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3170 = call i32 (ptr, ...) @scanf(ptr %3169, ptr %3168)
  %3171 = load i32, ptr %3168, align 4
  %3172 = icmp eq i32 %3171, 0
  br label %continuation4224

continuation4224:                                 ; preds = %else4226, %then4225
  %3173 = phi i1 [ %3172, %else4226 ], [ true, %then4225 ]
  br i1 %3173, label %then4233, label %else4234

then4233:                                         ; preds = %continuation4224
  br label %continuation4232

else4234:                                         ; preds = %continuation4224
  %3174 = alloca i32, align 4
  %3175 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3176 = call i32 (ptr, ...) @scanf(ptr %3175, ptr %3174)
  %3177 = load i32, ptr %3174, align 4
  %3178 = icmp eq i32 %3177, 0
  br label %continuation4232

continuation4232:                                 ; preds = %else4234, %then4233
  %3179 = phi i1 [ %3178, %else4234 ], [ true, %then4233 ]
  br i1 %3179, label %then4241, label %else4242

then4241:                                         ; preds = %continuation4232
  br label %continuation4240

else4242:                                         ; preds = %continuation4232
  %3180 = alloca i32, align 4
  %3181 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3182 = call i32 (ptr, ...) @scanf(ptr %3181, ptr %3180)
  %3183 = load i32, ptr %3180, align 4
  %3184 = icmp eq i32 %3183, 0
  br label %continuation4240

continuation4240:                                 ; preds = %else4242, %then4241
  %3185 = phi i1 [ %3184, %else4242 ], [ true, %then4241 ]
  br i1 %3185, label %then4249, label %else4250

then4249:                                         ; preds = %continuation4240
  br label %continuation4248

else4250:                                         ; preds = %continuation4240
  %3186 = alloca i32, align 4
  %3187 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3188 = call i32 (ptr, ...) @scanf(ptr %3187, ptr %3186)
  %3189 = load i32, ptr %3186, align 4
  %3190 = icmp eq i32 %3189, 0
  br label %continuation4248

continuation4248:                                 ; preds = %else4250, %then4249
  %3191 = phi i1 [ %3190, %else4250 ], [ true, %then4249 ]
  br i1 %3191, label %then4257, label %else4258

then4257:                                         ; preds = %continuation4248
  br label %continuation4256

else4258:                                         ; preds = %continuation4248
  %3192 = alloca i32, align 4
  %3193 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3194 = call i32 (ptr, ...) @scanf(ptr %3193, ptr %3192)
  %3195 = load i32, ptr %3192, align 4
  %3196 = icmp eq i32 %3195, 0
  br label %continuation4256

continuation4256:                                 ; preds = %else4258, %then4257
  %3197 = phi i1 [ %3196, %else4258 ], [ true, %then4257 ]
  br i1 %3197, label %then4265, label %else4266

then4265:                                         ; preds = %continuation4256
  br label %continuation4264

else4266:                                         ; preds = %continuation4256
  %3198 = alloca i32, align 4
  %3199 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3200 = call i32 (ptr, ...) @scanf(ptr %3199, ptr %3198)
  %3201 = load i32, ptr %3198, align 4
  %3202 = icmp eq i32 %3201, 0
  br label %continuation4264

continuation4264:                                 ; preds = %else4266, %then4265
  %3203 = phi i1 [ %3202, %else4266 ], [ true, %then4265 ]
  br i1 %3203, label %then4273, label %else4274

then4273:                                         ; preds = %continuation4264
  br label %continuation4272

else4274:                                         ; preds = %continuation4264
  %3204 = alloca i32, align 4
  %3205 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3206 = call i32 (ptr, ...) @scanf(ptr %3205, ptr %3204)
  %3207 = load i32, ptr %3204, align 4
  %3208 = icmp eq i32 %3207, 0
  br label %continuation4272

continuation4272:                                 ; preds = %else4274, %then4273
  %3209 = phi i1 [ %3208, %else4274 ], [ true, %then4273 ]
  br i1 %3209, label %then4281, label %else4282

then4281:                                         ; preds = %continuation4272
  br label %continuation4280

else4282:                                         ; preds = %continuation4272
  %3210 = alloca i32, align 4
  %3211 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3212 = call i32 (ptr, ...) @scanf(ptr %3211, ptr %3210)
  %3213 = load i32, ptr %3210, align 4
  %3214 = icmp eq i32 %3213, 0
  br label %continuation4280

continuation4280:                                 ; preds = %else4282, %then4281
  %3215 = phi i1 [ %3214, %else4282 ], [ true, %then4281 ]
  br i1 %3215, label %then4289, label %else4290

then4289:                                         ; preds = %continuation4280
  br label %continuation4288

else4290:                                         ; preds = %continuation4280
  %3216 = alloca i32, align 4
  %3217 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3218 = call i32 (ptr, ...) @scanf(ptr %3217, ptr %3216)
  %3219 = load i32, ptr %3216, align 4
  %3220 = icmp eq i32 %3219, 0
  br label %continuation4288

continuation4288:                                 ; preds = %else4290, %then4289
  %3221 = phi i1 [ %3220, %else4290 ], [ true, %then4289 ]
  br i1 %3221, label %then4297, label %else4298

then4297:                                         ; preds = %continuation4288
  br label %continuation4296

else4298:                                         ; preds = %continuation4288
  %3222 = alloca i32, align 4
  %3223 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3224 = call i32 (ptr, ...) @scanf(ptr %3223, ptr %3222)
  %3225 = load i32, ptr %3222, align 4
  %3226 = icmp eq i32 %3225, 0
  br label %continuation4296

continuation4296:                                 ; preds = %else4298, %then4297
  %3227 = phi i1 [ %3226, %else4298 ], [ true, %then4297 ]
  br i1 %3227, label %then4305, label %else4306

then4305:                                         ; preds = %continuation4296
  br label %continuation4304

else4306:                                         ; preds = %continuation4296
  %3228 = alloca i32, align 4
  %3229 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3230 = call i32 (ptr, ...) @scanf(ptr %3229, ptr %3228)
  %3231 = load i32, ptr %3228, align 4
  %3232 = icmp eq i32 %3231, 0
  br label %continuation4304

continuation4304:                                 ; preds = %else4306, %then4305
  %3233 = phi i1 [ %3232, %else4306 ], [ true, %then4305 ]
  br i1 %3233, label %then4313, label %else4314

then4313:                                         ; preds = %continuation4304
  br label %continuation4312

else4314:                                         ; preds = %continuation4304
  %3234 = alloca i32, align 4
  %3235 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3236 = call i32 (ptr, ...) @scanf(ptr %3235, ptr %3234)
  %3237 = load i32, ptr %3234, align 4
  %3238 = icmp eq i32 %3237, 0
  br label %continuation4312

continuation4312:                                 ; preds = %else4314, %then4313
  %3239 = phi i1 [ %3238, %else4314 ], [ true, %then4313 ]
  br i1 %3239, label %then4321, label %else4322

then4321:                                         ; preds = %continuation4312
  br label %continuation4320

else4322:                                         ; preds = %continuation4312
  %3240 = alloca i32, align 4
  %3241 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3242 = call i32 (ptr, ...) @scanf(ptr %3241, ptr %3240)
  %3243 = load i32, ptr %3240, align 4
  %3244 = icmp eq i32 %3243, 0
  br label %continuation4320

continuation4320:                                 ; preds = %else4322, %then4321
  %3245 = phi i1 [ %3244, %else4322 ], [ true, %then4321 ]
  br i1 %3245, label %then4329, label %else4330

then4329:                                         ; preds = %continuation4320
  br label %continuation4328

else4330:                                         ; preds = %continuation4320
  %3246 = alloca i32, align 4
  %3247 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3248 = call i32 (ptr, ...) @scanf(ptr %3247, ptr %3246)
  %3249 = load i32, ptr %3246, align 4
  %3250 = icmp eq i32 %3249, 0
  br label %continuation4328

continuation4328:                                 ; preds = %else4330, %then4329
  %3251 = phi i1 [ %3250, %else4330 ], [ true, %then4329 ]
  br i1 %3251, label %then4337, label %else4338

then4337:                                         ; preds = %continuation4328
  br label %continuation4336

else4338:                                         ; preds = %continuation4328
  %3252 = alloca i32, align 4
  %3253 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3254 = call i32 (ptr, ...) @scanf(ptr %3253, ptr %3252)
  %3255 = load i32, ptr %3252, align 4
  %3256 = icmp eq i32 %3255, 0
  br label %continuation4336

continuation4336:                                 ; preds = %else4338, %then4337
  %3257 = phi i1 [ %3256, %else4338 ], [ true, %then4337 ]
  br i1 %3257, label %then4345, label %else4346

then4345:                                         ; preds = %continuation4336
  br label %continuation4344

else4346:                                         ; preds = %continuation4336
  %3258 = alloca i32, align 4
  %3259 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3260 = call i32 (ptr, ...) @scanf(ptr %3259, ptr %3258)
  %3261 = load i32, ptr %3258, align 4
  %3262 = icmp eq i32 %3261, 0
  br label %continuation4344

continuation4344:                                 ; preds = %else4346, %then4345
  %3263 = phi i1 [ %3262, %else4346 ], [ true, %then4345 ]
  br i1 %3263, label %then4353, label %else4354

then4353:                                         ; preds = %continuation4344
  br label %continuation4352

else4354:                                         ; preds = %continuation4344
  %3264 = alloca i32, align 4
  %3265 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3266 = call i32 (ptr, ...) @scanf(ptr %3265, ptr %3264)
  %3267 = load i32, ptr %3264, align 4
  %3268 = icmp eq i32 %3267, 0
  br label %continuation4352

continuation4352:                                 ; preds = %else4354, %then4353
  %3269 = phi i1 [ %3268, %else4354 ], [ true, %then4353 ]
  br i1 %3269, label %then4361, label %else4362

then4361:                                         ; preds = %continuation4352
  br label %continuation4360

else4362:                                         ; preds = %continuation4352
  %3270 = alloca i32, align 4
  %3271 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3272 = call i32 (ptr, ...) @scanf(ptr %3271, ptr %3270)
  %3273 = load i32, ptr %3270, align 4
  %3274 = icmp eq i32 %3273, 0
  br label %continuation4360

continuation4360:                                 ; preds = %else4362, %then4361
  %3275 = phi i1 [ %3274, %else4362 ], [ true, %then4361 ]
  br i1 %3275, label %then4369, label %else4370

then4369:                                         ; preds = %continuation4360
  br label %continuation4368

else4370:                                         ; preds = %continuation4360
  %3276 = alloca i32, align 4
  %3277 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3278 = call i32 (ptr, ...) @scanf(ptr %3277, ptr %3276)
  %3279 = load i32, ptr %3276, align 4
  %3280 = icmp eq i32 %3279, 0
  br label %continuation4368

continuation4368:                                 ; preds = %else4370, %then4369
  %3281 = phi i1 [ %3280, %else4370 ], [ true, %then4369 ]
  br i1 %3281, label %then4377, label %else4378

then4377:                                         ; preds = %continuation4368
  br label %continuation4376

else4378:                                         ; preds = %continuation4368
  %3282 = alloca i32, align 4
  %3283 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3284 = call i32 (ptr, ...) @scanf(ptr %3283, ptr %3282)
  %3285 = load i32, ptr %3282, align 4
  %3286 = icmp eq i32 %3285, 0
  br label %continuation4376

continuation4376:                                 ; preds = %else4378, %then4377
  %3287 = phi i1 [ %3286, %else4378 ], [ true, %then4377 ]
  br i1 %3287, label %then4385, label %else4386

then4385:                                         ; preds = %continuation4376
  br label %continuation4384

else4386:                                         ; preds = %continuation4376
  %3288 = alloca i32, align 4
  %3289 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3290 = call i32 (ptr, ...) @scanf(ptr %3289, ptr %3288)
  %3291 = load i32, ptr %3288, align 4
  %3292 = icmp eq i32 %3291, 0
  br label %continuation4384

continuation4384:                                 ; preds = %else4386, %then4385
  %3293 = phi i1 [ %3292, %else4386 ], [ true, %then4385 ]
  br i1 %3293, label %then4393, label %else4394

then4393:                                         ; preds = %continuation4384
  br label %continuation4392

else4394:                                         ; preds = %continuation4384
  %3294 = alloca i32, align 4
  %3295 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3296 = call i32 (ptr, ...) @scanf(ptr %3295, ptr %3294)
  %3297 = load i32, ptr %3294, align 4
  %3298 = icmp eq i32 %3297, 0
  br label %continuation4392

continuation4392:                                 ; preds = %else4394, %then4393
  %3299 = phi i1 [ %3298, %else4394 ], [ true, %then4393 ]
  br i1 %3299, label %then4401, label %else4402

then4401:                                         ; preds = %continuation4392
  br label %continuation4400

else4402:                                         ; preds = %continuation4392
  %3300 = alloca i32, align 4
  %3301 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3302 = call i32 (ptr, ...) @scanf(ptr %3301, ptr %3300)
  %3303 = load i32, ptr %3300, align 4
  %3304 = icmp eq i32 %3303, 0
  br label %continuation4400

continuation4400:                                 ; preds = %else4402, %then4401
  %3305 = phi i1 [ %3304, %else4402 ], [ true, %then4401 ]
  br i1 %3305, label %then4409, label %else4410

then4409:                                         ; preds = %continuation4400
  br label %continuation4408

else4410:                                         ; preds = %continuation4400
  %3306 = alloca i32, align 4
  %3307 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3308 = call i32 (ptr, ...) @scanf(ptr %3307, ptr %3306)
  %3309 = load i32, ptr %3306, align 4
  %3310 = icmp eq i32 %3309, 0
  br label %continuation4408

continuation4408:                                 ; preds = %else4410, %then4409
  %3311 = phi i1 [ %3310, %else4410 ], [ true, %then4409 ]
  br i1 %3311, label %then4417, label %else4418

then4417:                                         ; preds = %continuation4408
  br label %continuation4416

else4418:                                         ; preds = %continuation4408
  %3312 = alloca i32, align 4
  %3313 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3314 = call i32 (ptr, ...) @scanf(ptr %3313, ptr %3312)
  %3315 = load i32, ptr %3312, align 4
  %3316 = icmp eq i32 %3315, 0
  br label %continuation4416

continuation4416:                                 ; preds = %else4418, %then4417
  %3317 = phi i1 [ %3316, %else4418 ], [ true, %then4417 ]
  br i1 %3317, label %then4425, label %else4426

then4425:                                         ; preds = %continuation4416
  br label %continuation4424

else4426:                                         ; preds = %continuation4416
  %3318 = alloca i32, align 4
  %3319 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3320 = call i32 (ptr, ...) @scanf(ptr %3319, ptr %3318)
  %3321 = load i32, ptr %3318, align 4
  %3322 = icmp eq i32 %3321, 0
  br label %continuation4424

continuation4424:                                 ; preds = %else4426, %then4425
  %3323 = phi i1 [ %3322, %else4426 ], [ true, %then4425 ]
  br i1 %3323, label %then4433, label %else4434

then4433:                                         ; preds = %continuation4424
  br label %continuation4432

else4434:                                         ; preds = %continuation4424
  %3324 = alloca i32, align 4
  %3325 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3326 = call i32 (ptr, ...) @scanf(ptr %3325, ptr %3324)
  %3327 = load i32, ptr %3324, align 4
  %3328 = icmp eq i32 %3327, 0
  br label %continuation4432

continuation4432:                                 ; preds = %else4434, %then4433
  %3329 = phi i1 [ %3328, %else4434 ], [ true, %then4433 ]
  br i1 %3329, label %then4441, label %else4442

then4441:                                         ; preds = %continuation4432
  br label %continuation4440

else4442:                                         ; preds = %continuation4432
  %3330 = alloca i32, align 4
  %3331 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3332 = call i32 (ptr, ...) @scanf(ptr %3331, ptr %3330)
  %3333 = load i32, ptr %3330, align 4
  %3334 = icmp eq i32 %3333, 0
  br label %continuation4440

continuation4440:                                 ; preds = %else4442, %then4441
  %3335 = phi i1 [ %3334, %else4442 ], [ true, %then4441 ]
  br i1 %3335, label %then4449, label %else4450

then4449:                                         ; preds = %continuation4440
  br label %continuation4448

else4450:                                         ; preds = %continuation4440
  %3336 = alloca i32, align 4
  %3337 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3338 = call i32 (ptr, ...) @scanf(ptr %3337, ptr %3336)
  %3339 = load i32, ptr %3336, align 4
  %3340 = icmp eq i32 %3339, 0
  br label %continuation4448

continuation4448:                                 ; preds = %else4450, %then4449
  %3341 = phi i1 [ %3340, %else4450 ], [ true, %then4449 ]
  br i1 %3341, label %then4457, label %else4458

then4457:                                         ; preds = %continuation4448
  br label %continuation4456

else4458:                                         ; preds = %continuation4448
  %3342 = alloca i32, align 4
  %3343 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3344 = call i32 (ptr, ...) @scanf(ptr %3343, ptr %3342)
  %3345 = load i32, ptr %3342, align 4
  %3346 = icmp eq i32 %3345, 0
  br label %continuation4456

continuation4456:                                 ; preds = %else4458, %then4457
  %3347 = phi i1 [ %3346, %else4458 ], [ true, %then4457 ]
  br i1 %3347, label %then4465, label %else4466

then4465:                                         ; preds = %continuation4456
  br label %continuation4464

else4466:                                         ; preds = %continuation4456
  %3348 = alloca i32, align 4
  %3349 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3350 = call i32 (ptr, ...) @scanf(ptr %3349, ptr %3348)
  %3351 = load i32, ptr %3348, align 4
  %3352 = icmp eq i32 %3351, 0
  br label %continuation4464

continuation4464:                                 ; preds = %else4466, %then4465
  %3353 = phi i1 [ %3352, %else4466 ], [ true, %then4465 ]
  br i1 %3353, label %then4473, label %else4474

then4473:                                         ; preds = %continuation4464
  br label %continuation4472

else4474:                                         ; preds = %continuation4464
  %3354 = alloca i32, align 4
  %3355 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3356 = call i32 (ptr, ...) @scanf(ptr %3355, ptr %3354)
  %3357 = load i32, ptr %3354, align 4
  %3358 = icmp eq i32 %3357, 0
  br label %continuation4472

continuation4472:                                 ; preds = %else4474, %then4473
  %3359 = phi i1 [ %3358, %else4474 ], [ true, %then4473 ]
  br i1 %3359, label %then4481, label %else4482

then4481:                                         ; preds = %continuation4472
  br label %continuation4480

else4482:                                         ; preds = %continuation4472
  %3360 = alloca i32, align 4
  %3361 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3362 = call i32 (ptr, ...) @scanf(ptr %3361, ptr %3360)
  %3363 = load i32, ptr %3360, align 4
  %3364 = icmp eq i32 %3363, 0
  br label %continuation4480

continuation4480:                                 ; preds = %else4482, %then4481
  %3365 = phi i1 [ %3364, %else4482 ], [ true, %then4481 ]
  br i1 %3365, label %then4489, label %else4490

then4489:                                         ; preds = %continuation4480
  br label %continuation4488

else4490:                                         ; preds = %continuation4480
  %3366 = alloca i32, align 4
  %3367 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3368 = call i32 (ptr, ...) @scanf(ptr %3367, ptr %3366)
  %3369 = load i32, ptr %3366, align 4
  %3370 = icmp eq i32 %3369, 0
  br label %continuation4488

continuation4488:                                 ; preds = %else4490, %then4489
  %3371 = phi i1 [ %3370, %else4490 ], [ true, %then4489 ]
  br i1 %3371, label %then4497, label %else4498

then4497:                                         ; preds = %continuation4488
  br label %continuation4496

else4498:                                         ; preds = %continuation4488
  %3372 = alloca i32, align 4
  %3373 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3374 = call i32 (ptr, ...) @scanf(ptr %3373, ptr %3372)
  %3375 = load i32, ptr %3372, align 4
  %3376 = icmp eq i32 %3375, 0
  br label %continuation4496

continuation4496:                                 ; preds = %else4498, %then4497
  %3377 = phi i1 [ %3376, %else4498 ], [ true, %then4497 ]
  br i1 %3377, label %then4505, label %else4506

then4505:                                         ; preds = %continuation4496
  br label %continuation4504

else4506:                                         ; preds = %continuation4496
  %3378 = alloca i32, align 4
  %3379 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3380 = call i32 (ptr, ...) @scanf(ptr %3379, ptr %3378)
  %3381 = load i32, ptr %3378, align 4
  %3382 = icmp eq i32 %3381, 0
  br label %continuation4504

continuation4504:                                 ; preds = %else4506, %then4505
  %3383 = phi i1 [ %3382, %else4506 ], [ true, %then4505 ]
  br i1 %3383, label %then4513, label %else4514

then4513:                                         ; preds = %continuation4504
  br label %continuation4512

else4514:                                         ; preds = %continuation4504
  %3384 = alloca i32, align 4
  %3385 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3386 = call i32 (ptr, ...) @scanf(ptr %3385, ptr %3384)
  %3387 = load i32, ptr %3384, align 4
  %3388 = icmp eq i32 %3387, 0
  br label %continuation4512

continuation4512:                                 ; preds = %else4514, %then4513
  %3389 = phi i1 [ %3388, %else4514 ], [ true, %then4513 ]
  br i1 %3389, label %then4521, label %else4522

then4521:                                         ; preds = %continuation4512
  br label %continuation4520

else4522:                                         ; preds = %continuation4512
  %3390 = alloca i32, align 4
  %3391 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3392 = call i32 (ptr, ...) @scanf(ptr %3391, ptr %3390)
  %3393 = load i32, ptr %3390, align 4
  %3394 = icmp eq i32 %3393, 0
  br label %continuation4520

continuation4520:                                 ; preds = %else4522, %then4521
  %3395 = phi i1 [ %3394, %else4522 ], [ true, %then4521 ]
  br i1 %3395, label %then4529, label %else4530

then4529:                                         ; preds = %continuation4520
  br label %continuation4528

else4530:                                         ; preds = %continuation4520
  %3396 = alloca i32, align 4
  %3397 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3398 = call i32 (ptr, ...) @scanf(ptr %3397, ptr %3396)
  %3399 = load i32, ptr %3396, align 4
  %3400 = icmp eq i32 %3399, 0
  br label %continuation4528

continuation4528:                                 ; preds = %else4530, %then4529
  %3401 = phi i1 [ %3400, %else4530 ], [ true, %then4529 ]
  br i1 %3401, label %then4537, label %else4538

then4537:                                         ; preds = %continuation4528
  br label %continuation4536

else4538:                                         ; preds = %continuation4528
  %3402 = alloca i32, align 4
  %3403 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3404 = call i32 (ptr, ...) @scanf(ptr %3403, ptr %3402)
  %3405 = load i32, ptr %3402, align 4
  %3406 = icmp eq i32 %3405, 0
  br label %continuation4536

continuation4536:                                 ; preds = %else4538, %then4537
  %3407 = phi i1 [ %3406, %else4538 ], [ true, %then4537 ]
  br i1 %3407, label %then4545, label %else4546

then4545:                                         ; preds = %continuation4536
  br label %continuation4544

else4546:                                         ; preds = %continuation4536
  %3408 = alloca i32, align 4
  %3409 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3410 = call i32 (ptr, ...) @scanf(ptr %3409, ptr %3408)
  %3411 = load i32, ptr %3408, align 4
  %3412 = icmp eq i32 %3411, 0
  br label %continuation4544

continuation4544:                                 ; preds = %else4546, %then4545
  %3413 = phi i1 [ %3412, %else4546 ], [ true, %then4545 ]
  br i1 %3413, label %then4553, label %else4554

then4553:                                         ; preds = %continuation4544
  br label %continuation4552

else4554:                                         ; preds = %continuation4544
  %3414 = alloca i32, align 4
  %3415 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3416 = call i32 (ptr, ...) @scanf(ptr %3415, ptr %3414)
  %3417 = load i32, ptr %3414, align 4
  %3418 = icmp eq i32 %3417, 0
  br label %continuation4552

continuation4552:                                 ; preds = %else4554, %then4553
  %3419 = phi i1 [ %3418, %else4554 ], [ true, %then4553 ]
  br i1 %3419, label %then4561, label %else4562

then4561:                                         ; preds = %continuation4552
  br label %continuation4560

else4562:                                         ; preds = %continuation4552
  %3420 = alloca i32, align 4
  %3421 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3422 = call i32 (ptr, ...) @scanf(ptr %3421, ptr %3420)
  %3423 = load i32, ptr %3420, align 4
  %3424 = icmp eq i32 %3423, 0
  br label %continuation4560

continuation4560:                                 ; preds = %else4562, %then4561
  %3425 = phi i1 [ %3424, %else4562 ], [ true, %then4561 ]
  br i1 %3425, label %then4569, label %else4570

then4569:                                         ; preds = %continuation4560
  br label %continuation4568

else4570:                                         ; preds = %continuation4560
  %3426 = alloca i32, align 4
  %3427 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3428 = call i32 (ptr, ...) @scanf(ptr %3427, ptr %3426)
  %3429 = load i32, ptr %3426, align 4
  %3430 = icmp eq i32 %3429, 0
  br label %continuation4568

continuation4568:                                 ; preds = %else4570, %then4569
  %3431 = phi i1 [ %3430, %else4570 ], [ true, %then4569 ]
  br i1 %3431, label %then4577, label %else4578

then4577:                                         ; preds = %continuation4568
  br label %continuation4576

else4578:                                         ; preds = %continuation4568
  %3432 = alloca i32, align 4
  %3433 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3434 = call i32 (ptr, ...) @scanf(ptr %3433, ptr %3432)
  %3435 = load i32, ptr %3432, align 4
  %3436 = icmp eq i32 %3435, 0
  br label %continuation4576

continuation4576:                                 ; preds = %else4578, %then4577
  %3437 = phi i1 [ %3436, %else4578 ], [ true, %then4577 ]
  br i1 %3437, label %then4585, label %else4586

then4585:                                         ; preds = %continuation4576
  br label %continuation4584

else4586:                                         ; preds = %continuation4576
  %3438 = alloca i32, align 4
  %3439 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3440 = call i32 (ptr, ...) @scanf(ptr %3439, ptr %3438)
  %3441 = load i32, ptr %3438, align 4
  %3442 = icmp eq i32 %3441, 0
  br label %continuation4584

continuation4584:                                 ; preds = %else4586, %then4585
  %3443 = phi i1 [ %3442, %else4586 ], [ true, %then4585 ]
  br i1 %3443, label %then4593, label %else4594

then4593:                                         ; preds = %continuation4584
  br label %continuation4592

else4594:                                         ; preds = %continuation4584
  %3444 = alloca i32, align 4
  %3445 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3446 = call i32 (ptr, ...) @scanf(ptr %3445, ptr %3444)
  %3447 = load i32, ptr %3444, align 4
  %3448 = icmp eq i32 %3447, 0
  br label %continuation4592

continuation4592:                                 ; preds = %else4594, %then4593
  %3449 = phi i1 [ %3448, %else4594 ], [ true, %then4593 ]
  br i1 %3449, label %then4601, label %else4602

then4601:                                         ; preds = %continuation4592
  br label %continuation4600

else4602:                                         ; preds = %continuation4592
  %3450 = alloca i32, align 4
  %3451 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3452 = call i32 (ptr, ...) @scanf(ptr %3451, ptr %3450)
  %3453 = load i32, ptr %3450, align 4
  %3454 = icmp eq i32 %3453, 0
  br label %continuation4600

continuation4600:                                 ; preds = %else4602, %then4601
  %3455 = phi i1 [ %3454, %else4602 ], [ true, %then4601 ]
  br i1 %3455, label %then4609, label %else4610

then4609:                                         ; preds = %continuation4600
  br label %continuation4608

else4610:                                         ; preds = %continuation4600
  %3456 = alloca i32, align 4
  %3457 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3458 = call i32 (ptr, ...) @scanf(ptr %3457, ptr %3456)
  %3459 = load i32, ptr %3456, align 4
  %3460 = icmp eq i32 %3459, 0
  br label %continuation4608

continuation4608:                                 ; preds = %else4610, %then4609
  %3461 = phi i1 [ %3460, %else4610 ], [ true, %then4609 ]
  br i1 %3461, label %then4617, label %else4618

then4617:                                         ; preds = %continuation4608
  br label %continuation4616

else4618:                                         ; preds = %continuation4608
  %3462 = alloca i32, align 4
  %3463 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3464 = call i32 (ptr, ...) @scanf(ptr %3463, ptr %3462)
  %3465 = load i32, ptr %3462, align 4
  %3466 = icmp eq i32 %3465, 0
  br label %continuation4616

continuation4616:                                 ; preds = %else4618, %then4617
  %3467 = phi i1 [ %3466, %else4618 ], [ true, %then4617 ]
  br i1 %3467, label %then4625, label %else4626

then4625:                                         ; preds = %continuation4616
  br label %continuation4624

else4626:                                         ; preds = %continuation4616
  %3468 = alloca i32, align 4
  %3469 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3470 = call i32 (ptr, ...) @scanf(ptr %3469, ptr %3468)
  %3471 = load i32, ptr %3468, align 4
  %3472 = icmp eq i32 %3471, 0
  br label %continuation4624

continuation4624:                                 ; preds = %else4626, %then4625
  %3473 = phi i1 [ %3472, %else4626 ], [ true, %then4625 ]
  br i1 %3473, label %then4633, label %else4634

then4633:                                         ; preds = %continuation4624
  br label %continuation4632

else4634:                                         ; preds = %continuation4624
  %3474 = alloca i32, align 4
  %3475 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3476 = call i32 (ptr, ...) @scanf(ptr %3475, ptr %3474)
  %3477 = load i32, ptr %3474, align 4
  %3478 = icmp eq i32 %3477, 0
  br label %continuation4632

continuation4632:                                 ; preds = %else4634, %then4633
  %3479 = phi i1 [ %3478, %else4634 ], [ true, %then4633 ]
  br i1 %3479, label %then4641, label %else4642

then4641:                                         ; preds = %continuation4632
  br label %continuation4640

else4642:                                         ; preds = %continuation4632
  %3480 = alloca i32, align 4
  %3481 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3482 = call i32 (ptr, ...) @scanf(ptr %3481, ptr %3480)
  %3483 = load i32, ptr %3480, align 4
  %3484 = icmp eq i32 %3483, 0
  br label %continuation4640

continuation4640:                                 ; preds = %else4642, %then4641
  %3485 = phi i1 [ %3484, %else4642 ], [ true, %then4641 ]
  br i1 %3485, label %then4649, label %else4650

then4649:                                         ; preds = %continuation4640
  br label %continuation4648

else4650:                                         ; preds = %continuation4640
  %3486 = alloca i32, align 4
  %3487 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3488 = call i32 (ptr, ...) @scanf(ptr %3487, ptr %3486)
  %3489 = load i32, ptr %3486, align 4
  %3490 = icmp eq i32 %3489, 0
  br label %continuation4648

continuation4648:                                 ; preds = %else4650, %then4649
  %3491 = phi i1 [ %3490, %else4650 ], [ true, %then4649 ]
  br i1 %3491, label %then4657, label %else4658

then4657:                                         ; preds = %continuation4648
  br label %continuation4656

else4658:                                         ; preds = %continuation4648
  %3492 = alloca i32, align 4
  %3493 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3494 = call i32 (ptr, ...) @scanf(ptr %3493, ptr %3492)
  %3495 = load i32, ptr %3492, align 4
  %3496 = icmp eq i32 %3495, 0
  br label %continuation4656

continuation4656:                                 ; preds = %else4658, %then4657
  %3497 = phi i1 [ %3496, %else4658 ], [ true, %then4657 ]
  br i1 %3497, label %then4665, label %else4666

then4665:                                         ; preds = %continuation4656
  br label %continuation4664

else4666:                                         ; preds = %continuation4656
  %3498 = alloca i32, align 4
  %3499 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3500 = call i32 (ptr, ...) @scanf(ptr %3499, ptr %3498)
  %3501 = load i32, ptr %3498, align 4
  %3502 = icmp eq i32 %3501, 0
  br label %continuation4664

continuation4664:                                 ; preds = %else4666, %then4665
  %3503 = phi i1 [ %3502, %else4666 ], [ true, %then4665 ]
  br i1 %3503, label %then4673, label %else4674

then4673:                                         ; preds = %continuation4664
  br label %continuation4672

else4674:                                         ; preds = %continuation4664
  %3504 = alloca i32, align 4
  %3505 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3506 = call i32 (ptr, ...) @scanf(ptr %3505, ptr %3504)
  %3507 = load i32, ptr %3504, align 4
  %3508 = icmp eq i32 %3507, 0
  br label %continuation4672

continuation4672:                                 ; preds = %else4674, %then4673
  %3509 = phi i1 [ %3508, %else4674 ], [ true, %then4673 ]
  br i1 %3509, label %then4681, label %else4682

then4681:                                         ; preds = %continuation4672
  br label %continuation4680

else4682:                                         ; preds = %continuation4672
  %3510 = alloca i32, align 4
  %3511 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3512 = call i32 (ptr, ...) @scanf(ptr %3511, ptr %3510)
  %3513 = load i32, ptr %3510, align 4
  %3514 = icmp eq i32 %3513, 0
  br label %continuation4680

continuation4680:                                 ; preds = %else4682, %then4681
  %3515 = phi i1 [ %3514, %else4682 ], [ true, %then4681 ]
  br i1 %3515, label %then4689, label %else4690

then4689:                                         ; preds = %continuation4680
  br label %continuation4688

else4690:                                         ; preds = %continuation4680
  %3516 = alloca i32, align 4
  %3517 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3518 = call i32 (ptr, ...) @scanf(ptr %3517, ptr %3516)
  %3519 = load i32, ptr %3516, align 4
  %3520 = icmp eq i32 %3519, 0
  br label %continuation4688

continuation4688:                                 ; preds = %else4690, %then4689
  %3521 = phi i1 [ %3520, %else4690 ], [ true, %then4689 ]
  br i1 %3521, label %then4697, label %else4698

then4697:                                         ; preds = %continuation4688
  br label %continuation4696

else4698:                                         ; preds = %continuation4688
  %3522 = alloca i32, align 4
  %3523 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3524 = call i32 (ptr, ...) @scanf(ptr %3523, ptr %3522)
  %3525 = load i32, ptr %3522, align 4
  %3526 = icmp eq i32 %3525, 0
  br label %continuation4696

continuation4696:                                 ; preds = %else4698, %then4697
  %3527 = phi i1 [ %3526, %else4698 ], [ true, %then4697 ]
  br i1 %3527, label %then4705, label %else4706

then4705:                                         ; preds = %continuation4696
  br label %continuation4704

else4706:                                         ; preds = %continuation4696
  %3528 = alloca i32, align 4
  %3529 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3530 = call i32 (ptr, ...) @scanf(ptr %3529, ptr %3528)
  %3531 = load i32, ptr %3528, align 4
  %3532 = icmp eq i32 %3531, 0
  br label %continuation4704

continuation4704:                                 ; preds = %else4706, %then4705
  %3533 = phi i1 [ %3532, %else4706 ], [ true, %then4705 ]
  br i1 %3533, label %then4713, label %else4714

then4713:                                         ; preds = %continuation4704
  br label %continuation4712

else4714:                                         ; preds = %continuation4704
  %3534 = alloca i32, align 4
  %3535 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3536 = call i32 (ptr, ...) @scanf(ptr %3535, ptr %3534)
  %3537 = load i32, ptr %3534, align 4
  %3538 = icmp eq i32 %3537, 0
  br label %continuation4712

continuation4712:                                 ; preds = %else4714, %then4713
  %3539 = phi i1 [ %3538, %else4714 ], [ true, %then4713 ]
  br i1 %3539, label %then4721, label %else4722

then4721:                                         ; preds = %continuation4712
  br label %continuation4720

else4722:                                         ; preds = %continuation4712
  %3540 = alloca i32, align 4
  %3541 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3542 = call i32 (ptr, ...) @scanf(ptr %3541, ptr %3540)
  %3543 = load i32, ptr %3540, align 4
  %3544 = icmp eq i32 %3543, 0
  br label %continuation4720

continuation4720:                                 ; preds = %else4722, %then4721
  %3545 = phi i1 [ %3544, %else4722 ], [ true, %then4721 ]
  br i1 %3545, label %then4729, label %else4730

then4729:                                         ; preds = %continuation4720
  br label %continuation4728

else4730:                                         ; preds = %continuation4720
  %3546 = alloca i32, align 4
  %3547 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3548 = call i32 (ptr, ...) @scanf(ptr %3547, ptr %3546)
  %3549 = load i32, ptr %3546, align 4
  %3550 = icmp eq i32 %3549, 0
  br label %continuation4728

continuation4728:                                 ; preds = %else4730, %then4729
  %3551 = phi i1 [ %3550, %else4730 ], [ true, %then4729 ]
  br i1 %3551, label %then4737, label %else4738

then4737:                                         ; preds = %continuation4728
  br label %continuation4736

else4738:                                         ; preds = %continuation4728
  %3552 = alloca i32, align 4
  %3553 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3554 = call i32 (ptr, ...) @scanf(ptr %3553, ptr %3552)
  %3555 = load i32, ptr %3552, align 4
  %3556 = icmp eq i32 %3555, 0
  br label %continuation4736

continuation4736:                                 ; preds = %else4738, %then4737
  %3557 = phi i1 [ %3556, %else4738 ], [ true, %then4737 ]
  br i1 %3557, label %then4745, label %else4746

then4745:                                         ; preds = %continuation4736
  br label %continuation4744

else4746:                                         ; preds = %continuation4736
  %3558 = alloca i32, align 4
  %3559 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3560 = call i32 (ptr, ...) @scanf(ptr %3559, ptr %3558)
  %3561 = load i32, ptr %3558, align 4
  %3562 = icmp eq i32 %3561, 0
  br label %continuation4744

continuation4744:                                 ; preds = %else4746, %then4745
  %3563 = phi i1 [ %3562, %else4746 ], [ true, %then4745 ]
  br i1 %3563, label %then4753, label %else4754

then4753:                                         ; preds = %continuation4744
  br label %continuation4752

else4754:                                         ; preds = %continuation4744
  %3564 = alloca i32, align 4
  %3565 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3566 = call i32 (ptr, ...) @scanf(ptr %3565, ptr %3564)
  %3567 = load i32, ptr %3564, align 4
  %3568 = icmp eq i32 %3567, 0
  br label %continuation4752

continuation4752:                                 ; preds = %else4754, %then4753
  %3569 = phi i1 [ %3568, %else4754 ], [ true, %then4753 ]
  br i1 %3569, label %then4761, label %else4762

then4761:                                         ; preds = %continuation4752
  br label %continuation4760

else4762:                                         ; preds = %continuation4752
  %3570 = alloca i32, align 4
  %3571 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3572 = call i32 (ptr, ...) @scanf(ptr %3571, ptr %3570)
  %3573 = load i32, ptr %3570, align 4
  %3574 = icmp eq i32 %3573, 0
  br label %continuation4760

continuation4760:                                 ; preds = %else4762, %then4761
  %3575 = phi i1 [ %3574, %else4762 ], [ true, %then4761 ]
  br i1 %3575, label %then4769, label %else4770

then4769:                                         ; preds = %continuation4760
  br label %continuation4768

else4770:                                         ; preds = %continuation4760
  %3576 = alloca i32, align 4
  %3577 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3578 = call i32 (ptr, ...) @scanf(ptr %3577, ptr %3576)
  %3579 = load i32, ptr %3576, align 4
  %3580 = icmp eq i32 %3579, 0
  br label %continuation4768

continuation4768:                                 ; preds = %else4770, %then4769
  %3581 = phi i1 [ %3580, %else4770 ], [ true, %then4769 ]
  br i1 %3581, label %then4777, label %else4778

then4777:                                         ; preds = %continuation4768
  br label %continuation4776

else4778:                                         ; preds = %continuation4768
  %3582 = alloca i32, align 4
  %3583 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3584 = call i32 (ptr, ...) @scanf(ptr %3583, ptr %3582)
  %3585 = load i32, ptr %3582, align 4
  %3586 = icmp eq i32 %3585, 0
  br label %continuation4776

continuation4776:                                 ; preds = %else4778, %then4777
  %3587 = phi i1 [ %3586, %else4778 ], [ true, %then4777 ]
  br i1 %3587, label %then4785, label %else4786

then4785:                                         ; preds = %continuation4776
  br label %continuation4784

else4786:                                         ; preds = %continuation4776
  %3588 = alloca i32, align 4
  %3589 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3590 = call i32 (ptr, ...) @scanf(ptr %3589, ptr %3588)
  %3591 = load i32, ptr %3588, align 4
  %3592 = icmp eq i32 %3591, 0
  br label %continuation4784

continuation4784:                                 ; preds = %else4786, %then4785
  %3593 = phi i1 [ %3592, %else4786 ], [ true, %then4785 ]
  br i1 %3593, label %then4793, label %else4794

then4793:                                         ; preds = %continuation4784
  br label %continuation4792

else4794:                                         ; preds = %continuation4784
  %3594 = alloca i32, align 4
  %3595 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3596 = call i32 (ptr, ...) @scanf(ptr %3595, ptr %3594)
  %3597 = load i32, ptr %3594, align 4
  %3598 = icmp eq i32 %3597, 0
  br label %continuation4792

continuation4792:                                 ; preds = %else4794, %then4793
  %3599 = phi i1 [ %3598, %else4794 ], [ true, %then4793 ]
  br i1 %3599, label %then4801, label %else4802

then4801:                                         ; preds = %continuation4792
  br label %continuation4800

else4802:                                         ; preds = %continuation4792
  %3600 = alloca i32, align 4
  %3601 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3602 = call i32 (ptr, ...) @scanf(ptr %3601, ptr %3600)
  %3603 = load i32, ptr %3600, align 4
  %3604 = icmp eq i32 %3603, 0
  br label %continuation4800

continuation4800:                                 ; preds = %else4802, %then4801
  %3605 = phi i1 [ %3604, %else4802 ], [ true, %then4801 ]
  br i1 %3605, label %then4809, label %else4810

then4809:                                         ; preds = %continuation4800
  br label %continuation4808

else4810:                                         ; preds = %continuation4800
  %3606 = alloca i32, align 4
  %3607 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3608 = call i32 (ptr, ...) @scanf(ptr %3607, ptr %3606)
  %3609 = load i32, ptr %3606, align 4
  %3610 = icmp eq i32 %3609, 0
  br label %continuation4808

continuation4808:                                 ; preds = %else4810, %then4809
  %3611 = phi i1 [ %3610, %else4810 ], [ true, %then4809 ]
  br i1 %3611, label %then4817, label %else4818

then4817:                                         ; preds = %continuation4808
  br label %continuation4816

else4818:                                         ; preds = %continuation4808
  %3612 = alloca i32, align 4
  %3613 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3614 = call i32 (ptr, ...) @scanf(ptr %3613, ptr %3612)
  %3615 = load i32, ptr %3612, align 4
  %3616 = icmp eq i32 %3615, 0
  br label %continuation4816

continuation4816:                                 ; preds = %else4818, %then4817
  %3617 = phi i1 [ %3616, %else4818 ], [ true, %then4817 ]
  br i1 %3617, label %then4825, label %else4826

then4825:                                         ; preds = %continuation4816
  br label %continuation4824

else4826:                                         ; preds = %continuation4816
  %3618 = alloca i32, align 4
  %3619 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3620 = call i32 (ptr, ...) @scanf(ptr %3619, ptr %3618)
  %3621 = load i32, ptr %3618, align 4
  %3622 = icmp eq i32 %3621, 0
  br label %continuation4824

continuation4824:                                 ; preds = %else4826, %then4825
  %3623 = phi i1 [ %3622, %else4826 ], [ true, %then4825 ]
  br i1 %3623, label %then4833, label %else4834

then4833:                                         ; preds = %continuation4824
  br label %continuation4832

else4834:                                         ; preds = %continuation4824
  %3624 = alloca i32, align 4
  %3625 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3626 = call i32 (ptr, ...) @scanf(ptr %3625, ptr %3624)
  %3627 = load i32, ptr %3624, align 4
  %3628 = icmp eq i32 %3627, 0
  br label %continuation4832

continuation4832:                                 ; preds = %else4834, %then4833
  %3629 = phi i1 [ %3628, %else4834 ], [ true, %then4833 ]
  br i1 %3629, label %then4841, label %else4842

then4841:                                         ; preds = %continuation4832
  br label %continuation4840

else4842:                                         ; preds = %continuation4832
  %3630 = alloca i32, align 4
  %3631 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3632 = call i32 (ptr, ...) @scanf(ptr %3631, ptr %3630)
  %3633 = load i32, ptr %3630, align 4
  %3634 = icmp eq i32 %3633, 0
  br label %continuation4840

continuation4840:                                 ; preds = %else4842, %then4841
  %3635 = phi i1 [ %3634, %else4842 ], [ true, %then4841 ]
  br i1 %3635, label %then4849, label %else4850

then4849:                                         ; preds = %continuation4840
  br label %continuation4848

else4850:                                         ; preds = %continuation4840
  %3636 = alloca i32, align 4
  %3637 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3638 = call i32 (ptr, ...) @scanf(ptr %3637, ptr %3636)
  %3639 = load i32, ptr %3636, align 4
  %3640 = icmp eq i32 %3639, 0
  br label %continuation4848

continuation4848:                                 ; preds = %else4850, %then4849
  %3641 = phi i1 [ %3640, %else4850 ], [ true, %then4849 ]
  br i1 %3641, label %then4857, label %else4858

then4857:                                         ; preds = %continuation4848
  br label %continuation4856

else4858:                                         ; preds = %continuation4848
  %3642 = alloca i32, align 4
  %3643 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3644 = call i32 (ptr, ...) @scanf(ptr %3643, ptr %3642)
  %3645 = load i32, ptr %3642, align 4
  %3646 = icmp eq i32 %3645, 0
  br label %continuation4856

continuation4856:                                 ; preds = %else4858, %then4857
  %3647 = phi i1 [ %3646, %else4858 ], [ true, %then4857 ]
  br i1 %3647, label %then4865, label %else4866

then4865:                                         ; preds = %continuation4856
  br label %continuation4864

else4866:                                         ; preds = %continuation4856
  %3648 = alloca i32, align 4
  %3649 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3650 = call i32 (ptr, ...) @scanf(ptr %3649, ptr %3648)
  %3651 = load i32, ptr %3648, align 4
  %3652 = icmp eq i32 %3651, 0
  br label %continuation4864

continuation4864:                                 ; preds = %else4866, %then4865
  %3653 = phi i1 [ %3652, %else4866 ], [ true, %then4865 ]
  br i1 %3653, label %then4873, label %else4874

then4873:                                         ; preds = %continuation4864
  br label %continuation4872

else4874:                                         ; preds = %continuation4864
  %3654 = alloca i32, align 4
  %3655 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3656 = call i32 (ptr, ...) @scanf(ptr %3655, ptr %3654)
  %3657 = load i32, ptr %3654, align 4
  %3658 = icmp eq i32 %3657, 0
  br label %continuation4872

continuation4872:                                 ; preds = %else4874, %then4873
  %3659 = phi i1 [ %3658, %else4874 ], [ true, %then4873 ]
  br i1 %3659, label %then4881, label %else4882

then4881:                                         ; preds = %continuation4872
  br label %continuation4880

else4882:                                         ; preds = %continuation4872
  %3660 = alloca i32, align 4
  %3661 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3662 = call i32 (ptr, ...) @scanf(ptr %3661, ptr %3660)
  %3663 = load i32, ptr %3660, align 4
  %3664 = icmp eq i32 %3663, 0
  br label %continuation4880

continuation4880:                                 ; preds = %else4882, %then4881
  %3665 = phi i1 [ %3664, %else4882 ], [ true, %then4881 ]
  br i1 %3665, label %then4889, label %else4890

then4889:                                         ; preds = %continuation4880
  br label %continuation4888

else4890:                                         ; preds = %continuation4880
  %3666 = alloca i32, align 4
  %3667 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3668 = call i32 (ptr, ...) @scanf(ptr %3667, ptr %3666)
  %3669 = load i32, ptr %3666, align 4
  %3670 = icmp eq i32 %3669, 0
  br label %continuation4888

continuation4888:                                 ; preds = %else4890, %then4889
  %3671 = phi i1 [ %3670, %else4890 ], [ true, %then4889 ]
  br i1 %3671, label %then4897, label %else4898

then4897:                                         ; preds = %continuation4888
  br label %continuation4896

else4898:                                         ; preds = %continuation4888
  %3672 = alloca i32, align 4
  %3673 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3674 = call i32 (ptr, ...) @scanf(ptr %3673, ptr %3672)
  %3675 = load i32, ptr %3672, align 4
  %3676 = icmp eq i32 %3675, 0
  br label %continuation4896

continuation4896:                                 ; preds = %else4898, %then4897
  %3677 = phi i1 [ %3676, %else4898 ], [ true, %then4897 ]
  br i1 %3677, label %then4905, label %else4906

then4905:                                         ; preds = %continuation4896
  br label %continuation4904

else4906:                                         ; preds = %continuation4896
  %3678 = alloca i32, align 4
  %3679 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3680 = call i32 (ptr, ...) @scanf(ptr %3679, ptr %3678)
  %3681 = load i32, ptr %3678, align 4
  %3682 = icmp eq i32 %3681, 0
  br label %continuation4904

continuation4904:                                 ; preds = %else4906, %then4905
  %3683 = phi i1 [ %3682, %else4906 ], [ true, %then4905 ]
  br i1 %3683, label %then4913, label %else4914

then4913:                                         ; preds = %continuation4904
  br label %continuation4912

else4914:                                         ; preds = %continuation4904
  %3684 = alloca i32, align 4
  %3685 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3686 = call i32 (ptr, ...) @scanf(ptr %3685, ptr %3684)
  %3687 = load i32, ptr %3684, align 4
  %3688 = icmp eq i32 %3687, 0
  br label %continuation4912

continuation4912:                                 ; preds = %else4914, %then4913
  %3689 = phi i1 [ %3688, %else4914 ], [ true, %then4913 ]
  br i1 %3689, label %then4921, label %else4922

then4921:                                         ; preds = %continuation4912
  br label %continuation4920

else4922:                                         ; preds = %continuation4912
  %3690 = alloca i32, align 4
  %3691 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3692 = call i32 (ptr, ...) @scanf(ptr %3691, ptr %3690)
  %3693 = load i32, ptr %3690, align 4
  %3694 = icmp eq i32 %3693, 0
  br label %continuation4920

continuation4920:                                 ; preds = %else4922, %then4921
  %3695 = phi i1 [ %3694, %else4922 ], [ true, %then4921 ]
  br i1 %3695, label %then4929, label %else4930

then4929:                                         ; preds = %continuation4920
  br label %continuation4928

else4930:                                         ; preds = %continuation4920
  %3696 = alloca i32, align 4
  %3697 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3698 = call i32 (ptr, ...) @scanf(ptr %3697, ptr %3696)
  %3699 = load i32, ptr %3696, align 4
  %3700 = icmp eq i32 %3699, 0
  br label %continuation4928

continuation4928:                                 ; preds = %else4930, %then4929
  %3701 = phi i1 [ %3700, %else4930 ], [ true, %then4929 ]
  br i1 %3701, label %then4937, label %else4938

then4937:                                         ; preds = %continuation4928
  br label %continuation4936

else4938:                                         ; preds = %continuation4928
  %3702 = alloca i32, align 4
  %3703 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3704 = call i32 (ptr, ...) @scanf(ptr %3703, ptr %3702)
  %3705 = load i32, ptr %3702, align 4
  %3706 = icmp eq i32 %3705, 0
  br label %continuation4936

continuation4936:                                 ; preds = %else4938, %then4937
  %3707 = phi i1 [ %3706, %else4938 ], [ true, %then4937 ]
  br i1 %3707, label %then4945, label %else4946

then4945:                                         ; preds = %continuation4936
  br label %continuation4944

else4946:                                         ; preds = %continuation4936
  %3708 = alloca i32, align 4
  %3709 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3710 = call i32 (ptr, ...) @scanf(ptr %3709, ptr %3708)
  %3711 = load i32, ptr %3708, align 4
  %3712 = icmp eq i32 %3711, 0
  br label %continuation4944

continuation4944:                                 ; preds = %else4946, %then4945
  %3713 = phi i1 [ %3712, %else4946 ], [ true, %then4945 ]
  br i1 %3713, label %then4953, label %else4954

then4953:                                         ; preds = %continuation4944
  br label %continuation4952

else4954:                                         ; preds = %continuation4944
  %3714 = alloca i32, align 4
  %3715 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3716 = call i32 (ptr, ...) @scanf(ptr %3715, ptr %3714)
  %3717 = load i32, ptr %3714, align 4
  %3718 = icmp eq i32 %3717, 0
  br label %continuation4952

continuation4952:                                 ; preds = %else4954, %then4953
  %3719 = phi i1 [ %3718, %else4954 ], [ true, %then4953 ]
  br i1 %3719, label %then4961, label %else4962

then4961:                                         ; preds = %continuation4952
  br label %continuation4960

else4962:                                         ; preds = %continuation4952
  %3720 = alloca i32, align 4
  %3721 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3722 = call i32 (ptr, ...) @scanf(ptr %3721, ptr %3720)
  %3723 = load i32, ptr %3720, align 4
  %3724 = icmp eq i32 %3723, 0
  br label %continuation4960

continuation4960:                                 ; preds = %else4962, %then4961
  %3725 = phi i1 [ %3724, %else4962 ], [ true, %then4961 ]
  br i1 %3725, label %then4969, label %else4970

then4969:                                         ; preds = %continuation4960
  br label %continuation4968

else4970:                                         ; preds = %continuation4960
  %3726 = alloca i32, align 4
  %3727 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3728 = call i32 (ptr, ...) @scanf(ptr %3727, ptr %3726)
  %3729 = load i32, ptr %3726, align 4
  %3730 = icmp eq i32 %3729, 0
  br label %continuation4968

continuation4968:                                 ; preds = %else4970, %then4969
  %3731 = phi i1 [ %3730, %else4970 ], [ true, %then4969 ]
  br i1 %3731, label %then4977, label %else4978

then4977:                                         ; preds = %continuation4968
  br label %continuation4976

else4978:                                         ; preds = %continuation4968
  %3732 = alloca i32, align 4
  %3733 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3734 = call i32 (ptr, ...) @scanf(ptr %3733, ptr %3732)
  %3735 = load i32, ptr %3732, align 4
  %3736 = icmp eq i32 %3735, 0
  br label %continuation4976

continuation4976:                                 ; preds = %else4978, %then4977
  %3737 = phi i1 [ %3736, %else4978 ], [ true, %then4977 ]
  br i1 %3737, label %then4985, label %else4986

then4985:                                         ; preds = %continuation4976
  br label %continuation4984

else4986:                                         ; preds = %continuation4976
  %3738 = alloca i32, align 4
  %3739 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3740 = call i32 (ptr, ...) @scanf(ptr %3739, ptr %3738)
  %3741 = load i32, ptr %3738, align 4
  %3742 = icmp eq i32 %3741, 0
  br label %continuation4984

continuation4984:                                 ; preds = %else4986, %then4985
  %3743 = phi i1 [ %3742, %else4986 ], [ true, %then4985 ]
  br i1 %3743, label %then4993, label %else4994

then4993:                                         ; preds = %continuation4984
  br label %continuation4992

else4994:                                         ; preds = %continuation4984
  %3744 = alloca i32, align 4
  %3745 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3746 = call i32 (ptr, ...) @scanf(ptr %3745, ptr %3744)
  %3747 = load i32, ptr %3744, align 4
  %3748 = icmp eq i32 %3747, 0
  br label %continuation4992

continuation4992:                                 ; preds = %else4994, %then4993
  %3749 = phi i1 [ %3748, %else4994 ], [ true, %then4993 ]
  br i1 %3749, label %then5001, label %else5002

then5001:                                         ; preds = %continuation4992
  br label %continuation5000

else5002:                                         ; preds = %continuation4992
  %3750 = alloca i32, align 4
  %3751 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3752 = call i32 (ptr, ...) @scanf(ptr %3751, ptr %3750)
  %3753 = load i32, ptr %3750, align 4
  %3754 = icmp eq i32 %3753, 0
  br label %continuation5000

continuation5000:                                 ; preds = %else5002, %then5001
  %3755 = phi i1 [ %3754, %else5002 ], [ true, %then5001 ]
  br i1 %3755, label %then5009, label %else5010

then5009:                                         ; preds = %continuation5000
  br label %continuation5008

else5010:                                         ; preds = %continuation5000
  %3756 = alloca i32, align 4
  %3757 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3758 = call i32 (ptr, ...) @scanf(ptr %3757, ptr %3756)
  %3759 = load i32, ptr %3756, align 4
  %3760 = icmp eq i32 %3759, 0
  br label %continuation5008

continuation5008:                                 ; preds = %else5010, %then5009
  %3761 = phi i1 [ %3760, %else5010 ], [ true, %then5009 ]
  br i1 %3761, label %then5017, label %else5018

then5017:                                         ; preds = %continuation5008
  br label %continuation5016

else5018:                                         ; preds = %continuation5008
  %3762 = alloca i32, align 4
  %3763 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3764 = call i32 (ptr, ...) @scanf(ptr %3763, ptr %3762)
  %3765 = load i32, ptr %3762, align 4
  %3766 = icmp eq i32 %3765, 0
  br label %continuation5016

continuation5016:                                 ; preds = %else5018, %then5017
  %3767 = phi i1 [ %3766, %else5018 ], [ true, %then5017 ]
  br i1 %3767, label %then5025, label %else5026

then5025:                                         ; preds = %continuation5016
  br label %continuation5024

else5026:                                         ; preds = %continuation5016
  %3768 = alloca i32, align 4
  %3769 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3770 = call i32 (ptr, ...) @scanf(ptr %3769, ptr %3768)
  %3771 = load i32, ptr %3768, align 4
  %3772 = icmp eq i32 %3771, 0
  br label %continuation5024

continuation5024:                                 ; preds = %else5026, %then5025
  %3773 = phi i1 [ %3772, %else5026 ], [ true, %then5025 ]
  br i1 %3773, label %then5033, label %else5034

then5033:                                         ; preds = %continuation5024
  br label %continuation5032

else5034:                                         ; preds = %continuation5024
  %3774 = alloca i32, align 4
  %3775 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3776 = call i32 (ptr, ...) @scanf(ptr %3775, ptr %3774)
  %3777 = load i32, ptr %3774, align 4
  %3778 = icmp eq i32 %3777, 0
  br label %continuation5032

continuation5032:                                 ; preds = %else5034, %then5033
  %3779 = phi i1 [ %3778, %else5034 ], [ true, %then5033 ]
  br i1 %3779, label %then5041, label %else5042

then5041:                                         ; preds = %continuation5032
  br label %continuation5040

else5042:                                         ; preds = %continuation5032
  %3780 = alloca i32, align 4
  %3781 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3782 = call i32 (ptr, ...) @scanf(ptr %3781, ptr %3780)
  %3783 = load i32, ptr %3780, align 4
  %3784 = icmp eq i32 %3783, 0
  br label %continuation5040

continuation5040:                                 ; preds = %else5042, %then5041
  %3785 = phi i1 [ %3784, %else5042 ], [ true, %then5041 ]
  br i1 %3785, label %then5049, label %else5050

then5049:                                         ; preds = %continuation5040
  br label %continuation5048

else5050:                                         ; preds = %continuation5040
  %3786 = alloca i32, align 4
  %3787 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3788 = call i32 (ptr, ...) @scanf(ptr %3787, ptr %3786)
  %3789 = load i32, ptr %3786, align 4
  %3790 = icmp eq i32 %3789, 0
  br label %continuation5048

continuation5048:                                 ; preds = %else5050, %then5049
  %3791 = phi i1 [ %3790, %else5050 ], [ true, %then5049 ]
  br i1 %3791, label %then5057, label %else5058

then5057:                                         ; preds = %continuation5048
  br label %continuation5056

else5058:                                         ; preds = %continuation5048
  %3792 = alloca i32, align 4
  %3793 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3794 = call i32 (ptr, ...) @scanf(ptr %3793, ptr %3792)
  %3795 = load i32, ptr %3792, align 4
  %3796 = icmp eq i32 %3795, 0
  br label %continuation5056

continuation5056:                                 ; preds = %else5058, %then5057
  %3797 = phi i1 [ %3796, %else5058 ], [ true, %then5057 ]
  br i1 %3797, label %then5065, label %else5066

then5065:                                         ; preds = %continuation5056
  br label %continuation5064

else5066:                                         ; preds = %continuation5056
  %3798 = alloca i32, align 4
  %3799 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3800 = call i32 (ptr, ...) @scanf(ptr %3799, ptr %3798)
  %3801 = load i32, ptr %3798, align 4
  %3802 = icmp eq i32 %3801, 0
  br label %continuation5064

continuation5064:                                 ; preds = %else5066, %then5065
  %3803 = phi i1 [ %3802, %else5066 ], [ true, %then5065 ]
  br i1 %3803, label %then5073, label %else5074

then5073:                                         ; preds = %continuation5064
  br label %continuation5072

else5074:                                         ; preds = %continuation5064
  %3804 = alloca i32, align 4
  %3805 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3806 = call i32 (ptr, ...) @scanf(ptr %3805, ptr %3804)
  %3807 = load i32, ptr %3804, align 4
  %3808 = icmp eq i32 %3807, 0
  br label %continuation5072

continuation5072:                                 ; preds = %else5074, %then5073
  %3809 = phi i1 [ %3808, %else5074 ], [ true, %then5073 ]
  br i1 %3809, label %then5081, label %else5082

then5081:                                         ; preds = %continuation5072
  br label %continuation5080

else5082:                                         ; preds = %continuation5072
  %3810 = alloca i32, align 4
  %3811 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3812 = call i32 (ptr, ...) @scanf(ptr %3811, ptr %3810)
  %3813 = load i32, ptr %3810, align 4
  %3814 = icmp eq i32 %3813, 0
  br label %continuation5080

continuation5080:                                 ; preds = %else5082, %then5081
  %3815 = phi i1 [ %3814, %else5082 ], [ true, %then5081 ]
  br i1 %3815, label %then5089, label %else5090

then5089:                                         ; preds = %continuation5080
  br label %continuation5088

else5090:                                         ; preds = %continuation5080
  %3816 = alloca i32, align 4
  %3817 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3818 = call i32 (ptr, ...) @scanf(ptr %3817, ptr %3816)
  %3819 = load i32, ptr %3816, align 4
  %3820 = icmp eq i32 %3819, 0
  br label %continuation5088

continuation5088:                                 ; preds = %else5090, %then5089
  %3821 = phi i1 [ %3820, %else5090 ], [ true, %then5089 ]
  br i1 %3821, label %then5097, label %else5098

then5097:                                         ; preds = %continuation5088
  br label %continuation5096

else5098:                                         ; preds = %continuation5088
  %3822 = alloca i32, align 4
  %3823 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3824 = call i32 (ptr, ...) @scanf(ptr %3823, ptr %3822)
  %3825 = load i32, ptr %3822, align 4
  %3826 = icmp eq i32 %3825, 0
  br label %continuation5096

continuation5096:                                 ; preds = %else5098, %then5097
  %3827 = phi i1 [ %3826, %else5098 ], [ true, %then5097 ]
  br i1 %3827, label %then5105, label %else5106

then5105:                                         ; preds = %continuation5096
  br label %continuation5104

else5106:                                         ; preds = %continuation5096
  %3828 = alloca i32, align 4
  %3829 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3830 = call i32 (ptr, ...) @scanf(ptr %3829, ptr %3828)
  %3831 = load i32, ptr %3828, align 4
  %3832 = icmp eq i32 %3831, 0
  br label %continuation5104

continuation5104:                                 ; preds = %else5106, %then5105
  %3833 = phi i1 [ %3832, %else5106 ], [ true, %then5105 ]
  br i1 %3833, label %then5113, label %else5114

then5113:                                         ; preds = %continuation5104
  br label %continuation5112

else5114:                                         ; preds = %continuation5104
  %3834 = alloca i32, align 4
  %3835 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3836 = call i32 (ptr, ...) @scanf(ptr %3835, ptr %3834)
  %3837 = load i32, ptr %3834, align 4
  %3838 = icmp eq i32 %3837, 0
  br label %continuation5112

continuation5112:                                 ; preds = %else5114, %then5113
  %3839 = phi i1 [ %3838, %else5114 ], [ true, %then5113 ]
  br i1 %3839, label %then5121, label %else5122

then5121:                                         ; preds = %continuation5112
  br label %continuation5120

else5122:                                         ; preds = %continuation5112
  %3840 = alloca i32, align 4
  %3841 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3842 = call i32 (ptr, ...) @scanf(ptr %3841, ptr %3840)
  %3843 = load i32, ptr %3840, align 4
  %3844 = icmp eq i32 %3843, 0
  br label %continuation5120

continuation5120:                                 ; preds = %else5122, %then5121
  %3845 = phi i1 [ %3844, %else5122 ], [ true, %then5121 ]
  br i1 %3845, label %then5129, label %else5130

then5129:                                         ; preds = %continuation5120
  br label %continuation5128

else5130:                                         ; preds = %continuation5120
  %3846 = alloca i32, align 4
  %3847 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3848 = call i32 (ptr, ...) @scanf(ptr %3847, ptr %3846)
  %3849 = load i32, ptr %3846, align 4
  %3850 = icmp eq i32 %3849, 0
  br label %continuation5128

continuation5128:                                 ; preds = %else5130, %then5129
  %3851 = phi i1 [ %3850, %else5130 ], [ true, %then5129 ]
  br i1 %3851, label %then5137, label %else5138

then5137:                                         ; preds = %continuation5128
  br label %continuation5136

else5138:                                         ; preds = %continuation5128
  %3852 = alloca i32, align 4
  %3853 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3854 = call i32 (ptr, ...) @scanf(ptr %3853, ptr %3852)
  %3855 = load i32, ptr %3852, align 4
  %3856 = icmp eq i32 %3855, 0
  br label %continuation5136

continuation5136:                                 ; preds = %else5138, %then5137
  %3857 = phi i1 [ %3856, %else5138 ], [ true, %then5137 ]
  br i1 %3857, label %then5145, label %else5146

then5145:                                         ; preds = %continuation5136
  br label %continuation5144

else5146:                                         ; preds = %continuation5136
  %3858 = alloca i32, align 4
  %3859 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3860 = call i32 (ptr, ...) @scanf(ptr %3859, ptr %3858)
  %3861 = load i32, ptr %3858, align 4
  %3862 = icmp eq i32 %3861, 0
  br label %continuation5144

continuation5144:                                 ; preds = %else5146, %then5145
  %3863 = phi i1 [ %3862, %else5146 ], [ true, %then5145 ]
  br i1 %3863, label %then5153, label %else5154

then5153:                                         ; preds = %continuation5144
  br label %continuation5152

else5154:                                         ; preds = %continuation5144
  %3864 = alloca i32, align 4
  %3865 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3866 = call i32 (ptr, ...) @scanf(ptr %3865, ptr %3864)
  %3867 = load i32, ptr %3864, align 4
  %3868 = icmp eq i32 %3867, 0
  br label %continuation5152

continuation5152:                                 ; preds = %else5154, %then5153
  %3869 = phi i1 [ %3868, %else5154 ], [ true, %then5153 ]
  br i1 %3869, label %then5161, label %else5162

then5161:                                         ; preds = %continuation5152
  br label %continuation5160

else5162:                                         ; preds = %continuation5152
  %3870 = alloca i32, align 4
  %3871 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3872 = call i32 (ptr, ...) @scanf(ptr %3871, ptr %3870)
  %3873 = load i32, ptr %3870, align 4
  %3874 = icmp eq i32 %3873, 0
  br label %continuation5160

continuation5160:                                 ; preds = %else5162, %then5161
  %3875 = phi i1 [ %3874, %else5162 ], [ true, %then5161 ]
  br i1 %3875, label %then5169, label %else5170

then5169:                                         ; preds = %continuation5160
  br label %continuation5168

else5170:                                         ; preds = %continuation5160
  %3876 = alloca i32, align 4
  %3877 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3878 = call i32 (ptr, ...) @scanf(ptr %3877, ptr %3876)
  %3879 = load i32, ptr %3876, align 4
  %3880 = icmp eq i32 %3879, 0
  br label %continuation5168

continuation5168:                                 ; preds = %else5170, %then5169
  %3881 = phi i1 [ %3880, %else5170 ], [ true, %then5169 ]
  br i1 %3881, label %then5177, label %else5178

then5177:                                         ; preds = %continuation5168
  br label %continuation5176

else5178:                                         ; preds = %continuation5168
  %3882 = alloca i32, align 4
  %3883 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3884 = call i32 (ptr, ...) @scanf(ptr %3883, ptr %3882)
  %3885 = load i32, ptr %3882, align 4
  %3886 = icmp eq i32 %3885, 0
  br label %continuation5176

continuation5176:                                 ; preds = %else5178, %then5177
  %3887 = phi i1 [ %3886, %else5178 ], [ true, %then5177 ]
  br i1 %3887, label %then5185, label %else5186

then5185:                                         ; preds = %continuation5176
  br label %continuation5184

else5186:                                         ; preds = %continuation5176
  %3888 = alloca i32, align 4
  %3889 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3890 = call i32 (ptr, ...) @scanf(ptr %3889, ptr %3888)
  %3891 = load i32, ptr %3888, align 4
  %3892 = icmp eq i32 %3891, 0
  br label %continuation5184

continuation5184:                                 ; preds = %else5186, %then5185
  %3893 = phi i1 [ %3892, %else5186 ], [ true, %then5185 ]
  br i1 %3893, label %then5193, label %else5194

then5193:                                         ; preds = %continuation5184
  br label %continuation5192

else5194:                                         ; preds = %continuation5184
  %3894 = alloca i32, align 4
  %3895 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3896 = call i32 (ptr, ...) @scanf(ptr %3895, ptr %3894)
  %3897 = load i32, ptr %3894, align 4
  %3898 = icmp eq i32 %3897, 0
  br label %continuation5192

continuation5192:                                 ; preds = %else5194, %then5193
  %3899 = phi i1 [ %3898, %else5194 ], [ true, %then5193 ]
  br i1 %3899, label %then5201, label %else5202

then5201:                                         ; preds = %continuation5192
  br label %continuation5200

else5202:                                         ; preds = %continuation5192
  %3900 = alloca i32, align 4
  %3901 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3902 = call i32 (ptr, ...) @scanf(ptr %3901, ptr %3900)
  %3903 = load i32, ptr %3900, align 4
  %3904 = icmp eq i32 %3903, 0
  br label %continuation5200

continuation5200:                                 ; preds = %else5202, %then5201
  %3905 = phi i1 [ %3904, %else5202 ], [ true, %then5201 ]
  br i1 %3905, label %then5209, label %else5210

then5209:                                         ; preds = %continuation5200
  br label %continuation5208

else5210:                                         ; preds = %continuation5200
  %3906 = alloca i32, align 4
  %3907 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3908 = call i32 (ptr, ...) @scanf(ptr %3907, ptr %3906)
  %3909 = load i32, ptr %3906, align 4
  %3910 = icmp eq i32 %3909, 0
  br label %continuation5208

continuation5208:                                 ; preds = %else5210, %then5209
  %3911 = phi i1 [ %3910, %else5210 ], [ true, %then5209 ]
  br i1 %3911, label %then5217, label %else5218

then5217:                                         ; preds = %continuation5208
  br label %continuation5216

else5218:                                         ; preds = %continuation5208
  %3912 = alloca i32, align 4
  %3913 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3914 = call i32 (ptr, ...) @scanf(ptr %3913, ptr %3912)
  %3915 = load i32, ptr %3912, align 4
  %3916 = icmp eq i32 %3915, 0
  br label %continuation5216

continuation5216:                                 ; preds = %else5218, %then5217
  %3917 = phi i1 [ %3916, %else5218 ], [ true, %then5217 ]
  br i1 %3917, label %then5225, label %else5226

then5225:                                         ; preds = %continuation5216
  br label %continuation5224

else5226:                                         ; preds = %continuation5216
  %3918 = alloca i32, align 4
  %3919 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3920 = call i32 (ptr, ...) @scanf(ptr %3919, ptr %3918)
  %3921 = load i32, ptr %3918, align 4
  %3922 = icmp eq i32 %3921, 0
  br label %continuation5224

continuation5224:                                 ; preds = %else5226, %then5225
  %3923 = phi i1 [ %3922, %else5226 ], [ true, %then5225 ]
  br i1 %3923, label %then5233, label %else5234

then5233:                                         ; preds = %continuation5224
  br label %continuation5232

else5234:                                         ; preds = %continuation5224
  %3924 = alloca i32, align 4
  %3925 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3926 = call i32 (ptr, ...) @scanf(ptr %3925, ptr %3924)
  %3927 = load i32, ptr %3924, align 4
  %3928 = icmp eq i32 %3927, 0
  br label %continuation5232

continuation5232:                                 ; preds = %else5234, %then5233
  %3929 = phi i1 [ %3928, %else5234 ], [ true, %then5233 ]
  br i1 %3929, label %then5241, label %else5242

then5241:                                         ; preds = %continuation5232
  br label %continuation5240

else5242:                                         ; preds = %continuation5232
  %3930 = alloca i32, align 4
  %3931 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3932 = call i32 (ptr, ...) @scanf(ptr %3931, ptr %3930)
  %3933 = load i32, ptr %3930, align 4
  %3934 = icmp eq i32 %3933, 0
  br label %continuation5240

continuation5240:                                 ; preds = %else5242, %then5241
  %3935 = phi i1 [ %3934, %else5242 ], [ true, %then5241 ]
  br i1 %3935, label %then5249, label %else5250

then5249:                                         ; preds = %continuation5240
  br label %continuation5248

else5250:                                         ; preds = %continuation5240
  %3936 = alloca i32, align 4
  %3937 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3938 = call i32 (ptr, ...) @scanf(ptr %3937, ptr %3936)
  %3939 = load i32, ptr %3936, align 4
  %3940 = icmp eq i32 %3939, 0
  br label %continuation5248

continuation5248:                                 ; preds = %else5250, %then5249
  %3941 = phi i1 [ %3940, %else5250 ], [ true, %then5249 ]
  br i1 %3941, label %then5257, label %else5258

then5257:                                         ; preds = %continuation5248
  br label %continuation5256

else5258:                                         ; preds = %continuation5248
  %3942 = alloca i32, align 4
  %3943 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3944 = call i32 (ptr, ...) @scanf(ptr %3943, ptr %3942)
  %3945 = load i32, ptr %3942, align 4
  %3946 = icmp eq i32 %3945, 0
  br label %continuation5256

continuation5256:                                 ; preds = %else5258, %then5257
  %3947 = phi i1 [ %3946, %else5258 ], [ true, %then5257 ]
  br i1 %3947, label %then5265, label %else5266

then5265:                                         ; preds = %continuation5256
  br label %continuation5264

else5266:                                         ; preds = %continuation5256
  %3948 = alloca i32, align 4
  %3949 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3950 = call i32 (ptr, ...) @scanf(ptr %3949, ptr %3948)
  %3951 = load i32, ptr %3948, align 4
  %3952 = icmp eq i32 %3951, 0
  br label %continuation5264

continuation5264:                                 ; preds = %else5266, %then5265
  %3953 = phi i1 [ %3952, %else5266 ], [ true, %then5265 ]
  br i1 %3953, label %then5273, label %else5274

then5273:                                         ; preds = %continuation5264
  br label %continuation5272

else5274:                                         ; preds = %continuation5264
  %3954 = alloca i32, align 4
  %3955 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3956 = call i32 (ptr, ...) @scanf(ptr %3955, ptr %3954)
  %3957 = load i32, ptr %3954, align 4
  %3958 = icmp eq i32 %3957, 0
  br label %continuation5272

continuation5272:                                 ; preds = %else5274, %then5273
  %3959 = phi i1 [ %3958, %else5274 ], [ true, %then5273 ]
  br i1 %3959, label %then5281, label %else5282

then5281:                                         ; preds = %continuation5272
  br label %continuation5280

else5282:                                         ; preds = %continuation5272
  %3960 = alloca i32, align 4
  %3961 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3962 = call i32 (ptr, ...) @scanf(ptr %3961, ptr %3960)
  %3963 = load i32, ptr %3960, align 4
  %3964 = icmp eq i32 %3963, 0
  br label %continuation5280

continuation5280:                                 ; preds = %else5282, %then5281
  %3965 = phi i1 [ %3964, %else5282 ], [ true, %then5281 ]
  br i1 %3965, label %then5289, label %else5290

then5289:                                         ; preds = %continuation5280
  br label %continuation5288

else5290:                                         ; preds = %continuation5280
  %3966 = alloca i32, align 4
  %3967 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3968 = call i32 (ptr, ...) @scanf(ptr %3967, ptr %3966)
  %3969 = load i32, ptr %3966, align 4
  %3970 = icmp eq i32 %3969, 0
  br label %continuation5288

continuation5288:                                 ; preds = %else5290, %then5289
  %3971 = phi i1 [ %3970, %else5290 ], [ true, %then5289 ]
  br i1 %3971, label %then5297, label %else5298

then5297:                                         ; preds = %continuation5288
  br label %continuation5296

else5298:                                         ; preds = %continuation5288
  %3972 = alloca i32, align 4
  %3973 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3974 = call i32 (ptr, ...) @scanf(ptr %3973, ptr %3972)
  %3975 = load i32, ptr %3972, align 4
  %3976 = icmp eq i32 %3975, 0
  br label %continuation5296

continuation5296:                                 ; preds = %else5298, %then5297
  %3977 = phi i1 [ %3976, %else5298 ], [ true, %then5297 ]
  br i1 %3977, label %then5305, label %else5306

then5305:                                         ; preds = %continuation5296
  br label %continuation5304

else5306:                                         ; preds = %continuation5296
  %3978 = alloca i32, align 4
  %3979 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3980 = call i32 (ptr, ...) @scanf(ptr %3979, ptr %3978)
  %3981 = load i32, ptr %3978, align 4
  %3982 = icmp eq i32 %3981, 0
  br label %continuation5304

continuation5304:                                 ; preds = %else5306, %then5305
  %3983 = phi i1 [ %3982, %else5306 ], [ true, %then5305 ]
  br i1 %3983, label %then5313, label %else5314

then5313:                                         ; preds = %continuation5304
  br label %continuation5312

else5314:                                         ; preds = %continuation5304
  %3984 = alloca i32, align 4
  %3985 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3986 = call i32 (ptr, ...) @scanf(ptr %3985, ptr %3984)
  %3987 = load i32, ptr %3984, align 4
  %3988 = icmp eq i32 %3987, 0
  br label %continuation5312

continuation5312:                                 ; preds = %else5314, %then5313
  %3989 = phi i1 [ %3988, %else5314 ], [ true, %then5313 ]
  br i1 %3989, label %then5321, label %else5322

then5321:                                         ; preds = %continuation5312
  br label %continuation5320

else5322:                                         ; preds = %continuation5312
  %3990 = alloca i32, align 4
  %3991 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3992 = call i32 (ptr, ...) @scanf(ptr %3991, ptr %3990)
  %3993 = load i32, ptr %3990, align 4
  %3994 = icmp eq i32 %3993, 0
  br label %continuation5320

continuation5320:                                 ; preds = %else5322, %then5321
  %3995 = phi i1 [ %3994, %else5322 ], [ true, %then5321 ]
  br i1 %3995, label %then5329, label %else5330

then5329:                                         ; preds = %continuation5320
  br label %continuation5328

else5330:                                         ; preds = %continuation5320
  %3996 = alloca i32, align 4
  %3997 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3998 = call i32 (ptr, ...) @scanf(ptr %3997, ptr %3996)
  %3999 = load i32, ptr %3996, align 4
  %4000 = icmp eq i32 %3999, 0
  br label %continuation5328

continuation5328:                                 ; preds = %else5330, %then5329
  %4001 = phi i1 [ %4000, %else5330 ], [ true, %then5329 ]
  br i1 %4001, label %then5337, label %else5338

then5337:                                         ; preds = %continuation5328
  br label %continuation5336

else5338:                                         ; preds = %continuation5328
  %4002 = alloca i32, align 4
  %4003 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4004 = call i32 (ptr, ...) @scanf(ptr %4003, ptr %4002)
  %4005 = load i32, ptr %4002, align 4
  %4006 = icmp eq i32 %4005, 0
  br label %continuation5336

continuation5336:                                 ; preds = %else5338, %then5337
  %4007 = phi i1 [ %4006, %else5338 ], [ true, %then5337 ]
  br i1 %4007, label %then5345, label %else5346

then5345:                                         ; preds = %continuation5336
  br label %continuation5344

else5346:                                         ; preds = %continuation5336
  %4008 = alloca i32, align 4
  %4009 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4010 = call i32 (ptr, ...) @scanf(ptr %4009, ptr %4008)
  %4011 = load i32, ptr %4008, align 4
  %4012 = icmp eq i32 %4011, 0
  br label %continuation5344

continuation5344:                                 ; preds = %else5346, %then5345
  %4013 = phi i1 [ %4012, %else5346 ], [ true, %then5345 ]
  br i1 %4013, label %then5353, label %else5354

then5353:                                         ; preds = %continuation5344
  br label %continuation5352

else5354:                                         ; preds = %continuation5344
  %4014 = alloca i32, align 4
  %4015 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4016 = call i32 (ptr, ...) @scanf(ptr %4015, ptr %4014)
  %4017 = load i32, ptr %4014, align 4
  %4018 = icmp eq i32 %4017, 0
  br label %continuation5352

continuation5352:                                 ; preds = %else5354, %then5353
  %4019 = phi i1 [ %4018, %else5354 ], [ true, %then5353 ]
  br i1 %4019, label %then5361, label %else5362

then5361:                                         ; preds = %continuation5352
  br label %continuation5360

else5362:                                         ; preds = %continuation5352
  %4020 = alloca i32, align 4
  %4021 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4022 = call i32 (ptr, ...) @scanf(ptr %4021, ptr %4020)
  %4023 = load i32, ptr %4020, align 4
  %4024 = icmp eq i32 %4023, 0
  br label %continuation5360

continuation5360:                                 ; preds = %else5362, %then5361
  %4025 = phi i1 [ %4024, %else5362 ], [ true, %then5361 ]
  br i1 %4025, label %then5369, label %else5370

then5369:                                         ; preds = %continuation5360
  br label %continuation5368

else5370:                                         ; preds = %continuation5360
  %4026 = alloca i32, align 4
  %4027 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4028 = call i32 (ptr, ...) @scanf(ptr %4027, ptr %4026)
  %4029 = load i32, ptr %4026, align 4
  %4030 = icmp eq i32 %4029, 0
  br label %continuation5368

continuation5368:                                 ; preds = %else5370, %then5369
  %4031 = phi i1 [ %4030, %else5370 ], [ true, %then5369 ]
  br i1 %4031, label %then5377, label %else5378

then5377:                                         ; preds = %continuation5368
  br label %continuation5376

else5378:                                         ; preds = %continuation5368
  %4032 = alloca i32, align 4
  %4033 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4034 = call i32 (ptr, ...) @scanf(ptr %4033, ptr %4032)
  %4035 = load i32, ptr %4032, align 4
  %4036 = icmp eq i32 %4035, 0
  br label %continuation5376

continuation5376:                                 ; preds = %else5378, %then5377
  %4037 = phi i1 [ %4036, %else5378 ], [ true, %then5377 ]
  br i1 %4037, label %then5385, label %else5386

then5385:                                         ; preds = %continuation5376
  br label %continuation5384

else5386:                                         ; preds = %continuation5376
  %4038 = alloca i32, align 4
  %4039 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4040 = call i32 (ptr, ...) @scanf(ptr %4039, ptr %4038)
  %4041 = load i32, ptr %4038, align 4
  %4042 = icmp eq i32 %4041, 0
  br label %continuation5384

continuation5384:                                 ; preds = %else5386, %then5385
  %4043 = phi i1 [ %4042, %else5386 ], [ true, %then5385 ]
  br i1 %4043, label %then5393, label %else5394

then5393:                                         ; preds = %continuation5384
  br label %continuation5392

else5394:                                         ; preds = %continuation5384
  %4044 = alloca i32, align 4
  %4045 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4046 = call i32 (ptr, ...) @scanf(ptr %4045, ptr %4044)
  %4047 = load i32, ptr %4044, align 4
  %4048 = icmp eq i32 %4047, 0
  br label %continuation5392

continuation5392:                                 ; preds = %else5394, %then5393
  %4049 = phi i1 [ %4048, %else5394 ], [ true, %then5393 ]
  br i1 %4049, label %then5401, label %else5402

then5401:                                         ; preds = %continuation5392
  br label %continuation5400

else5402:                                         ; preds = %continuation5392
  %4050 = alloca i32, align 4
  %4051 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4052 = call i32 (ptr, ...) @scanf(ptr %4051, ptr %4050)
  %4053 = load i32, ptr %4050, align 4
  %4054 = icmp eq i32 %4053, 0
  br label %continuation5400

continuation5400:                                 ; preds = %else5402, %then5401
  %4055 = phi i1 [ %4054, %else5402 ], [ true, %then5401 ]
  br i1 %4055, label %then5409, label %else5410

then5409:                                         ; preds = %continuation5400
  br label %continuation5408

else5410:                                         ; preds = %continuation5400
  %4056 = alloca i32, align 4
  %4057 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4058 = call i32 (ptr, ...) @scanf(ptr %4057, ptr %4056)
  %4059 = load i32, ptr %4056, align 4
  %4060 = icmp eq i32 %4059, 0
  br label %continuation5408

continuation5408:                                 ; preds = %else5410, %then5409
  %4061 = phi i1 [ %4060, %else5410 ], [ true, %then5409 ]
  br i1 %4061, label %then5417, label %else5418

then5417:                                         ; preds = %continuation5408
  br label %continuation5416

else5418:                                         ; preds = %continuation5408
  %4062 = alloca i32, align 4
  %4063 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4064 = call i32 (ptr, ...) @scanf(ptr %4063, ptr %4062)
  %4065 = load i32, ptr %4062, align 4
  %4066 = icmp eq i32 %4065, 0
  br label %continuation5416

continuation5416:                                 ; preds = %else5418, %then5417
  %4067 = phi i1 [ %4066, %else5418 ], [ true, %then5417 ]
  br i1 %4067, label %then5425, label %else5426

then5425:                                         ; preds = %continuation5416
  br label %continuation5424

else5426:                                         ; preds = %continuation5416
  %4068 = alloca i32, align 4
  %4069 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4070 = call i32 (ptr, ...) @scanf(ptr %4069, ptr %4068)
  %4071 = load i32, ptr %4068, align 4
  %4072 = icmp eq i32 %4071, 0
  br label %continuation5424

continuation5424:                                 ; preds = %else5426, %then5425
  %4073 = phi i1 [ %4072, %else5426 ], [ true, %then5425 ]
  br i1 %4073, label %then5433, label %else5434

then5433:                                         ; preds = %continuation5424
  br label %continuation5432

else5434:                                         ; preds = %continuation5424
  %4074 = alloca i32, align 4
  %4075 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4076 = call i32 (ptr, ...) @scanf(ptr %4075, ptr %4074)
  %4077 = load i32, ptr %4074, align 4
  %4078 = icmp eq i32 %4077, 0
  br label %continuation5432

continuation5432:                                 ; preds = %else5434, %then5433
  %4079 = phi i1 [ %4078, %else5434 ], [ true, %then5433 ]
  br i1 %4079, label %then5441, label %else5442

then5441:                                         ; preds = %continuation5432
  br label %continuation5440

else5442:                                         ; preds = %continuation5432
  %4080 = alloca i32, align 4
  %4081 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4082 = call i32 (ptr, ...) @scanf(ptr %4081, ptr %4080)
  %4083 = load i32, ptr %4080, align 4
  %4084 = icmp eq i32 %4083, 0
  br label %continuation5440

continuation5440:                                 ; preds = %else5442, %then5441
  %4085 = phi i1 [ %4084, %else5442 ], [ true, %then5441 ]
  br i1 %4085, label %then5449, label %else5450

then5449:                                         ; preds = %continuation5440
  br label %continuation5448

else5450:                                         ; preds = %continuation5440
  %4086 = alloca i32, align 4
  %4087 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4088 = call i32 (ptr, ...) @scanf(ptr %4087, ptr %4086)
  %4089 = load i32, ptr %4086, align 4
  %4090 = icmp eq i32 %4089, 0
  br label %continuation5448

continuation5448:                                 ; preds = %else5450, %then5449
  %4091 = phi i1 [ %4090, %else5450 ], [ true, %then5449 ]
  br i1 %4091, label %then5457, label %else5458

then5457:                                         ; preds = %continuation5448
  br label %continuation5456

else5458:                                         ; preds = %continuation5448
  %4092 = alloca i32, align 4
  %4093 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4094 = call i32 (ptr, ...) @scanf(ptr %4093, ptr %4092)
  %4095 = load i32, ptr %4092, align 4
  %4096 = icmp eq i32 %4095, 0
  br label %continuation5456

continuation5456:                                 ; preds = %else5458, %then5457
  %4097 = phi i1 [ %4096, %else5458 ], [ true, %then5457 ]
  br i1 %4097, label %then5465, label %else5466

then5465:                                         ; preds = %continuation5456
  br label %continuation5464

else5466:                                         ; preds = %continuation5456
  %4098 = alloca i32, align 4
  %4099 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4100 = call i32 (ptr, ...) @scanf(ptr %4099, ptr %4098)
  %4101 = load i32, ptr %4098, align 4
  %4102 = icmp eq i32 %4101, 0
  br label %continuation5464

continuation5464:                                 ; preds = %else5466, %then5465
  %4103 = phi i1 [ %4102, %else5466 ], [ true, %then5465 ]
  br i1 %4103, label %then5473, label %else5474

then5473:                                         ; preds = %continuation5464
  br label %continuation5472

else5474:                                         ; preds = %continuation5464
  %4104 = alloca i32, align 4
  %4105 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4106 = call i32 (ptr, ...) @scanf(ptr %4105, ptr %4104)
  %4107 = load i32, ptr %4104, align 4
  %4108 = icmp eq i32 %4107, 0
  br label %continuation5472

continuation5472:                                 ; preds = %else5474, %then5473
  %4109 = phi i1 [ %4108, %else5474 ], [ true, %then5473 ]
  br i1 %4109, label %then5481, label %else5482

then5481:                                         ; preds = %continuation5472
  br label %continuation5480

else5482:                                         ; preds = %continuation5472
  %4110 = alloca i32, align 4
  %4111 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4112 = call i32 (ptr, ...) @scanf(ptr %4111, ptr %4110)
  %4113 = load i32, ptr %4110, align 4
  %4114 = icmp eq i32 %4113, 0
  br label %continuation5480

continuation5480:                                 ; preds = %else5482, %then5481
  %4115 = phi i1 [ %4114, %else5482 ], [ true, %then5481 ]
  br i1 %4115, label %then5489, label %else5490

then5489:                                         ; preds = %continuation5480
  br label %continuation5488

else5490:                                         ; preds = %continuation5480
  %4116 = alloca i32, align 4
  %4117 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4118 = call i32 (ptr, ...) @scanf(ptr %4117, ptr %4116)
  %4119 = load i32, ptr %4116, align 4
  %4120 = icmp eq i32 %4119, 0
  br label %continuation5488

continuation5488:                                 ; preds = %else5490, %then5489
  %4121 = phi i1 [ %4120, %else5490 ], [ true, %then5489 ]
  br i1 %4121, label %then5497, label %else5498

then5497:                                         ; preds = %continuation5488
  br label %continuation5496

else5498:                                         ; preds = %continuation5488
  %4122 = alloca i32, align 4
  %4123 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4124 = call i32 (ptr, ...) @scanf(ptr %4123, ptr %4122)
  %4125 = load i32, ptr %4122, align 4
  %4126 = icmp eq i32 %4125, 0
  br label %continuation5496

continuation5496:                                 ; preds = %else5498, %then5497
  %4127 = phi i1 [ %4126, %else5498 ], [ true, %then5497 ]
  br i1 %4127, label %then5505, label %else5506

then5505:                                         ; preds = %continuation5496
  br label %continuation5504

else5506:                                         ; preds = %continuation5496
  %4128 = alloca i32, align 4
  %4129 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4130 = call i32 (ptr, ...) @scanf(ptr %4129, ptr %4128)
  %4131 = load i32, ptr %4128, align 4
  %4132 = icmp eq i32 %4131, 0
  br label %continuation5504

continuation5504:                                 ; preds = %else5506, %then5505
  %4133 = phi i1 [ %4132, %else5506 ], [ true, %then5505 ]
  br i1 %4133, label %then5513, label %else5514

then5513:                                         ; preds = %continuation5504
  br label %continuation5512

else5514:                                         ; preds = %continuation5504
  %4134 = alloca i32, align 4
  %4135 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4136 = call i32 (ptr, ...) @scanf(ptr %4135, ptr %4134)
  %4137 = load i32, ptr %4134, align 4
  %4138 = icmp eq i32 %4137, 0
  br label %continuation5512

continuation5512:                                 ; preds = %else5514, %then5513
  %4139 = phi i1 [ %4138, %else5514 ], [ true, %then5513 ]
  br i1 %4139, label %then5521, label %else5522

then5521:                                         ; preds = %continuation5512
  br label %continuation5520

else5522:                                         ; preds = %continuation5512
  %4140 = alloca i32, align 4
  %4141 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4142 = call i32 (ptr, ...) @scanf(ptr %4141, ptr %4140)
  %4143 = load i32, ptr %4140, align 4
  %4144 = icmp eq i32 %4143, 0
  br label %continuation5520

continuation5520:                                 ; preds = %else5522, %then5521
  %4145 = phi i1 [ %4144, %else5522 ], [ true, %then5521 ]
  br i1 %4145, label %then5529, label %else5530

then5529:                                         ; preds = %continuation5520
  br label %continuation5528

else5530:                                         ; preds = %continuation5520
  %4146 = alloca i32, align 4
  %4147 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4148 = call i32 (ptr, ...) @scanf(ptr %4147, ptr %4146)
  %4149 = load i32, ptr %4146, align 4
  %4150 = icmp eq i32 %4149, 0
  br label %continuation5528

continuation5528:                                 ; preds = %else5530, %then5529
  %4151 = phi i1 [ %4150, %else5530 ], [ true, %then5529 ]
  br i1 %4151, label %then5537, label %else5538

then5537:                                         ; preds = %continuation5528
  br label %continuation5536

else5538:                                         ; preds = %continuation5528
  %4152 = alloca i32, align 4
  %4153 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4154 = call i32 (ptr, ...) @scanf(ptr %4153, ptr %4152)
  %4155 = load i32, ptr %4152, align 4
  %4156 = icmp eq i32 %4155, 0
  br label %continuation5536

continuation5536:                                 ; preds = %else5538, %then5537
  %4157 = phi i1 [ %4156, %else5538 ], [ true, %then5537 ]
  br i1 %4157, label %then5545, label %else5546

then5545:                                         ; preds = %continuation5536
  br label %continuation5544

else5546:                                         ; preds = %continuation5536
  %4158 = alloca i32, align 4
  %4159 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4160 = call i32 (ptr, ...) @scanf(ptr %4159, ptr %4158)
  %4161 = load i32, ptr %4158, align 4
  %4162 = icmp eq i32 %4161, 0
  br label %continuation5544

continuation5544:                                 ; preds = %else5546, %then5545
  %4163 = phi i1 [ %4162, %else5546 ], [ true, %then5545 ]
  br i1 %4163, label %then5553, label %else5554

then5553:                                         ; preds = %continuation5544
  br label %continuation5552

else5554:                                         ; preds = %continuation5544
  %4164 = alloca i32, align 4
  %4165 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4166 = call i32 (ptr, ...) @scanf(ptr %4165, ptr %4164)
  %4167 = load i32, ptr %4164, align 4
  %4168 = icmp eq i32 %4167, 0
  br label %continuation5552

continuation5552:                                 ; preds = %else5554, %then5553
  %4169 = phi i1 [ %4168, %else5554 ], [ true, %then5553 ]
  br i1 %4169, label %then5561, label %else5562

then5561:                                         ; preds = %continuation5552
  br label %continuation5560

else5562:                                         ; preds = %continuation5552
  %4170 = alloca i32, align 4
  %4171 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4172 = call i32 (ptr, ...) @scanf(ptr %4171, ptr %4170)
  %4173 = load i32, ptr %4170, align 4
  %4174 = icmp eq i32 %4173, 0
  br label %continuation5560

continuation5560:                                 ; preds = %else5562, %then5561
  %4175 = phi i1 [ %4174, %else5562 ], [ true, %then5561 ]
  br i1 %4175, label %then5569, label %else5570

then5569:                                         ; preds = %continuation5560
  br label %continuation5568

else5570:                                         ; preds = %continuation5560
  %4176 = alloca i32, align 4
  %4177 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4178 = call i32 (ptr, ...) @scanf(ptr %4177, ptr %4176)
  %4179 = load i32, ptr %4176, align 4
  %4180 = icmp eq i32 %4179, 0
  br label %continuation5568

continuation5568:                                 ; preds = %else5570, %then5569
  %4181 = phi i1 [ %4180, %else5570 ], [ true, %then5569 ]
  br i1 %4181, label %then5577, label %else5578

then5577:                                         ; preds = %continuation5568
  br label %continuation5576

else5578:                                         ; preds = %continuation5568
  %4182 = alloca i32, align 4
  %4183 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4184 = call i32 (ptr, ...) @scanf(ptr %4183, ptr %4182)
  %4185 = load i32, ptr %4182, align 4
  %4186 = icmp eq i32 %4185, 0
  br label %continuation5576

continuation5576:                                 ; preds = %else5578, %then5577
  %4187 = phi i1 [ %4186, %else5578 ], [ true, %then5577 ]
  br i1 %4187, label %then5585, label %else5586

then5585:                                         ; preds = %continuation5576
  br label %continuation5584

else5586:                                         ; preds = %continuation5576
  %4188 = alloca i32, align 4
  %4189 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4190 = call i32 (ptr, ...) @scanf(ptr %4189, ptr %4188)
  %4191 = load i32, ptr %4188, align 4
  %4192 = icmp eq i32 %4191, 0
  br label %continuation5584

continuation5584:                                 ; preds = %else5586, %then5585
  %4193 = phi i1 [ %4192, %else5586 ], [ true, %then5585 ]
  br i1 %4193, label %then5593, label %else5594

then5593:                                         ; preds = %continuation5584
  br label %continuation5592

else5594:                                         ; preds = %continuation5584
  %4194 = alloca i32, align 4
  %4195 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4196 = call i32 (ptr, ...) @scanf(ptr %4195, ptr %4194)
  %4197 = load i32, ptr %4194, align 4
  %4198 = icmp eq i32 %4197, 0
  br label %continuation5592

continuation5592:                                 ; preds = %else5594, %then5593
  %4199 = phi i1 [ %4198, %else5594 ], [ true, %then5593 ]
  br i1 %4199, label %then5601, label %else5602

then5601:                                         ; preds = %continuation5592
  br label %continuation5600

else5602:                                         ; preds = %continuation5592
  %4200 = alloca i32, align 4
  %4201 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4202 = call i32 (ptr, ...) @scanf(ptr %4201, ptr %4200)
  %4203 = load i32, ptr %4200, align 4
  %4204 = icmp eq i32 %4203, 0
  br label %continuation5600

continuation5600:                                 ; preds = %else5602, %then5601
  %4205 = phi i1 [ %4204, %else5602 ], [ true, %then5601 ]
  br i1 %4205, label %then5609, label %else5610

then5609:                                         ; preds = %continuation5600
  br label %continuation5608

else5610:                                         ; preds = %continuation5600
  %4206 = alloca i32, align 4
  %4207 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4208 = call i32 (ptr, ...) @scanf(ptr %4207, ptr %4206)
  %4209 = load i32, ptr %4206, align 4
  %4210 = icmp eq i32 %4209, 0
  br label %continuation5608

continuation5608:                                 ; preds = %else5610, %then5609
  %4211 = phi i1 [ %4210, %else5610 ], [ true, %then5609 ]
  br i1 %4211, label %then5617, label %else5618

then5617:                                         ; preds = %continuation5608
  br label %continuation5616

else5618:                                         ; preds = %continuation5608
  %4212 = alloca i32, align 4
  %4213 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4214 = call i32 (ptr, ...) @scanf(ptr %4213, ptr %4212)
  %4215 = load i32, ptr %4212, align 4
  %4216 = icmp eq i32 %4215, 0
  br label %continuation5616

continuation5616:                                 ; preds = %else5618, %then5617
  %4217 = phi i1 [ %4216, %else5618 ], [ true, %then5617 ]
  br i1 %4217, label %then5625, label %else5626

then5625:                                         ; preds = %continuation5616
  br label %continuation5624

else5626:                                         ; preds = %continuation5616
  %4218 = alloca i32, align 4
  %4219 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4220 = call i32 (ptr, ...) @scanf(ptr %4219, ptr %4218)
  %4221 = load i32, ptr %4218, align 4
  %4222 = icmp eq i32 %4221, 0
  br label %continuation5624

continuation5624:                                 ; preds = %else5626, %then5625
  %4223 = phi i1 [ %4222, %else5626 ], [ true, %then5625 ]
  br i1 %4223, label %then5633, label %else5634

then5633:                                         ; preds = %continuation5624
  br label %continuation5632

else5634:                                         ; preds = %continuation5624
  %4224 = alloca i32, align 4
  %4225 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4226 = call i32 (ptr, ...) @scanf(ptr %4225, ptr %4224)
  %4227 = load i32, ptr %4224, align 4
  %4228 = icmp eq i32 %4227, 0
  br label %continuation5632

continuation5632:                                 ; preds = %else5634, %then5633
  %4229 = phi i1 [ %4228, %else5634 ], [ true, %then5633 ]
  br i1 %4229, label %then5641, label %else5642

then5641:                                         ; preds = %continuation5632
  br label %continuation5640

else5642:                                         ; preds = %continuation5632
  %4230 = alloca i32, align 4
  %4231 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4232 = call i32 (ptr, ...) @scanf(ptr %4231, ptr %4230)
  %4233 = load i32, ptr %4230, align 4
  %4234 = icmp eq i32 %4233, 0
  br label %continuation5640

continuation5640:                                 ; preds = %else5642, %then5641
  %4235 = phi i1 [ %4234, %else5642 ], [ true, %then5641 ]
  br i1 %4235, label %then5649, label %else5650

then5649:                                         ; preds = %continuation5640
  br label %continuation5648

else5650:                                         ; preds = %continuation5640
  %4236 = alloca i32, align 4
  %4237 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4238 = call i32 (ptr, ...) @scanf(ptr %4237, ptr %4236)
  %4239 = load i32, ptr %4236, align 4
  %4240 = icmp eq i32 %4239, 0
  br label %continuation5648

continuation5648:                                 ; preds = %else5650, %then5649
  %4241 = phi i1 [ %4240, %else5650 ], [ true, %then5649 ]
  br i1 %4241, label %then5657, label %else5658

then5657:                                         ; preds = %continuation5648
  br label %continuation5656

else5658:                                         ; preds = %continuation5648
  %4242 = alloca i32, align 4
  %4243 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4244 = call i32 (ptr, ...) @scanf(ptr %4243, ptr %4242)
  %4245 = load i32, ptr %4242, align 4
  %4246 = icmp eq i32 %4245, 0
  br label %continuation5656

continuation5656:                                 ; preds = %else5658, %then5657
  %4247 = phi i1 [ %4246, %else5658 ], [ true, %then5657 ]
  br i1 %4247, label %then5665, label %else5666

then5665:                                         ; preds = %continuation5656
  br label %continuation5664

else5666:                                         ; preds = %continuation5656
  %4248 = alloca i32, align 4
  %4249 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4250 = call i32 (ptr, ...) @scanf(ptr %4249, ptr %4248)
  %4251 = load i32, ptr %4248, align 4
  %4252 = icmp eq i32 %4251, 0
  br label %continuation5664

continuation5664:                                 ; preds = %else5666, %then5665
  %4253 = phi i1 [ %4252, %else5666 ], [ true, %then5665 ]
  br i1 %4253, label %then5673, label %else5674

then5673:                                         ; preds = %continuation5664
  br label %continuation5672

else5674:                                         ; preds = %continuation5664
  %4254 = alloca i32, align 4
  %4255 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4256 = call i32 (ptr, ...) @scanf(ptr %4255, ptr %4254)
  %4257 = load i32, ptr %4254, align 4
  %4258 = icmp eq i32 %4257, 0
  br label %continuation5672

continuation5672:                                 ; preds = %else5674, %then5673
  %4259 = phi i1 [ %4258, %else5674 ], [ true, %then5673 ]
  br i1 %4259, label %then5681, label %else5682

then5681:                                         ; preds = %continuation5672
  br label %continuation5680

else5682:                                         ; preds = %continuation5672
  %4260 = alloca i32, align 4
  %4261 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4262 = call i32 (ptr, ...) @scanf(ptr %4261, ptr %4260)
  %4263 = load i32, ptr %4260, align 4
  %4264 = icmp eq i32 %4263, 0
  br label %continuation5680

continuation5680:                                 ; preds = %else5682, %then5681
  %4265 = phi i1 [ %4264, %else5682 ], [ true, %then5681 ]
  br i1 %4265, label %then5689, label %else5690

then5689:                                         ; preds = %continuation5680
  br label %continuation5688

else5690:                                         ; preds = %continuation5680
  %4266 = alloca i32, align 4
  %4267 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4268 = call i32 (ptr, ...) @scanf(ptr %4267, ptr %4266)
  %4269 = load i32, ptr %4266, align 4
  %4270 = icmp eq i32 %4269, 0
  br label %continuation5688

continuation5688:                                 ; preds = %else5690, %then5689
  %4271 = phi i1 [ %4270, %else5690 ], [ true, %then5689 ]
  br i1 %4271, label %then5697, label %else5698

then5697:                                         ; preds = %continuation5688
  br label %continuation5696

else5698:                                         ; preds = %continuation5688
  %4272 = alloca i32, align 4
  %4273 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4274 = call i32 (ptr, ...) @scanf(ptr %4273, ptr %4272)
  %4275 = load i32, ptr %4272, align 4
  %4276 = icmp eq i32 %4275, 0
  br label %continuation5696

continuation5696:                                 ; preds = %else5698, %then5697
  %4277 = phi i1 [ %4276, %else5698 ], [ true, %then5697 ]
  br i1 %4277, label %then5705, label %else5706

then5705:                                         ; preds = %continuation5696
  br label %continuation5704

else5706:                                         ; preds = %continuation5696
  %4278 = alloca i32, align 4
  %4279 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4280 = call i32 (ptr, ...) @scanf(ptr %4279, ptr %4278)
  %4281 = load i32, ptr %4278, align 4
  %4282 = icmp eq i32 %4281, 0
  br label %continuation5704

continuation5704:                                 ; preds = %else5706, %then5705
  %4283 = phi i1 [ %4282, %else5706 ], [ true, %then5705 ]
  br i1 %4283, label %then5713, label %else5714

then5713:                                         ; preds = %continuation5704
  br label %continuation5712

else5714:                                         ; preds = %continuation5704
  %4284 = alloca i32, align 4
  %4285 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4286 = call i32 (ptr, ...) @scanf(ptr %4285, ptr %4284)
  %4287 = load i32, ptr %4284, align 4
  %4288 = icmp eq i32 %4287, 0
  br label %continuation5712

continuation5712:                                 ; preds = %else5714, %then5713
  %4289 = phi i1 [ %4288, %else5714 ], [ true, %then5713 ]
  br i1 %4289, label %then5721, label %else5722

then5721:                                         ; preds = %continuation5712
  br label %continuation5720

else5722:                                         ; preds = %continuation5712
  %4290 = alloca i32, align 4
  %4291 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4292 = call i32 (ptr, ...) @scanf(ptr %4291, ptr %4290)
  %4293 = load i32, ptr %4290, align 4
  %4294 = icmp eq i32 %4293, 0
  br label %continuation5720

continuation5720:                                 ; preds = %else5722, %then5721
  %4295 = phi i1 [ %4294, %else5722 ], [ true, %then5721 ]
  br i1 %4295, label %then5729, label %else5730

then5729:                                         ; preds = %continuation5720
  br label %continuation5728

else5730:                                         ; preds = %continuation5720
  %4296 = alloca i32, align 4
  %4297 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4298 = call i32 (ptr, ...) @scanf(ptr %4297, ptr %4296)
  %4299 = load i32, ptr %4296, align 4
  %4300 = icmp eq i32 %4299, 0
  br label %continuation5728

continuation5728:                                 ; preds = %else5730, %then5729
  %4301 = phi i1 [ %4300, %else5730 ], [ true, %then5729 ]
  br i1 %4301, label %then5737, label %else5738

then5737:                                         ; preds = %continuation5728
  br label %continuation5736

else5738:                                         ; preds = %continuation5728
  %4302 = alloca i32, align 4
  %4303 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4304 = call i32 (ptr, ...) @scanf(ptr %4303, ptr %4302)
  %4305 = load i32, ptr %4302, align 4
  %4306 = icmp eq i32 %4305, 0
  br label %continuation5736

continuation5736:                                 ; preds = %else5738, %then5737
  %4307 = phi i1 [ %4306, %else5738 ], [ true, %then5737 ]
  br i1 %4307, label %then5745, label %else5746

then5745:                                         ; preds = %continuation5736
  br label %continuation5744

else5746:                                         ; preds = %continuation5736
  %4308 = alloca i32, align 4
  %4309 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4310 = call i32 (ptr, ...) @scanf(ptr %4309, ptr %4308)
  %4311 = load i32, ptr %4308, align 4
  %4312 = icmp eq i32 %4311, 0
  br label %continuation5744

continuation5744:                                 ; preds = %else5746, %then5745
  %4313 = phi i1 [ %4312, %else5746 ], [ true, %then5745 ]
  br i1 %4313, label %then5753, label %else5754

then5753:                                         ; preds = %continuation5744
  br label %continuation5752

else5754:                                         ; preds = %continuation5744
  %4314 = alloca i32, align 4
  %4315 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4316 = call i32 (ptr, ...) @scanf(ptr %4315, ptr %4314)
  %4317 = load i32, ptr %4314, align 4
  %4318 = icmp eq i32 %4317, 0
  br label %continuation5752

continuation5752:                                 ; preds = %else5754, %then5753
  %4319 = phi i1 [ %4318, %else5754 ], [ true, %then5753 ]
  br i1 %4319, label %then5761, label %else5762

then5761:                                         ; preds = %continuation5752
  br label %continuation5760

else5762:                                         ; preds = %continuation5752
  %4320 = alloca i32, align 4
  %4321 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4322 = call i32 (ptr, ...) @scanf(ptr %4321, ptr %4320)
  %4323 = load i32, ptr %4320, align 4
  %4324 = icmp eq i32 %4323, 0
  br label %continuation5760

continuation5760:                                 ; preds = %else5762, %then5761
  %4325 = phi i1 [ %4324, %else5762 ], [ true, %then5761 ]
  br i1 %4325, label %then5769, label %else5770

then5769:                                         ; preds = %continuation5760
  br label %continuation5768

else5770:                                         ; preds = %continuation5760
  %4326 = alloca i32, align 4
  %4327 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4328 = call i32 (ptr, ...) @scanf(ptr %4327, ptr %4326)
  %4329 = load i32, ptr %4326, align 4
  %4330 = icmp eq i32 %4329, 0
  br label %continuation5768

continuation5768:                                 ; preds = %else5770, %then5769
  %4331 = phi i1 [ %4330, %else5770 ], [ true, %then5769 ]
  br i1 %4331, label %then5777, label %else5778

then5777:                                         ; preds = %continuation5768
  br label %continuation5776

else5778:                                         ; preds = %continuation5768
  %4332 = alloca i32, align 4
  %4333 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4334 = call i32 (ptr, ...) @scanf(ptr %4333, ptr %4332)
  %4335 = load i32, ptr %4332, align 4
  %4336 = icmp eq i32 %4335, 0
  br label %continuation5776

continuation5776:                                 ; preds = %else5778, %then5777
  %4337 = phi i1 [ %4336, %else5778 ], [ true, %then5777 ]
  br i1 %4337, label %then5785, label %else5786

then5785:                                         ; preds = %continuation5776
  br label %continuation5784

else5786:                                         ; preds = %continuation5776
  %4338 = alloca i32, align 4
  %4339 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4340 = call i32 (ptr, ...) @scanf(ptr %4339, ptr %4338)
  %4341 = load i32, ptr %4338, align 4
  %4342 = icmp eq i32 %4341, 0
  br label %continuation5784

continuation5784:                                 ; preds = %else5786, %then5785
  %4343 = phi i1 [ %4342, %else5786 ], [ true, %then5785 ]
  br i1 %4343, label %then5793, label %else5794

then5793:                                         ; preds = %continuation5784
  br label %continuation5792

else5794:                                         ; preds = %continuation5784
  %4344 = alloca i32, align 4
  %4345 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4346 = call i32 (ptr, ...) @scanf(ptr %4345, ptr %4344)
  %4347 = load i32, ptr %4344, align 4
  %4348 = icmp eq i32 %4347, 0
  br label %continuation5792

continuation5792:                                 ; preds = %else5794, %then5793
  %4349 = phi i1 [ %4348, %else5794 ], [ true, %then5793 ]
  br i1 %4349, label %then5801, label %else5802

then5801:                                         ; preds = %continuation5792
  br label %continuation5800

else5802:                                         ; preds = %continuation5792
  %4350 = alloca i32, align 4
  %4351 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4352 = call i32 (ptr, ...) @scanf(ptr %4351, ptr %4350)
  %4353 = load i32, ptr %4350, align 4
  %4354 = icmp eq i32 %4353, 0
  br label %continuation5800

continuation5800:                                 ; preds = %else5802, %then5801
  %4355 = phi i1 [ %4354, %else5802 ], [ true, %then5801 ]
  br i1 %4355, label %then5809, label %else5810

then5809:                                         ; preds = %continuation5800
  br label %continuation5808

else5810:                                         ; preds = %continuation5800
  %4356 = alloca i32, align 4
  %4357 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4358 = call i32 (ptr, ...) @scanf(ptr %4357, ptr %4356)
  %4359 = load i32, ptr %4356, align 4
  %4360 = icmp eq i32 %4359, 0
  br label %continuation5808

continuation5808:                                 ; preds = %else5810, %then5809
  %4361 = phi i1 [ %4360, %else5810 ], [ true, %then5809 ]
  br i1 %4361, label %then5817, label %else5818

then5817:                                         ; preds = %continuation5808
  br label %continuation5816

else5818:                                         ; preds = %continuation5808
  %4362 = alloca i32, align 4
  %4363 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4364 = call i32 (ptr, ...) @scanf(ptr %4363, ptr %4362)
  %4365 = load i32, ptr %4362, align 4
  %4366 = icmp eq i32 %4365, 0
  br label %continuation5816

continuation5816:                                 ; preds = %else5818, %then5817
  %4367 = phi i1 [ %4366, %else5818 ], [ true, %then5817 ]
  br i1 %4367, label %then5825, label %else5826

then5825:                                         ; preds = %continuation5816
  br label %continuation5824

else5826:                                         ; preds = %continuation5816
  %4368 = alloca i32, align 4
  %4369 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4370 = call i32 (ptr, ...) @scanf(ptr %4369, ptr %4368)
  %4371 = load i32, ptr %4368, align 4
  %4372 = icmp eq i32 %4371, 0
  br label %continuation5824

continuation5824:                                 ; preds = %else5826, %then5825
  %4373 = phi i1 [ %4372, %else5826 ], [ true, %then5825 ]
  br i1 %4373, label %then5833, label %else5834

then5833:                                         ; preds = %continuation5824
  br label %continuation5832

else5834:                                         ; preds = %continuation5824
  %4374 = alloca i32, align 4
  %4375 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4376 = call i32 (ptr, ...) @scanf(ptr %4375, ptr %4374)
  %4377 = load i32, ptr %4374, align 4
  %4378 = icmp eq i32 %4377, 0
  br label %continuation5832

continuation5832:                                 ; preds = %else5834, %then5833
  %4379 = phi i1 [ %4378, %else5834 ], [ true, %then5833 ]
  br i1 %4379, label %then5841, label %else5842

then5841:                                         ; preds = %continuation5832
  br label %continuation5840

else5842:                                         ; preds = %continuation5832
  %4380 = alloca i32, align 4
  %4381 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4382 = call i32 (ptr, ...) @scanf(ptr %4381, ptr %4380)
  %4383 = load i32, ptr %4380, align 4
  %4384 = icmp eq i32 %4383, 0
  br label %continuation5840

continuation5840:                                 ; preds = %else5842, %then5841
  %4385 = phi i1 [ %4384, %else5842 ], [ true, %then5841 ]
  br i1 %4385, label %then5849, label %else5850

then5849:                                         ; preds = %continuation5840
  br label %continuation5848

else5850:                                         ; preds = %continuation5840
  %4386 = alloca i32, align 4
  %4387 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4388 = call i32 (ptr, ...) @scanf(ptr %4387, ptr %4386)
  %4389 = load i32, ptr %4386, align 4
  %4390 = icmp eq i32 %4389, 0
  br label %continuation5848

continuation5848:                                 ; preds = %else5850, %then5849
  %4391 = phi i1 [ %4390, %else5850 ], [ true, %then5849 ]
  br i1 %4391, label %then5857, label %else5858

then5857:                                         ; preds = %continuation5848
  br label %continuation5856

else5858:                                         ; preds = %continuation5848
  %4392 = alloca i32, align 4
  %4393 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4394 = call i32 (ptr, ...) @scanf(ptr %4393, ptr %4392)
  %4395 = load i32, ptr %4392, align 4
  %4396 = icmp eq i32 %4395, 0
  br label %continuation5856

continuation5856:                                 ; preds = %else5858, %then5857
  %4397 = phi i1 [ %4396, %else5858 ], [ true, %then5857 ]
  br i1 %4397, label %then5865, label %else5866

then5865:                                         ; preds = %continuation5856
  br label %continuation5864

else5866:                                         ; preds = %continuation5856
  %4398 = alloca i32, align 4
  %4399 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4400 = call i32 (ptr, ...) @scanf(ptr %4399, ptr %4398)
  %4401 = load i32, ptr %4398, align 4
  %4402 = icmp eq i32 %4401, 0
  br label %continuation5864

continuation5864:                                 ; preds = %else5866, %then5865
  %4403 = phi i1 [ %4402, %else5866 ], [ true, %then5865 ]
  br i1 %4403, label %then5873, label %else5874

then5873:                                         ; preds = %continuation5864
  br label %continuation5872

else5874:                                         ; preds = %continuation5864
  %4404 = alloca i32, align 4
  %4405 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4406 = call i32 (ptr, ...) @scanf(ptr %4405, ptr %4404)
  %4407 = load i32, ptr %4404, align 4
  %4408 = icmp eq i32 %4407, 0
  br label %continuation5872

continuation5872:                                 ; preds = %else5874, %then5873
  %4409 = phi i1 [ %4408, %else5874 ], [ true, %then5873 ]
  br i1 %4409, label %then5881, label %else5882

then5881:                                         ; preds = %continuation5872
  br label %continuation5880

else5882:                                         ; preds = %continuation5872
  %4410 = alloca i32, align 4
  %4411 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4412 = call i32 (ptr, ...) @scanf(ptr %4411, ptr %4410)
  %4413 = load i32, ptr %4410, align 4
  %4414 = icmp eq i32 %4413, 0
  br label %continuation5880

continuation5880:                                 ; preds = %else5882, %then5881
  %4415 = phi i1 [ %4414, %else5882 ], [ true, %then5881 ]
  br i1 %4415, label %then5889, label %else5890

then5889:                                         ; preds = %continuation5880
  br label %continuation5888

else5890:                                         ; preds = %continuation5880
  %4416 = alloca i32, align 4
  %4417 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4418 = call i32 (ptr, ...) @scanf(ptr %4417, ptr %4416)
  %4419 = load i32, ptr %4416, align 4
  %4420 = icmp eq i32 %4419, 0
  br label %continuation5888

continuation5888:                                 ; preds = %else5890, %then5889
  %4421 = phi i1 [ %4420, %else5890 ], [ true, %then5889 ]
  br i1 %4421, label %then5897, label %else5898

then5897:                                         ; preds = %continuation5888
  br label %continuation5896

else5898:                                         ; preds = %continuation5888
  %4422 = alloca i32, align 4
  %4423 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4424 = call i32 (ptr, ...) @scanf(ptr %4423, ptr %4422)
  %4425 = load i32, ptr %4422, align 4
  %4426 = icmp eq i32 %4425, 0
  br label %continuation5896

continuation5896:                                 ; preds = %else5898, %then5897
  %4427 = phi i1 [ %4426, %else5898 ], [ true, %then5897 ]
  br i1 %4427, label %then5905, label %else5906

then5905:                                         ; preds = %continuation5896
  br label %continuation5904

else5906:                                         ; preds = %continuation5896
  %4428 = alloca i32, align 4
  %4429 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4430 = call i32 (ptr, ...) @scanf(ptr %4429, ptr %4428)
  %4431 = load i32, ptr %4428, align 4
  %4432 = icmp eq i32 %4431, 0
  br label %continuation5904

continuation5904:                                 ; preds = %else5906, %then5905
  %4433 = phi i1 [ %4432, %else5906 ], [ true, %then5905 ]
  br i1 %4433, label %then5913, label %else5914

then5913:                                         ; preds = %continuation5904
  br label %continuation5912

else5914:                                         ; preds = %continuation5904
  %4434 = alloca i32, align 4
  %4435 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4436 = call i32 (ptr, ...) @scanf(ptr %4435, ptr %4434)
  %4437 = load i32, ptr %4434, align 4
  %4438 = icmp eq i32 %4437, 0
  br label %continuation5912

continuation5912:                                 ; preds = %else5914, %then5913
  %4439 = phi i1 [ %4438, %else5914 ], [ true, %then5913 ]
  br i1 %4439, label %then5921, label %else5922

then5921:                                         ; preds = %continuation5912
  br label %continuation5920

else5922:                                         ; preds = %continuation5912
  %4440 = alloca i32, align 4
  %4441 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4442 = call i32 (ptr, ...) @scanf(ptr %4441, ptr %4440)
  %4443 = load i32, ptr %4440, align 4
  %4444 = icmp eq i32 %4443, 0
  br label %continuation5920

continuation5920:                                 ; preds = %else5922, %then5921
  %4445 = phi i1 [ %4444, %else5922 ], [ true, %then5921 ]
  br i1 %4445, label %then5929, label %else5930

then5929:                                         ; preds = %continuation5920
  br label %continuation5928

else5930:                                         ; preds = %continuation5920
  %4446 = alloca i32, align 4
  %4447 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4448 = call i32 (ptr, ...) @scanf(ptr %4447, ptr %4446)
  %4449 = load i32, ptr %4446, align 4
  %4450 = icmp eq i32 %4449, 0
  br label %continuation5928

continuation5928:                                 ; preds = %else5930, %then5929
  %4451 = phi i1 [ %4450, %else5930 ], [ true, %then5929 ]
  br i1 %4451, label %then5937, label %else5938

then5937:                                         ; preds = %continuation5928
  br label %continuation5936

else5938:                                         ; preds = %continuation5928
  %4452 = alloca i32, align 4
  %4453 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4454 = call i32 (ptr, ...) @scanf(ptr %4453, ptr %4452)
  %4455 = load i32, ptr %4452, align 4
  %4456 = icmp eq i32 %4455, 0
  br label %continuation5936

continuation5936:                                 ; preds = %else5938, %then5937
  %4457 = phi i1 [ %4456, %else5938 ], [ true, %then5937 ]
  br i1 %4457, label %then5945, label %else5946

then5945:                                         ; preds = %continuation5936
  br label %continuation5944

else5946:                                         ; preds = %continuation5936
  %4458 = alloca i32, align 4
  %4459 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4460 = call i32 (ptr, ...) @scanf(ptr %4459, ptr %4458)
  %4461 = load i32, ptr %4458, align 4
  %4462 = icmp eq i32 %4461, 0
  br label %continuation5944

continuation5944:                                 ; preds = %else5946, %then5945
  %4463 = phi i1 [ %4462, %else5946 ], [ true, %then5945 ]
  br i1 %4463, label %then5953, label %else5954

then5953:                                         ; preds = %continuation5944
  br label %continuation5952

else5954:                                         ; preds = %continuation5944
  %4464 = alloca i32, align 4
  %4465 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4466 = call i32 (ptr, ...) @scanf(ptr %4465, ptr %4464)
  %4467 = load i32, ptr %4464, align 4
  %4468 = icmp eq i32 %4467, 0
  br label %continuation5952

continuation5952:                                 ; preds = %else5954, %then5953
  %4469 = phi i1 [ %4468, %else5954 ], [ true, %then5953 ]
  br i1 %4469, label %then5961, label %else5962

then5961:                                         ; preds = %continuation5952
  br label %continuation5960

else5962:                                         ; preds = %continuation5952
  %4470 = alloca i32, align 4
  %4471 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4472 = call i32 (ptr, ...) @scanf(ptr %4471, ptr %4470)
  %4473 = load i32, ptr %4470, align 4
  %4474 = icmp eq i32 %4473, 0
  br label %continuation5960

continuation5960:                                 ; preds = %else5962, %then5961
  %4475 = phi i1 [ %4474, %else5962 ], [ true, %then5961 ]
  br i1 %4475, label %then5969, label %else5970

then5969:                                         ; preds = %continuation5960
  br label %continuation5968

else5970:                                         ; preds = %continuation5960
  %4476 = alloca i32, align 4
  %4477 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4478 = call i32 (ptr, ...) @scanf(ptr %4477, ptr %4476)
  %4479 = load i32, ptr %4476, align 4
  %4480 = icmp eq i32 %4479, 0
  br label %continuation5968

continuation5968:                                 ; preds = %else5970, %then5969
  %4481 = phi i1 [ %4480, %else5970 ], [ true, %then5969 ]
  br i1 %4481, label %then5977, label %else5978

then5977:                                         ; preds = %continuation5968
  br label %continuation5976

else5978:                                         ; preds = %continuation5968
  %4482 = alloca i32, align 4
  %4483 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4484 = call i32 (ptr, ...) @scanf(ptr %4483, ptr %4482)
  %4485 = load i32, ptr %4482, align 4
  %4486 = icmp eq i32 %4485, 0
  br label %continuation5976

continuation5976:                                 ; preds = %else5978, %then5977
  %4487 = phi i1 [ %4486, %else5978 ], [ true, %then5977 ]
  br i1 %4487, label %then5985, label %else5986

then5985:                                         ; preds = %continuation5976
  br label %continuation5984

else5986:                                         ; preds = %continuation5976
  %4488 = alloca i32, align 4
  %4489 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4490 = call i32 (ptr, ...) @scanf(ptr %4489, ptr %4488)
  %4491 = load i32, ptr %4488, align 4
  %4492 = icmp eq i32 %4491, 0
  br label %continuation5984

continuation5984:                                 ; preds = %else5986, %then5985
  %4493 = phi i1 [ %4492, %else5986 ], [ true, %then5985 ]
  br i1 %4493, label %then5993, label %else5994

then5993:                                         ; preds = %continuation5984
  br label %continuation5992

else5994:                                         ; preds = %continuation5984
  %4494 = alloca i32, align 4
  %4495 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4496 = call i32 (ptr, ...) @scanf(ptr %4495, ptr %4494)
  %4497 = load i32, ptr %4494, align 4
  %4498 = icmp eq i32 %4497, 0
  br label %continuation5992

continuation5992:                                 ; preds = %else5994, %then5993
  %4499 = phi i1 [ %4498, %else5994 ], [ true, %then5993 ]
  br i1 %4499, label %then6001, label %else6002

then6001:                                         ; preds = %continuation5992
  br label %continuation6000

else6002:                                         ; preds = %continuation5992
  %4500 = alloca i32, align 4
  %4501 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4502 = call i32 (ptr, ...) @scanf(ptr %4501, ptr %4500)
  %4503 = load i32, ptr %4500, align 4
  %4504 = icmp eq i32 %4503, 0
  br label %continuation6000

continuation6000:                                 ; preds = %else6002, %then6001
  %4505 = phi i1 [ %4504, %else6002 ], [ true, %then6001 ]
  br i1 %4505, label %then6009, label %else6010

then6009:                                         ; preds = %continuation6000
  br label %continuation6008

else6010:                                         ; preds = %continuation6000
  %4506 = alloca i32, align 4
  %4507 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4508 = call i32 (ptr, ...) @scanf(ptr %4507, ptr %4506)
  %4509 = load i32, ptr %4506, align 4
  %4510 = icmp eq i32 %4509, 0
  br label %continuation6008

continuation6008:                                 ; preds = %else6010, %then6009
  %4511 = phi i1 [ %4510, %else6010 ], [ true, %then6009 ]
  br i1 %4511, label %then6017, label %else6018

then6017:                                         ; preds = %continuation6008
  br label %continuation6016

else6018:                                         ; preds = %continuation6008
  %4512 = alloca i32, align 4
  %4513 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4514 = call i32 (ptr, ...) @scanf(ptr %4513, ptr %4512)
  %4515 = load i32, ptr %4512, align 4
  %4516 = icmp eq i32 %4515, 0
  br label %continuation6016

continuation6016:                                 ; preds = %else6018, %then6017
  %4517 = phi i1 [ %4516, %else6018 ], [ true, %then6017 ]
  br i1 %4517, label %then6025, label %else6026

then6025:                                         ; preds = %continuation6016
  br label %continuation6024

else6026:                                         ; preds = %continuation6016
  %4518 = alloca i32, align 4
  %4519 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4520 = call i32 (ptr, ...) @scanf(ptr %4519, ptr %4518)
  %4521 = load i32, ptr %4518, align 4
  %4522 = icmp eq i32 %4521, 0
  br label %continuation6024

continuation6024:                                 ; preds = %else6026, %then6025
  %4523 = phi i1 [ %4522, %else6026 ], [ true, %then6025 ]
  br i1 %4523, label %then6033, label %else6034

then6033:                                         ; preds = %continuation6024
  br label %continuation6032

else6034:                                         ; preds = %continuation6024
  %4524 = alloca i32, align 4
  %4525 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4526 = call i32 (ptr, ...) @scanf(ptr %4525, ptr %4524)
  %4527 = load i32, ptr %4524, align 4
  %4528 = icmp eq i32 %4527, 0
  br label %continuation6032

continuation6032:                                 ; preds = %else6034, %then6033
  %4529 = phi i1 [ %4528, %else6034 ], [ true, %then6033 ]
  br i1 %4529, label %then6041, label %else6042

then6041:                                         ; preds = %continuation6032
  br label %continuation6040

else6042:                                         ; preds = %continuation6032
  %4530 = alloca i32, align 4
  %4531 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4532 = call i32 (ptr, ...) @scanf(ptr %4531, ptr %4530)
  %4533 = load i32, ptr %4530, align 4
  %4534 = icmp eq i32 %4533, 0
  br label %continuation6040

continuation6040:                                 ; preds = %else6042, %then6041
  %4535 = phi i1 [ %4534, %else6042 ], [ true, %then6041 ]
  br i1 %4535, label %then6049, label %else6050

then6049:                                         ; preds = %continuation6040
  br label %continuation6048

else6050:                                         ; preds = %continuation6040
  %4536 = alloca i32, align 4
  %4537 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4538 = call i32 (ptr, ...) @scanf(ptr %4537, ptr %4536)
  %4539 = load i32, ptr %4536, align 4
  %4540 = icmp eq i32 %4539, 0
  br label %continuation6048

continuation6048:                                 ; preds = %else6050, %then6049
  %4541 = phi i1 [ %4540, %else6050 ], [ true, %then6049 ]
  br i1 %4541, label %then6057, label %else6058

then6057:                                         ; preds = %continuation6048
  br label %continuation6056

else6058:                                         ; preds = %continuation6048
  %4542 = alloca i32, align 4
  %4543 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4544 = call i32 (ptr, ...) @scanf(ptr %4543, ptr %4542)
  %4545 = load i32, ptr %4542, align 4
  %4546 = icmp eq i32 %4545, 0
  br label %continuation6056

continuation6056:                                 ; preds = %else6058, %then6057
  %4547 = phi i1 [ %4546, %else6058 ], [ true, %then6057 ]
  br i1 %4547, label %then6065, label %else6066

then6065:                                         ; preds = %continuation6056
  br label %continuation6064

else6066:                                         ; preds = %continuation6056
  %4548 = alloca i32, align 4
  %4549 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4550 = call i32 (ptr, ...) @scanf(ptr %4549, ptr %4548)
  %4551 = load i32, ptr %4548, align 4
  %4552 = icmp eq i32 %4551, 0
  br label %continuation6064

continuation6064:                                 ; preds = %else6066, %then6065
  %4553 = phi i1 [ %4552, %else6066 ], [ true, %then6065 ]
  br i1 %4553, label %then6073, label %else6074

then6073:                                         ; preds = %continuation6064
  br label %continuation6072

else6074:                                         ; preds = %continuation6064
  %4554 = alloca i32, align 4
  %4555 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4556 = call i32 (ptr, ...) @scanf(ptr %4555, ptr %4554)
  %4557 = load i32, ptr %4554, align 4
  %4558 = icmp eq i32 %4557, 0
  br label %continuation6072

continuation6072:                                 ; preds = %else6074, %then6073
  %4559 = phi i1 [ %4558, %else6074 ], [ true, %then6073 ]
  br i1 %4559, label %then6081, label %else6082

then6081:                                         ; preds = %continuation6072
  br label %continuation6080

else6082:                                         ; preds = %continuation6072
  %4560 = alloca i32, align 4
  %4561 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4562 = call i32 (ptr, ...) @scanf(ptr %4561, ptr %4560)
  %4563 = load i32, ptr %4560, align 4
  %4564 = icmp eq i32 %4563, 0
  br label %continuation6080

continuation6080:                                 ; preds = %else6082, %then6081
  %4565 = phi i1 [ %4564, %else6082 ], [ true, %then6081 ]
  br i1 %4565, label %then6089, label %else6090

then6089:                                         ; preds = %continuation6080
  br label %continuation6088

else6090:                                         ; preds = %continuation6080
  %4566 = alloca i32, align 4
  %4567 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4568 = call i32 (ptr, ...) @scanf(ptr %4567, ptr %4566)
  %4569 = load i32, ptr %4566, align 4
  %4570 = icmp eq i32 %4569, 0
  br label %continuation6088

continuation6088:                                 ; preds = %else6090, %then6089
  %4571 = phi i1 [ %4570, %else6090 ], [ true, %then6089 ]
  br i1 %4571, label %then6097, label %else6098

then6097:                                         ; preds = %continuation6088
  br label %continuation6096

else6098:                                         ; preds = %continuation6088
  %4572 = alloca i32, align 4
  %4573 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4574 = call i32 (ptr, ...) @scanf(ptr %4573, ptr %4572)
  %4575 = load i32, ptr %4572, align 4
  %4576 = icmp eq i32 %4575, 0
  br label %continuation6096

continuation6096:                                 ; preds = %else6098, %then6097
  %4577 = phi i1 [ %4576, %else6098 ], [ true, %then6097 ]
  br i1 %4577, label %then6105, label %else6106

then6105:                                         ; preds = %continuation6096
  br label %continuation6104

else6106:                                         ; preds = %continuation6096
  %4578 = alloca i32, align 4
  %4579 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4580 = call i32 (ptr, ...) @scanf(ptr %4579, ptr %4578)
  %4581 = load i32, ptr %4578, align 4
  %4582 = icmp eq i32 %4581, 0
  br label %continuation6104

continuation6104:                                 ; preds = %else6106, %then6105
  %4583 = phi i1 [ %4582, %else6106 ], [ true, %then6105 ]
  br i1 %4583, label %then6113, label %else6114

then6113:                                         ; preds = %continuation6104
  br label %continuation6112

else6114:                                         ; preds = %continuation6104
  %4584 = alloca i32, align 4
  %4585 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4586 = call i32 (ptr, ...) @scanf(ptr %4585, ptr %4584)
  %4587 = load i32, ptr %4584, align 4
  %4588 = icmp eq i32 %4587, 0
  br label %continuation6112

continuation6112:                                 ; preds = %else6114, %then6113
  %4589 = phi i1 [ %4588, %else6114 ], [ true, %then6113 ]
  br i1 %4589, label %then6121, label %else6122

then6121:                                         ; preds = %continuation6112
  br label %continuation6120

else6122:                                         ; preds = %continuation6112
  %4590 = alloca i32, align 4
  %4591 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4592 = call i32 (ptr, ...) @scanf(ptr %4591, ptr %4590)
  %4593 = load i32, ptr %4590, align 4
  %4594 = icmp eq i32 %4593, 0
  br label %continuation6120

continuation6120:                                 ; preds = %else6122, %then6121
  %4595 = phi i1 [ %4594, %else6122 ], [ true, %then6121 ]
  br i1 %4595, label %then6129, label %else6130

then6129:                                         ; preds = %continuation6120
  br label %continuation6128

else6130:                                         ; preds = %continuation6120
  %4596 = alloca i32, align 4
  %4597 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4598 = call i32 (ptr, ...) @scanf(ptr %4597, ptr %4596)
  %4599 = load i32, ptr %4596, align 4
  %4600 = icmp eq i32 %4599, 0
  br label %continuation6128

continuation6128:                                 ; preds = %else6130, %then6129
  %4601 = phi i1 [ %4600, %else6130 ], [ true, %then6129 ]
  br i1 %4601, label %then6137, label %else6138

then6137:                                         ; preds = %continuation6128
  br label %continuation6136

else6138:                                         ; preds = %continuation6128
  %4602 = alloca i32, align 4
  %4603 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4604 = call i32 (ptr, ...) @scanf(ptr %4603, ptr %4602)
  %4605 = load i32, ptr %4602, align 4
  %4606 = icmp eq i32 %4605, 0
  br label %continuation6136

continuation6136:                                 ; preds = %else6138, %then6137
  %4607 = phi i1 [ %4606, %else6138 ], [ true, %then6137 ]
  br i1 %4607, label %then6145, label %else6146

then6145:                                         ; preds = %continuation6136
  br label %continuation6144

else6146:                                         ; preds = %continuation6136
  %4608 = alloca i32, align 4
  %4609 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4610 = call i32 (ptr, ...) @scanf(ptr %4609, ptr %4608)
  %4611 = load i32, ptr %4608, align 4
  %4612 = icmp eq i32 %4611, 0
  br label %continuation6144

continuation6144:                                 ; preds = %else6146, %then6145
  %4613 = phi i1 [ %4612, %else6146 ], [ true, %then6145 ]
  br i1 %4613, label %then6153, label %else6154

then6153:                                         ; preds = %continuation6144
  br label %continuation6152

else6154:                                         ; preds = %continuation6144
  %4614 = alloca i32, align 4
  %4615 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4616 = call i32 (ptr, ...) @scanf(ptr %4615, ptr %4614)
  %4617 = load i32, ptr %4614, align 4
  %4618 = icmp eq i32 %4617, 0
  br label %continuation6152

continuation6152:                                 ; preds = %else6154, %then6153
  %4619 = phi i1 [ %4618, %else6154 ], [ true, %then6153 ]
  br i1 %4619, label %then6161, label %else6162

then6161:                                         ; preds = %continuation6152
  br label %continuation6160

else6162:                                         ; preds = %continuation6152
  %4620 = alloca i32, align 4
  %4621 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4622 = call i32 (ptr, ...) @scanf(ptr %4621, ptr %4620)
  %4623 = load i32, ptr %4620, align 4
  %4624 = icmp eq i32 %4623, 0
  br label %continuation6160

continuation6160:                                 ; preds = %else6162, %then6161
  %4625 = phi i1 [ %4624, %else6162 ], [ true, %then6161 ]
  br i1 %4625, label %then6169, label %else6170

then6169:                                         ; preds = %continuation6160
  br label %continuation6168

else6170:                                         ; preds = %continuation6160
  %4626 = alloca i32, align 4
  %4627 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4628 = call i32 (ptr, ...) @scanf(ptr %4627, ptr %4626)
  %4629 = load i32, ptr %4626, align 4
  %4630 = icmp eq i32 %4629, 0
  br label %continuation6168

continuation6168:                                 ; preds = %else6170, %then6169
  %4631 = phi i1 [ %4630, %else6170 ], [ true, %then6169 ]
  br i1 %4631, label %then6177, label %else6178

then6177:                                         ; preds = %continuation6168
  br label %continuation6176

else6178:                                         ; preds = %continuation6168
  %4632 = alloca i32, align 4
  %4633 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4634 = call i32 (ptr, ...) @scanf(ptr %4633, ptr %4632)
  %4635 = load i32, ptr %4632, align 4
  %4636 = icmp eq i32 %4635, 0
  br label %continuation6176

continuation6176:                                 ; preds = %else6178, %then6177
  %4637 = phi i1 [ %4636, %else6178 ], [ true, %then6177 ]
  br i1 %4637, label %then6185, label %else6186

then6185:                                         ; preds = %continuation6176
  br label %continuation6184

else6186:                                         ; preds = %continuation6176
  %4638 = alloca i32, align 4
  %4639 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4640 = call i32 (ptr, ...) @scanf(ptr %4639, ptr %4638)
  %4641 = load i32, ptr %4638, align 4
  %4642 = icmp eq i32 %4641, 0
  br label %continuation6184

continuation6184:                                 ; preds = %else6186, %then6185
  %4643 = phi i1 [ %4642, %else6186 ], [ true, %then6185 ]
  br i1 %4643, label %then6193, label %else6194

then6193:                                         ; preds = %continuation6184
  br label %continuation6192

else6194:                                         ; preds = %continuation6184
  %4644 = alloca i32, align 4
  %4645 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4646 = call i32 (ptr, ...) @scanf(ptr %4645, ptr %4644)
  %4647 = load i32, ptr %4644, align 4
  %4648 = icmp eq i32 %4647, 0
  br label %continuation6192

continuation6192:                                 ; preds = %else6194, %then6193
  %4649 = phi i1 [ %4648, %else6194 ], [ true, %then6193 ]
  br i1 %4649, label %then6201, label %else6202

then6201:                                         ; preds = %continuation6192
  br label %continuation6200

else6202:                                         ; preds = %continuation6192
  %4650 = alloca i32, align 4
  %4651 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4652 = call i32 (ptr, ...) @scanf(ptr %4651, ptr %4650)
  %4653 = load i32, ptr %4650, align 4
  %4654 = icmp eq i32 %4653, 0
  br label %continuation6200

continuation6200:                                 ; preds = %else6202, %then6201
  %4655 = phi i1 [ %4654, %else6202 ], [ true, %then6201 ]
  br i1 %4655, label %then6209, label %else6210

then6209:                                         ; preds = %continuation6200
  br label %continuation6208

else6210:                                         ; preds = %continuation6200
  %4656 = alloca i32, align 4
  %4657 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4658 = call i32 (ptr, ...) @scanf(ptr %4657, ptr %4656)
  %4659 = load i32, ptr %4656, align 4
  %4660 = icmp eq i32 %4659, 0
  br label %continuation6208

continuation6208:                                 ; preds = %else6210, %then6209
  %4661 = phi i1 [ %4660, %else6210 ], [ true, %then6209 ]
  br i1 %4661, label %then6217, label %else6218

then6217:                                         ; preds = %continuation6208
  br label %continuation6216

else6218:                                         ; preds = %continuation6208
  %4662 = alloca i32, align 4
  %4663 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4664 = call i32 (ptr, ...) @scanf(ptr %4663, ptr %4662)
  %4665 = load i32, ptr %4662, align 4
  %4666 = icmp eq i32 %4665, 0
  br label %continuation6216

continuation6216:                                 ; preds = %else6218, %then6217
  %4667 = phi i1 [ %4666, %else6218 ], [ true, %then6217 ]
  br i1 %4667, label %then6225, label %else6226

then6225:                                         ; preds = %continuation6216
  br label %continuation6224

else6226:                                         ; preds = %continuation6216
  %4668 = alloca i32, align 4
  %4669 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4670 = call i32 (ptr, ...) @scanf(ptr %4669, ptr %4668)
  %4671 = load i32, ptr %4668, align 4
  %4672 = icmp eq i32 %4671, 0
  br label %continuation6224

continuation6224:                                 ; preds = %else6226, %then6225
  %4673 = phi i1 [ %4672, %else6226 ], [ true, %then6225 ]
  br i1 %4673, label %then6233, label %else6234

then6233:                                         ; preds = %continuation6224
  br label %continuation6232

else6234:                                         ; preds = %continuation6224
  %4674 = alloca i32, align 4
  %4675 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4676 = call i32 (ptr, ...) @scanf(ptr %4675, ptr %4674)
  %4677 = load i32, ptr %4674, align 4
  %4678 = icmp eq i32 %4677, 0
  br label %continuation6232

continuation6232:                                 ; preds = %else6234, %then6233
  %4679 = phi i1 [ %4678, %else6234 ], [ true, %then6233 ]
  br i1 %4679, label %then6241, label %else6242

then6241:                                         ; preds = %continuation6232
  br label %continuation6240

else6242:                                         ; preds = %continuation6232
  %4680 = alloca i32, align 4
  %4681 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4682 = call i32 (ptr, ...) @scanf(ptr %4681, ptr %4680)
  %4683 = load i32, ptr %4680, align 4
  %4684 = icmp eq i32 %4683, 0
  br label %continuation6240

continuation6240:                                 ; preds = %else6242, %then6241
  %4685 = phi i1 [ %4684, %else6242 ], [ true, %then6241 ]
  br i1 %4685, label %then6249, label %else6250

then6249:                                         ; preds = %continuation6240
  br label %continuation6248

else6250:                                         ; preds = %continuation6240
  %4686 = alloca i32, align 4
  %4687 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4688 = call i32 (ptr, ...) @scanf(ptr %4687, ptr %4686)
  %4689 = load i32, ptr %4686, align 4
  %4690 = icmp eq i32 %4689, 0
  br label %continuation6248

continuation6248:                                 ; preds = %else6250, %then6249
  %4691 = phi i1 [ %4690, %else6250 ], [ true, %then6249 ]
  br i1 %4691, label %then6257, label %else6258

then6257:                                         ; preds = %continuation6248
  br label %continuation6256

else6258:                                         ; preds = %continuation6248
  %4692 = alloca i32, align 4
  %4693 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4694 = call i32 (ptr, ...) @scanf(ptr %4693, ptr %4692)
  %4695 = load i32, ptr %4692, align 4
  %4696 = icmp eq i32 %4695, 0
  br label %continuation6256

continuation6256:                                 ; preds = %else6258, %then6257
  %4697 = phi i1 [ %4696, %else6258 ], [ true, %then6257 ]
  br i1 %4697, label %then6265, label %else6266

then6265:                                         ; preds = %continuation6256
  br label %continuation6264

else6266:                                         ; preds = %continuation6256
  %4698 = alloca i32, align 4
  %4699 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4700 = call i32 (ptr, ...) @scanf(ptr %4699, ptr %4698)
  %4701 = load i32, ptr %4698, align 4
  %4702 = icmp eq i32 %4701, 0
  br label %continuation6264

continuation6264:                                 ; preds = %else6266, %then6265
  %4703 = phi i1 [ %4702, %else6266 ], [ true, %then6265 ]
  br i1 %4703, label %then6273, label %else6274

then6273:                                         ; preds = %continuation6264
  br label %continuation6272

else6274:                                         ; preds = %continuation6264
  %4704 = alloca i32, align 4
  %4705 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4706 = call i32 (ptr, ...) @scanf(ptr %4705, ptr %4704)
  %4707 = load i32, ptr %4704, align 4
  %4708 = icmp eq i32 %4707, 0
  br label %continuation6272

continuation6272:                                 ; preds = %else6274, %then6273
  %4709 = phi i1 [ %4708, %else6274 ], [ true, %then6273 ]
  br i1 %4709, label %then6281, label %else6282

then6281:                                         ; preds = %continuation6272
  br label %continuation6280

else6282:                                         ; preds = %continuation6272
  %4710 = alloca i32, align 4
  %4711 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4712 = call i32 (ptr, ...) @scanf(ptr %4711, ptr %4710)
  %4713 = load i32, ptr %4710, align 4
  %4714 = icmp eq i32 %4713, 0
  br label %continuation6280

continuation6280:                                 ; preds = %else6282, %then6281
  %4715 = phi i1 [ %4714, %else6282 ], [ true, %then6281 ]
  br i1 %4715, label %then6289, label %else6290

then6289:                                         ; preds = %continuation6280
  br label %continuation6288

else6290:                                         ; preds = %continuation6280
  %4716 = alloca i32, align 4
  %4717 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4718 = call i32 (ptr, ...) @scanf(ptr %4717, ptr %4716)
  %4719 = load i32, ptr %4716, align 4
  %4720 = icmp eq i32 %4719, 0
  br label %continuation6288

continuation6288:                                 ; preds = %else6290, %then6289
  %4721 = phi i1 [ %4720, %else6290 ], [ true, %then6289 ]
  br i1 %4721, label %then6297, label %else6298

then6297:                                         ; preds = %continuation6288
  br label %continuation6296

else6298:                                         ; preds = %continuation6288
  %4722 = alloca i32, align 4
  %4723 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4724 = call i32 (ptr, ...) @scanf(ptr %4723, ptr %4722)
  %4725 = load i32, ptr %4722, align 4
  %4726 = icmp eq i32 %4725, 0
  br label %continuation6296

continuation6296:                                 ; preds = %else6298, %then6297
  %4727 = phi i1 [ %4726, %else6298 ], [ true, %then6297 ]
  br i1 %4727, label %then6305, label %else6306

then6305:                                         ; preds = %continuation6296
  br label %continuation6304

else6306:                                         ; preds = %continuation6296
  %4728 = alloca i32, align 4
  %4729 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4730 = call i32 (ptr, ...) @scanf(ptr %4729, ptr %4728)
  %4731 = load i32, ptr %4728, align 4
  %4732 = icmp eq i32 %4731, 0
  br label %continuation6304

continuation6304:                                 ; preds = %else6306, %then6305
  %4733 = phi i1 [ %4732, %else6306 ], [ true, %then6305 ]
  br i1 %4733, label %then6313, label %else6314

then6313:                                         ; preds = %continuation6304
  br label %continuation6312

else6314:                                         ; preds = %continuation6304
  %4734 = alloca i32, align 4
  %4735 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4736 = call i32 (ptr, ...) @scanf(ptr %4735, ptr %4734)
  %4737 = load i32, ptr %4734, align 4
  %4738 = icmp eq i32 %4737, 0
  br label %continuation6312

continuation6312:                                 ; preds = %else6314, %then6313
  %4739 = phi i1 [ %4738, %else6314 ], [ true, %then6313 ]
  br i1 %4739, label %then6321, label %else6322

then6321:                                         ; preds = %continuation6312
  br label %continuation6320

else6322:                                         ; preds = %continuation6312
  %4740 = alloca i32, align 4
  %4741 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4742 = call i32 (ptr, ...) @scanf(ptr %4741, ptr %4740)
  %4743 = load i32, ptr %4740, align 4
  %4744 = icmp eq i32 %4743, 0
  br label %continuation6320

continuation6320:                                 ; preds = %else6322, %then6321
  %4745 = phi i1 [ %4744, %else6322 ], [ true, %then6321 ]
  br i1 %4745, label %then6329, label %else6330

then6329:                                         ; preds = %continuation6320
  br label %continuation6328

else6330:                                         ; preds = %continuation6320
  %4746 = alloca i32, align 4
  %4747 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4748 = call i32 (ptr, ...) @scanf(ptr %4747, ptr %4746)
  %4749 = load i32, ptr %4746, align 4
  %4750 = icmp eq i32 %4749, 0
  br label %continuation6328

continuation6328:                                 ; preds = %else6330, %then6329
  %4751 = phi i1 [ %4750, %else6330 ], [ true, %then6329 ]
  br i1 %4751, label %then6337, label %else6338

then6337:                                         ; preds = %continuation6328
  br label %continuation6336

else6338:                                         ; preds = %continuation6328
  %4752 = alloca i32, align 4
  %4753 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4754 = call i32 (ptr, ...) @scanf(ptr %4753, ptr %4752)
  %4755 = load i32, ptr %4752, align 4
  %4756 = icmp eq i32 %4755, 0
  br label %continuation6336

continuation6336:                                 ; preds = %else6338, %then6337
  %4757 = phi i1 [ %4756, %else6338 ], [ true, %then6337 ]
  br i1 %4757, label %then6345, label %else6346

then6345:                                         ; preds = %continuation6336
  br label %continuation6344

else6346:                                         ; preds = %continuation6336
  %4758 = alloca i32, align 4
  %4759 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4760 = call i32 (ptr, ...) @scanf(ptr %4759, ptr %4758)
  %4761 = load i32, ptr %4758, align 4
  %4762 = icmp eq i32 %4761, 0
  br label %continuation6344

continuation6344:                                 ; preds = %else6346, %then6345
  %4763 = phi i1 [ %4762, %else6346 ], [ true, %then6345 ]
  br i1 %4763, label %then6353, label %else6354

then6353:                                         ; preds = %continuation6344
  br label %continuation6352

else6354:                                         ; preds = %continuation6344
  %4764 = alloca i32, align 4
  %4765 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4766 = call i32 (ptr, ...) @scanf(ptr %4765, ptr %4764)
  %4767 = load i32, ptr %4764, align 4
  %4768 = icmp eq i32 %4767, 0
  br label %continuation6352

continuation6352:                                 ; preds = %else6354, %then6353
  %4769 = phi i1 [ %4768, %else6354 ], [ true, %then6353 ]
  br i1 %4769, label %then6361, label %else6362

then6361:                                         ; preds = %continuation6352
  br label %continuation6360

else6362:                                         ; preds = %continuation6352
  %4770 = alloca i32, align 4
  %4771 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4772 = call i32 (ptr, ...) @scanf(ptr %4771, ptr %4770)
  %4773 = load i32, ptr %4770, align 4
  %4774 = icmp eq i32 %4773, 0
  br label %continuation6360

continuation6360:                                 ; preds = %else6362, %then6361
  %4775 = phi i1 [ %4774, %else6362 ], [ true, %then6361 ]
  br i1 %4775, label %then6369, label %else6370

then6369:                                         ; preds = %continuation6360
  br label %continuation6368

else6370:                                         ; preds = %continuation6360
  %4776 = alloca i32, align 4
  %4777 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4778 = call i32 (ptr, ...) @scanf(ptr %4777, ptr %4776)
  %4779 = load i32, ptr %4776, align 4
  %4780 = icmp eq i32 %4779, 0
  br label %continuation6368

continuation6368:                                 ; preds = %else6370, %then6369
  %4781 = phi i1 [ %4780, %else6370 ], [ true, %then6369 ]
  br i1 %4781, label %then6377, label %else6378

then6377:                                         ; preds = %continuation6368
  br label %continuation6376

else6378:                                         ; preds = %continuation6368
  %4782 = alloca i32, align 4
  %4783 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4784 = call i32 (ptr, ...) @scanf(ptr %4783, ptr %4782)
  %4785 = load i32, ptr %4782, align 4
  %4786 = icmp eq i32 %4785, 0
  br label %continuation6376

continuation6376:                                 ; preds = %else6378, %then6377
  %4787 = phi i1 [ %4786, %else6378 ], [ true, %then6377 ]
  br i1 %4787, label %then6385, label %else6386

then6385:                                         ; preds = %continuation6376
  br label %continuation6384

else6386:                                         ; preds = %continuation6376
  %4788 = alloca i32, align 4
  %4789 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4790 = call i32 (ptr, ...) @scanf(ptr %4789, ptr %4788)
  %4791 = load i32, ptr %4788, align 4
  %4792 = icmp eq i32 %4791, 0
  br label %continuation6384

continuation6384:                                 ; preds = %else6386, %then6385
  %4793 = phi i1 [ %4792, %else6386 ], [ true, %then6385 ]
  br i1 %4793, label %then6393, label %else6394

then6393:                                         ; preds = %continuation6384
  br label %continuation6392

else6394:                                         ; preds = %continuation6384
  %4794 = alloca i32, align 4
  %4795 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4796 = call i32 (ptr, ...) @scanf(ptr %4795, ptr %4794)
  %4797 = load i32, ptr %4794, align 4
  %4798 = icmp eq i32 %4797, 0
  br label %continuation6392

continuation6392:                                 ; preds = %else6394, %then6393
  %4799 = phi i1 [ %4798, %else6394 ], [ true, %then6393 ]
  br i1 %4799, label %then6401, label %else6402

then6401:                                         ; preds = %continuation6392
  br label %continuation6400

else6402:                                         ; preds = %continuation6392
  %4800 = alloca i32, align 4
  %4801 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4802 = call i32 (ptr, ...) @scanf(ptr %4801, ptr %4800)
  %4803 = load i32, ptr %4800, align 4
  %4804 = icmp eq i32 %4803, 0
  br label %continuation6400

continuation6400:                                 ; preds = %else6402, %then6401
  %4805 = phi i1 [ %4804, %else6402 ], [ true, %then6401 ]
  br i1 %4805, label %then6409, label %else6410

then6409:                                         ; preds = %continuation6400
  br label %continuation6408

else6410:                                         ; preds = %continuation6400
  %4806 = alloca i32, align 4
  %4807 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4808 = call i32 (ptr, ...) @scanf(ptr %4807, ptr %4806)
  %4809 = load i32, ptr %4806, align 4
  %4810 = icmp eq i32 %4809, 0
  br label %continuation6408

continuation6408:                                 ; preds = %else6410, %then6409
  %4811 = phi i1 [ %4810, %else6410 ], [ true, %then6409 ]
  br i1 %4811, label %then6417, label %else6418

then6417:                                         ; preds = %continuation6408
  br label %continuation6416

else6418:                                         ; preds = %continuation6408
  %4812 = alloca i32, align 4
  %4813 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4814 = call i32 (ptr, ...) @scanf(ptr %4813, ptr %4812)
  %4815 = load i32, ptr %4812, align 4
  %4816 = icmp eq i32 %4815, 0
  br label %continuation6416

continuation6416:                                 ; preds = %else6418, %then6417
  %4817 = phi i1 [ %4816, %else6418 ], [ true, %then6417 ]
  br i1 %4817, label %then6425, label %else6426

then6425:                                         ; preds = %continuation6416
  br label %continuation6424

else6426:                                         ; preds = %continuation6416
  %4818 = alloca i32, align 4
  %4819 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4820 = call i32 (ptr, ...) @scanf(ptr %4819, ptr %4818)
  %4821 = load i32, ptr %4818, align 4
  %4822 = icmp eq i32 %4821, 0
  br label %continuation6424

continuation6424:                                 ; preds = %else6426, %then6425
  %4823 = phi i1 [ %4822, %else6426 ], [ true, %then6425 ]
  br i1 %4823, label %then6433, label %else6434

then6433:                                         ; preds = %continuation6424
  br label %continuation6432

else6434:                                         ; preds = %continuation6424
  %4824 = alloca i32, align 4
  %4825 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4826 = call i32 (ptr, ...) @scanf(ptr %4825, ptr %4824)
  %4827 = load i32, ptr %4824, align 4
  %4828 = icmp eq i32 %4827, 0
  br label %continuation6432

continuation6432:                                 ; preds = %else6434, %then6433
  %4829 = phi i1 [ %4828, %else6434 ], [ true, %then6433 ]
  br i1 %4829, label %then6441, label %else6442

then6441:                                         ; preds = %continuation6432
  br label %continuation6440

else6442:                                         ; preds = %continuation6432
  %4830 = alloca i32, align 4
  %4831 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4832 = call i32 (ptr, ...) @scanf(ptr %4831, ptr %4830)
  %4833 = load i32, ptr %4830, align 4
  %4834 = icmp eq i32 %4833, 0
  br label %continuation6440

continuation6440:                                 ; preds = %else6442, %then6441
  %4835 = phi i1 [ %4834, %else6442 ], [ true, %then6441 ]
  br i1 %4835, label %then6449, label %else6450

then6449:                                         ; preds = %continuation6440
  br label %continuation6448

else6450:                                         ; preds = %continuation6440
  %4836 = alloca i32, align 4
  %4837 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4838 = call i32 (ptr, ...) @scanf(ptr %4837, ptr %4836)
  %4839 = load i32, ptr %4836, align 4
  %4840 = icmp eq i32 %4839, 0
  br label %continuation6448

continuation6448:                                 ; preds = %else6450, %then6449
  %4841 = phi i1 [ %4840, %else6450 ], [ true, %then6449 ]
  br i1 %4841, label %then6457, label %else6458

then6457:                                         ; preds = %continuation6448
  br label %continuation6456

else6458:                                         ; preds = %continuation6448
  %4842 = alloca i32, align 4
  %4843 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4844 = call i32 (ptr, ...) @scanf(ptr %4843, ptr %4842)
  %4845 = load i32, ptr %4842, align 4
  %4846 = icmp eq i32 %4845, 0
  br label %continuation6456

continuation6456:                                 ; preds = %else6458, %then6457
  %4847 = phi i1 [ %4846, %else6458 ], [ true, %then6457 ]
  br i1 %4847, label %then6465, label %else6466

then6465:                                         ; preds = %continuation6456
  br label %continuation6464

else6466:                                         ; preds = %continuation6456
  %4848 = alloca i32, align 4
  %4849 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4850 = call i32 (ptr, ...) @scanf(ptr %4849, ptr %4848)
  %4851 = load i32, ptr %4848, align 4
  %4852 = icmp eq i32 %4851, 0
  br label %continuation6464

continuation6464:                                 ; preds = %else6466, %then6465
  %4853 = phi i1 [ %4852, %else6466 ], [ true, %then6465 ]
  br i1 %4853, label %then6473, label %else6474

then6473:                                         ; preds = %continuation6464
  br label %continuation6472

else6474:                                         ; preds = %continuation6464
  %4854 = alloca i32, align 4
  %4855 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4856 = call i32 (ptr, ...) @scanf(ptr %4855, ptr %4854)
  %4857 = load i32, ptr %4854, align 4
  %4858 = icmp eq i32 %4857, 0
  br label %continuation6472

continuation6472:                                 ; preds = %else6474, %then6473
  %4859 = phi i1 [ %4858, %else6474 ], [ true, %then6473 ]
  br i1 %4859, label %then6481, label %else6482

then6481:                                         ; preds = %continuation6472
  br label %continuation6480

else6482:                                         ; preds = %continuation6472
  %4860 = alloca i32, align 4
  %4861 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4862 = call i32 (ptr, ...) @scanf(ptr %4861, ptr %4860)
  %4863 = load i32, ptr %4860, align 4
  %4864 = icmp eq i32 %4863, 0
  br label %continuation6480

continuation6480:                                 ; preds = %else6482, %then6481
  %4865 = phi i1 [ %4864, %else6482 ], [ true, %then6481 ]
  br i1 %4865, label %then6489, label %else6490

then6489:                                         ; preds = %continuation6480
  br label %continuation6488

else6490:                                         ; preds = %continuation6480
  %4866 = alloca i32, align 4
  %4867 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4868 = call i32 (ptr, ...) @scanf(ptr %4867, ptr %4866)
  %4869 = load i32, ptr %4866, align 4
  %4870 = icmp eq i32 %4869, 0
  br label %continuation6488

continuation6488:                                 ; preds = %else6490, %then6489
  %4871 = phi i1 [ %4870, %else6490 ], [ true, %then6489 ]
  br i1 %4871, label %then6497, label %else6498

then6497:                                         ; preds = %continuation6488
  br label %continuation6496

else6498:                                         ; preds = %continuation6488
  %4872 = alloca i32, align 4
  %4873 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4874 = call i32 (ptr, ...) @scanf(ptr %4873, ptr %4872)
  %4875 = load i32, ptr %4872, align 4
  %4876 = icmp eq i32 %4875, 0
  br label %continuation6496

continuation6496:                                 ; preds = %else6498, %then6497
  %4877 = phi i1 [ %4876, %else6498 ], [ true, %then6497 ]
  br i1 %4877, label %then6505, label %else6506

then6505:                                         ; preds = %continuation6496
  br label %continuation6504

else6506:                                         ; preds = %continuation6496
  %4878 = alloca i32, align 4
  %4879 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4880 = call i32 (ptr, ...) @scanf(ptr %4879, ptr %4878)
  %4881 = load i32, ptr %4878, align 4
  %4882 = icmp eq i32 %4881, 0
  br label %continuation6504

continuation6504:                                 ; preds = %else6506, %then6505
  %4883 = phi i1 [ %4882, %else6506 ], [ true, %then6505 ]
  br i1 %4883, label %then6513, label %else6514

then6513:                                         ; preds = %continuation6504
  br label %continuation6512

else6514:                                         ; preds = %continuation6504
  %4884 = alloca i32, align 4
  %4885 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4886 = call i32 (ptr, ...) @scanf(ptr %4885, ptr %4884)
  %4887 = load i32, ptr %4884, align 4
  %4888 = icmp eq i32 %4887, 0
  br label %continuation6512

continuation6512:                                 ; preds = %else6514, %then6513
  %4889 = phi i1 [ %4888, %else6514 ], [ true, %then6513 ]
  br i1 %4889, label %then6521, label %else6522

then6521:                                         ; preds = %continuation6512
  br label %continuation6520

else6522:                                         ; preds = %continuation6512
  %4890 = alloca i32, align 4
  %4891 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4892 = call i32 (ptr, ...) @scanf(ptr %4891, ptr %4890)
  %4893 = load i32, ptr %4890, align 4
  %4894 = icmp eq i32 %4893, 0
  br label %continuation6520

continuation6520:                                 ; preds = %else6522, %then6521
  %4895 = phi i1 [ %4894, %else6522 ], [ true, %then6521 ]
  br i1 %4895, label %then6529, label %else6530

then6529:                                         ; preds = %continuation6520
  br label %continuation6528

else6530:                                         ; preds = %continuation6520
  %4896 = alloca i32, align 4
  %4897 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4898 = call i32 (ptr, ...) @scanf(ptr %4897, ptr %4896)
  %4899 = load i32, ptr %4896, align 4
  %4900 = icmp eq i32 %4899, 0
  br label %continuation6528

continuation6528:                                 ; preds = %else6530, %then6529
  %4901 = phi i1 [ %4900, %else6530 ], [ true, %then6529 ]
  br i1 %4901, label %then6537, label %else6538

then6537:                                         ; preds = %continuation6528
  br label %continuation6536

else6538:                                         ; preds = %continuation6528
  %4902 = alloca i32, align 4
  %4903 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4904 = call i32 (ptr, ...) @scanf(ptr %4903, ptr %4902)
  %4905 = load i32, ptr %4902, align 4
  %4906 = icmp eq i32 %4905, 0
  br label %continuation6536

continuation6536:                                 ; preds = %else6538, %then6537
  %4907 = phi i1 [ %4906, %else6538 ], [ true, %then6537 ]
  br i1 %4907, label %then6545, label %else6546

then6545:                                         ; preds = %continuation6536
  br label %continuation6544

else6546:                                         ; preds = %continuation6536
  %4908 = alloca i32, align 4
  %4909 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4910 = call i32 (ptr, ...) @scanf(ptr %4909, ptr %4908)
  %4911 = load i32, ptr %4908, align 4
  %4912 = icmp eq i32 %4911, 0
  br label %continuation6544

continuation6544:                                 ; preds = %else6546, %then6545
  %4913 = phi i1 [ %4912, %else6546 ], [ true, %then6545 ]
  br i1 %4913, label %then6553, label %else6554

then6553:                                         ; preds = %continuation6544
  br label %continuation6552

else6554:                                         ; preds = %continuation6544
  %4914 = alloca i32, align 4
  %4915 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4916 = call i32 (ptr, ...) @scanf(ptr %4915, ptr %4914)
  %4917 = load i32, ptr %4914, align 4
  %4918 = icmp eq i32 %4917, 0
  br label %continuation6552

continuation6552:                                 ; preds = %else6554, %then6553
  %4919 = phi i1 [ %4918, %else6554 ], [ true, %then6553 ]
  br i1 %4919, label %then6561, label %else6562

then6561:                                         ; preds = %continuation6552
  br label %continuation6560

else6562:                                         ; preds = %continuation6552
  %4920 = alloca i32, align 4
  %4921 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4922 = call i32 (ptr, ...) @scanf(ptr %4921, ptr %4920)
  %4923 = load i32, ptr %4920, align 4
  %4924 = icmp eq i32 %4923, 0
  br label %continuation6560

continuation6560:                                 ; preds = %else6562, %then6561
  %4925 = phi i1 [ %4924, %else6562 ], [ true, %then6561 ]
  br i1 %4925, label %then6569, label %else6570

then6569:                                         ; preds = %continuation6560
  br label %continuation6568

else6570:                                         ; preds = %continuation6560
  %4926 = alloca i32, align 4
  %4927 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4928 = call i32 (ptr, ...) @scanf(ptr %4927, ptr %4926)
  %4929 = load i32, ptr %4926, align 4
  %4930 = icmp eq i32 %4929, 0
  br label %continuation6568

continuation6568:                                 ; preds = %else6570, %then6569
  %4931 = phi i1 [ %4930, %else6570 ], [ true, %then6569 ]
  br i1 %4931, label %then6577, label %else6578

then6577:                                         ; preds = %continuation6568
  br label %continuation6576

else6578:                                         ; preds = %continuation6568
  %4932 = alloca i32, align 4
  %4933 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4934 = call i32 (ptr, ...) @scanf(ptr %4933, ptr %4932)
  %4935 = load i32, ptr %4932, align 4
  %4936 = icmp eq i32 %4935, 0
  br label %continuation6576

continuation6576:                                 ; preds = %else6578, %then6577
  %4937 = phi i1 [ %4936, %else6578 ], [ true, %then6577 ]
  br i1 %4937, label %then6585, label %else6586

then6585:                                         ; preds = %continuation6576
  br label %continuation6584

else6586:                                         ; preds = %continuation6576
  %4938 = alloca i32, align 4
  %4939 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4940 = call i32 (ptr, ...) @scanf(ptr %4939, ptr %4938)
  %4941 = load i32, ptr %4938, align 4
  %4942 = icmp eq i32 %4941, 0
  br label %continuation6584

continuation6584:                                 ; preds = %else6586, %then6585
  %4943 = phi i1 [ %4942, %else6586 ], [ true, %then6585 ]
  br i1 %4943, label %then6593, label %else6594

then6593:                                         ; preds = %continuation6584
  br label %continuation6592

else6594:                                         ; preds = %continuation6584
  %4944 = alloca i32, align 4
  %4945 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4946 = call i32 (ptr, ...) @scanf(ptr %4945, ptr %4944)
  %4947 = load i32, ptr %4944, align 4
  %4948 = icmp eq i32 %4947, 0
  br label %continuation6592

continuation6592:                                 ; preds = %else6594, %then6593
  %4949 = phi i1 [ %4948, %else6594 ], [ true, %then6593 ]
  br i1 %4949, label %then6601, label %else6602

then6601:                                         ; preds = %continuation6592
  br label %continuation6600

else6602:                                         ; preds = %continuation6592
  %4950 = alloca i32, align 4
  %4951 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4952 = call i32 (ptr, ...) @scanf(ptr %4951, ptr %4950)
  %4953 = load i32, ptr %4950, align 4
  %4954 = icmp eq i32 %4953, 0
  br label %continuation6600

continuation6600:                                 ; preds = %else6602, %then6601
  %4955 = phi i1 [ %4954, %else6602 ], [ true, %then6601 ]
  br i1 %4955, label %then6609, label %else6610

then6609:                                         ; preds = %continuation6600
  br label %continuation6608

else6610:                                         ; preds = %continuation6600
  %4956 = alloca i32, align 4
  %4957 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4958 = call i32 (ptr, ...) @scanf(ptr %4957, ptr %4956)
  %4959 = load i32, ptr %4956, align 4
  %4960 = icmp eq i32 %4959, 0
  br label %continuation6608

continuation6608:                                 ; preds = %else6610, %then6609
  %4961 = phi i1 [ %4960, %else6610 ], [ true, %then6609 ]
  br i1 %4961, label %then6617, label %else6618

then6617:                                         ; preds = %continuation6608
  br label %continuation6616

else6618:                                         ; preds = %continuation6608
  %4962 = alloca i32, align 4
  %4963 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4964 = call i32 (ptr, ...) @scanf(ptr %4963, ptr %4962)
  %4965 = load i32, ptr %4962, align 4
  %4966 = icmp eq i32 %4965, 0
  br label %continuation6616

continuation6616:                                 ; preds = %else6618, %then6617
  %4967 = phi i1 [ %4966, %else6618 ], [ true, %then6617 ]
  br i1 %4967, label %then6625, label %else6626

then6625:                                         ; preds = %continuation6616
  br label %continuation6624

else6626:                                         ; preds = %continuation6616
  %4968 = alloca i32, align 4
  %4969 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4970 = call i32 (ptr, ...) @scanf(ptr %4969, ptr %4968)
  %4971 = load i32, ptr %4968, align 4
  %4972 = icmp eq i32 %4971, 0
  br label %continuation6624

continuation6624:                                 ; preds = %else6626, %then6625
  %4973 = phi i1 [ %4972, %else6626 ], [ true, %then6625 ]
  br i1 %4973, label %then6633, label %else6634

then6633:                                         ; preds = %continuation6624
  br label %continuation6632

else6634:                                         ; preds = %continuation6624
  %4974 = alloca i32, align 4
  %4975 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4976 = call i32 (ptr, ...) @scanf(ptr %4975, ptr %4974)
  %4977 = load i32, ptr %4974, align 4
  %4978 = icmp eq i32 %4977, 0
  br label %continuation6632

continuation6632:                                 ; preds = %else6634, %then6633
  %4979 = phi i1 [ %4978, %else6634 ], [ true, %then6633 ]
  br i1 %4979, label %then6641, label %else6642

then6641:                                         ; preds = %continuation6632
  br label %continuation6640

else6642:                                         ; preds = %continuation6632
  %4980 = alloca i32, align 4
  %4981 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4982 = call i32 (ptr, ...) @scanf(ptr %4981, ptr %4980)
  %4983 = load i32, ptr %4980, align 4
  %4984 = icmp eq i32 %4983, 0
  br label %continuation6640

continuation6640:                                 ; preds = %else6642, %then6641
  %4985 = phi i1 [ %4984, %else6642 ], [ true, %then6641 ]
  br i1 %4985, label %then6649, label %else6650

then6649:                                         ; preds = %continuation6640
  br label %continuation6648

else6650:                                         ; preds = %continuation6640
  %4986 = alloca i32, align 4
  %4987 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4988 = call i32 (ptr, ...) @scanf(ptr %4987, ptr %4986)
  %4989 = load i32, ptr %4986, align 4
  %4990 = icmp eq i32 %4989, 0
  br label %continuation6648

continuation6648:                                 ; preds = %else6650, %then6649
  %4991 = phi i1 [ %4990, %else6650 ], [ true, %then6649 ]
  br i1 %4991, label %then6657, label %else6658

then6657:                                         ; preds = %continuation6648
  br label %continuation6656

else6658:                                         ; preds = %continuation6648
  %4992 = alloca i32, align 4
  %4993 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4994 = call i32 (ptr, ...) @scanf(ptr %4993, ptr %4992)
  %4995 = load i32, ptr %4992, align 4
  %4996 = icmp eq i32 %4995, 0
  br label %continuation6656

continuation6656:                                 ; preds = %else6658, %then6657
  %4997 = phi i1 [ %4996, %else6658 ], [ true, %then6657 ]
  br i1 %4997, label %then6665, label %else6666

then6665:                                         ; preds = %continuation6656
  br label %continuation6664

else6666:                                         ; preds = %continuation6656
  %4998 = alloca i32, align 4
  %4999 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5000 = call i32 (ptr, ...) @scanf(ptr %4999, ptr %4998)
  %5001 = load i32, ptr %4998, align 4
  %5002 = icmp eq i32 %5001, 0
  br label %continuation6664

continuation6664:                                 ; preds = %else6666, %then6665
  %5003 = phi i1 [ %5002, %else6666 ], [ true, %then6665 ]
  br i1 %5003, label %then6673, label %else6674

then6673:                                         ; preds = %continuation6664
  br label %continuation6672

else6674:                                         ; preds = %continuation6664
  %5004 = alloca i32, align 4
  %5005 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5006 = call i32 (ptr, ...) @scanf(ptr %5005, ptr %5004)
  %5007 = load i32, ptr %5004, align 4
  %5008 = icmp eq i32 %5007, 0
  br label %continuation6672

continuation6672:                                 ; preds = %else6674, %then6673
  %5009 = phi i1 [ %5008, %else6674 ], [ true, %then6673 ]
  br i1 %5009, label %then6681, label %else6682

then6681:                                         ; preds = %continuation6672
  br label %continuation6680

else6682:                                         ; preds = %continuation6672
  %5010 = alloca i32, align 4
  %5011 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5012 = call i32 (ptr, ...) @scanf(ptr %5011, ptr %5010)
  %5013 = load i32, ptr %5010, align 4
  %5014 = icmp eq i32 %5013, 0
  br label %continuation6680

continuation6680:                                 ; preds = %else6682, %then6681
  %5015 = phi i1 [ %5014, %else6682 ], [ true, %then6681 ]
  br i1 %5015, label %then6689, label %else6690

then6689:                                         ; preds = %continuation6680
  br label %continuation6688

else6690:                                         ; preds = %continuation6680
  %5016 = alloca i32, align 4
  %5017 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5018 = call i32 (ptr, ...) @scanf(ptr %5017, ptr %5016)
  %5019 = load i32, ptr %5016, align 4
  %5020 = icmp eq i32 %5019, 0
  br label %continuation6688

continuation6688:                                 ; preds = %else6690, %then6689
  %5021 = phi i1 [ %5020, %else6690 ], [ true, %then6689 ]
  br i1 %5021, label %then6697, label %else6698

then6697:                                         ; preds = %continuation6688
  br label %continuation6696

else6698:                                         ; preds = %continuation6688
  %5022 = alloca i32, align 4
  %5023 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5024 = call i32 (ptr, ...) @scanf(ptr %5023, ptr %5022)
  %5025 = load i32, ptr %5022, align 4
  %5026 = icmp eq i32 %5025, 0
  br label %continuation6696

continuation6696:                                 ; preds = %else6698, %then6697
  %5027 = phi i1 [ %5026, %else6698 ], [ true, %then6697 ]
  br i1 %5027, label %then6705, label %else6706

then6705:                                         ; preds = %continuation6696
  br label %continuation6704

else6706:                                         ; preds = %continuation6696
  %5028 = alloca i32, align 4
  %5029 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5030 = call i32 (ptr, ...) @scanf(ptr %5029, ptr %5028)
  %5031 = load i32, ptr %5028, align 4
  %5032 = icmp eq i32 %5031, 0
  br label %continuation6704

continuation6704:                                 ; preds = %else6706, %then6705
  %5033 = phi i1 [ %5032, %else6706 ], [ true, %then6705 ]
  br i1 %5033, label %then6713, label %else6714

then6713:                                         ; preds = %continuation6704
  br label %continuation6712

else6714:                                         ; preds = %continuation6704
  %5034 = alloca i32, align 4
  %5035 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5036 = call i32 (ptr, ...) @scanf(ptr %5035, ptr %5034)
  %5037 = load i32, ptr %5034, align 4
  %5038 = icmp eq i32 %5037, 0
  br label %continuation6712

continuation6712:                                 ; preds = %else6714, %then6713
  %5039 = phi i1 [ %5038, %else6714 ], [ true, %then6713 ]
  br i1 %5039, label %then6721, label %else6722

then6721:                                         ; preds = %continuation6712
  br label %continuation6720

else6722:                                         ; preds = %continuation6712
  %5040 = alloca i32, align 4
  %5041 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5042 = call i32 (ptr, ...) @scanf(ptr %5041, ptr %5040)
  %5043 = load i32, ptr %5040, align 4
  %5044 = icmp eq i32 %5043, 0
  br label %continuation6720

continuation6720:                                 ; preds = %else6722, %then6721
  %5045 = phi i1 [ %5044, %else6722 ], [ true, %then6721 ]
  br i1 %5045, label %then6729, label %else6730

then6729:                                         ; preds = %continuation6720
  br label %continuation6728

else6730:                                         ; preds = %continuation6720
  %5046 = alloca i32, align 4
  %5047 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5048 = call i32 (ptr, ...) @scanf(ptr %5047, ptr %5046)
  %5049 = load i32, ptr %5046, align 4
  %5050 = icmp eq i32 %5049, 0
  br label %continuation6728

continuation6728:                                 ; preds = %else6730, %then6729
  %5051 = phi i1 [ %5050, %else6730 ], [ true, %then6729 ]
  br i1 %5051, label %then6737, label %else6738

then6737:                                         ; preds = %continuation6728
  br label %continuation6736

else6738:                                         ; preds = %continuation6728
  %5052 = alloca i32, align 4
  %5053 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5054 = call i32 (ptr, ...) @scanf(ptr %5053, ptr %5052)
  %5055 = load i32, ptr %5052, align 4
  %5056 = icmp eq i32 %5055, 0
  br label %continuation6736

continuation6736:                                 ; preds = %else6738, %then6737
  %5057 = phi i1 [ %5056, %else6738 ], [ true, %then6737 ]
  br i1 %5057, label %then6745, label %else6746

then6745:                                         ; preds = %continuation6736
  br label %continuation6744

else6746:                                         ; preds = %continuation6736
  %5058 = alloca i32, align 4
  %5059 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5060 = call i32 (ptr, ...) @scanf(ptr %5059, ptr %5058)
  %5061 = load i32, ptr %5058, align 4
  %5062 = icmp eq i32 %5061, 0
  br label %continuation6744

continuation6744:                                 ; preds = %else6746, %then6745
  %5063 = phi i1 [ %5062, %else6746 ], [ true, %then6745 ]
  br i1 %5063, label %then6753, label %else6754

then6753:                                         ; preds = %continuation6744
  br label %continuation6752

else6754:                                         ; preds = %continuation6744
  %5064 = alloca i32, align 4
  %5065 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5066 = call i32 (ptr, ...) @scanf(ptr %5065, ptr %5064)
  %5067 = load i32, ptr %5064, align 4
  %5068 = icmp eq i32 %5067, 0
  br label %continuation6752

continuation6752:                                 ; preds = %else6754, %then6753
  %5069 = phi i1 [ %5068, %else6754 ], [ true, %then6753 ]
  br i1 %5069, label %then6761, label %else6762

then6761:                                         ; preds = %continuation6752
  br label %continuation6760

else6762:                                         ; preds = %continuation6752
  %5070 = alloca i32, align 4
  %5071 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5072 = call i32 (ptr, ...) @scanf(ptr %5071, ptr %5070)
  %5073 = load i32, ptr %5070, align 4
  %5074 = icmp eq i32 %5073, 0
  br label %continuation6760

continuation6760:                                 ; preds = %else6762, %then6761
  %5075 = phi i1 [ %5074, %else6762 ], [ true, %then6761 ]
  br i1 %5075, label %then6769, label %else6770

then6769:                                         ; preds = %continuation6760
  br label %continuation6768

else6770:                                         ; preds = %continuation6760
  %5076 = alloca i32, align 4
  %5077 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5078 = call i32 (ptr, ...) @scanf(ptr %5077, ptr %5076)
  %5079 = load i32, ptr %5076, align 4
  %5080 = icmp eq i32 %5079, 0
  br label %continuation6768

continuation6768:                                 ; preds = %else6770, %then6769
  %5081 = phi i1 [ %5080, %else6770 ], [ true, %then6769 ]
  br i1 %5081, label %then6777, label %else6778

then6777:                                         ; preds = %continuation6768
  br label %continuation6776

else6778:                                         ; preds = %continuation6768
  %5082 = alloca i32, align 4
  %5083 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5084 = call i32 (ptr, ...) @scanf(ptr %5083, ptr %5082)
  %5085 = load i32, ptr %5082, align 4
  %5086 = icmp eq i32 %5085, 0
  br label %continuation6776

continuation6776:                                 ; preds = %else6778, %then6777
  %5087 = phi i1 [ %5086, %else6778 ], [ true, %then6777 ]
  br i1 %5087, label %then6785, label %else6786

then6785:                                         ; preds = %continuation6776
  br label %continuation6784

else6786:                                         ; preds = %continuation6776
  %5088 = alloca i32, align 4
  %5089 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5090 = call i32 (ptr, ...) @scanf(ptr %5089, ptr %5088)
  %5091 = load i32, ptr %5088, align 4
  %5092 = icmp eq i32 %5091, 0
  br label %continuation6784

continuation6784:                                 ; preds = %else6786, %then6785
  %5093 = phi i1 [ %5092, %else6786 ], [ true, %then6785 ]
  br i1 %5093, label %then6793, label %else6794

then6793:                                         ; preds = %continuation6784
  br label %continuation6792

else6794:                                         ; preds = %continuation6784
  %5094 = alloca i32, align 4
  %5095 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5096 = call i32 (ptr, ...) @scanf(ptr %5095, ptr %5094)
  %5097 = load i32, ptr %5094, align 4
  %5098 = icmp eq i32 %5097, 0
  br label %continuation6792

continuation6792:                                 ; preds = %else6794, %then6793
  %5099 = phi i1 [ %5098, %else6794 ], [ true, %then6793 ]
  br i1 %5099, label %then6801, label %else6802

then6801:                                         ; preds = %continuation6792
  br label %continuation6800

else6802:                                         ; preds = %continuation6792
  %5100 = alloca i32, align 4
  %5101 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5102 = call i32 (ptr, ...) @scanf(ptr %5101, ptr %5100)
  %5103 = load i32, ptr %5100, align 4
  %5104 = icmp eq i32 %5103, 0
  br label %continuation6800

continuation6800:                                 ; preds = %else6802, %then6801
  %5105 = phi i1 [ %5104, %else6802 ], [ true, %then6801 ]
  br i1 %5105, label %then6809, label %else6810

then6809:                                         ; preds = %continuation6800
  br label %continuation6808

else6810:                                         ; preds = %continuation6800
  %5106 = alloca i32, align 4
  %5107 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5108 = call i32 (ptr, ...) @scanf(ptr %5107, ptr %5106)
  %5109 = load i32, ptr %5106, align 4
  %5110 = icmp eq i32 %5109, 0
  br label %continuation6808

continuation6808:                                 ; preds = %else6810, %then6809
  %5111 = phi i1 [ %5110, %else6810 ], [ true, %then6809 ]
  br i1 %5111, label %then6817, label %else6818

then6817:                                         ; preds = %continuation6808
  br label %continuation6816

else6818:                                         ; preds = %continuation6808
  %5112 = alloca i32, align 4
  %5113 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5114 = call i32 (ptr, ...) @scanf(ptr %5113, ptr %5112)
  %5115 = load i32, ptr %5112, align 4
  %5116 = icmp eq i32 %5115, 0
  br label %continuation6816

continuation6816:                                 ; preds = %else6818, %then6817
  %5117 = phi i1 [ %5116, %else6818 ], [ true, %then6817 ]
  br i1 %5117, label %then6825, label %else6826

then6825:                                         ; preds = %continuation6816
  br label %continuation6824

else6826:                                         ; preds = %continuation6816
  %5118 = alloca i32, align 4
  %5119 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5120 = call i32 (ptr, ...) @scanf(ptr %5119, ptr %5118)
  %5121 = load i32, ptr %5118, align 4
  %5122 = icmp eq i32 %5121, 0
  br label %continuation6824

continuation6824:                                 ; preds = %else6826, %then6825
  %5123 = phi i1 [ %5122, %else6826 ], [ true, %then6825 ]
  br i1 %5123, label %then6833, label %else6834

then6833:                                         ; preds = %continuation6824
  br label %continuation6832

else6834:                                         ; preds = %continuation6824
  %5124 = alloca i32, align 4
  %5125 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5126 = call i32 (ptr, ...) @scanf(ptr %5125, ptr %5124)
  %5127 = load i32, ptr %5124, align 4
  %5128 = icmp eq i32 %5127, 0
  br label %continuation6832

continuation6832:                                 ; preds = %else6834, %then6833
  %5129 = phi i1 [ %5128, %else6834 ], [ true, %then6833 ]
  br i1 %5129, label %then6841, label %else6842

then6841:                                         ; preds = %continuation6832
  br label %continuation6840

else6842:                                         ; preds = %continuation6832
  %5130 = alloca i32, align 4
  %5131 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5132 = call i32 (ptr, ...) @scanf(ptr %5131, ptr %5130)
  %5133 = load i32, ptr %5130, align 4
  %5134 = icmp eq i32 %5133, 0
  br label %continuation6840

continuation6840:                                 ; preds = %else6842, %then6841
  %5135 = phi i1 [ %5134, %else6842 ], [ true, %then6841 ]
  br i1 %5135, label %then6849, label %else6850

then6849:                                         ; preds = %continuation6840
  br label %continuation6848

else6850:                                         ; preds = %continuation6840
  %5136 = alloca i32, align 4
  %5137 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5138 = call i32 (ptr, ...) @scanf(ptr %5137, ptr %5136)
  %5139 = load i32, ptr %5136, align 4
  %5140 = icmp eq i32 %5139, 0
  br label %continuation6848

continuation6848:                                 ; preds = %else6850, %then6849
  %5141 = phi i1 [ %5140, %else6850 ], [ true, %then6849 ]
  br i1 %5141, label %then6857, label %else6858

then6857:                                         ; preds = %continuation6848
  br label %continuation6856

else6858:                                         ; preds = %continuation6848
  %5142 = alloca i32, align 4
  %5143 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5144 = call i32 (ptr, ...) @scanf(ptr %5143, ptr %5142)
  %5145 = load i32, ptr %5142, align 4
  %5146 = icmp eq i32 %5145, 0
  br label %continuation6856

continuation6856:                                 ; preds = %else6858, %then6857
  %5147 = phi i1 [ %5146, %else6858 ], [ true, %then6857 ]
  br i1 %5147, label %then6865, label %else6866

then6865:                                         ; preds = %continuation6856
  br label %continuation6864

else6866:                                         ; preds = %continuation6856
  %5148 = alloca i32, align 4
  %5149 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5150 = call i32 (ptr, ...) @scanf(ptr %5149, ptr %5148)
  %5151 = load i32, ptr %5148, align 4
  %5152 = icmp eq i32 %5151, 0
  br label %continuation6864

continuation6864:                                 ; preds = %else6866, %then6865
  %5153 = phi i1 [ %5152, %else6866 ], [ true, %then6865 ]
  br i1 %5153, label %then6873, label %else6874

then6873:                                         ; preds = %continuation6864
  br label %continuation6872

else6874:                                         ; preds = %continuation6864
  %5154 = alloca i32, align 4
  %5155 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5156 = call i32 (ptr, ...) @scanf(ptr %5155, ptr %5154)
  %5157 = load i32, ptr %5154, align 4
  %5158 = icmp eq i32 %5157, 0
  br label %continuation6872

continuation6872:                                 ; preds = %else6874, %then6873
  %5159 = phi i1 [ %5158, %else6874 ], [ true, %then6873 ]
  br i1 %5159, label %then6881, label %else6882

then6881:                                         ; preds = %continuation6872
  br label %continuation6880

else6882:                                         ; preds = %continuation6872
  %5160 = alloca i32, align 4
  %5161 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5162 = call i32 (ptr, ...) @scanf(ptr %5161, ptr %5160)
  %5163 = load i32, ptr %5160, align 4
  %5164 = icmp eq i32 %5163, 0
  br label %continuation6880

continuation6880:                                 ; preds = %else6882, %then6881
  %5165 = phi i1 [ %5164, %else6882 ], [ true, %then6881 ]
  br i1 %5165, label %then6889, label %else6890

then6889:                                         ; preds = %continuation6880
  br label %continuation6888

else6890:                                         ; preds = %continuation6880
  %5166 = alloca i32, align 4
  %5167 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5168 = call i32 (ptr, ...) @scanf(ptr %5167, ptr %5166)
  %5169 = load i32, ptr %5166, align 4
  %5170 = icmp eq i32 %5169, 0
  br label %continuation6888

continuation6888:                                 ; preds = %else6890, %then6889
  %5171 = phi i1 [ %5170, %else6890 ], [ true, %then6889 ]
  br i1 %5171, label %then6897, label %else6898

then6897:                                         ; preds = %continuation6888
  br label %continuation6896

else6898:                                         ; preds = %continuation6888
  %5172 = alloca i32, align 4
  %5173 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5174 = call i32 (ptr, ...) @scanf(ptr %5173, ptr %5172)
  %5175 = load i32, ptr %5172, align 4
  %5176 = icmp eq i32 %5175, 0
  br label %continuation6896

continuation6896:                                 ; preds = %else6898, %then6897
  %5177 = phi i1 [ %5176, %else6898 ], [ true, %then6897 ]
  br i1 %5177, label %then6905, label %else6906

then6905:                                         ; preds = %continuation6896
  br label %continuation6904

else6906:                                         ; preds = %continuation6896
  %5178 = alloca i32, align 4
  %5179 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5180 = call i32 (ptr, ...) @scanf(ptr %5179, ptr %5178)
  %5181 = load i32, ptr %5178, align 4
  %5182 = icmp eq i32 %5181, 0
  br label %continuation6904

continuation6904:                                 ; preds = %else6906, %then6905
  %5183 = phi i1 [ %5182, %else6906 ], [ true, %then6905 ]
  br i1 %5183, label %then6913, label %else6914

then6913:                                         ; preds = %continuation6904
  br label %continuation6912

else6914:                                         ; preds = %continuation6904
  %5184 = alloca i32, align 4
  %5185 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5186 = call i32 (ptr, ...) @scanf(ptr %5185, ptr %5184)
  %5187 = load i32, ptr %5184, align 4
  %5188 = icmp eq i32 %5187, 0
  br label %continuation6912

continuation6912:                                 ; preds = %else6914, %then6913
  %5189 = phi i1 [ %5188, %else6914 ], [ true, %then6913 ]
  br i1 %5189, label %then6921, label %else6922

then6921:                                         ; preds = %continuation6912
  br label %continuation6920

else6922:                                         ; preds = %continuation6912
  %5190 = alloca i32, align 4
  %5191 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5192 = call i32 (ptr, ...) @scanf(ptr %5191, ptr %5190)
  %5193 = load i32, ptr %5190, align 4
  %5194 = icmp eq i32 %5193, 0
  br label %continuation6920

continuation6920:                                 ; preds = %else6922, %then6921
  %5195 = phi i1 [ %5194, %else6922 ], [ true, %then6921 ]
  br i1 %5195, label %then6929, label %else6930

then6929:                                         ; preds = %continuation6920
  br label %continuation6928

else6930:                                         ; preds = %continuation6920
  %5196 = alloca i32, align 4
  %5197 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5198 = call i32 (ptr, ...) @scanf(ptr %5197, ptr %5196)
  %5199 = load i32, ptr %5196, align 4
  %5200 = icmp eq i32 %5199, 0
  br label %continuation6928

continuation6928:                                 ; preds = %else6930, %then6929
  %5201 = phi i1 [ %5200, %else6930 ], [ true, %then6929 ]
  br i1 %5201, label %then6937, label %else6938

then6937:                                         ; preds = %continuation6928
  br label %continuation6936

else6938:                                         ; preds = %continuation6928
  %5202 = alloca i32, align 4
  %5203 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5204 = call i32 (ptr, ...) @scanf(ptr %5203, ptr %5202)
  %5205 = load i32, ptr %5202, align 4
  %5206 = icmp eq i32 %5205, 0
  br label %continuation6936

continuation6936:                                 ; preds = %else6938, %then6937
  %5207 = phi i1 [ %5206, %else6938 ], [ true, %then6937 ]
  br i1 %5207, label %then6945, label %else6946

then6945:                                         ; preds = %continuation6936
  br label %continuation6944

else6946:                                         ; preds = %continuation6936
  %5208 = alloca i32, align 4
  %5209 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5210 = call i32 (ptr, ...) @scanf(ptr %5209, ptr %5208)
  %5211 = load i32, ptr %5208, align 4
  %5212 = icmp eq i32 %5211, 0
  br label %continuation6944

continuation6944:                                 ; preds = %else6946, %then6945
  %5213 = phi i1 [ %5212, %else6946 ], [ true, %then6945 ]
  br i1 %5213, label %then6953, label %else6954

then6953:                                         ; preds = %continuation6944
  br label %continuation6952

else6954:                                         ; preds = %continuation6944
  %5214 = alloca i32, align 4
  %5215 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5216 = call i32 (ptr, ...) @scanf(ptr %5215, ptr %5214)
  %5217 = load i32, ptr %5214, align 4
  %5218 = icmp eq i32 %5217, 0
  br label %continuation6952

continuation6952:                                 ; preds = %else6954, %then6953
  %5219 = phi i1 [ %5218, %else6954 ], [ true, %then6953 ]
  br i1 %5219, label %then6961, label %else6962

then6961:                                         ; preds = %continuation6952
  br label %continuation6960

else6962:                                         ; preds = %continuation6952
  %5220 = alloca i32, align 4
  %5221 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5222 = call i32 (ptr, ...) @scanf(ptr %5221, ptr %5220)
  %5223 = load i32, ptr %5220, align 4
  %5224 = icmp eq i32 %5223, 0
  br label %continuation6960

continuation6960:                                 ; preds = %else6962, %then6961
  %5225 = phi i1 [ %5224, %else6962 ], [ true, %then6961 ]
  br i1 %5225, label %then6969, label %else6970

then6969:                                         ; preds = %continuation6960
  br label %continuation6968

else6970:                                         ; preds = %continuation6960
  %5226 = alloca i32, align 4
  %5227 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5228 = call i32 (ptr, ...) @scanf(ptr %5227, ptr %5226)
  %5229 = load i32, ptr %5226, align 4
  %5230 = icmp eq i32 %5229, 0
  br label %continuation6968

continuation6968:                                 ; preds = %else6970, %then6969
  %5231 = phi i1 [ %5230, %else6970 ], [ true, %then6969 ]
  br i1 %5231, label %then6977, label %else6978

then6977:                                         ; preds = %continuation6968
  br label %continuation6976

else6978:                                         ; preds = %continuation6968
  %5232 = alloca i32, align 4
  %5233 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5234 = call i32 (ptr, ...) @scanf(ptr %5233, ptr %5232)
  %5235 = load i32, ptr %5232, align 4
  %5236 = icmp eq i32 %5235, 0
  br label %continuation6976

continuation6976:                                 ; preds = %else6978, %then6977
  %5237 = phi i1 [ %5236, %else6978 ], [ true, %then6977 ]
  br i1 %5237, label %then6985, label %else6986

then6985:                                         ; preds = %continuation6976
  br label %continuation6984

else6986:                                         ; preds = %continuation6976
  %5238 = alloca i32, align 4
  %5239 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5240 = call i32 (ptr, ...) @scanf(ptr %5239, ptr %5238)
  %5241 = load i32, ptr %5238, align 4
  %5242 = icmp eq i32 %5241, 0
  br label %continuation6984

continuation6984:                                 ; preds = %else6986, %then6985
  %5243 = phi i1 [ %5242, %else6986 ], [ true, %then6985 ]
  br i1 %5243, label %then6993, label %else6994

then6993:                                         ; preds = %continuation6984
  br label %continuation6992

else6994:                                         ; preds = %continuation6984
  %5244 = alloca i32, align 4
  %5245 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5246 = call i32 (ptr, ...) @scanf(ptr %5245, ptr %5244)
  %5247 = load i32, ptr %5244, align 4
  %5248 = icmp eq i32 %5247, 0
  br label %continuation6992

continuation6992:                                 ; preds = %else6994, %then6993
  %5249 = phi i1 [ %5248, %else6994 ], [ true, %then6993 ]
  br i1 %5249, label %then7001, label %else7002

then7001:                                         ; preds = %continuation6992
  br label %continuation7000

else7002:                                         ; preds = %continuation6992
  %5250 = alloca i32, align 4
  %5251 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5252 = call i32 (ptr, ...) @scanf(ptr %5251, ptr %5250)
  %5253 = load i32, ptr %5250, align 4
  %5254 = icmp eq i32 %5253, 0
  br label %continuation7000

continuation7000:                                 ; preds = %else7002, %then7001
  %5255 = phi i1 [ %5254, %else7002 ], [ true, %then7001 ]
  br i1 %5255, label %then7009, label %else7010

then7009:                                         ; preds = %continuation7000
  br label %continuation7008

else7010:                                         ; preds = %continuation7000
  %5256 = alloca i32, align 4
  %5257 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5258 = call i32 (ptr, ...) @scanf(ptr %5257, ptr %5256)
  %5259 = load i32, ptr %5256, align 4
  %5260 = icmp eq i32 %5259, 0
  br label %continuation7008

continuation7008:                                 ; preds = %else7010, %then7009
  %5261 = phi i1 [ %5260, %else7010 ], [ true, %then7009 ]
  br i1 %5261, label %then7017, label %else7018

then7017:                                         ; preds = %continuation7008
  br label %continuation7016

else7018:                                         ; preds = %continuation7008
  %5262 = alloca i32, align 4
  %5263 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5264 = call i32 (ptr, ...) @scanf(ptr %5263, ptr %5262)
  %5265 = load i32, ptr %5262, align 4
  %5266 = icmp eq i32 %5265, 0
  br label %continuation7016

continuation7016:                                 ; preds = %else7018, %then7017
  %5267 = phi i1 [ %5266, %else7018 ], [ true, %then7017 ]
  br i1 %5267, label %then7025, label %else7026

then7025:                                         ; preds = %continuation7016
  br label %continuation7024

else7026:                                         ; preds = %continuation7016
  %5268 = alloca i32, align 4
  %5269 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5270 = call i32 (ptr, ...) @scanf(ptr %5269, ptr %5268)
  %5271 = load i32, ptr %5268, align 4
  %5272 = icmp eq i32 %5271, 0
  br label %continuation7024

continuation7024:                                 ; preds = %else7026, %then7025
  %5273 = phi i1 [ %5272, %else7026 ], [ true, %then7025 ]
  br i1 %5273, label %then7033, label %else7034

then7033:                                         ; preds = %continuation7024
  br label %continuation7032

else7034:                                         ; preds = %continuation7024
  %5274 = alloca i32, align 4
  %5275 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5276 = call i32 (ptr, ...) @scanf(ptr %5275, ptr %5274)
  %5277 = load i32, ptr %5274, align 4
  %5278 = icmp eq i32 %5277, 0
  br label %continuation7032

continuation7032:                                 ; preds = %else7034, %then7033
  %5279 = phi i1 [ %5278, %else7034 ], [ true, %then7033 ]
  br i1 %5279, label %then7041, label %else7042

then7041:                                         ; preds = %continuation7032
  br label %continuation7040

else7042:                                         ; preds = %continuation7032
  %5280 = alloca i32, align 4
  %5281 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5282 = call i32 (ptr, ...) @scanf(ptr %5281, ptr %5280)
  %5283 = load i32, ptr %5280, align 4
  %5284 = icmp eq i32 %5283, 0
  br label %continuation7040

continuation7040:                                 ; preds = %else7042, %then7041
  %5285 = phi i1 [ %5284, %else7042 ], [ true, %then7041 ]
  br i1 %5285, label %then7049, label %else7050

then7049:                                         ; preds = %continuation7040
  br label %continuation7048

else7050:                                         ; preds = %continuation7040
  %5286 = alloca i32, align 4
  %5287 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5288 = call i32 (ptr, ...) @scanf(ptr %5287, ptr %5286)
  %5289 = load i32, ptr %5286, align 4
  %5290 = icmp eq i32 %5289, 0
  br label %continuation7048

continuation7048:                                 ; preds = %else7050, %then7049
  %5291 = phi i1 [ %5290, %else7050 ], [ true, %then7049 ]
  br i1 %5291, label %then7057, label %else7058

then7057:                                         ; preds = %continuation7048
  br label %continuation7056

else7058:                                         ; preds = %continuation7048
  %5292 = alloca i32, align 4
  %5293 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5294 = call i32 (ptr, ...) @scanf(ptr %5293, ptr %5292)
  %5295 = load i32, ptr %5292, align 4
  %5296 = icmp eq i32 %5295, 0
  br label %continuation7056

continuation7056:                                 ; preds = %else7058, %then7057
  %5297 = phi i1 [ %5296, %else7058 ], [ true, %then7057 ]
  br i1 %5297, label %then7065, label %else7066

then7065:                                         ; preds = %continuation7056
  br label %continuation7064

else7066:                                         ; preds = %continuation7056
  %5298 = alloca i32, align 4
  %5299 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5300 = call i32 (ptr, ...) @scanf(ptr %5299, ptr %5298)
  %5301 = load i32, ptr %5298, align 4
  %5302 = icmp eq i32 %5301, 0
  br label %continuation7064

continuation7064:                                 ; preds = %else7066, %then7065
  %5303 = phi i1 [ %5302, %else7066 ], [ true, %then7065 ]
  br i1 %5303, label %then7073, label %else7074

then7073:                                         ; preds = %continuation7064
  br label %continuation7072

else7074:                                         ; preds = %continuation7064
  %5304 = alloca i32, align 4
  %5305 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5306 = call i32 (ptr, ...) @scanf(ptr %5305, ptr %5304)
  %5307 = load i32, ptr %5304, align 4
  %5308 = icmp eq i32 %5307, 0
  br label %continuation7072

continuation7072:                                 ; preds = %else7074, %then7073
  %5309 = phi i1 [ %5308, %else7074 ], [ true, %then7073 ]
  br i1 %5309, label %then7081, label %else7082

then7081:                                         ; preds = %continuation7072
  br label %continuation7080

else7082:                                         ; preds = %continuation7072
  %5310 = alloca i32, align 4
  %5311 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5312 = call i32 (ptr, ...) @scanf(ptr %5311, ptr %5310)
  %5313 = load i32, ptr %5310, align 4
  %5314 = icmp eq i32 %5313, 0
  br label %continuation7080

continuation7080:                                 ; preds = %else7082, %then7081
  %5315 = phi i1 [ %5314, %else7082 ], [ true, %then7081 ]
  br i1 %5315, label %then7089, label %else7090

then7089:                                         ; preds = %continuation7080
  br label %continuation7088

else7090:                                         ; preds = %continuation7080
  %5316 = alloca i32, align 4
  %5317 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5318 = call i32 (ptr, ...) @scanf(ptr %5317, ptr %5316)
  %5319 = load i32, ptr %5316, align 4
  %5320 = icmp eq i32 %5319, 0
  br label %continuation7088

continuation7088:                                 ; preds = %else7090, %then7089
  %5321 = phi i1 [ %5320, %else7090 ], [ true, %then7089 ]
  br i1 %5321, label %then7097, label %else7098

then7097:                                         ; preds = %continuation7088
  br label %continuation7096

else7098:                                         ; preds = %continuation7088
  %5322 = alloca i32, align 4
  %5323 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5324 = call i32 (ptr, ...) @scanf(ptr %5323, ptr %5322)
  %5325 = load i32, ptr %5322, align 4
  %5326 = icmp eq i32 %5325, 0
  br label %continuation7096

continuation7096:                                 ; preds = %else7098, %then7097
  %5327 = phi i1 [ %5326, %else7098 ], [ true, %then7097 ]
  br i1 %5327, label %then7105, label %else7106

then7105:                                         ; preds = %continuation7096
  br label %continuation7104

else7106:                                         ; preds = %continuation7096
  %5328 = alloca i32, align 4
  %5329 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5330 = call i32 (ptr, ...) @scanf(ptr %5329, ptr %5328)
  %5331 = load i32, ptr %5328, align 4
  %5332 = icmp eq i32 %5331, 0
  br label %continuation7104

continuation7104:                                 ; preds = %else7106, %then7105
  %5333 = phi i1 [ %5332, %else7106 ], [ true, %then7105 ]
  br i1 %5333, label %then7113, label %else7114

then7113:                                         ; preds = %continuation7104
  br label %continuation7112

else7114:                                         ; preds = %continuation7104
  %5334 = alloca i32, align 4
  %5335 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5336 = call i32 (ptr, ...) @scanf(ptr %5335, ptr %5334)
  %5337 = load i32, ptr %5334, align 4
  %5338 = icmp eq i32 %5337, 0
  br label %continuation7112

continuation7112:                                 ; preds = %else7114, %then7113
  %5339 = phi i1 [ %5338, %else7114 ], [ true, %then7113 ]
  br i1 %5339, label %then7121, label %else7122

then7121:                                         ; preds = %continuation7112
  br label %continuation7120

else7122:                                         ; preds = %continuation7112
  %5340 = alloca i32, align 4
  %5341 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5342 = call i32 (ptr, ...) @scanf(ptr %5341, ptr %5340)
  %5343 = load i32, ptr %5340, align 4
  %5344 = icmp eq i32 %5343, 0
  br label %continuation7120

continuation7120:                                 ; preds = %else7122, %then7121
  %5345 = phi i1 [ %5344, %else7122 ], [ true, %then7121 ]
  br i1 %5345, label %then7129, label %else7130

then7129:                                         ; preds = %continuation7120
  br label %continuation7128

else7130:                                         ; preds = %continuation7120
  %5346 = alloca i32, align 4
  %5347 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5348 = call i32 (ptr, ...) @scanf(ptr %5347, ptr %5346)
  %5349 = load i32, ptr %5346, align 4
  %5350 = icmp eq i32 %5349, 0
  br label %continuation7128

continuation7128:                                 ; preds = %else7130, %then7129
  %5351 = phi i1 [ %5350, %else7130 ], [ true, %then7129 ]
  br i1 %5351, label %then7137, label %else7138

then7137:                                         ; preds = %continuation7128
  br label %continuation7136

else7138:                                         ; preds = %continuation7128
  %5352 = alloca i32, align 4
  %5353 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5354 = call i32 (ptr, ...) @scanf(ptr %5353, ptr %5352)
  %5355 = load i32, ptr %5352, align 4
  %5356 = icmp eq i32 %5355, 0
  br label %continuation7136

continuation7136:                                 ; preds = %else7138, %then7137
  %5357 = phi i1 [ %5356, %else7138 ], [ true, %then7137 ]
  br i1 %5357, label %then7145, label %else7146

then7145:                                         ; preds = %continuation7136
  br label %continuation7144

else7146:                                         ; preds = %continuation7136
  %5358 = alloca i32, align 4
  %5359 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5360 = call i32 (ptr, ...) @scanf(ptr %5359, ptr %5358)
  %5361 = load i32, ptr %5358, align 4
  %5362 = icmp eq i32 %5361, 0
  br label %continuation7144

continuation7144:                                 ; preds = %else7146, %then7145
  %5363 = phi i1 [ %5362, %else7146 ], [ true, %then7145 ]
  br i1 %5363, label %then7153, label %else7154

then7153:                                         ; preds = %continuation7144
  br label %continuation7152

else7154:                                         ; preds = %continuation7144
  %5364 = alloca i32, align 4
  %5365 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5366 = call i32 (ptr, ...) @scanf(ptr %5365, ptr %5364)
  %5367 = load i32, ptr %5364, align 4
  %5368 = icmp eq i32 %5367, 0
  br label %continuation7152

continuation7152:                                 ; preds = %else7154, %then7153
  %5369 = phi i1 [ %5368, %else7154 ], [ true, %then7153 ]
  br i1 %5369, label %then7161, label %else7162

then7161:                                         ; preds = %continuation7152
  br label %continuation7160

else7162:                                         ; preds = %continuation7152
  %5370 = alloca i32, align 4
  %5371 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5372 = call i32 (ptr, ...) @scanf(ptr %5371, ptr %5370)
  %5373 = load i32, ptr %5370, align 4
  %5374 = icmp eq i32 %5373, 0
  br label %continuation7160

continuation7160:                                 ; preds = %else7162, %then7161
  %5375 = phi i1 [ %5374, %else7162 ], [ true, %then7161 ]
  br i1 %5375, label %then7169, label %else7170

then7169:                                         ; preds = %continuation7160
  br label %continuation7168

else7170:                                         ; preds = %continuation7160
  %5376 = alloca i32, align 4
  %5377 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5378 = call i32 (ptr, ...) @scanf(ptr %5377, ptr %5376)
  %5379 = load i32, ptr %5376, align 4
  %5380 = icmp eq i32 %5379, 0
  br label %continuation7168

continuation7168:                                 ; preds = %else7170, %then7169
  %5381 = phi i1 [ %5380, %else7170 ], [ true, %then7169 ]
  br i1 %5381, label %then7177, label %else7178

then7177:                                         ; preds = %continuation7168
  br label %continuation7176

else7178:                                         ; preds = %continuation7168
  %5382 = alloca i32, align 4
  %5383 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5384 = call i32 (ptr, ...) @scanf(ptr %5383, ptr %5382)
  %5385 = load i32, ptr %5382, align 4
  %5386 = icmp eq i32 %5385, 0
  br label %continuation7176

continuation7176:                                 ; preds = %else7178, %then7177
  %5387 = phi i1 [ %5386, %else7178 ], [ true, %then7177 ]
  br i1 %5387, label %then7185, label %else7186

then7185:                                         ; preds = %continuation7176
  br label %continuation7184

else7186:                                         ; preds = %continuation7176
  %5388 = alloca i32, align 4
  %5389 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5390 = call i32 (ptr, ...) @scanf(ptr %5389, ptr %5388)
  %5391 = load i32, ptr %5388, align 4
  %5392 = icmp eq i32 %5391, 0
  br label %continuation7184

continuation7184:                                 ; preds = %else7186, %then7185
  %5393 = phi i1 [ %5392, %else7186 ], [ true, %then7185 ]
  br i1 %5393, label %then7193, label %else7194

then7193:                                         ; preds = %continuation7184
  br label %continuation7192

else7194:                                         ; preds = %continuation7184
  %5394 = alloca i32, align 4
  %5395 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5396 = call i32 (ptr, ...) @scanf(ptr %5395, ptr %5394)
  %5397 = load i32, ptr %5394, align 4
  %5398 = icmp eq i32 %5397, 0
  br label %continuation7192

continuation7192:                                 ; preds = %else7194, %then7193
  %5399 = phi i1 [ %5398, %else7194 ], [ true, %then7193 ]
  br i1 %5399, label %then7201, label %else7202

then7201:                                         ; preds = %continuation7192
  br label %continuation7200

else7202:                                         ; preds = %continuation7192
  %5400 = alloca i32, align 4
  %5401 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5402 = call i32 (ptr, ...) @scanf(ptr %5401, ptr %5400)
  %5403 = load i32, ptr %5400, align 4
  %5404 = icmp eq i32 %5403, 0
  br label %continuation7200

continuation7200:                                 ; preds = %else7202, %then7201
  %5405 = phi i1 [ %5404, %else7202 ], [ true, %then7201 ]
  br i1 %5405, label %then7209, label %else7210

then7209:                                         ; preds = %continuation7200
  br label %continuation7208

else7210:                                         ; preds = %continuation7200
  %5406 = alloca i32, align 4
  %5407 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5408 = call i32 (ptr, ...) @scanf(ptr %5407, ptr %5406)
  %5409 = load i32, ptr %5406, align 4
  %5410 = icmp eq i32 %5409, 0
  br label %continuation7208

continuation7208:                                 ; preds = %else7210, %then7209
  %5411 = phi i1 [ %5410, %else7210 ], [ true, %then7209 ]
  br i1 %5411, label %then7217, label %else7218

then7217:                                         ; preds = %continuation7208
  br label %continuation7216

else7218:                                         ; preds = %continuation7208
  %5412 = alloca i32, align 4
  %5413 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5414 = call i32 (ptr, ...) @scanf(ptr %5413, ptr %5412)
  %5415 = load i32, ptr %5412, align 4
  %5416 = icmp eq i32 %5415, 0
  br label %continuation7216

continuation7216:                                 ; preds = %else7218, %then7217
  %5417 = phi i1 [ %5416, %else7218 ], [ true, %then7217 ]
  br i1 %5417, label %then7225, label %else7226

then7225:                                         ; preds = %continuation7216
  br label %continuation7224

else7226:                                         ; preds = %continuation7216
  %5418 = alloca i32, align 4
  %5419 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5420 = call i32 (ptr, ...) @scanf(ptr %5419, ptr %5418)
  %5421 = load i32, ptr %5418, align 4
  %5422 = icmp eq i32 %5421, 0
  br label %continuation7224

continuation7224:                                 ; preds = %else7226, %then7225
  %5423 = phi i1 [ %5422, %else7226 ], [ true, %then7225 ]
  br i1 %5423, label %then7233, label %else7234

then7233:                                         ; preds = %continuation7224
  br label %continuation7232

else7234:                                         ; preds = %continuation7224
  %5424 = alloca i32, align 4
  %5425 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5426 = call i32 (ptr, ...) @scanf(ptr %5425, ptr %5424)
  %5427 = load i32, ptr %5424, align 4
  %5428 = icmp eq i32 %5427, 0
  br label %continuation7232

continuation7232:                                 ; preds = %else7234, %then7233
  %5429 = phi i1 [ %5428, %else7234 ], [ true, %then7233 ]
  br i1 %5429, label %then7241, label %else7242

then7241:                                         ; preds = %continuation7232
  br label %continuation7240

else7242:                                         ; preds = %continuation7232
  %5430 = alloca i32, align 4
  %5431 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5432 = call i32 (ptr, ...) @scanf(ptr %5431, ptr %5430)
  %5433 = load i32, ptr %5430, align 4
  %5434 = icmp eq i32 %5433, 0
  br label %continuation7240

continuation7240:                                 ; preds = %else7242, %then7241
  %5435 = phi i1 [ %5434, %else7242 ], [ true, %then7241 ]
  br i1 %5435, label %then7249, label %else7250

then7249:                                         ; preds = %continuation7240
  br label %continuation7248

else7250:                                         ; preds = %continuation7240
  %5436 = alloca i32, align 4
  %5437 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5438 = call i32 (ptr, ...) @scanf(ptr %5437, ptr %5436)
  %5439 = load i32, ptr %5436, align 4
  %5440 = icmp eq i32 %5439, 0
  br label %continuation7248

continuation7248:                                 ; preds = %else7250, %then7249
  %5441 = phi i1 [ %5440, %else7250 ], [ true, %then7249 ]
  br i1 %5441, label %then7257, label %else7258

then7257:                                         ; preds = %continuation7248
  br label %continuation7256

else7258:                                         ; preds = %continuation7248
  %5442 = alloca i32, align 4
  %5443 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5444 = call i32 (ptr, ...) @scanf(ptr %5443, ptr %5442)
  %5445 = load i32, ptr %5442, align 4
  %5446 = icmp eq i32 %5445, 0
  br label %continuation7256

continuation7256:                                 ; preds = %else7258, %then7257
  %5447 = phi i1 [ %5446, %else7258 ], [ true, %then7257 ]
  br i1 %5447, label %then7265, label %else7266

then7265:                                         ; preds = %continuation7256
  br label %continuation7264

else7266:                                         ; preds = %continuation7256
  %5448 = alloca i32, align 4
  %5449 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5450 = call i32 (ptr, ...) @scanf(ptr %5449, ptr %5448)
  %5451 = load i32, ptr %5448, align 4
  %5452 = icmp eq i32 %5451, 0
  br label %continuation7264

continuation7264:                                 ; preds = %else7266, %then7265
  %5453 = phi i1 [ %5452, %else7266 ], [ true, %then7265 ]
  br i1 %5453, label %then7273, label %else7274

then7273:                                         ; preds = %continuation7264
  br label %continuation7272

else7274:                                         ; preds = %continuation7264
  %5454 = alloca i32, align 4
  %5455 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5456 = call i32 (ptr, ...) @scanf(ptr %5455, ptr %5454)
  %5457 = load i32, ptr %5454, align 4
  %5458 = icmp eq i32 %5457, 0
  br label %continuation7272

continuation7272:                                 ; preds = %else7274, %then7273
  %5459 = phi i1 [ %5458, %else7274 ], [ true, %then7273 ]
  br i1 %5459, label %then7281, label %else7282

then7281:                                         ; preds = %continuation7272
  br label %continuation7280

else7282:                                         ; preds = %continuation7272
  %5460 = alloca i32, align 4
  %5461 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5462 = call i32 (ptr, ...) @scanf(ptr %5461, ptr %5460)
  %5463 = load i32, ptr %5460, align 4
  %5464 = icmp eq i32 %5463, 0
  br label %continuation7280

continuation7280:                                 ; preds = %else7282, %then7281
  %5465 = phi i1 [ %5464, %else7282 ], [ true, %then7281 ]
  br i1 %5465, label %then7289, label %else7290

then7289:                                         ; preds = %continuation7280
  br label %continuation7288

else7290:                                         ; preds = %continuation7280
  %5466 = alloca i32, align 4
  %5467 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5468 = call i32 (ptr, ...) @scanf(ptr %5467, ptr %5466)
  %5469 = load i32, ptr %5466, align 4
  %5470 = icmp eq i32 %5469, 0
  br label %continuation7288

continuation7288:                                 ; preds = %else7290, %then7289
  %5471 = phi i1 [ %5470, %else7290 ], [ true, %then7289 ]
  br i1 %5471, label %then7297, label %else7298

then7297:                                         ; preds = %continuation7288
  br label %continuation7296

else7298:                                         ; preds = %continuation7288
  %5472 = alloca i32, align 4
  %5473 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5474 = call i32 (ptr, ...) @scanf(ptr %5473, ptr %5472)
  %5475 = load i32, ptr %5472, align 4
  %5476 = icmp eq i32 %5475, 0
  br label %continuation7296

continuation7296:                                 ; preds = %else7298, %then7297
  %5477 = phi i1 [ %5476, %else7298 ], [ true, %then7297 ]
  br i1 %5477, label %then7305, label %else7306

then7305:                                         ; preds = %continuation7296
  br label %continuation7304

else7306:                                         ; preds = %continuation7296
  %5478 = alloca i32, align 4
  %5479 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5480 = call i32 (ptr, ...) @scanf(ptr %5479, ptr %5478)
  %5481 = load i32, ptr %5478, align 4
  %5482 = icmp eq i32 %5481, 0
  br label %continuation7304

continuation7304:                                 ; preds = %else7306, %then7305
  %5483 = phi i1 [ %5482, %else7306 ], [ true, %then7305 ]
  br i1 %5483, label %then7313, label %else7314

then7313:                                         ; preds = %continuation7304
  br label %continuation7312

else7314:                                         ; preds = %continuation7304
  %5484 = alloca i32, align 4
  %5485 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5486 = call i32 (ptr, ...) @scanf(ptr %5485, ptr %5484)
  %5487 = load i32, ptr %5484, align 4
  %5488 = icmp eq i32 %5487, 0
  br label %continuation7312

continuation7312:                                 ; preds = %else7314, %then7313
  %5489 = phi i1 [ %5488, %else7314 ], [ true, %then7313 ]
  br i1 %5489, label %then7321, label %else7322

then7321:                                         ; preds = %continuation7312
  br label %continuation7320

else7322:                                         ; preds = %continuation7312
  %5490 = alloca i32, align 4
  %5491 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5492 = call i32 (ptr, ...) @scanf(ptr %5491, ptr %5490)
  %5493 = load i32, ptr %5490, align 4
  %5494 = icmp eq i32 %5493, 0
  br label %continuation7320

continuation7320:                                 ; preds = %else7322, %then7321
  %5495 = phi i1 [ %5494, %else7322 ], [ true, %then7321 ]
  br i1 %5495, label %then7329, label %else7330

then7329:                                         ; preds = %continuation7320
  br label %continuation7328

else7330:                                         ; preds = %continuation7320
  %5496 = alloca i32, align 4
  %5497 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5498 = call i32 (ptr, ...) @scanf(ptr %5497, ptr %5496)
  %5499 = load i32, ptr %5496, align 4
  %5500 = icmp eq i32 %5499, 0
  br label %continuation7328

continuation7328:                                 ; preds = %else7330, %then7329
  %5501 = phi i1 [ %5500, %else7330 ], [ true, %then7329 ]
  br i1 %5501, label %then7337, label %else7338

then7337:                                         ; preds = %continuation7328
  br label %continuation7336

else7338:                                         ; preds = %continuation7328
  %5502 = alloca i32, align 4
  %5503 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5504 = call i32 (ptr, ...) @scanf(ptr %5503, ptr %5502)
  %5505 = load i32, ptr %5502, align 4
  %5506 = icmp eq i32 %5505, 0
  br label %continuation7336

continuation7336:                                 ; preds = %else7338, %then7337
  %5507 = phi i1 [ %5506, %else7338 ], [ true, %then7337 ]
  br i1 %5507, label %then7345, label %else7346

then7345:                                         ; preds = %continuation7336
  br label %continuation7344

else7346:                                         ; preds = %continuation7336
  %5508 = alloca i32, align 4
  %5509 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5510 = call i32 (ptr, ...) @scanf(ptr %5509, ptr %5508)
  %5511 = load i32, ptr %5508, align 4
  %5512 = icmp eq i32 %5511, 0
  br label %continuation7344

continuation7344:                                 ; preds = %else7346, %then7345
  %5513 = phi i1 [ %5512, %else7346 ], [ true, %then7345 ]
  br i1 %5513, label %then7353, label %else7354

then7353:                                         ; preds = %continuation7344
  br label %continuation7352

else7354:                                         ; preds = %continuation7344
  %5514 = alloca i32, align 4
  %5515 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5516 = call i32 (ptr, ...) @scanf(ptr %5515, ptr %5514)
  %5517 = load i32, ptr %5514, align 4
  %5518 = icmp eq i32 %5517, 0
  br label %continuation7352

continuation7352:                                 ; preds = %else7354, %then7353
  %5519 = phi i1 [ %5518, %else7354 ], [ true, %then7353 ]
  br i1 %5519, label %then7361, label %else7362

then7361:                                         ; preds = %continuation7352
  br label %continuation7360

else7362:                                         ; preds = %continuation7352
  %5520 = alloca i32, align 4
  %5521 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5522 = call i32 (ptr, ...) @scanf(ptr %5521, ptr %5520)
  %5523 = load i32, ptr %5520, align 4
  %5524 = icmp eq i32 %5523, 0
  br label %continuation7360

continuation7360:                                 ; preds = %else7362, %then7361
  %5525 = phi i1 [ %5524, %else7362 ], [ true, %then7361 ]
  br i1 %5525, label %then7369, label %else7370

then7369:                                         ; preds = %continuation7360
  br label %continuation7368

else7370:                                         ; preds = %continuation7360
  %5526 = alloca i32, align 4
  %5527 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5528 = call i32 (ptr, ...) @scanf(ptr %5527, ptr %5526)
  %5529 = load i32, ptr %5526, align 4
  %5530 = icmp eq i32 %5529, 0
  br label %continuation7368

continuation7368:                                 ; preds = %else7370, %then7369
  %5531 = phi i1 [ %5530, %else7370 ], [ true, %then7369 ]
  br i1 %5531, label %then7377, label %else7378

then7377:                                         ; preds = %continuation7368
  br label %continuation7376

else7378:                                         ; preds = %continuation7368
  %5532 = alloca i32, align 4
  %5533 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5534 = call i32 (ptr, ...) @scanf(ptr %5533, ptr %5532)
  %5535 = load i32, ptr %5532, align 4
  %5536 = icmp eq i32 %5535, 0
  br label %continuation7376

continuation7376:                                 ; preds = %else7378, %then7377
  %5537 = phi i1 [ %5536, %else7378 ], [ true, %then7377 ]
  br i1 %5537, label %then7385, label %else7386

then7385:                                         ; preds = %continuation7376
  br label %continuation7384

else7386:                                         ; preds = %continuation7376
  %5538 = alloca i32, align 4
  %5539 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5540 = call i32 (ptr, ...) @scanf(ptr %5539, ptr %5538)
  %5541 = load i32, ptr %5538, align 4
  %5542 = icmp eq i32 %5541, 0
  br label %continuation7384

continuation7384:                                 ; preds = %else7386, %then7385
  %5543 = phi i1 [ %5542, %else7386 ], [ true, %then7385 ]
  br i1 %5543, label %then7393, label %else7394

then7393:                                         ; preds = %continuation7384
  br label %continuation7392

else7394:                                         ; preds = %continuation7384
  %5544 = alloca i32, align 4
  %5545 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5546 = call i32 (ptr, ...) @scanf(ptr %5545, ptr %5544)
  %5547 = load i32, ptr %5544, align 4
  %5548 = icmp eq i32 %5547, 0
  br label %continuation7392

continuation7392:                                 ; preds = %else7394, %then7393
  %5549 = phi i1 [ %5548, %else7394 ], [ true, %then7393 ]
  br i1 %5549, label %then7401, label %else7402

then7401:                                         ; preds = %continuation7392
  br label %continuation7400

else7402:                                         ; preds = %continuation7392
  %5550 = alloca i32, align 4
  %5551 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5552 = call i32 (ptr, ...) @scanf(ptr %5551, ptr %5550)
  %5553 = load i32, ptr %5550, align 4
  %5554 = icmp eq i32 %5553, 0
  br label %continuation7400

continuation7400:                                 ; preds = %else7402, %then7401
  %5555 = phi i1 [ %5554, %else7402 ], [ true, %then7401 ]
  br i1 %5555, label %then7409, label %else7410

then7409:                                         ; preds = %continuation7400
  br label %continuation7408

else7410:                                         ; preds = %continuation7400
  %5556 = alloca i32, align 4
  %5557 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5558 = call i32 (ptr, ...) @scanf(ptr %5557, ptr %5556)
  %5559 = load i32, ptr %5556, align 4
  %5560 = icmp eq i32 %5559, 0
  br label %continuation7408

continuation7408:                                 ; preds = %else7410, %then7409
  %5561 = phi i1 [ %5560, %else7410 ], [ true, %then7409 ]
  br i1 %5561, label %then7417, label %else7418

then7417:                                         ; preds = %continuation7408
  br label %continuation7416

else7418:                                         ; preds = %continuation7408
  %5562 = alloca i32, align 4
  %5563 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5564 = call i32 (ptr, ...) @scanf(ptr %5563, ptr %5562)
  %5565 = load i32, ptr %5562, align 4
  %5566 = icmp eq i32 %5565, 0
  br label %continuation7416

continuation7416:                                 ; preds = %else7418, %then7417
  %5567 = phi i1 [ %5566, %else7418 ], [ true, %then7417 ]
  br i1 %5567, label %then7425, label %else7426

then7425:                                         ; preds = %continuation7416
  br label %continuation7424

else7426:                                         ; preds = %continuation7416
  %5568 = alloca i32, align 4
  %5569 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5570 = call i32 (ptr, ...) @scanf(ptr %5569, ptr %5568)
  %5571 = load i32, ptr %5568, align 4
  %5572 = icmp eq i32 %5571, 0
  br label %continuation7424

continuation7424:                                 ; preds = %else7426, %then7425
  %5573 = phi i1 [ %5572, %else7426 ], [ true, %then7425 ]
  br i1 %5573, label %then7433, label %else7434

then7433:                                         ; preds = %continuation7424
  br label %continuation7432

else7434:                                         ; preds = %continuation7424
  %5574 = alloca i32, align 4
  %5575 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5576 = call i32 (ptr, ...) @scanf(ptr %5575, ptr %5574)
  %5577 = load i32, ptr %5574, align 4
  %5578 = icmp eq i32 %5577, 0
  br label %continuation7432

continuation7432:                                 ; preds = %else7434, %then7433
  %5579 = phi i1 [ %5578, %else7434 ], [ true, %then7433 ]
  br i1 %5579, label %then7441, label %else7442

then7441:                                         ; preds = %continuation7432
  br label %continuation7440

else7442:                                         ; preds = %continuation7432
  %5580 = alloca i32, align 4
  %5581 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5582 = call i32 (ptr, ...) @scanf(ptr %5581, ptr %5580)
  %5583 = load i32, ptr %5580, align 4
  %5584 = icmp eq i32 %5583, 0
  br label %continuation7440

continuation7440:                                 ; preds = %else7442, %then7441
  %5585 = phi i1 [ %5584, %else7442 ], [ true, %then7441 ]
  br i1 %5585, label %then7449, label %else7450

then7449:                                         ; preds = %continuation7440
  br label %continuation7448

else7450:                                         ; preds = %continuation7440
  %5586 = alloca i32, align 4
  %5587 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5588 = call i32 (ptr, ...) @scanf(ptr %5587, ptr %5586)
  %5589 = load i32, ptr %5586, align 4
  %5590 = icmp eq i32 %5589, 0
  br label %continuation7448

continuation7448:                                 ; preds = %else7450, %then7449
  %5591 = phi i1 [ %5590, %else7450 ], [ true, %then7449 ]
  br i1 %5591, label %then7457, label %else7458

then7457:                                         ; preds = %continuation7448
  br label %continuation7456

else7458:                                         ; preds = %continuation7448
  %5592 = alloca i32, align 4
  %5593 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5594 = call i32 (ptr, ...) @scanf(ptr %5593, ptr %5592)
  %5595 = load i32, ptr %5592, align 4
  %5596 = icmp eq i32 %5595, 0
  br label %continuation7456

continuation7456:                                 ; preds = %else7458, %then7457
  %5597 = phi i1 [ %5596, %else7458 ], [ true, %then7457 ]
  br i1 %5597, label %then7465, label %else7466

then7465:                                         ; preds = %continuation7456
  br label %continuation7464

else7466:                                         ; preds = %continuation7456
  %5598 = alloca i32, align 4
  %5599 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5600 = call i32 (ptr, ...) @scanf(ptr %5599, ptr %5598)
  %5601 = load i32, ptr %5598, align 4
  %5602 = icmp eq i32 %5601, 0
  br label %continuation7464

continuation7464:                                 ; preds = %else7466, %then7465
  %5603 = phi i1 [ %5602, %else7466 ], [ true, %then7465 ]
  br i1 %5603, label %then7473, label %else7474

then7473:                                         ; preds = %continuation7464
  br label %continuation7472

else7474:                                         ; preds = %continuation7464
  %5604 = alloca i32, align 4
  %5605 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5606 = call i32 (ptr, ...) @scanf(ptr %5605, ptr %5604)
  %5607 = load i32, ptr %5604, align 4
  %5608 = icmp eq i32 %5607, 0
  br label %continuation7472

continuation7472:                                 ; preds = %else7474, %then7473
  %5609 = phi i1 [ %5608, %else7474 ], [ true, %then7473 ]
  br i1 %5609, label %then7481, label %else7482

then7481:                                         ; preds = %continuation7472
  br label %continuation7480

else7482:                                         ; preds = %continuation7472
  %5610 = alloca i32, align 4
  %5611 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5612 = call i32 (ptr, ...) @scanf(ptr %5611, ptr %5610)
  %5613 = load i32, ptr %5610, align 4
  %5614 = icmp eq i32 %5613, 0
  br label %continuation7480

continuation7480:                                 ; preds = %else7482, %then7481
  %5615 = phi i1 [ %5614, %else7482 ], [ true, %then7481 ]
  br i1 %5615, label %then7489, label %else7490

then7489:                                         ; preds = %continuation7480
  br label %continuation7488

else7490:                                         ; preds = %continuation7480
  %5616 = alloca i32, align 4
  %5617 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5618 = call i32 (ptr, ...) @scanf(ptr %5617, ptr %5616)
  %5619 = load i32, ptr %5616, align 4
  %5620 = icmp eq i32 %5619, 0
  br label %continuation7488

continuation7488:                                 ; preds = %else7490, %then7489
  %5621 = phi i1 [ %5620, %else7490 ], [ true, %then7489 ]
  br i1 %5621, label %then7497, label %else7498

then7497:                                         ; preds = %continuation7488
  br label %continuation7496

else7498:                                         ; preds = %continuation7488
  %5622 = alloca i32, align 4
  %5623 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5624 = call i32 (ptr, ...) @scanf(ptr %5623, ptr %5622)
  %5625 = load i32, ptr %5622, align 4
  %5626 = icmp eq i32 %5625, 0
  br label %continuation7496

continuation7496:                                 ; preds = %else7498, %then7497
  %5627 = phi i1 [ %5626, %else7498 ], [ true, %then7497 ]
  br i1 %5627, label %then7505, label %else7506

then7505:                                         ; preds = %continuation7496
  br label %continuation7504

else7506:                                         ; preds = %continuation7496
  %5628 = alloca i32, align 4
  %5629 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5630 = call i32 (ptr, ...) @scanf(ptr %5629, ptr %5628)
  %5631 = load i32, ptr %5628, align 4
  %5632 = icmp eq i32 %5631, 0
  br label %continuation7504

continuation7504:                                 ; preds = %else7506, %then7505
  %5633 = phi i1 [ %5632, %else7506 ], [ true, %then7505 ]
  br i1 %5633, label %then7513, label %else7514

then7513:                                         ; preds = %continuation7504
  br label %continuation7512

else7514:                                         ; preds = %continuation7504
  %5634 = alloca i32, align 4
  %5635 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5636 = call i32 (ptr, ...) @scanf(ptr %5635, ptr %5634)
  %5637 = load i32, ptr %5634, align 4
  %5638 = icmp eq i32 %5637, 0
  br label %continuation7512

continuation7512:                                 ; preds = %else7514, %then7513
  %5639 = phi i1 [ %5638, %else7514 ], [ true, %then7513 ]
  br i1 %5639, label %then7521, label %else7522

then7521:                                         ; preds = %continuation7512
  br label %continuation7520

else7522:                                         ; preds = %continuation7512
  %5640 = alloca i32, align 4
  %5641 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5642 = call i32 (ptr, ...) @scanf(ptr %5641, ptr %5640)
  %5643 = load i32, ptr %5640, align 4
  %5644 = icmp eq i32 %5643, 0
  br label %continuation7520

continuation7520:                                 ; preds = %else7522, %then7521
  %5645 = phi i1 [ %5644, %else7522 ], [ true, %then7521 ]
  br i1 %5645, label %then7529, label %else7530

then7529:                                         ; preds = %continuation7520
  br label %continuation7528

else7530:                                         ; preds = %continuation7520
  %5646 = alloca i32, align 4
  %5647 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5648 = call i32 (ptr, ...) @scanf(ptr %5647, ptr %5646)
  %5649 = load i32, ptr %5646, align 4
  %5650 = icmp eq i32 %5649, 0
  br label %continuation7528

continuation7528:                                 ; preds = %else7530, %then7529
  %5651 = phi i1 [ %5650, %else7530 ], [ true, %then7529 ]
  br i1 %5651, label %then7537, label %else7538

then7537:                                         ; preds = %continuation7528
  br label %continuation7536

else7538:                                         ; preds = %continuation7528
  %5652 = alloca i32, align 4
  %5653 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5654 = call i32 (ptr, ...) @scanf(ptr %5653, ptr %5652)
  %5655 = load i32, ptr %5652, align 4
  %5656 = icmp eq i32 %5655, 0
  br label %continuation7536

continuation7536:                                 ; preds = %else7538, %then7537
  %5657 = phi i1 [ %5656, %else7538 ], [ true, %then7537 ]
  br i1 %5657, label %then7545, label %else7546

then7545:                                         ; preds = %continuation7536
  br label %continuation7544

else7546:                                         ; preds = %continuation7536
  %5658 = alloca i32, align 4
  %5659 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5660 = call i32 (ptr, ...) @scanf(ptr %5659, ptr %5658)
  %5661 = load i32, ptr %5658, align 4
  %5662 = icmp eq i32 %5661, 0
  br label %continuation7544

continuation7544:                                 ; preds = %else7546, %then7545
  %5663 = phi i1 [ %5662, %else7546 ], [ true, %then7545 ]
  br i1 %5663, label %then7553, label %else7554

then7553:                                         ; preds = %continuation7544
  br label %continuation7552

else7554:                                         ; preds = %continuation7544
  %5664 = alloca i32, align 4
  %5665 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5666 = call i32 (ptr, ...) @scanf(ptr %5665, ptr %5664)
  %5667 = load i32, ptr %5664, align 4
  %5668 = icmp eq i32 %5667, 0
  br label %continuation7552

continuation7552:                                 ; preds = %else7554, %then7553
  %5669 = phi i1 [ %5668, %else7554 ], [ true, %then7553 ]
  br i1 %5669, label %then7561, label %else7562

then7561:                                         ; preds = %continuation7552
  br label %continuation7560

else7562:                                         ; preds = %continuation7552
  %5670 = alloca i32, align 4
  %5671 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5672 = call i32 (ptr, ...) @scanf(ptr %5671, ptr %5670)
  %5673 = load i32, ptr %5670, align 4
  %5674 = icmp eq i32 %5673, 0
  br label %continuation7560

continuation7560:                                 ; preds = %else7562, %then7561
  %5675 = phi i1 [ %5674, %else7562 ], [ true, %then7561 ]
  br i1 %5675, label %then7569, label %else7570

then7569:                                         ; preds = %continuation7560
  br label %continuation7568

else7570:                                         ; preds = %continuation7560
  %5676 = alloca i32, align 4
  %5677 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5678 = call i32 (ptr, ...) @scanf(ptr %5677, ptr %5676)
  %5679 = load i32, ptr %5676, align 4
  %5680 = icmp eq i32 %5679, 0
  br label %continuation7568

continuation7568:                                 ; preds = %else7570, %then7569
  %5681 = phi i1 [ %5680, %else7570 ], [ true, %then7569 ]
  br i1 %5681, label %then7577, label %else7578

then7577:                                         ; preds = %continuation7568
  br label %continuation7576

else7578:                                         ; preds = %continuation7568
  %5682 = alloca i32, align 4
  %5683 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5684 = call i32 (ptr, ...) @scanf(ptr %5683, ptr %5682)
  %5685 = load i32, ptr %5682, align 4
  %5686 = icmp eq i32 %5685, 0
  br label %continuation7576

continuation7576:                                 ; preds = %else7578, %then7577
  %5687 = phi i1 [ %5686, %else7578 ], [ true, %then7577 ]
  br i1 %5687, label %then7585, label %else7586

then7585:                                         ; preds = %continuation7576
  br label %continuation7584

else7586:                                         ; preds = %continuation7576
  %5688 = alloca i32, align 4
  %5689 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5690 = call i32 (ptr, ...) @scanf(ptr %5689, ptr %5688)
  %5691 = load i32, ptr %5688, align 4
  %5692 = icmp eq i32 %5691, 0
  br label %continuation7584

continuation7584:                                 ; preds = %else7586, %then7585
  %5693 = phi i1 [ %5692, %else7586 ], [ true, %then7585 ]
  br i1 %5693, label %then7593, label %else7594

then7593:                                         ; preds = %continuation7584
  br label %continuation7592

else7594:                                         ; preds = %continuation7584
  %5694 = alloca i32, align 4
  %5695 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5696 = call i32 (ptr, ...) @scanf(ptr %5695, ptr %5694)
  %5697 = load i32, ptr %5694, align 4
  %5698 = icmp eq i32 %5697, 0
  br label %continuation7592

continuation7592:                                 ; preds = %else7594, %then7593
  %5699 = phi i1 [ %5698, %else7594 ], [ true, %then7593 ]
  br i1 %5699, label %then7601, label %else7602

then7601:                                         ; preds = %continuation7592
  br label %continuation7600

else7602:                                         ; preds = %continuation7592
  %5700 = alloca i32, align 4
  %5701 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5702 = call i32 (ptr, ...) @scanf(ptr %5701, ptr %5700)
  %5703 = load i32, ptr %5700, align 4
  %5704 = icmp eq i32 %5703, 0
  br label %continuation7600

continuation7600:                                 ; preds = %else7602, %then7601
  %5705 = phi i1 [ %5704, %else7602 ], [ true, %then7601 ]
  br i1 %5705, label %then7609, label %else7610

then7609:                                         ; preds = %continuation7600
  br label %continuation7608

else7610:                                         ; preds = %continuation7600
  %5706 = alloca i32, align 4
  %5707 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5708 = call i32 (ptr, ...) @scanf(ptr %5707, ptr %5706)
  %5709 = load i32, ptr %5706, align 4
  %5710 = icmp eq i32 %5709, 0
  br label %continuation7608

continuation7608:                                 ; preds = %else7610, %then7609
  %5711 = phi i1 [ %5710, %else7610 ], [ true, %then7609 ]
  br i1 %5711, label %then7617, label %else7618

then7617:                                         ; preds = %continuation7608
  br label %continuation7616

else7618:                                         ; preds = %continuation7608
  %5712 = alloca i32, align 4
  %5713 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5714 = call i32 (ptr, ...) @scanf(ptr %5713, ptr %5712)
  %5715 = load i32, ptr %5712, align 4
  %5716 = icmp eq i32 %5715, 0
  br label %continuation7616

continuation7616:                                 ; preds = %else7618, %then7617
  %5717 = phi i1 [ %5716, %else7618 ], [ true, %then7617 ]
  br i1 %5717, label %then7625, label %else7626

then7625:                                         ; preds = %continuation7616
  br label %continuation7624

else7626:                                         ; preds = %continuation7616
  %5718 = alloca i32, align 4
  %5719 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5720 = call i32 (ptr, ...) @scanf(ptr %5719, ptr %5718)
  %5721 = load i32, ptr %5718, align 4
  %5722 = icmp eq i32 %5721, 0
  br label %continuation7624

continuation7624:                                 ; preds = %else7626, %then7625
  %5723 = phi i1 [ %5722, %else7626 ], [ true, %then7625 ]
  br i1 %5723, label %then7633, label %else7634

then7633:                                         ; preds = %continuation7624
  br label %continuation7632

else7634:                                         ; preds = %continuation7624
  %5724 = alloca i32, align 4
  %5725 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5726 = call i32 (ptr, ...) @scanf(ptr %5725, ptr %5724)
  %5727 = load i32, ptr %5724, align 4
  %5728 = icmp eq i32 %5727, 0
  br label %continuation7632

continuation7632:                                 ; preds = %else7634, %then7633
  %5729 = phi i1 [ %5728, %else7634 ], [ true, %then7633 ]
  br i1 %5729, label %then7641, label %else7642

then7641:                                         ; preds = %continuation7632
  br label %continuation7640

else7642:                                         ; preds = %continuation7632
  %5730 = alloca i32, align 4
  %5731 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5732 = call i32 (ptr, ...) @scanf(ptr %5731, ptr %5730)
  %5733 = load i32, ptr %5730, align 4
  %5734 = icmp eq i32 %5733, 0
  br label %continuation7640

continuation7640:                                 ; preds = %else7642, %then7641
  %5735 = phi i1 [ %5734, %else7642 ], [ true, %then7641 ]
  br i1 %5735, label %then7649, label %else7650

then7649:                                         ; preds = %continuation7640
  br label %continuation7648

else7650:                                         ; preds = %continuation7640
  %5736 = alloca i32, align 4
  %5737 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5738 = call i32 (ptr, ...) @scanf(ptr %5737, ptr %5736)
  %5739 = load i32, ptr %5736, align 4
  %5740 = icmp eq i32 %5739, 0
  br label %continuation7648

continuation7648:                                 ; preds = %else7650, %then7649
  %5741 = phi i1 [ %5740, %else7650 ], [ true, %then7649 ]
  br i1 %5741, label %then7657, label %else7658

then7657:                                         ; preds = %continuation7648
  br label %continuation7656

else7658:                                         ; preds = %continuation7648
  %5742 = alloca i32, align 4
  %5743 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5744 = call i32 (ptr, ...) @scanf(ptr %5743, ptr %5742)
  %5745 = load i32, ptr %5742, align 4
  %5746 = icmp eq i32 %5745, 0
  br label %continuation7656

continuation7656:                                 ; preds = %else7658, %then7657
  %5747 = phi i1 [ %5746, %else7658 ], [ true, %then7657 ]
  br i1 %5747, label %then7665, label %else7666

then7665:                                         ; preds = %continuation7656
  br label %continuation7664

else7666:                                         ; preds = %continuation7656
  %5748 = alloca i32, align 4
  %5749 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5750 = call i32 (ptr, ...) @scanf(ptr %5749, ptr %5748)
  %5751 = load i32, ptr %5748, align 4
  %5752 = icmp eq i32 %5751, 0
  br label %continuation7664

continuation7664:                                 ; preds = %else7666, %then7665
  %5753 = phi i1 [ %5752, %else7666 ], [ true, %then7665 ]
  br i1 %5753, label %then7673, label %else7674

then7673:                                         ; preds = %continuation7664
  br label %continuation7672

else7674:                                         ; preds = %continuation7664
  %5754 = alloca i32, align 4
  %5755 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5756 = call i32 (ptr, ...) @scanf(ptr %5755, ptr %5754)
  %5757 = load i32, ptr %5754, align 4
  %5758 = icmp eq i32 %5757, 0
  br label %continuation7672

continuation7672:                                 ; preds = %else7674, %then7673
  %5759 = phi i1 [ %5758, %else7674 ], [ true, %then7673 ]
  br i1 %5759, label %then7681, label %else7682

then7681:                                         ; preds = %continuation7672
  br label %continuation7680

else7682:                                         ; preds = %continuation7672
  %5760 = alloca i32, align 4
  %5761 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5762 = call i32 (ptr, ...) @scanf(ptr %5761, ptr %5760)
  %5763 = load i32, ptr %5760, align 4
  %5764 = icmp eq i32 %5763, 0
  br label %continuation7680

continuation7680:                                 ; preds = %else7682, %then7681
  %5765 = phi i1 [ %5764, %else7682 ], [ true, %then7681 ]
  br i1 %5765, label %then7689, label %else7690

then7689:                                         ; preds = %continuation7680
  br label %continuation7688

else7690:                                         ; preds = %continuation7680
  %5766 = alloca i32, align 4
  %5767 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5768 = call i32 (ptr, ...) @scanf(ptr %5767, ptr %5766)
  %5769 = load i32, ptr %5766, align 4
  %5770 = icmp eq i32 %5769, 0
  br label %continuation7688

continuation7688:                                 ; preds = %else7690, %then7689
  %5771 = phi i1 [ %5770, %else7690 ], [ true, %then7689 ]
  br i1 %5771, label %then7697, label %else7698

then7697:                                         ; preds = %continuation7688
  br label %continuation7696

else7698:                                         ; preds = %continuation7688
  %5772 = alloca i32, align 4
  %5773 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5774 = call i32 (ptr, ...) @scanf(ptr %5773, ptr %5772)
  %5775 = load i32, ptr %5772, align 4
  %5776 = icmp eq i32 %5775, 0
  br label %continuation7696

continuation7696:                                 ; preds = %else7698, %then7697
  %5777 = phi i1 [ %5776, %else7698 ], [ true, %then7697 ]
  br i1 %5777, label %then7705, label %else7706

then7705:                                         ; preds = %continuation7696
  br label %continuation7704

else7706:                                         ; preds = %continuation7696
  %5778 = alloca i32, align 4
  %5779 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5780 = call i32 (ptr, ...) @scanf(ptr %5779, ptr %5778)
  %5781 = load i32, ptr %5778, align 4
  %5782 = icmp eq i32 %5781, 0
  br label %continuation7704

continuation7704:                                 ; preds = %else7706, %then7705
  %5783 = phi i1 [ %5782, %else7706 ], [ true, %then7705 ]
  br i1 %5783, label %then7713, label %else7714

then7713:                                         ; preds = %continuation7704
  br label %continuation7712

else7714:                                         ; preds = %continuation7704
  %5784 = alloca i32, align 4
  %5785 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5786 = call i32 (ptr, ...) @scanf(ptr %5785, ptr %5784)
  %5787 = load i32, ptr %5784, align 4
  %5788 = icmp eq i32 %5787, 0
  br label %continuation7712

continuation7712:                                 ; preds = %else7714, %then7713
  %5789 = phi i1 [ %5788, %else7714 ], [ true, %then7713 ]
  br i1 %5789, label %then7721, label %else7722

then7721:                                         ; preds = %continuation7712
  br label %continuation7720

else7722:                                         ; preds = %continuation7712
  %5790 = alloca i32, align 4
  %5791 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5792 = call i32 (ptr, ...) @scanf(ptr %5791, ptr %5790)
  %5793 = load i32, ptr %5790, align 4
  %5794 = icmp eq i32 %5793, 0
  br label %continuation7720

continuation7720:                                 ; preds = %else7722, %then7721
  %5795 = phi i1 [ %5794, %else7722 ], [ true, %then7721 ]
  br i1 %5795, label %then7729, label %else7730

then7729:                                         ; preds = %continuation7720
  br label %continuation7728

else7730:                                         ; preds = %continuation7720
  %5796 = alloca i32, align 4
  %5797 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5798 = call i32 (ptr, ...) @scanf(ptr %5797, ptr %5796)
  %5799 = load i32, ptr %5796, align 4
  %5800 = icmp eq i32 %5799, 0
  br label %continuation7728

continuation7728:                                 ; preds = %else7730, %then7729
  %5801 = phi i1 [ %5800, %else7730 ], [ true, %then7729 ]
  br i1 %5801, label %then7737, label %else7738

then7737:                                         ; preds = %continuation7728
  br label %continuation7736

else7738:                                         ; preds = %continuation7728
  %5802 = alloca i32, align 4
  %5803 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5804 = call i32 (ptr, ...) @scanf(ptr %5803, ptr %5802)
  %5805 = load i32, ptr %5802, align 4
  %5806 = icmp eq i32 %5805, 0
  br label %continuation7736

continuation7736:                                 ; preds = %else7738, %then7737
  %5807 = phi i1 [ %5806, %else7738 ], [ true, %then7737 ]
  br i1 %5807, label %then7745, label %else7746

then7745:                                         ; preds = %continuation7736
  br label %continuation7744

else7746:                                         ; preds = %continuation7736
  %5808 = alloca i32, align 4
  %5809 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5810 = call i32 (ptr, ...) @scanf(ptr %5809, ptr %5808)
  %5811 = load i32, ptr %5808, align 4
  %5812 = icmp eq i32 %5811, 0
  br label %continuation7744

continuation7744:                                 ; preds = %else7746, %then7745
  %5813 = phi i1 [ %5812, %else7746 ], [ true, %then7745 ]
  br i1 %5813, label %then7753, label %else7754

then7753:                                         ; preds = %continuation7744
  br label %continuation7752

else7754:                                         ; preds = %continuation7744
  %5814 = alloca i32, align 4
  %5815 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5816 = call i32 (ptr, ...) @scanf(ptr %5815, ptr %5814)
  %5817 = load i32, ptr %5814, align 4
  %5818 = icmp eq i32 %5817, 0
  br label %continuation7752

continuation7752:                                 ; preds = %else7754, %then7753
  %5819 = phi i1 [ %5818, %else7754 ], [ true, %then7753 ]
  br i1 %5819, label %then7761, label %else7762

then7761:                                         ; preds = %continuation7752
  br label %continuation7760

else7762:                                         ; preds = %continuation7752
  %5820 = alloca i32, align 4
  %5821 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5822 = call i32 (ptr, ...) @scanf(ptr %5821, ptr %5820)
  %5823 = load i32, ptr %5820, align 4
  %5824 = icmp eq i32 %5823, 0
  br label %continuation7760

continuation7760:                                 ; preds = %else7762, %then7761
  %5825 = phi i1 [ %5824, %else7762 ], [ true, %then7761 ]
  br i1 %5825, label %then7769, label %else7770

then7769:                                         ; preds = %continuation7760
  br label %continuation7768

else7770:                                         ; preds = %continuation7760
  %5826 = alloca i32, align 4
  %5827 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5828 = call i32 (ptr, ...) @scanf(ptr %5827, ptr %5826)
  %5829 = load i32, ptr %5826, align 4
  %5830 = icmp eq i32 %5829, 0
  br label %continuation7768

continuation7768:                                 ; preds = %else7770, %then7769
  %5831 = phi i1 [ %5830, %else7770 ], [ true, %then7769 ]
  br i1 %5831, label %then7777, label %else7778

then7777:                                         ; preds = %continuation7768
  br label %continuation7776

else7778:                                         ; preds = %continuation7768
  %5832 = alloca i32, align 4
  %5833 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5834 = call i32 (ptr, ...) @scanf(ptr %5833, ptr %5832)
  %5835 = load i32, ptr %5832, align 4
  %5836 = icmp eq i32 %5835, 0
  br label %continuation7776

continuation7776:                                 ; preds = %else7778, %then7777
  %5837 = phi i1 [ %5836, %else7778 ], [ true, %then7777 ]
  br i1 %5837, label %then7785, label %else7786

then7785:                                         ; preds = %continuation7776
  br label %continuation7784

else7786:                                         ; preds = %continuation7776
  %5838 = alloca i32, align 4
  %5839 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5840 = call i32 (ptr, ...) @scanf(ptr %5839, ptr %5838)
  %5841 = load i32, ptr %5838, align 4
  %5842 = icmp eq i32 %5841, 0
  br label %continuation7784

continuation7784:                                 ; preds = %else7786, %then7785
  %5843 = phi i1 [ %5842, %else7786 ], [ true, %then7785 ]
  br i1 %5843, label %then7793, label %else7794

then7793:                                         ; preds = %continuation7784
  br label %continuation7792

else7794:                                         ; preds = %continuation7784
  %5844 = alloca i32, align 4
  %5845 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5846 = call i32 (ptr, ...) @scanf(ptr %5845, ptr %5844)
  %5847 = load i32, ptr %5844, align 4
  %5848 = icmp eq i32 %5847, 0
  br label %continuation7792

continuation7792:                                 ; preds = %else7794, %then7793
  %5849 = phi i1 [ %5848, %else7794 ], [ true, %then7793 ]
  br i1 %5849, label %then7801, label %else7802

then7801:                                         ; preds = %continuation7792
  br label %continuation7800

else7802:                                         ; preds = %continuation7792
  %5850 = alloca i32, align 4
  %5851 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5852 = call i32 (ptr, ...) @scanf(ptr %5851, ptr %5850)
  %5853 = load i32, ptr %5850, align 4
  %5854 = icmp eq i32 %5853, 0
  br label %continuation7800

continuation7800:                                 ; preds = %else7802, %then7801
  %5855 = phi i1 [ %5854, %else7802 ], [ true, %then7801 ]
  br i1 %5855, label %then7809, label %else7810

then7809:                                         ; preds = %continuation7800
  br label %continuation7808

else7810:                                         ; preds = %continuation7800
  %5856 = alloca i32, align 4
  %5857 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5858 = call i32 (ptr, ...) @scanf(ptr %5857, ptr %5856)
  %5859 = load i32, ptr %5856, align 4
  %5860 = icmp eq i32 %5859, 0
  br label %continuation7808

continuation7808:                                 ; preds = %else7810, %then7809
  %5861 = phi i1 [ %5860, %else7810 ], [ true, %then7809 ]
  br i1 %5861, label %then7817, label %else7818

then7817:                                         ; preds = %continuation7808
  br label %continuation7816

else7818:                                         ; preds = %continuation7808
  %5862 = alloca i32, align 4
  %5863 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5864 = call i32 (ptr, ...) @scanf(ptr %5863, ptr %5862)
  %5865 = load i32, ptr %5862, align 4
  %5866 = icmp eq i32 %5865, 0
  br label %continuation7816

continuation7816:                                 ; preds = %else7818, %then7817
  %5867 = phi i1 [ %5866, %else7818 ], [ true, %then7817 ]
  br i1 %5867, label %then7825, label %else7826

then7825:                                         ; preds = %continuation7816
  br label %continuation7824

else7826:                                         ; preds = %continuation7816
  %5868 = alloca i32, align 4
  %5869 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5870 = call i32 (ptr, ...) @scanf(ptr %5869, ptr %5868)
  %5871 = load i32, ptr %5868, align 4
  %5872 = icmp eq i32 %5871, 0
  br label %continuation7824

continuation7824:                                 ; preds = %else7826, %then7825
  %5873 = phi i1 [ %5872, %else7826 ], [ true, %then7825 ]
  br i1 %5873, label %then7833, label %else7834

then7833:                                         ; preds = %continuation7824
  br label %continuation7832

else7834:                                         ; preds = %continuation7824
  %5874 = alloca i32, align 4
  %5875 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5876 = call i32 (ptr, ...) @scanf(ptr %5875, ptr %5874)
  %5877 = load i32, ptr %5874, align 4
  %5878 = icmp eq i32 %5877, 0
  br label %continuation7832

continuation7832:                                 ; preds = %else7834, %then7833
  %5879 = phi i1 [ %5878, %else7834 ], [ true, %then7833 ]
  br i1 %5879, label %then7841, label %else7842

then7841:                                         ; preds = %continuation7832
  br label %continuation7840

else7842:                                         ; preds = %continuation7832
  %5880 = alloca i32, align 4
  %5881 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5882 = call i32 (ptr, ...) @scanf(ptr %5881, ptr %5880)
  %5883 = load i32, ptr %5880, align 4
  %5884 = icmp eq i32 %5883, 0
  br label %continuation7840

continuation7840:                                 ; preds = %else7842, %then7841
  %5885 = phi i1 [ %5884, %else7842 ], [ true, %then7841 ]
  br i1 %5885, label %then7849, label %else7850

then7849:                                         ; preds = %continuation7840
  br label %continuation7848

else7850:                                         ; preds = %continuation7840
  %5886 = alloca i32, align 4
  %5887 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5888 = call i32 (ptr, ...) @scanf(ptr %5887, ptr %5886)
  %5889 = load i32, ptr %5886, align 4
  %5890 = icmp eq i32 %5889, 0
  br label %continuation7848

continuation7848:                                 ; preds = %else7850, %then7849
  %5891 = phi i1 [ %5890, %else7850 ], [ true, %then7849 ]
  br i1 %5891, label %then7857, label %else7858

then7857:                                         ; preds = %continuation7848
  br label %continuation7856

else7858:                                         ; preds = %continuation7848
  %5892 = alloca i32, align 4
  %5893 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5894 = call i32 (ptr, ...) @scanf(ptr %5893, ptr %5892)
  %5895 = load i32, ptr %5892, align 4
  %5896 = icmp eq i32 %5895, 0
  br label %continuation7856

continuation7856:                                 ; preds = %else7858, %then7857
  %5897 = phi i1 [ %5896, %else7858 ], [ true, %then7857 ]
  br i1 %5897, label %then7865, label %else7866

then7865:                                         ; preds = %continuation7856
  br label %continuation7864

else7866:                                         ; preds = %continuation7856
  %5898 = alloca i32, align 4
  %5899 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5900 = call i32 (ptr, ...) @scanf(ptr %5899, ptr %5898)
  %5901 = load i32, ptr %5898, align 4
  %5902 = icmp eq i32 %5901, 0
  br label %continuation7864

continuation7864:                                 ; preds = %else7866, %then7865
  %5903 = phi i1 [ %5902, %else7866 ], [ true, %then7865 ]
  br i1 %5903, label %then7873, label %else7874

then7873:                                         ; preds = %continuation7864
  br label %continuation7872

else7874:                                         ; preds = %continuation7864
  %5904 = alloca i32, align 4
  %5905 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5906 = call i32 (ptr, ...) @scanf(ptr %5905, ptr %5904)
  %5907 = load i32, ptr %5904, align 4
  %5908 = icmp eq i32 %5907, 0
  br label %continuation7872

continuation7872:                                 ; preds = %else7874, %then7873
  %5909 = phi i1 [ %5908, %else7874 ], [ true, %then7873 ]
  br i1 %5909, label %then7881, label %else7882

then7881:                                         ; preds = %continuation7872
  br label %continuation7880

else7882:                                         ; preds = %continuation7872
  %5910 = alloca i32, align 4
  %5911 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5912 = call i32 (ptr, ...) @scanf(ptr %5911, ptr %5910)
  %5913 = load i32, ptr %5910, align 4
  %5914 = icmp eq i32 %5913, 0
  br label %continuation7880

continuation7880:                                 ; preds = %else7882, %then7881
  %5915 = phi i1 [ %5914, %else7882 ], [ true, %then7881 ]
  br i1 %5915, label %then7889, label %else7890

then7889:                                         ; preds = %continuation7880
  br label %continuation7888

else7890:                                         ; preds = %continuation7880
  %5916 = alloca i32, align 4
  %5917 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5918 = call i32 (ptr, ...) @scanf(ptr %5917, ptr %5916)
  %5919 = load i32, ptr %5916, align 4
  %5920 = icmp eq i32 %5919, 0
  br label %continuation7888

continuation7888:                                 ; preds = %else7890, %then7889
  %5921 = phi i1 [ %5920, %else7890 ], [ true, %then7889 ]
  br i1 %5921, label %then7897, label %else7898

then7897:                                         ; preds = %continuation7888
  br label %continuation7896

else7898:                                         ; preds = %continuation7888
  %5922 = alloca i32, align 4
  %5923 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5924 = call i32 (ptr, ...) @scanf(ptr %5923, ptr %5922)
  %5925 = load i32, ptr %5922, align 4
  %5926 = icmp eq i32 %5925, 0
  br label %continuation7896

continuation7896:                                 ; preds = %else7898, %then7897
  %5927 = phi i1 [ %5926, %else7898 ], [ true, %then7897 ]
  br i1 %5927, label %then7905, label %else7906

then7905:                                         ; preds = %continuation7896
  br label %continuation7904

else7906:                                         ; preds = %continuation7896
  %5928 = alloca i32, align 4
  %5929 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5930 = call i32 (ptr, ...) @scanf(ptr %5929, ptr %5928)
  %5931 = load i32, ptr %5928, align 4
  %5932 = icmp eq i32 %5931, 0
  br label %continuation7904

continuation7904:                                 ; preds = %else7906, %then7905
  %5933 = phi i1 [ %5932, %else7906 ], [ true, %then7905 ]
  br i1 %5933, label %then7913, label %else7914

then7913:                                         ; preds = %continuation7904
  br label %continuation7912

else7914:                                         ; preds = %continuation7904
  %5934 = alloca i32, align 4
  %5935 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5936 = call i32 (ptr, ...) @scanf(ptr %5935, ptr %5934)
  %5937 = load i32, ptr %5934, align 4
  %5938 = icmp eq i32 %5937, 0
  br label %continuation7912

continuation7912:                                 ; preds = %else7914, %then7913
  %5939 = phi i1 [ %5938, %else7914 ], [ true, %then7913 ]
  br i1 %5939, label %then7921, label %else7922

then7921:                                         ; preds = %continuation7912
  br label %continuation7920

else7922:                                         ; preds = %continuation7912
  %5940 = alloca i32, align 4
  %5941 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5942 = call i32 (ptr, ...) @scanf(ptr %5941, ptr %5940)
  %5943 = load i32, ptr %5940, align 4
  %5944 = icmp eq i32 %5943, 0
  br label %continuation7920

continuation7920:                                 ; preds = %else7922, %then7921
  %5945 = phi i1 [ %5944, %else7922 ], [ true, %then7921 ]
  br i1 %5945, label %then7929, label %else7930

then7929:                                         ; preds = %continuation7920
  br label %continuation7928

else7930:                                         ; preds = %continuation7920
  %5946 = alloca i32, align 4
  %5947 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5948 = call i32 (ptr, ...) @scanf(ptr %5947, ptr %5946)
  %5949 = load i32, ptr %5946, align 4
  %5950 = icmp eq i32 %5949, 0
  br label %continuation7928

continuation7928:                                 ; preds = %else7930, %then7929
  %5951 = phi i1 [ %5950, %else7930 ], [ true, %then7929 ]
  br i1 %5951, label %then7937, label %else7938

then7937:                                         ; preds = %continuation7928
  br label %continuation7936

else7938:                                         ; preds = %continuation7928
  %5952 = alloca i32, align 4
  %5953 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5954 = call i32 (ptr, ...) @scanf(ptr %5953, ptr %5952)
  %5955 = load i32, ptr %5952, align 4
  %5956 = icmp eq i32 %5955, 0
  br label %continuation7936

continuation7936:                                 ; preds = %else7938, %then7937
  %5957 = phi i1 [ %5956, %else7938 ], [ true, %then7937 ]
  br i1 %5957, label %then7945, label %else7946

then7945:                                         ; preds = %continuation7936
  br label %continuation7944

else7946:                                         ; preds = %continuation7936
  %5958 = alloca i32, align 4
  %5959 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5960 = call i32 (ptr, ...) @scanf(ptr %5959, ptr %5958)
  %5961 = load i32, ptr %5958, align 4
  %5962 = icmp eq i32 %5961, 0
  br label %continuation7944

continuation7944:                                 ; preds = %else7946, %then7945
  %5963 = phi i1 [ %5962, %else7946 ], [ true, %then7945 ]
  br i1 %5963, label %then7953, label %else7954

then7953:                                         ; preds = %continuation7944
  br label %continuation7952

else7954:                                         ; preds = %continuation7944
  %5964 = alloca i32, align 4
  %5965 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5966 = call i32 (ptr, ...) @scanf(ptr %5965, ptr %5964)
  %5967 = load i32, ptr %5964, align 4
  %5968 = icmp eq i32 %5967, 0
  br label %continuation7952

continuation7952:                                 ; preds = %else7954, %then7953
  %5969 = phi i1 [ %5968, %else7954 ], [ true, %then7953 ]
  br i1 %5969, label %then7961, label %else7962

then7961:                                         ; preds = %continuation7952
  br label %continuation7960

else7962:                                         ; preds = %continuation7952
  %5970 = alloca i32, align 4
  %5971 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5972 = call i32 (ptr, ...) @scanf(ptr %5971, ptr %5970)
  %5973 = load i32, ptr %5970, align 4
  %5974 = icmp eq i32 %5973, 0
  br label %continuation7960

continuation7960:                                 ; preds = %else7962, %then7961
  %5975 = phi i1 [ %5974, %else7962 ], [ true, %then7961 ]
  br i1 %5975, label %then7969, label %else7970

then7969:                                         ; preds = %continuation7960
  br label %continuation7968

else7970:                                         ; preds = %continuation7960
  %5976 = alloca i32, align 4
  %5977 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5978 = call i32 (ptr, ...) @scanf(ptr %5977, ptr %5976)
  %5979 = load i32, ptr %5976, align 4
  %5980 = icmp eq i32 %5979, 0
  br label %continuation7968

continuation7968:                                 ; preds = %else7970, %then7969
  %5981 = phi i1 [ %5980, %else7970 ], [ true, %then7969 ]
  br i1 %5981, label %then7977, label %else7978

then7977:                                         ; preds = %continuation7968
  br label %continuation7976

else7978:                                         ; preds = %continuation7968
  %5982 = alloca i32, align 4
  %5983 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5984 = call i32 (ptr, ...) @scanf(ptr %5983, ptr %5982)
  %5985 = load i32, ptr %5982, align 4
  %5986 = icmp eq i32 %5985, 0
  br label %continuation7976

continuation7976:                                 ; preds = %else7978, %then7977
  %5987 = phi i1 [ %5986, %else7978 ], [ true, %then7977 ]
  br i1 %5987, label %then7985, label %else7986

then7985:                                         ; preds = %continuation7976
  br label %continuation7984

else7986:                                         ; preds = %continuation7976
  %5988 = alloca i32, align 4
  %5989 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5990 = call i32 (ptr, ...) @scanf(ptr %5989, ptr %5988)
  %5991 = load i32, ptr %5988, align 4
  %5992 = icmp eq i32 %5991, 0
  br label %continuation7984

continuation7984:                                 ; preds = %else7986, %then7985
  %5993 = phi i1 [ %5992, %else7986 ], [ true, %then7985 ]
  br i1 %5993, label %then7993, label %else7994

then7993:                                         ; preds = %continuation7984
  br label %continuation7992

else7994:                                         ; preds = %continuation7984
  %5994 = alloca i32, align 4
  %5995 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5996 = call i32 (ptr, ...) @scanf(ptr %5995, ptr %5994)
  %5997 = load i32, ptr %5994, align 4
  %5998 = icmp eq i32 %5997, 0
  br label %continuation7992

continuation7992:                                 ; preds = %else7994, %then7993
  %5999 = phi i1 [ %5998, %else7994 ], [ true, %then7993 ]
  br i1 %5999, label %then8001, label %else8002

then8001:                                         ; preds = %continuation7992
  %6000 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6001 = call i32 (ptr, ...) @printf(ptr %6000, i32 1)
  br label %continuation8000

else8002:                                         ; preds = %continuation7992
  %6002 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6003 = call i32 (ptr, ...) @printf(ptr %6002, i32 0)
  br label %continuation8000

continuation8000:                                 ; preds = %else8002, %then8001
  br label %exit

exit:                                             ; preds = %continuation8000
  ret i32 0
}

attributes #0 = { nounwind }
