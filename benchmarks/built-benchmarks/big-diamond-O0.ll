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
  br i1 %5, label %then10, label %else11

then10:                                           ; preds = %continuation1
  br label %continuation9

else11:                                           ; preds = %continuation1
  %6 = alloca i32, align 4
  %7 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %8 = call i32 (ptr, ...) @scanf(ptr %7, ptr %6)
  %9 = load i32, ptr %6, align 4
  %10 = icmp eq i32 %9, 0
  br label %continuation9

continuation9:                                    ; preds = %else11, %then10
  %11 = phi i1 [ %10, %else11 ], [ true, %then10 ]
  br i1 %11, label %then19, label %else20

then19:                                           ; preds = %continuation9
  br label %continuation18

else20:                                           ; preds = %continuation9
  %12 = alloca i32, align 4
  %13 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %14 = call i32 (ptr, ...) @scanf(ptr %13, ptr %12)
  %15 = load i32, ptr %12, align 4
  %16 = icmp eq i32 %15, 0
  br label %continuation18

continuation18:                                   ; preds = %else20, %then19
  %17 = phi i1 [ %16, %else20 ], [ true, %then19 ]
  br i1 %17, label %then28, label %else29

then28:                                           ; preds = %continuation18
  br label %continuation27

else29:                                           ; preds = %continuation18
  %18 = alloca i32, align 4
  %19 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %20 = call i32 (ptr, ...) @scanf(ptr %19, ptr %18)
  %21 = load i32, ptr %18, align 4
  %22 = icmp eq i32 %21, 0
  br label %continuation27

continuation27:                                   ; preds = %else29, %then28
  %23 = phi i1 [ %22, %else29 ], [ true, %then28 ]
  br i1 %23, label %then37, label %else38

then37:                                           ; preds = %continuation27
  br label %continuation36

else38:                                           ; preds = %continuation27
  %24 = alloca i32, align 4
  %25 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %26 = call i32 (ptr, ...) @scanf(ptr %25, ptr %24)
  %27 = load i32, ptr %24, align 4
  %28 = icmp eq i32 %27, 0
  br label %continuation36

continuation36:                                   ; preds = %else38, %then37
  %29 = phi i1 [ %28, %else38 ], [ true, %then37 ]
  br i1 %29, label %then46, label %else47

then46:                                           ; preds = %continuation36
  br label %continuation45

else47:                                           ; preds = %continuation36
  %30 = alloca i32, align 4
  %31 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %32 = call i32 (ptr, ...) @scanf(ptr %31, ptr %30)
  %33 = load i32, ptr %30, align 4
  %34 = icmp eq i32 %33, 0
  br label %continuation45

continuation45:                                   ; preds = %else47, %then46
  %35 = phi i1 [ %34, %else47 ], [ true, %then46 ]
  br i1 %35, label %then55, label %else56

then55:                                           ; preds = %continuation45
  br label %continuation54

else56:                                           ; preds = %continuation45
  %36 = alloca i32, align 4
  %37 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %38 = call i32 (ptr, ...) @scanf(ptr %37, ptr %36)
  %39 = load i32, ptr %36, align 4
  %40 = icmp eq i32 %39, 0
  br label %continuation54

continuation54:                                   ; preds = %else56, %then55
  %41 = phi i1 [ %40, %else56 ], [ true, %then55 ]
  br i1 %41, label %then64, label %else65

then64:                                           ; preds = %continuation54
  br label %continuation63

else65:                                           ; preds = %continuation54
  %42 = alloca i32, align 4
  %43 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %44 = call i32 (ptr, ...) @scanf(ptr %43, ptr %42)
  %45 = load i32, ptr %42, align 4
  %46 = icmp eq i32 %45, 0
  br label %continuation63

continuation63:                                   ; preds = %else65, %then64
  %47 = phi i1 [ %46, %else65 ], [ true, %then64 ]
  br i1 %47, label %then73, label %else74

then73:                                           ; preds = %continuation63
  br label %continuation72

else74:                                           ; preds = %continuation63
  %48 = alloca i32, align 4
  %49 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %50 = call i32 (ptr, ...) @scanf(ptr %49, ptr %48)
  %51 = load i32, ptr %48, align 4
  %52 = icmp eq i32 %51, 0
  br label %continuation72

continuation72:                                   ; preds = %else74, %then73
  %53 = phi i1 [ %52, %else74 ], [ true, %then73 ]
  br i1 %53, label %then82, label %else83

then82:                                           ; preds = %continuation72
  br label %continuation81

else83:                                           ; preds = %continuation72
  %54 = alloca i32, align 4
  %55 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %56 = call i32 (ptr, ...) @scanf(ptr %55, ptr %54)
  %57 = load i32, ptr %54, align 4
  %58 = icmp eq i32 %57, 0
  br label %continuation81

continuation81:                                   ; preds = %else83, %then82
  %59 = phi i1 [ %58, %else83 ], [ true, %then82 ]
  br i1 %59, label %then91, label %else92

then91:                                           ; preds = %continuation81
  br label %continuation90

else92:                                           ; preds = %continuation81
  %60 = alloca i32, align 4
  %61 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %62 = call i32 (ptr, ...) @scanf(ptr %61, ptr %60)
  %63 = load i32, ptr %60, align 4
  %64 = icmp eq i32 %63, 0
  br label %continuation90

continuation90:                                   ; preds = %else92, %then91
  %65 = phi i1 [ %64, %else92 ], [ true, %then91 ]
  br i1 %65, label %then100, label %else101

then100:                                          ; preds = %continuation90
  br label %continuation99

else101:                                          ; preds = %continuation90
  %66 = alloca i32, align 4
  %67 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %68 = call i32 (ptr, ...) @scanf(ptr %67, ptr %66)
  %69 = load i32, ptr %66, align 4
  %70 = icmp eq i32 %69, 0
  br label %continuation99

continuation99:                                   ; preds = %else101, %then100
  %71 = phi i1 [ %70, %else101 ], [ true, %then100 ]
  br i1 %71, label %then109, label %else110

then109:                                          ; preds = %continuation99
  br label %continuation108

else110:                                          ; preds = %continuation99
  %72 = alloca i32, align 4
  %73 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %74 = call i32 (ptr, ...) @scanf(ptr %73, ptr %72)
  %75 = load i32, ptr %72, align 4
  %76 = icmp eq i32 %75, 0
  br label %continuation108

continuation108:                                  ; preds = %else110, %then109
  %77 = phi i1 [ %76, %else110 ], [ true, %then109 ]
  br i1 %77, label %then118, label %else119

then118:                                          ; preds = %continuation108
  br label %continuation117

else119:                                          ; preds = %continuation108
  %78 = alloca i32, align 4
  %79 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %80 = call i32 (ptr, ...) @scanf(ptr %79, ptr %78)
  %81 = load i32, ptr %78, align 4
  %82 = icmp eq i32 %81, 0
  br label %continuation117

continuation117:                                  ; preds = %else119, %then118
  %83 = phi i1 [ %82, %else119 ], [ true, %then118 ]
  br i1 %83, label %then127, label %else128

then127:                                          ; preds = %continuation117
  br label %continuation126

else128:                                          ; preds = %continuation117
  %84 = alloca i32, align 4
  %85 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %86 = call i32 (ptr, ...) @scanf(ptr %85, ptr %84)
  %87 = load i32, ptr %84, align 4
  %88 = icmp eq i32 %87, 0
  br label %continuation126

continuation126:                                  ; preds = %else128, %then127
  %89 = phi i1 [ %88, %else128 ], [ true, %then127 ]
  br i1 %89, label %then136, label %else137

then136:                                          ; preds = %continuation126
  br label %continuation135

else137:                                          ; preds = %continuation126
  %90 = alloca i32, align 4
  %91 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %92 = call i32 (ptr, ...) @scanf(ptr %91, ptr %90)
  %93 = load i32, ptr %90, align 4
  %94 = icmp eq i32 %93, 0
  br label %continuation135

continuation135:                                  ; preds = %else137, %then136
  %95 = phi i1 [ %94, %else137 ], [ true, %then136 ]
  br i1 %95, label %then145, label %else146

then145:                                          ; preds = %continuation135
  br label %continuation144

else146:                                          ; preds = %continuation135
  %96 = alloca i32, align 4
  %97 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %98 = call i32 (ptr, ...) @scanf(ptr %97, ptr %96)
  %99 = load i32, ptr %96, align 4
  %100 = icmp eq i32 %99, 0
  br label %continuation144

continuation144:                                  ; preds = %else146, %then145
  %101 = phi i1 [ %100, %else146 ], [ true, %then145 ]
  br i1 %101, label %then154, label %else155

then154:                                          ; preds = %continuation144
  br label %continuation153

else155:                                          ; preds = %continuation144
  %102 = alloca i32, align 4
  %103 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %104 = call i32 (ptr, ...) @scanf(ptr %103, ptr %102)
  %105 = load i32, ptr %102, align 4
  %106 = icmp eq i32 %105, 0
  br label %continuation153

continuation153:                                  ; preds = %else155, %then154
  %107 = phi i1 [ %106, %else155 ], [ true, %then154 ]
  br i1 %107, label %then163, label %else164

then163:                                          ; preds = %continuation153
  br label %continuation162

else164:                                          ; preds = %continuation153
  %108 = alloca i32, align 4
  %109 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %110 = call i32 (ptr, ...) @scanf(ptr %109, ptr %108)
  %111 = load i32, ptr %108, align 4
  %112 = icmp eq i32 %111, 0
  br label %continuation162

continuation162:                                  ; preds = %else164, %then163
  %113 = phi i1 [ %112, %else164 ], [ true, %then163 ]
  br i1 %113, label %then172, label %else173

then172:                                          ; preds = %continuation162
  br label %continuation171

else173:                                          ; preds = %continuation162
  %114 = alloca i32, align 4
  %115 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %116 = call i32 (ptr, ...) @scanf(ptr %115, ptr %114)
  %117 = load i32, ptr %114, align 4
  %118 = icmp eq i32 %117, 0
  br label %continuation171

continuation171:                                  ; preds = %else173, %then172
  %119 = phi i1 [ %118, %else173 ], [ true, %then172 ]
  br i1 %119, label %then181, label %else182

then181:                                          ; preds = %continuation171
  br label %continuation180

else182:                                          ; preds = %continuation171
  %120 = alloca i32, align 4
  %121 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %122 = call i32 (ptr, ...) @scanf(ptr %121, ptr %120)
  %123 = load i32, ptr %120, align 4
  %124 = icmp eq i32 %123, 0
  br label %continuation180

continuation180:                                  ; preds = %else182, %then181
  %125 = phi i1 [ %124, %else182 ], [ true, %then181 ]
  br i1 %125, label %then190, label %else191

then190:                                          ; preds = %continuation180
  br label %continuation189

else191:                                          ; preds = %continuation180
  %126 = alloca i32, align 4
  %127 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %128 = call i32 (ptr, ...) @scanf(ptr %127, ptr %126)
  %129 = load i32, ptr %126, align 4
  %130 = icmp eq i32 %129, 0
  br label %continuation189

continuation189:                                  ; preds = %else191, %then190
  %131 = phi i1 [ %130, %else191 ], [ true, %then190 ]
  br i1 %131, label %then199, label %else200

then199:                                          ; preds = %continuation189
  br label %continuation198

else200:                                          ; preds = %continuation189
  %132 = alloca i32, align 4
  %133 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %134 = call i32 (ptr, ...) @scanf(ptr %133, ptr %132)
  %135 = load i32, ptr %132, align 4
  %136 = icmp eq i32 %135, 0
  br label %continuation198

continuation198:                                  ; preds = %else200, %then199
  %137 = phi i1 [ %136, %else200 ], [ true, %then199 ]
  br i1 %137, label %then208, label %else209

then208:                                          ; preds = %continuation198
  br label %continuation207

else209:                                          ; preds = %continuation198
  %138 = alloca i32, align 4
  %139 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %140 = call i32 (ptr, ...) @scanf(ptr %139, ptr %138)
  %141 = load i32, ptr %138, align 4
  %142 = icmp eq i32 %141, 0
  br label %continuation207

continuation207:                                  ; preds = %else209, %then208
  %143 = phi i1 [ %142, %else209 ], [ true, %then208 ]
  br i1 %143, label %then217, label %else218

then217:                                          ; preds = %continuation207
  br label %continuation216

else218:                                          ; preds = %continuation207
  %144 = alloca i32, align 4
  %145 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %146 = call i32 (ptr, ...) @scanf(ptr %145, ptr %144)
  %147 = load i32, ptr %144, align 4
  %148 = icmp eq i32 %147, 0
  br label %continuation216

continuation216:                                  ; preds = %else218, %then217
  %149 = phi i1 [ %148, %else218 ], [ true, %then217 ]
  br i1 %149, label %then226, label %else227

then226:                                          ; preds = %continuation216
  br label %continuation225

else227:                                          ; preds = %continuation216
  %150 = alloca i32, align 4
  %151 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %152 = call i32 (ptr, ...) @scanf(ptr %151, ptr %150)
  %153 = load i32, ptr %150, align 4
  %154 = icmp eq i32 %153, 0
  br label %continuation225

continuation225:                                  ; preds = %else227, %then226
  %155 = phi i1 [ %154, %else227 ], [ true, %then226 ]
  br i1 %155, label %then235, label %else236

then235:                                          ; preds = %continuation225
  br label %continuation234

else236:                                          ; preds = %continuation225
  %156 = alloca i32, align 4
  %157 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %158 = call i32 (ptr, ...) @scanf(ptr %157, ptr %156)
  %159 = load i32, ptr %156, align 4
  %160 = icmp eq i32 %159, 0
  br label %continuation234

continuation234:                                  ; preds = %else236, %then235
  %161 = phi i1 [ %160, %else236 ], [ true, %then235 ]
  br i1 %161, label %then244, label %else245

then244:                                          ; preds = %continuation234
  br label %continuation243

else245:                                          ; preds = %continuation234
  %162 = alloca i32, align 4
  %163 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %164 = call i32 (ptr, ...) @scanf(ptr %163, ptr %162)
  %165 = load i32, ptr %162, align 4
  %166 = icmp eq i32 %165, 0
  br label %continuation243

continuation243:                                  ; preds = %else245, %then244
  %167 = phi i1 [ %166, %else245 ], [ true, %then244 ]
  br i1 %167, label %then253, label %else254

then253:                                          ; preds = %continuation243
  br label %continuation252

else254:                                          ; preds = %continuation243
  %168 = alloca i32, align 4
  %169 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %170 = call i32 (ptr, ...) @scanf(ptr %169, ptr %168)
  %171 = load i32, ptr %168, align 4
  %172 = icmp eq i32 %171, 0
  br label %continuation252

continuation252:                                  ; preds = %else254, %then253
  %173 = phi i1 [ %172, %else254 ], [ true, %then253 ]
  br i1 %173, label %then262, label %else263

then262:                                          ; preds = %continuation252
  br label %continuation261

else263:                                          ; preds = %continuation252
  %174 = alloca i32, align 4
  %175 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %176 = call i32 (ptr, ...) @scanf(ptr %175, ptr %174)
  %177 = load i32, ptr %174, align 4
  %178 = icmp eq i32 %177, 0
  br label %continuation261

continuation261:                                  ; preds = %else263, %then262
  %179 = phi i1 [ %178, %else263 ], [ true, %then262 ]
  br i1 %179, label %then271, label %else272

then271:                                          ; preds = %continuation261
  br label %continuation270

else272:                                          ; preds = %continuation261
  %180 = alloca i32, align 4
  %181 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %182 = call i32 (ptr, ...) @scanf(ptr %181, ptr %180)
  %183 = load i32, ptr %180, align 4
  %184 = icmp eq i32 %183, 0
  br label %continuation270

continuation270:                                  ; preds = %else272, %then271
  %185 = phi i1 [ %184, %else272 ], [ true, %then271 ]
  br i1 %185, label %then280, label %else281

then280:                                          ; preds = %continuation270
  br label %continuation279

else281:                                          ; preds = %continuation270
  %186 = alloca i32, align 4
  %187 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %188 = call i32 (ptr, ...) @scanf(ptr %187, ptr %186)
  %189 = load i32, ptr %186, align 4
  %190 = icmp eq i32 %189, 0
  br label %continuation279

continuation279:                                  ; preds = %else281, %then280
  %191 = phi i1 [ %190, %else281 ], [ true, %then280 ]
  br i1 %191, label %then289, label %else290

then289:                                          ; preds = %continuation279
  br label %continuation288

else290:                                          ; preds = %continuation279
  %192 = alloca i32, align 4
  %193 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %194 = call i32 (ptr, ...) @scanf(ptr %193, ptr %192)
  %195 = load i32, ptr %192, align 4
  %196 = icmp eq i32 %195, 0
  br label %continuation288

continuation288:                                  ; preds = %else290, %then289
  %197 = phi i1 [ %196, %else290 ], [ true, %then289 ]
  br i1 %197, label %then298, label %else299

then298:                                          ; preds = %continuation288
  br label %continuation297

else299:                                          ; preds = %continuation288
  %198 = alloca i32, align 4
  %199 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %200 = call i32 (ptr, ...) @scanf(ptr %199, ptr %198)
  %201 = load i32, ptr %198, align 4
  %202 = icmp eq i32 %201, 0
  br label %continuation297

continuation297:                                  ; preds = %else299, %then298
  %203 = phi i1 [ %202, %else299 ], [ true, %then298 ]
  br i1 %203, label %then307, label %else308

then307:                                          ; preds = %continuation297
  br label %continuation306

else308:                                          ; preds = %continuation297
  %204 = alloca i32, align 4
  %205 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %206 = call i32 (ptr, ...) @scanf(ptr %205, ptr %204)
  %207 = load i32, ptr %204, align 4
  %208 = icmp eq i32 %207, 0
  br label %continuation306

continuation306:                                  ; preds = %else308, %then307
  %209 = phi i1 [ %208, %else308 ], [ true, %then307 ]
  br i1 %209, label %then316, label %else317

then316:                                          ; preds = %continuation306
  br label %continuation315

else317:                                          ; preds = %continuation306
  %210 = alloca i32, align 4
  %211 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %212 = call i32 (ptr, ...) @scanf(ptr %211, ptr %210)
  %213 = load i32, ptr %210, align 4
  %214 = icmp eq i32 %213, 0
  br label %continuation315

continuation315:                                  ; preds = %else317, %then316
  %215 = phi i1 [ %214, %else317 ], [ true, %then316 ]
  br i1 %215, label %then325, label %else326

then325:                                          ; preds = %continuation315
  br label %continuation324

else326:                                          ; preds = %continuation315
  %216 = alloca i32, align 4
  %217 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %218 = call i32 (ptr, ...) @scanf(ptr %217, ptr %216)
  %219 = load i32, ptr %216, align 4
  %220 = icmp eq i32 %219, 0
  br label %continuation324

continuation324:                                  ; preds = %else326, %then325
  %221 = phi i1 [ %220, %else326 ], [ true, %then325 ]
  br i1 %221, label %then334, label %else335

then334:                                          ; preds = %continuation324
  br label %continuation333

else335:                                          ; preds = %continuation324
  %222 = alloca i32, align 4
  %223 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %224 = call i32 (ptr, ...) @scanf(ptr %223, ptr %222)
  %225 = load i32, ptr %222, align 4
  %226 = icmp eq i32 %225, 0
  br label %continuation333

continuation333:                                  ; preds = %else335, %then334
  %227 = phi i1 [ %226, %else335 ], [ true, %then334 ]
  br i1 %227, label %then343, label %else344

then343:                                          ; preds = %continuation333
  br label %continuation342

else344:                                          ; preds = %continuation333
  %228 = alloca i32, align 4
  %229 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %230 = call i32 (ptr, ...) @scanf(ptr %229, ptr %228)
  %231 = load i32, ptr %228, align 4
  %232 = icmp eq i32 %231, 0
  br label %continuation342

continuation342:                                  ; preds = %else344, %then343
  %233 = phi i1 [ %232, %else344 ], [ true, %then343 ]
  br i1 %233, label %then352, label %else353

then352:                                          ; preds = %continuation342
  br label %continuation351

else353:                                          ; preds = %continuation342
  %234 = alloca i32, align 4
  %235 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %236 = call i32 (ptr, ...) @scanf(ptr %235, ptr %234)
  %237 = load i32, ptr %234, align 4
  %238 = icmp eq i32 %237, 0
  br label %continuation351

continuation351:                                  ; preds = %else353, %then352
  %239 = phi i1 [ %238, %else353 ], [ true, %then352 ]
  br i1 %239, label %then361, label %else362

then361:                                          ; preds = %continuation351
  br label %continuation360

else362:                                          ; preds = %continuation351
  %240 = alloca i32, align 4
  %241 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %242 = call i32 (ptr, ...) @scanf(ptr %241, ptr %240)
  %243 = load i32, ptr %240, align 4
  %244 = icmp eq i32 %243, 0
  br label %continuation360

continuation360:                                  ; preds = %else362, %then361
  %245 = phi i1 [ %244, %else362 ], [ true, %then361 ]
  br i1 %245, label %then370, label %else371

then370:                                          ; preds = %continuation360
  br label %continuation369

else371:                                          ; preds = %continuation360
  %246 = alloca i32, align 4
  %247 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %248 = call i32 (ptr, ...) @scanf(ptr %247, ptr %246)
  %249 = load i32, ptr %246, align 4
  %250 = icmp eq i32 %249, 0
  br label %continuation369

continuation369:                                  ; preds = %else371, %then370
  %251 = phi i1 [ %250, %else371 ], [ true, %then370 ]
  br i1 %251, label %then379, label %else380

then379:                                          ; preds = %continuation369
  br label %continuation378

else380:                                          ; preds = %continuation369
  %252 = alloca i32, align 4
  %253 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %254 = call i32 (ptr, ...) @scanf(ptr %253, ptr %252)
  %255 = load i32, ptr %252, align 4
  %256 = icmp eq i32 %255, 0
  br label %continuation378

continuation378:                                  ; preds = %else380, %then379
  %257 = phi i1 [ %256, %else380 ], [ true, %then379 ]
  br i1 %257, label %then388, label %else389

then388:                                          ; preds = %continuation378
  br label %continuation387

else389:                                          ; preds = %continuation378
  %258 = alloca i32, align 4
  %259 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %260 = call i32 (ptr, ...) @scanf(ptr %259, ptr %258)
  %261 = load i32, ptr %258, align 4
  %262 = icmp eq i32 %261, 0
  br label %continuation387

continuation387:                                  ; preds = %else389, %then388
  %263 = phi i1 [ %262, %else389 ], [ true, %then388 ]
  br i1 %263, label %then397, label %else398

then397:                                          ; preds = %continuation387
  br label %continuation396

else398:                                          ; preds = %continuation387
  %264 = alloca i32, align 4
  %265 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %266 = call i32 (ptr, ...) @scanf(ptr %265, ptr %264)
  %267 = load i32, ptr %264, align 4
  %268 = icmp eq i32 %267, 0
  br label %continuation396

continuation396:                                  ; preds = %else398, %then397
  %269 = phi i1 [ %268, %else398 ], [ true, %then397 ]
  br i1 %269, label %then406, label %else407

then406:                                          ; preds = %continuation396
  br label %continuation405

else407:                                          ; preds = %continuation396
  %270 = alloca i32, align 4
  %271 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %272 = call i32 (ptr, ...) @scanf(ptr %271, ptr %270)
  %273 = load i32, ptr %270, align 4
  %274 = icmp eq i32 %273, 0
  br label %continuation405

continuation405:                                  ; preds = %else407, %then406
  %275 = phi i1 [ %274, %else407 ], [ true, %then406 ]
  br i1 %275, label %then415, label %else416

then415:                                          ; preds = %continuation405
  br label %continuation414

else416:                                          ; preds = %continuation405
  %276 = alloca i32, align 4
  %277 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %278 = call i32 (ptr, ...) @scanf(ptr %277, ptr %276)
  %279 = load i32, ptr %276, align 4
  %280 = icmp eq i32 %279, 0
  br label %continuation414

continuation414:                                  ; preds = %else416, %then415
  %281 = phi i1 [ %280, %else416 ], [ true, %then415 ]
  br i1 %281, label %then424, label %else425

then424:                                          ; preds = %continuation414
  br label %continuation423

else425:                                          ; preds = %continuation414
  %282 = alloca i32, align 4
  %283 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %284 = call i32 (ptr, ...) @scanf(ptr %283, ptr %282)
  %285 = load i32, ptr %282, align 4
  %286 = icmp eq i32 %285, 0
  br label %continuation423

continuation423:                                  ; preds = %else425, %then424
  %287 = phi i1 [ %286, %else425 ], [ true, %then424 ]
  br i1 %287, label %then433, label %else434

then433:                                          ; preds = %continuation423
  br label %continuation432

else434:                                          ; preds = %continuation423
  %288 = alloca i32, align 4
  %289 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %290 = call i32 (ptr, ...) @scanf(ptr %289, ptr %288)
  %291 = load i32, ptr %288, align 4
  %292 = icmp eq i32 %291, 0
  br label %continuation432

continuation432:                                  ; preds = %else434, %then433
  %293 = phi i1 [ %292, %else434 ], [ true, %then433 ]
  br i1 %293, label %then442, label %else443

then442:                                          ; preds = %continuation432
  br label %continuation441

else443:                                          ; preds = %continuation432
  %294 = alloca i32, align 4
  %295 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %296 = call i32 (ptr, ...) @scanf(ptr %295, ptr %294)
  %297 = load i32, ptr %294, align 4
  %298 = icmp eq i32 %297, 0
  br label %continuation441

continuation441:                                  ; preds = %else443, %then442
  %299 = phi i1 [ %298, %else443 ], [ true, %then442 ]
  br i1 %299, label %then451, label %else452

then451:                                          ; preds = %continuation441
  br label %continuation450

else452:                                          ; preds = %continuation441
  %300 = alloca i32, align 4
  %301 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %302 = call i32 (ptr, ...) @scanf(ptr %301, ptr %300)
  %303 = load i32, ptr %300, align 4
  %304 = icmp eq i32 %303, 0
  br label %continuation450

continuation450:                                  ; preds = %else452, %then451
  %305 = phi i1 [ %304, %else452 ], [ true, %then451 ]
  br i1 %305, label %then460, label %else461

then460:                                          ; preds = %continuation450
  br label %continuation459

else461:                                          ; preds = %continuation450
  %306 = alloca i32, align 4
  %307 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %308 = call i32 (ptr, ...) @scanf(ptr %307, ptr %306)
  %309 = load i32, ptr %306, align 4
  %310 = icmp eq i32 %309, 0
  br label %continuation459

continuation459:                                  ; preds = %else461, %then460
  %311 = phi i1 [ %310, %else461 ], [ true, %then460 ]
  br i1 %311, label %then469, label %else470

then469:                                          ; preds = %continuation459
  br label %continuation468

else470:                                          ; preds = %continuation459
  %312 = alloca i32, align 4
  %313 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %314 = call i32 (ptr, ...) @scanf(ptr %313, ptr %312)
  %315 = load i32, ptr %312, align 4
  %316 = icmp eq i32 %315, 0
  br label %continuation468

continuation468:                                  ; preds = %else470, %then469
  %317 = phi i1 [ %316, %else470 ], [ true, %then469 ]
  br i1 %317, label %then478, label %else479

then478:                                          ; preds = %continuation468
  br label %continuation477

else479:                                          ; preds = %continuation468
  %318 = alloca i32, align 4
  %319 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %320 = call i32 (ptr, ...) @scanf(ptr %319, ptr %318)
  %321 = load i32, ptr %318, align 4
  %322 = icmp eq i32 %321, 0
  br label %continuation477

continuation477:                                  ; preds = %else479, %then478
  %323 = phi i1 [ %322, %else479 ], [ true, %then478 ]
  br i1 %323, label %then487, label %else488

then487:                                          ; preds = %continuation477
  br label %continuation486

else488:                                          ; preds = %continuation477
  %324 = alloca i32, align 4
  %325 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %326 = call i32 (ptr, ...) @scanf(ptr %325, ptr %324)
  %327 = load i32, ptr %324, align 4
  %328 = icmp eq i32 %327, 0
  br label %continuation486

continuation486:                                  ; preds = %else488, %then487
  %329 = phi i1 [ %328, %else488 ], [ true, %then487 ]
  br i1 %329, label %then496, label %else497

then496:                                          ; preds = %continuation486
  br label %continuation495

else497:                                          ; preds = %continuation486
  %330 = alloca i32, align 4
  %331 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %332 = call i32 (ptr, ...) @scanf(ptr %331, ptr %330)
  %333 = load i32, ptr %330, align 4
  %334 = icmp eq i32 %333, 0
  br label %continuation495

continuation495:                                  ; preds = %else497, %then496
  %335 = phi i1 [ %334, %else497 ], [ true, %then496 ]
  br i1 %335, label %then505, label %else506

then505:                                          ; preds = %continuation495
  br label %continuation504

else506:                                          ; preds = %continuation495
  %336 = alloca i32, align 4
  %337 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %338 = call i32 (ptr, ...) @scanf(ptr %337, ptr %336)
  %339 = load i32, ptr %336, align 4
  %340 = icmp eq i32 %339, 0
  br label %continuation504

continuation504:                                  ; preds = %else506, %then505
  %341 = phi i1 [ %340, %else506 ], [ true, %then505 ]
  br i1 %341, label %then514, label %else515

then514:                                          ; preds = %continuation504
  br label %continuation513

else515:                                          ; preds = %continuation504
  %342 = alloca i32, align 4
  %343 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %344 = call i32 (ptr, ...) @scanf(ptr %343, ptr %342)
  %345 = load i32, ptr %342, align 4
  %346 = icmp eq i32 %345, 0
  br label %continuation513

continuation513:                                  ; preds = %else515, %then514
  %347 = phi i1 [ %346, %else515 ], [ true, %then514 ]
  br i1 %347, label %then523, label %else524

then523:                                          ; preds = %continuation513
  br label %continuation522

else524:                                          ; preds = %continuation513
  %348 = alloca i32, align 4
  %349 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %350 = call i32 (ptr, ...) @scanf(ptr %349, ptr %348)
  %351 = load i32, ptr %348, align 4
  %352 = icmp eq i32 %351, 0
  br label %continuation522

continuation522:                                  ; preds = %else524, %then523
  %353 = phi i1 [ %352, %else524 ], [ true, %then523 ]
  br i1 %353, label %then532, label %else533

then532:                                          ; preds = %continuation522
  br label %continuation531

else533:                                          ; preds = %continuation522
  %354 = alloca i32, align 4
  %355 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %356 = call i32 (ptr, ...) @scanf(ptr %355, ptr %354)
  %357 = load i32, ptr %354, align 4
  %358 = icmp eq i32 %357, 0
  br label %continuation531

continuation531:                                  ; preds = %else533, %then532
  %359 = phi i1 [ %358, %else533 ], [ true, %then532 ]
  br i1 %359, label %then541, label %else542

then541:                                          ; preds = %continuation531
  br label %continuation540

else542:                                          ; preds = %continuation531
  %360 = alloca i32, align 4
  %361 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %362 = call i32 (ptr, ...) @scanf(ptr %361, ptr %360)
  %363 = load i32, ptr %360, align 4
  %364 = icmp eq i32 %363, 0
  br label %continuation540

continuation540:                                  ; preds = %else542, %then541
  %365 = phi i1 [ %364, %else542 ], [ true, %then541 ]
  br i1 %365, label %then550, label %else551

then550:                                          ; preds = %continuation540
  br label %continuation549

else551:                                          ; preds = %continuation540
  %366 = alloca i32, align 4
  %367 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %368 = call i32 (ptr, ...) @scanf(ptr %367, ptr %366)
  %369 = load i32, ptr %366, align 4
  %370 = icmp eq i32 %369, 0
  br label %continuation549

continuation549:                                  ; preds = %else551, %then550
  %371 = phi i1 [ %370, %else551 ], [ true, %then550 ]
  br i1 %371, label %then559, label %else560

then559:                                          ; preds = %continuation549
  br label %continuation558

else560:                                          ; preds = %continuation549
  %372 = alloca i32, align 4
  %373 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %374 = call i32 (ptr, ...) @scanf(ptr %373, ptr %372)
  %375 = load i32, ptr %372, align 4
  %376 = icmp eq i32 %375, 0
  br label %continuation558

continuation558:                                  ; preds = %else560, %then559
  %377 = phi i1 [ %376, %else560 ], [ true, %then559 ]
  br i1 %377, label %then568, label %else569

then568:                                          ; preds = %continuation558
  br label %continuation567

else569:                                          ; preds = %continuation558
  %378 = alloca i32, align 4
  %379 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %380 = call i32 (ptr, ...) @scanf(ptr %379, ptr %378)
  %381 = load i32, ptr %378, align 4
  %382 = icmp eq i32 %381, 0
  br label %continuation567

continuation567:                                  ; preds = %else569, %then568
  %383 = phi i1 [ %382, %else569 ], [ true, %then568 ]
  br i1 %383, label %then577, label %else578

then577:                                          ; preds = %continuation567
  br label %continuation576

else578:                                          ; preds = %continuation567
  %384 = alloca i32, align 4
  %385 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %386 = call i32 (ptr, ...) @scanf(ptr %385, ptr %384)
  %387 = load i32, ptr %384, align 4
  %388 = icmp eq i32 %387, 0
  br label %continuation576

continuation576:                                  ; preds = %else578, %then577
  %389 = phi i1 [ %388, %else578 ], [ true, %then577 ]
  br i1 %389, label %then586, label %else587

then586:                                          ; preds = %continuation576
  br label %continuation585

else587:                                          ; preds = %continuation576
  %390 = alloca i32, align 4
  %391 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %392 = call i32 (ptr, ...) @scanf(ptr %391, ptr %390)
  %393 = load i32, ptr %390, align 4
  %394 = icmp eq i32 %393, 0
  br label %continuation585

continuation585:                                  ; preds = %else587, %then586
  %395 = phi i1 [ %394, %else587 ], [ true, %then586 ]
  br i1 %395, label %then595, label %else596

then595:                                          ; preds = %continuation585
  br label %continuation594

else596:                                          ; preds = %continuation585
  %396 = alloca i32, align 4
  %397 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %398 = call i32 (ptr, ...) @scanf(ptr %397, ptr %396)
  %399 = load i32, ptr %396, align 4
  %400 = icmp eq i32 %399, 0
  br label %continuation594

continuation594:                                  ; preds = %else596, %then595
  %401 = phi i1 [ %400, %else596 ], [ true, %then595 ]
  br i1 %401, label %then604, label %else605

then604:                                          ; preds = %continuation594
  br label %continuation603

else605:                                          ; preds = %continuation594
  %402 = alloca i32, align 4
  %403 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %404 = call i32 (ptr, ...) @scanf(ptr %403, ptr %402)
  %405 = load i32, ptr %402, align 4
  %406 = icmp eq i32 %405, 0
  br label %continuation603

continuation603:                                  ; preds = %else605, %then604
  %407 = phi i1 [ %406, %else605 ], [ true, %then604 ]
  br i1 %407, label %then613, label %else614

then613:                                          ; preds = %continuation603
  br label %continuation612

else614:                                          ; preds = %continuation603
  %408 = alloca i32, align 4
  %409 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %410 = call i32 (ptr, ...) @scanf(ptr %409, ptr %408)
  %411 = load i32, ptr %408, align 4
  %412 = icmp eq i32 %411, 0
  br label %continuation612

continuation612:                                  ; preds = %else614, %then613
  %413 = phi i1 [ %412, %else614 ], [ true, %then613 ]
  br i1 %413, label %then622, label %else623

then622:                                          ; preds = %continuation612
  br label %continuation621

else623:                                          ; preds = %continuation612
  %414 = alloca i32, align 4
  %415 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %416 = call i32 (ptr, ...) @scanf(ptr %415, ptr %414)
  %417 = load i32, ptr %414, align 4
  %418 = icmp eq i32 %417, 0
  br label %continuation621

continuation621:                                  ; preds = %else623, %then622
  %419 = phi i1 [ %418, %else623 ], [ true, %then622 ]
  br i1 %419, label %then631, label %else632

then631:                                          ; preds = %continuation621
  br label %continuation630

else632:                                          ; preds = %continuation621
  %420 = alloca i32, align 4
  %421 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %422 = call i32 (ptr, ...) @scanf(ptr %421, ptr %420)
  %423 = load i32, ptr %420, align 4
  %424 = icmp eq i32 %423, 0
  br label %continuation630

continuation630:                                  ; preds = %else632, %then631
  %425 = phi i1 [ %424, %else632 ], [ true, %then631 ]
  br i1 %425, label %then640, label %else641

then640:                                          ; preds = %continuation630
  br label %continuation639

else641:                                          ; preds = %continuation630
  %426 = alloca i32, align 4
  %427 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %428 = call i32 (ptr, ...) @scanf(ptr %427, ptr %426)
  %429 = load i32, ptr %426, align 4
  %430 = icmp eq i32 %429, 0
  br label %continuation639

continuation639:                                  ; preds = %else641, %then640
  %431 = phi i1 [ %430, %else641 ], [ true, %then640 ]
  br i1 %431, label %then649, label %else650

then649:                                          ; preds = %continuation639
  br label %continuation648

else650:                                          ; preds = %continuation639
  %432 = alloca i32, align 4
  %433 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %434 = call i32 (ptr, ...) @scanf(ptr %433, ptr %432)
  %435 = load i32, ptr %432, align 4
  %436 = icmp eq i32 %435, 0
  br label %continuation648

continuation648:                                  ; preds = %else650, %then649
  %437 = phi i1 [ %436, %else650 ], [ true, %then649 ]
  br i1 %437, label %then658, label %else659

then658:                                          ; preds = %continuation648
  br label %continuation657

else659:                                          ; preds = %continuation648
  %438 = alloca i32, align 4
  %439 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %440 = call i32 (ptr, ...) @scanf(ptr %439, ptr %438)
  %441 = load i32, ptr %438, align 4
  %442 = icmp eq i32 %441, 0
  br label %continuation657

continuation657:                                  ; preds = %else659, %then658
  %443 = phi i1 [ %442, %else659 ], [ true, %then658 ]
  br i1 %443, label %then667, label %else668

then667:                                          ; preds = %continuation657
  br label %continuation666

else668:                                          ; preds = %continuation657
  %444 = alloca i32, align 4
  %445 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %446 = call i32 (ptr, ...) @scanf(ptr %445, ptr %444)
  %447 = load i32, ptr %444, align 4
  %448 = icmp eq i32 %447, 0
  br label %continuation666

continuation666:                                  ; preds = %else668, %then667
  %449 = phi i1 [ %448, %else668 ], [ true, %then667 ]
  br i1 %449, label %then676, label %else677

then676:                                          ; preds = %continuation666
  br label %continuation675

else677:                                          ; preds = %continuation666
  %450 = alloca i32, align 4
  %451 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %452 = call i32 (ptr, ...) @scanf(ptr %451, ptr %450)
  %453 = load i32, ptr %450, align 4
  %454 = icmp eq i32 %453, 0
  br label %continuation675

continuation675:                                  ; preds = %else677, %then676
  %455 = phi i1 [ %454, %else677 ], [ true, %then676 ]
  br i1 %455, label %then685, label %else686

then685:                                          ; preds = %continuation675
  br label %continuation684

else686:                                          ; preds = %continuation675
  %456 = alloca i32, align 4
  %457 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %458 = call i32 (ptr, ...) @scanf(ptr %457, ptr %456)
  %459 = load i32, ptr %456, align 4
  %460 = icmp eq i32 %459, 0
  br label %continuation684

continuation684:                                  ; preds = %else686, %then685
  %461 = phi i1 [ %460, %else686 ], [ true, %then685 ]
  br i1 %461, label %then694, label %else695

then694:                                          ; preds = %continuation684
  br label %continuation693

else695:                                          ; preds = %continuation684
  %462 = alloca i32, align 4
  %463 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %464 = call i32 (ptr, ...) @scanf(ptr %463, ptr %462)
  %465 = load i32, ptr %462, align 4
  %466 = icmp eq i32 %465, 0
  br label %continuation693

continuation693:                                  ; preds = %else695, %then694
  %467 = phi i1 [ %466, %else695 ], [ true, %then694 ]
  br i1 %467, label %then703, label %else704

then703:                                          ; preds = %continuation693
  br label %continuation702

else704:                                          ; preds = %continuation693
  %468 = alloca i32, align 4
  %469 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %470 = call i32 (ptr, ...) @scanf(ptr %469, ptr %468)
  %471 = load i32, ptr %468, align 4
  %472 = icmp eq i32 %471, 0
  br label %continuation702

continuation702:                                  ; preds = %else704, %then703
  %473 = phi i1 [ %472, %else704 ], [ true, %then703 ]
  br i1 %473, label %then712, label %else713

then712:                                          ; preds = %continuation702
  br label %continuation711

else713:                                          ; preds = %continuation702
  %474 = alloca i32, align 4
  %475 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %476 = call i32 (ptr, ...) @scanf(ptr %475, ptr %474)
  %477 = load i32, ptr %474, align 4
  %478 = icmp eq i32 %477, 0
  br label %continuation711

continuation711:                                  ; preds = %else713, %then712
  %479 = phi i1 [ %478, %else713 ], [ true, %then712 ]
  br i1 %479, label %then721, label %else722

then721:                                          ; preds = %continuation711
  br label %continuation720

else722:                                          ; preds = %continuation711
  %480 = alloca i32, align 4
  %481 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %482 = call i32 (ptr, ...) @scanf(ptr %481, ptr %480)
  %483 = load i32, ptr %480, align 4
  %484 = icmp eq i32 %483, 0
  br label %continuation720

continuation720:                                  ; preds = %else722, %then721
  %485 = phi i1 [ %484, %else722 ], [ true, %then721 ]
  br i1 %485, label %then730, label %else731

then730:                                          ; preds = %continuation720
  br label %continuation729

else731:                                          ; preds = %continuation720
  %486 = alloca i32, align 4
  %487 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %488 = call i32 (ptr, ...) @scanf(ptr %487, ptr %486)
  %489 = load i32, ptr %486, align 4
  %490 = icmp eq i32 %489, 0
  br label %continuation729

continuation729:                                  ; preds = %else731, %then730
  %491 = phi i1 [ %490, %else731 ], [ true, %then730 ]
  br i1 %491, label %then739, label %else740

then739:                                          ; preds = %continuation729
  br label %continuation738

else740:                                          ; preds = %continuation729
  %492 = alloca i32, align 4
  %493 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %494 = call i32 (ptr, ...) @scanf(ptr %493, ptr %492)
  %495 = load i32, ptr %492, align 4
  %496 = icmp eq i32 %495, 0
  br label %continuation738

continuation738:                                  ; preds = %else740, %then739
  %497 = phi i1 [ %496, %else740 ], [ true, %then739 ]
  br i1 %497, label %then748, label %else749

then748:                                          ; preds = %continuation738
  br label %continuation747

else749:                                          ; preds = %continuation738
  %498 = alloca i32, align 4
  %499 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %500 = call i32 (ptr, ...) @scanf(ptr %499, ptr %498)
  %501 = load i32, ptr %498, align 4
  %502 = icmp eq i32 %501, 0
  br label %continuation747

continuation747:                                  ; preds = %else749, %then748
  %503 = phi i1 [ %502, %else749 ], [ true, %then748 ]
  br i1 %503, label %then757, label %else758

then757:                                          ; preds = %continuation747
  br label %continuation756

else758:                                          ; preds = %continuation747
  %504 = alloca i32, align 4
  %505 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %506 = call i32 (ptr, ...) @scanf(ptr %505, ptr %504)
  %507 = load i32, ptr %504, align 4
  %508 = icmp eq i32 %507, 0
  br label %continuation756

continuation756:                                  ; preds = %else758, %then757
  %509 = phi i1 [ %508, %else758 ], [ true, %then757 ]
  br i1 %509, label %then766, label %else767

then766:                                          ; preds = %continuation756
  br label %continuation765

else767:                                          ; preds = %continuation756
  %510 = alloca i32, align 4
  %511 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %512 = call i32 (ptr, ...) @scanf(ptr %511, ptr %510)
  %513 = load i32, ptr %510, align 4
  %514 = icmp eq i32 %513, 0
  br label %continuation765

continuation765:                                  ; preds = %else767, %then766
  %515 = phi i1 [ %514, %else767 ], [ true, %then766 ]
  br i1 %515, label %then775, label %else776

then775:                                          ; preds = %continuation765
  br label %continuation774

else776:                                          ; preds = %continuation765
  %516 = alloca i32, align 4
  %517 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %518 = call i32 (ptr, ...) @scanf(ptr %517, ptr %516)
  %519 = load i32, ptr %516, align 4
  %520 = icmp eq i32 %519, 0
  br label %continuation774

continuation774:                                  ; preds = %else776, %then775
  %521 = phi i1 [ %520, %else776 ], [ true, %then775 ]
  br i1 %521, label %then784, label %else785

then784:                                          ; preds = %continuation774
  br label %continuation783

else785:                                          ; preds = %continuation774
  %522 = alloca i32, align 4
  %523 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %524 = call i32 (ptr, ...) @scanf(ptr %523, ptr %522)
  %525 = load i32, ptr %522, align 4
  %526 = icmp eq i32 %525, 0
  br label %continuation783

continuation783:                                  ; preds = %else785, %then784
  %527 = phi i1 [ %526, %else785 ], [ true, %then784 ]
  br i1 %527, label %then793, label %else794

then793:                                          ; preds = %continuation783
  br label %continuation792

else794:                                          ; preds = %continuation783
  %528 = alloca i32, align 4
  %529 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %530 = call i32 (ptr, ...) @scanf(ptr %529, ptr %528)
  %531 = load i32, ptr %528, align 4
  %532 = icmp eq i32 %531, 0
  br label %continuation792

continuation792:                                  ; preds = %else794, %then793
  %533 = phi i1 [ %532, %else794 ], [ true, %then793 ]
  br i1 %533, label %then802, label %else803

then802:                                          ; preds = %continuation792
  br label %continuation801

else803:                                          ; preds = %continuation792
  %534 = alloca i32, align 4
  %535 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %536 = call i32 (ptr, ...) @scanf(ptr %535, ptr %534)
  %537 = load i32, ptr %534, align 4
  %538 = icmp eq i32 %537, 0
  br label %continuation801

continuation801:                                  ; preds = %else803, %then802
  %539 = phi i1 [ %538, %else803 ], [ true, %then802 ]
  br i1 %539, label %then811, label %else812

then811:                                          ; preds = %continuation801
  br label %continuation810

else812:                                          ; preds = %continuation801
  %540 = alloca i32, align 4
  %541 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %542 = call i32 (ptr, ...) @scanf(ptr %541, ptr %540)
  %543 = load i32, ptr %540, align 4
  %544 = icmp eq i32 %543, 0
  br label %continuation810

continuation810:                                  ; preds = %else812, %then811
  %545 = phi i1 [ %544, %else812 ], [ true, %then811 ]
  br i1 %545, label %then820, label %else821

then820:                                          ; preds = %continuation810
  br label %continuation819

else821:                                          ; preds = %continuation810
  %546 = alloca i32, align 4
  %547 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %548 = call i32 (ptr, ...) @scanf(ptr %547, ptr %546)
  %549 = load i32, ptr %546, align 4
  %550 = icmp eq i32 %549, 0
  br label %continuation819

continuation819:                                  ; preds = %else821, %then820
  %551 = phi i1 [ %550, %else821 ], [ true, %then820 ]
  br i1 %551, label %then829, label %else830

then829:                                          ; preds = %continuation819
  br label %continuation828

else830:                                          ; preds = %continuation819
  %552 = alloca i32, align 4
  %553 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %554 = call i32 (ptr, ...) @scanf(ptr %553, ptr %552)
  %555 = load i32, ptr %552, align 4
  %556 = icmp eq i32 %555, 0
  br label %continuation828

continuation828:                                  ; preds = %else830, %then829
  %557 = phi i1 [ %556, %else830 ], [ true, %then829 ]
  br i1 %557, label %then838, label %else839

then838:                                          ; preds = %continuation828
  br label %continuation837

else839:                                          ; preds = %continuation828
  %558 = alloca i32, align 4
  %559 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %560 = call i32 (ptr, ...) @scanf(ptr %559, ptr %558)
  %561 = load i32, ptr %558, align 4
  %562 = icmp eq i32 %561, 0
  br label %continuation837

continuation837:                                  ; preds = %else839, %then838
  %563 = phi i1 [ %562, %else839 ], [ true, %then838 ]
  br i1 %563, label %then847, label %else848

then847:                                          ; preds = %continuation837
  br label %continuation846

else848:                                          ; preds = %continuation837
  %564 = alloca i32, align 4
  %565 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %566 = call i32 (ptr, ...) @scanf(ptr %565, ptr %564)
  %567 = load i32, ptr %564, align 4
  %568 = icmp eq i32 %567, 0
  br label %continuation846

continuation846:                                  ; preds = %else848, %then847
  %569 = phi i1 [ %568, %else848 ], [ true, %then847 ]
  br i1 %569, label %then856, label %else857

then856:                                          ; preds = %continuation846
  br label %continuation855

else857:                                          ; preds = %continuation846
  %570 = alloca i32, align 4
  %571 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %572 = call i32 (ptr, ...) @scanf(ptr %571, ptr %570)
  %573 = load i32, ptr %570, align 4
  %574 = icmp eq i32 %573, 0
  br label %continuation855

continuation855:                                  ; preds = %else857, %then856
  %575 = phi i1 [ %574, %else857 ], [ true, %then856 ]
  br i1 %575, label %then865, label %else866

then865:                                          ; preds = %continuation855
  br label %continuation864

else866:                                          ; preds = %continuation855
  %576 = alloca i32, align 4
  %577 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %578 = call i32 (ptr, ...) @scanf(ptr %577, ptr %576)
  %579 = load i32, ptr %576, align 4
  %580 = icmp eq i32 %579, 0
  br label %continuation864

continuation864:                                  ; preds = %else866, %then865
  %581 = phi i1 [ %580, %else866 ], [ true, %then865 ]
  br i1 %581, label %then874, label %else875

then874:                                          ; preds = %continuation864
  br label %continuation873

else875:                                          ; preds = %continuation864
  %582 = alloca i32, align 4
  %583 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %584 = call i32 (ptr, ...) @scanf(ptr %583, ptr %582)
  %585 = load i32, ptr %582, align 4
  %586 = icmp eq i32 %585, 0
  br label %continuation873

continuation873:                                  ; preds = %else875, %then874
  %587 = phi i1 [ %586, %else875 ], [ true, %then874 ]
  br i1 %587, label %then883, label %else884

then883:                                          ; preds = %continuation873
  br label %continuation882

else884:                                          ; preds = %continuation873
  %588 = alloca i32, align 4
  %589 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %590 = call i32 (ptr, ...) @scanf(ptr %589, ptr %588)
  %591 = load i32, ptr %588, align 4
  %592 = icmp eq i32 %591, 0
  br label %continuation882

continuation882:                                  ; preds = %else884, %then883
  %593 = phi i1 [ %592, %else884 ], [ true, %then883 ]
  br i1 %593, label %then892, label %else893

then892:                                          ; preds = %continuation882
  br label %continuation891

else893:                                          ; preds = %continuation882
  %594 = alloca i32, align 4
  %595 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %596 = call i32 (ptr, ...) @scanf(ptr %595, ptr %594)
  %597 = load i32, ptr %594, align 4
  %598 = icmp eq i32 %597, 0
  br label %continuation891

continuation891:                                  ; preds = %else893, %then892
  %599 = phi i1 [ %598, %else893 ], [ true, %then892 ]
  br i1 %599, label %then901, label %else902

then901:                                          ; preds = %continuation891
  br label %continuation900

else902:                                          ; preds = %continuation891
  %600 = alloca i32, align 4
  %601 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %602 = call i32 (ptr, ...) @scanf(ptr %601, ptr %600)
  %603 = load i32, ptr %600, align 4
  %604 = icmp eq i32 %603, 0
  br label %continuation900

continuation900:                                  ; preds = %else902, %then901
  %605 = phi i1 [ %604, %else902 ], [ true, %then901 ]
  br i1 %605, label %then910, label %else911

then910:                                          ; preds = %continuation900
  br label %continuation909

else911:                                          ; preds = %continuation900
  %606 = alloca i32, align 4
  %607 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %608 = call i32 (ptr, ...) @scanf(ptr %607, ptr %606)
  %609 = load i32, ptr %606, align 4
  %610 = icmp eq i32 %609, 0
  br label %continuation909

continuation909:                                  ; preds = %else911, %then910
  %611 = phi i1 [ %610, %else911 ], [ true, %then910 ]
  br i1 %611, label %then919, label %else920

then919:                                          ; preds = %continuation909
  br label %continuation918

else920:                                          ; preds = %continuation909
  %612 = alloca i32, align 4
  %613 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %614 = call i32 (ptr, ...) @scanf(ptr %613, ptr %612)
  %615 = load i32, ptr %612, align 4
  %616 = icmp eq i32 %615, 0
  br label %continuation918

continuation918:                                  ; preds = %else920, %then919
  %617 = phi i1 [ %616, %else920 ], [ true, %then919 ]
  br i1 %617, label %then928, label %else929

then928:                                          ; preds = %continuation918
  br label %continuation927

else929:                                          ; preds = %continuation918
  %618 = alloca i32, align 4
  %619 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %620 = call i32 (ptr, ...) @scanf(ptr %619, ptr %618)
  %621 = load i32, ptr %618, align 4
  %622 = icmp eq i32 %621, 0
  br label %continuation927

continuation927:                                  ; preds = %else929, %then928
  %623 = phi i1 [ %622, %else929 ], [ true, %then928 ]
  br i1 %623, label %then937, label %else938

then937:                                          ; preds = %continuation927
  br label %continuation936

else938:                                          ; preds = %continuation927
  %624 = alloca i32, align 4
  %625 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %626 = call i32 (ptr, ...) @scanf(ptr %625, ptr %624)
  %627 = load i32, ptr %624, align 4
  %628 = icmp eq i32 %627, 0
  br label %continuation936

continuation936:                                  ; preds = %else938, %then937
  %629 = phi i1 [ %628, %else938 ], [ true, %then937 ]
  br i1 %629, label %then946, label %else947

then946:                                          ; preds = %continuation936
  br label %continuation945

else947:                                          ; preds = %continuation936
  %630 = alloca i32, align 4
  %631 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %632 = call i32 (ptr, ...) @scanf(ptr %631, ptr %630)
  %633 = load i32, ptr %630, align 4
  %634 = icmp eq i32 %633, 0
  br label %continuation945

continuation945:                                  ; preds = %else947, %then946
  %635 = phi i1 [ %634, %else947 ], [ true, %then946 ]
  br i1 %635, label %then955, label %else956

then955:                                          ; preds = %continuation945
  br label %continuation954

else956:                                          ; preds = %continuation945
  %636 = alloca i32, align 4
  %637 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %638 = call i32 (ptr, ...) @scanf(ptr %637, ptr %636)
  %639 = load i32, ptr %636, align 4
  %640 = icmp eq i32 %639, 0
  br label %continuation954

continuation954:                                  ; preds = %else956, %then955
  %641 = phi i1 [ %640, %else956 ], [ true, %then955 ]
  br i1 %641, label %then964, label %else965

then964:                                          ; preds = %continuation954
  br label %continuation963

else965:                                          ; preds = %continuation954
  %642 = alloca i32, align 4
  %643 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %644 = call i32 (ptr, ...) @scanf(ptr %643, ptr %642)
  %645 = load i32, ptr %642, align 4
  %646 = icmp eq i32 %645, 0
  br label %continuation963

continuation963:                                  ; preds = %else965, %then964
  %647 = phi i1 [ %646, %else965 ], [ true, %then964 ]
  br i1 %647, label %then973, label %else974

then973:                                          ; preds = %continuation963
  br label %continuation972

else974:                                          ; preds = %continuation963
  %648 = alloca i32, align 4
  %649 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %650 = call i32 (ptr, ...) @scanf(ptr %649, ptr %648)
  %651 = load i32, ptr %648, align 4
  %652 = icmp eq i32 %651, 0
  br label %continuation972

continuation972:                                  ; preds = %else974, %then973
  %653 = phi i1 [ %652, %else974 ], [ true, %then973 ]
  br i1 %653, label %then982, label %else983

then982:                                          ; preds = %continuation972
  br label %continuation981

else983:                                          ; preds = %continuation972
  %654 = alloca i32, align 4
  %655 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %656 = call i32 (ptr, ...) @scanf(ptr %655, ptr %654)
  %657 = load i32, ptr %654, align 4
  %658 = icmp eq i32 %657, 0
  br label %continuation981

continuation981:                                  ; preds = %else983, %then982
  %659 = phi i1 [ %658, %else983 ], [ true, %then982 ]
  br i1 %659, label %then991, label %else992

then991:                                          ; preds = %continuation981
  br label %continuation990

else992:                                          ; preds = %continuation981
  %660 = alloca i32, align 4
  %661 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %662 = call i32 (ptr, ...) @scanf(ptr %661, ptr %660)
  %663 = load i32, ptr %660, align 4
  %664 = icmp eq i32 %663, 0
  br label %continuation990

continuation990:                                  ; preds = %else992, %then991
  %665 = phi i1 [ %664, %else992 ], [ true, %then991 ]
  br i1 %665, label %then1000, label %else1001

then1000:                                         ; preds = %continuation990
  br label %continuation999

else1001:                                         ; preds = %continuation990
  %666 = alloca i32, align 4
  %667 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %668 = call i32 (ptr, ...) @scanf(ptr %667, ptr %666)
  %669 = load i32, ptr %666, align 4
  %670 = icmp eq i32 %669, 0
  br label %continuation999

continuation999:                                  ; preds = %else1001, %then1000
  %671 = phi i1 [ %670, %else1001 ], [ true, %then1000 ]
  br i1 %671, label %then1009, label %else1010

then1009:                                         ; preds = %continuation999
  br label %continuation1008

else1010:                                         ; preds = %continuation999
  %672 = alloca i32, align 4
  %673 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %674 = call i32 (ptr, ...) @scanf(ptr %673, ptr %672)
  %675 = load i32, ptr %672, align 4
  %676 = icmp eq i32 %675, 0
  br label %continuation1008

continuation1008:                                 ; preds = %else1010, %then1009
  %677 = phi i1 [ %676, %else1010 ], [ true, %then1009 ]
  br i1 %677, label %then1018, label %else1019

then1018:                                         ; preds = %continuation1008
  br label %continuation1017

else1019:                                         ; preds = %continuation1008
  %678 = alloca i32, align 4
  %679 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %680 = call i32 (ptr, ...) @scanf(ptr %679, ptr %678)
  %681 = load i32, ptr %678, align 4
  %682 = icmp eq i32 %681, 0
  br label %continuation1017

continuation1017:                                 ; preds = %else1019, %then1018
  %683 = phi i1 [ %682, %else1019 ], [ true, %then1018 ]
  br i1 %683, label %then1027, label %else1028

then1027:                                         ; preds = %continuation1017
  br label %continuation1026

else1028:                                         ; preds = %continuation1017
  %684 = alloca i32, align 4
  %685 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %686 = call i32 (ptr, ...) @scanf(ptr %685, ptr %684)
  %687 = load i32, ptr %684, align 4
  %688 = icmp eq i32 %687, 0
  br label %continuation1026

continuation1026:                                 ; preds = %else1028, %then1027
  %689 = phi i1 [ %688, %else1028 ], [ true, %then1027 ]
  br i1 %689, label %then1036, label %else1037

then1036:                                         ; preds = %continuation1026
  br label %continuation1035

else1037:                                         ; preds = %continuation1026
  %690 = alloca i32, align 4
  %691 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %692 = call i32 (ptr, ...) @scanf(ptr %691, ptr %690)
  %693 = load i32, ptr %690, align 4
  %694 = icmp eq i32 %693, 0
  br label %continuation1035

continuation1035:                                 ; preds = %else1037, %then1036
  %695 = phi i1 [ %694, %else1037 ], [ true, %then1036 ]
  br i1 %695, label %then1045, label %else1046

then1045:                                         ; preds = %continuation1035
  br label %continuation1044

else1046:                                         ; preds = %continuation1035
  %696 = alloca i32, align 4
  %697 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %698 = call i32 (ptr, ...) @scanf(ptr %697, ptr %696)
  %699 = load i32, ptr %696, align 4
  %700 = icmp eq i32 %699, 0
  br label %continuation1044

continuation1044:                                 ; preds = %else1046, %then1045
  %701 = phi i1 [ %700, %else1046 ], [ true, %then1045 ]
  br i1 %701, label %then1054, label %else1055

then1054:                                         ; preds = %continuation1044
  br label %continuation1053

else1055:                                         ; preds = %continuation1044
  %702 = alloca i32, align 4
  %703 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %704 = call i32 (ptr, ...) @scanf(ptr %703, ptr %702)
  %705 = load i32, ptr %702, align 4
  %706 = icmp eq i32 %705, 0
  br label %continuation1053

continuation1053:                                 ; preds = %else1055, %then1054
  %707 = phi i1 [ %706, %else1055 ], [ true, %then1054 ]
  br i1 %707, label %then1063, label %else1064

then1063:                                         ; preds = %continuation1053
  br label %continuation1062

else1064:                                         ; preds = %continuation1053
  %708 = alloca i32, align 4
  %709 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %710 = call i32 (ptr, ...) @scanf(ptr %709, ptr %708)
  %711 = load i32, ptr %708, align 4
  %712 = icmp eq i32 %711, 0
  br label %continuation1062

continuation1062:                                 ; preds = %else1064, %then1063
  %713 = phi i1 [ %712, %else1064 ], [ true, %then1063 ]
  br i1 %713, label %then1072, label %else1073

then1072:                                         ; preds = %continuation1062
  br label %continuation1071

else1073:                                         ; preds = %continuation1062
  %714 = alloca i32, align 4
  %715 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %716 = call i32 (ptr, ...) @scanf(ptr %715, ptr %714)
  %717 = load i32, ptr %714, align 4
  %718 = icmp eq i32 %717, 0
  br label %continuation1071

continuation1071:                                 ; preds = %else1073, %then1072
  %719 = phi i1 [ %718, %else1073 ], [ true, %then1072 ]
  br i1 %719, label %then1081, label %else1082

then1081:                                         ; preds = %continuation1071
  br label %continuation1080

else1082:                                         ; preds = %continuation1071
  %720 = alloca i32, align 4
  %721 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %722 = call i32 (ptr, ...) @scanf(ptr %721, ptr %720)
  %723 = load i32, ptr %720, align 4
  %724 = icmp eq i32 %723, 0
  br label %continuation1080

continuation1080:                                 ; preds = %else1082, %then1081
  %725 = phi i1 [ %724, %else1082 ], [ true, %then1081 ]
  br i1 %725, label %then1090, label %else1091

then1090:                                         ; preds = %continuation1080
  br label %continuation1089

else1091:                                         ; preds = %continuation1080
  %726 = alloca i32, align 4
  %727 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %728 = call i32 (ptr, ...) @scanf(ptr %727, ptr %726)
  %729 = load i32, ptr %726, align 4
  %730 = icmp eq i32 %729, 0
  br label %continuation1089

continuation1089:                                 ; preds = %else1091, %then1090
  %731 = phi i1 [ %730, %else1091 ], [ true, %then1090 ]
  br i1 %731, label %then1099, label %else1100

then1099:                                         ; preds = %continuation1089
  br label %continuation1098

else1100:                                         ; preds = %continuation1089
  %732 = alloca i32, align 4
  %733 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %734 = call i32 (ptr, ...) @scanf(ptr %733, ptr %732)
  %735 = load i32, ptr %732, align 4
  %736 = icmp eq i32 %735, 0
  br label %continuation1098

continuation1098:                                 ; preds = %else1100, %then1099
  %737 = phi i1 [ %736, %else1100 ], [ true, %then1099 ]
  br i1 %737, label %then1108, label %else1109

then1108:                                         ; preds = %continuation1098
  br label %continuation1107

else1109:                                         ; preds = %continuation1098
  %738 = alloca i32, align 4
  %739 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %740 = call i32 (ptr, ...) @scanf(ptr %739, ptr %738)
  %741 = load i32, ptr %738, align 4
  %742 = icmp eq i32 %741, 0
  br label %continuation1107

continuation1107:                                 ; preds = %else1109, %then1108
  %743 = phi i1 [ %742, %else1109 ], [ true, %then1108 ]
  br i1 %743, label %then1117, label %else1118

then1117:                                         ; preds = %continuation1107
  br label %continuation1116

else1118:                                         ; preds = %continuation1107
  %744 = alloca i32, align 4
  %745 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %746 = call i32 (ptr, ...) @scanf(ptr %745, ptr %744)
  %747 = load i32, ptr %744, align 4
  %748 = icmp eq i32 %747, 0
  br label %continuation1116

continuation1116:                                 ; preds = %else1118, %then1117
  %749 = phi i1 [ %748, %else1118 ], [ true, %then1117 ]
  br i1 %749, label %then1126, label %else1127

then1126:                                         ; preds = %continuation1116
  br label %continuation1125

else1127:                                         ; preds = %continuation1116
  %750 = alloca i32, align 4
  %751 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %752 = call i32 (ptr, ...) @scanf(ptr %751, ptr %750)
  %753 = load i32, ptr %750, align 4
  %754 = icmp eq i32 %753, 0
  br label %continuation1125

continuation1125:                                 ; preds = %else1127, %then1126
  %755 = phi i1 [ %754, %else1127 ], [ true, %then1126 ]
  br i1 %755, label %then1135, label %else1136

then1135:                                         ; preds = %continuation1125
  br label %continuation1134

else1136:                                         ; preds = %continuation1125
  %756 = alloca i32, align 4
  %757 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %758 = call i32 (ptr, ...) @scanf(ptr %757, ptr %756)
  %759 = load i32, ptr %756, align 4
  %760 = icmp eq i32 %759, 0
  br label %continuation1134

continuation1134:                                 ; preds = %else1136, %then1135
  %761 = phi i1 [ %760, %else1136 ], [ true, %then1135 ]
  br i1 %761, label %then1144, label %else1145

then1144:                                         ; preds = %continuation1134
  br label %continuation1143

else1145:                                         ; preds = %continuation1134
  %762 = alloca i32, align 4
  %763 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %764 = call i32 (ptr, ...) @scanf(ptr %763, ptr %762)
  %765 = load i32, ptr %762, align 4
  %766 = icmp eq i32 %765, 0
  br label %continuation1143

continuation1143:                                 ; preds = %else1145, %then1144
  %767 = phi i1 [ %766, %else1145 ], [ true, %then1144 ]
  br i1 %767, label %then1153, label %else1154

then1153:                                         ; preds = %continuation1143
  br label %continuation1152

else1154:                                         ; preds = %continuation1143
  %768 = alloca i32, align 4
  %769 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %770 = call i32 (ptr, ...) @scanf(ptr %769, ptr %768)
  %771 = load i32, ptr %768, align 4
  %772 = icmp eq i32 %771, 0
  br label %continuation1152

continuation1152:                                 ; preds = %else1154, %then1153
  %773 = phi i1 [ %772, %else1154 ], [ true, %then1153 ]
  br i1 %773, label %then1162, label %else1163

then1162:                                         ; preds = %continuation1152
  br label %continuation1161

else1163:                                         ; preds = %continuation1152
  %774 = alloca i32, align 4
  %775 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %776 = call i32 (ptr, ...) @scanf(ptr %775, ptr %774)
  %777 = load i32, ptr %774, align 4
  %778 = icmp eq i32 %777, 0
  br label %continuation1161

continuation1161:                                 ; preds = %else1163, %then1162
  %779 = phi i1 [ %778, %else1163 ], [ true, %then1162 ]
  br i1 %779, label %then1171, label %else1172

then1171:                                         ; preds = %continuation1161
  br label %continuation1170

else1172:                                         ; preds = %continuation1161
  %780 = alloca i32, align 4
  %781 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %782 = call i32 (ptr, ...) @scanf(ptr %781, ptr %780)
  %783 = load i32, ptr %780, align 4
  %784 = icmp eq i32 %783, 0
  br label %continuation1170

continuation1170:                                 ; preds = %else1172, %then1171
  %785 = phi i1 [ %784, %else1172 ], [ true, %then1171 ]
  br i1 %785, label %then1180, label %else1181

then1180:                                         ; preds = %continuation1170
  br label %continuation1179

else1181:                                         ; preds = %continuation1170
  %786 = alloca i32, align 4
  %787 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %788 = call i32 (ptr, ...) @scanf(ptr %787, ptr %786)
  %789 = load i32, ptr %786, align 4
  %790 = icmp eq i32 %789, 0
  br label %continuation1179

continuation1179:                                 ; preds = %else1181, %then1180
  %791 = phi i1 [ %790, %else1181 ], [ true, %then1180 ]
  br i1 %791, label %then1189, label %else1190

then1189:                                         ; preds = %continuation1179
  br label %continuation1188

else1190:                                         ; preds = %continuation1179
  %792 = alloca i32, align 4
  %793 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %794 = call i32 (ptr, ...) @scanf(ptr %793, ptr %792)
  %795 = load i32, ptr %792, align 4
  %796 = icmp eq i32 %795, 0
  br label %continuation1188

continuation1188:                                 ; preds = %else1190, %then1189
  %797 = phi i1 [ %796, %else1190 ], [ true, %then1189 ]
  br i1 %797, label %then1198, label %else1199

then1198:                                         ; preds = %continuation1188
  br label %continuation1197

else1199:                                         ; preds = %continuation1188
  %798 = alloca i32, align 4
  %799 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %800 = call i32 (ptr, ...) @scanf(ptr %799, ptr %798)
  %801 = load i32, ptr %798, align 4
  %802 = icmp eq i32 %801, 0
  br label %continuation1197

continuation1197:                                 ; preds = %else1199, %then1198
  %803 = phi i1 [ %802, %else1199 ], [ true, %then1198 ]
  br i1 %803, label %then1207, label %else1208

then1207:                                         ; preds = %continuation1197
  br label %continuation1206

else1208:                                         ; preds = %continuation1197
  %804 = alloca i32, align 4
  %805 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %806 = call i32 (ptr, ...) @scanf(ptr %805, ptr %804)
  %807 = load i32, ptr %804, align 4
  %808 = icmp eq i32 %807, 0
  br label %continuation1206

continuation1206:                                 ; preds = %else1208, %then1207
  %809 = phi i1 [ %808, %else1208 ], [ true, %then1207 ]
  br i1 %809, label %then1216, label %else1217

then1216:                                         ; preds = %continuation1206
  br label %continuation1215

else1217:                                         ; preds = %continuation1206
  %810 = alloca i32, align 4
  %811 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %812 = call i32 (ptr, ...) @scanf(ptr %811, ptr %810)
  %813 = load i32, ptr %810, align 4
  %814 = icmp eq i32 %813, 0
  br label %continuation1215

continuation1215:                                 ; preds = %else1217, %then1216
  %815 = phi i1 [ %814, %else1217 ], [ true, %then1216 ]
  br i1 %815, label %then1225, label %else1226

then1225:                                         ; preds = %continuation1215
  br label %continuation1224

else1226:                                         ; preds = %continuation1215
  %816 = alloca i32, align 4
  %817 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %818 = call i32 (ptr, ...) @scanf(ptr %817, ptr %816)
  %819 = load i32, ptr %816, align 4
  %820 = icmp eq i32 %819, 0
  br label %continuation1224

continuation1224:                                 ; preds = %else1226, %then1225
  %821 = phi i1 [ %820, %else1226 ], [ true, %then1225 ]
  br i1 %821, label %then1234, label %else1235

then1234:                                         ; preds = %continuation1224
  br label %continuation1233

else1235:                                         ; preds = %continuation1224
  %822 = alloca i32, align 4
  %823 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %824 = call i32 (ptr, ...) @scanf(ptr %823, ptr %822)
  %825 = load i32, ptr %822, align 4
  %826 = icmp eq i32 %825, 0
  br label %continuation1233

continuation1233:                                 ; preds = %else1235, %then1234
  %827 = phi i1 [ %826, %else1235 ], [ true, %then1234 ]
  br i1 %827, label %then1243, label %else1244

then1243:                                         ; preds = %continuation1233
  br label %continuation1242

else1244:                                         ; preds = %continuation1233
  %828 = alloca i32, align 4
  %829 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %830 = call i32 (ptr, ...) @scanf(ptr %829, ptr %828)
  %831 = load i32, ptr %828, align 4
  %832 = icmp eq i32 %831, 0
  br label %continuation1242

continuation1242:                                 ; preds = %else1244, %then1243
  %833 = phi i1 [ %832, %else1244 ], [ true, %then1243 ]
  br i1 %833, label %then1252, label %else1253

then1252:                                         ; preds = %continuation1242
  br label %continuation1251

else1253:                                         ; preds = %continuation1242
  %834 = alloca i32, align 4
  %835 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %836 = call i32 (ptr, ...) @scanf(ptr %835, ptr %834)
  %837 = load i32, ptr %834, align 4
  %838 = icmp eq i32 %837, 0
  br label %continuation1251

continuation1251:                                 ; preds = %else1253, %then1252
  %839 = phi i1 [ %838, %else1253 ], [ true, %then1252 ]
  br i1 %839, label %then1261, label %else1262

then1261:                                         ; preds = %continuation1251
  br label %continuation1260

else1262:                                         ; preds = %continuation1251
  %840 = alloca i32, align 4
  %841 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %842 = call i32 (ptr, ...) @scanf(ptr %841, ptr %840)
  %843 = load i32, ptr %840, align 4
  %844 = icmp eq i32 %843, 0
  br label %continuation1260

continuation1260:                                 ; preds = %else1262, %then1261
  %845 = phi i1 [ %844, %else1262 ], [ true, %then1261 ]
  br i1 %845, label %then1270, label %else1271

then1270:                                         ; preds = %continuation1260
  br label %continuation1269

else1271:                                         ; preds = %continuation1260
  %846 = alloca i32, align 4
  %847 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %848 = call i32 (ptr, ...) @scanf(ptr %847, ptr %846)
  %849 = load i32, ptr %846, align 4
  %850 = icmp eq i32 %849, 0
  br label %continuation1269

continuation1269:                                 ; preds = %else1271, %then1270
  %851 = phi i1 [ %850, %else1271 ], [ true, %then1270 ]
  br i1 %851, label %then1279, label %else1280

then1279:                                         ; preds = %continuation1269
  br label %continuation1278

else1280:                                         ; preds = %continuation1269
  %852 = alloca i32, align 4
  %853 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %854 = call i32 (ptr, ...) @scanf(ptr %853, ptr %852)
  %855 = load i32, ptr %852, align 4
  %856 = icmp eq i32 %855, 0
  br label %continuation1278

continuation1278:                                 ; preds = %else1280, %then1279
  %857 = phi i1 [ %856, %else1280 ], [ true, %then1279 ]
  br i1 %857, label %then1288, label %else1289

then1288:                                         ; preds = %continuation1278
  br label %continuation1287

else1289:                                         ; preds = %continuation1278
  %858 = alloca i32, align 4
  %859 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %860 = call i32 (ptr, ...) @scanf(ptr %859, ptr %858)
  %861 = load i32, ptr %858, align 4
  %862 = icmp eq i32 %861, 0
  br label %continuation1287

continuation1287:                                 ; preds = %else1289, %then1288
  %863 = phi i1 [ %862, %else1289 ], [ true, %then1288 ]
  br i1 %863, label %then1297, label %else1298

then1297:                                         ; preds = %continuation1287
  br label %continuation1296

else1298:                                         ; preds = %continuation1287
  %864 = alloca i32, align 4
  %865 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %866 = call i32 (ptr, ...) @scanf(ptr %865, ptr %864)
  %867 = load i32, ptr %864, align 4
  %868 = icmp eq i32 %867, 0
  br label %continuation1296

continuation1296:                                 ; preds = %else1298, %then1297
  %869 = phi i1 [ %868, %else1298 ], [ true, %then1297 ]
  br i1 %869, label %then1306, label %else1307

then1306:                                         ; preds = %continuation1296
  br label %continuation1305

else1307:                                         ; preds = %continuation1296
  %870 = alloca i32, align 4
  %871 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %872 = call i32 (ptr, ...) @scanf(ptr %871, ptr %870)
  %873 = load i32, ptr %870, align 4
  %874 = icmp eq i32 %873, 0
  br label %continuation1305

continuation1305:                                 ; preds = %else1307, %then1306
  %875 = phi i1 [ %874, %else1307 ], [ true, %then1306 ]
  br i1 %875, label %then1315, label %else1316

then1315:                                         ; preds = %continuation1305
  br label %continuation1314

else1316:                                         ; preds = %continuation1305
  %876 = alloca i32, align 4
  %877 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %878 = call i32 (ptr, ...) @scanf(ptr %877, ptr %876)
  %879 = load i32, ptr %876, align 4
  %880 = icmp eq i32 %879, 0
  br label %continuation1314

continuation1314:                                 ; preds = %else1316, %then1315
  %881 = phi i1 [ %880, %else1316 ], [ true, %then1315 ]
  br i1 %881, label %then1324, label %else1325

then1324:                                         ; preds = %continuation1314
  br label %continuation1323

else1325:                                         ; preds = %continuation1314
  %882 = alloca i32, align 4
  %883 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %884 = call i32 (ptr, ...) @scanf(ptr %883, ptr %882)
  %885 = load i32, ptr %882, align 4
  %886 = icmp eq i32 %885, 0
  br label %continuation1323

continuation1323:                                 ; preds = %else1325, %then1324
  %887 = phi i1 [ %886, %else1325 ], [ true, %then1324 ]
  br i1 %887, label %then1333, label %else1334

then1333:                                         ; preds = %continuation1323
  br label %continuation1332

else1334:                                         ; preds = %continuation1323
  %888 = alloca i32, align 4
  %889 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %890 = call i32 (ptr, ...) @scanf(ptr %889, ptr %888)
  %891 = load i32, ptr %888, align 4
  %892 = icmp eq i32 %891, 0
  br label %continuation1332

continuation1332:                                 ; preds = %else1334, %then1333
  %893 = phi i1 [ %892, %else1334 ], [ true, %then1333 ]
  br i1 %893, label %then1342, label %else1343

then1342:                                         ; preds = %continuation1332
  br label %continuation1341

else1343:                                         ; preds = %continuation1332
  %894 = alloca i32, align 4
  %895 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %896 = call i32 (ptr, ...) @scanf(ptr %895, ptr %894)
  %897 = load i32, ptr %894, align 4
  %898 = icmp eq i32 %897, 0
  br label %continuation1341

continuation1341:                                 ; preds = %else1343, %then1342
  %899 = phi i1 [ %898, %else1343 ], [ true, %then1342 ]
  br i1 %899, label %then1351, label %else1352

then1351:                                         ; preds = %continuation1341
  br label %continuation1350

else1352:                                         ; preds = %continuation1341
  %900 = alloca i32, align 4
  %901 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %902 = call i32 (ptr, ...) @scanf(ptr %901, ptr %900)
  %903 = load i32, ptr %900, align 4
  %904 = icmp eq i32 %903, 0
  br label %continuation1350

continuation1350:                                 ; preds = %else1352, %then1351
  %905 = phi i1 [ %904, %else1352 ], [ true, %then1351 ]
  br i1 %905, label %then1360, label %else1361

then1360:                                         ; preds = %continuation1350
  br label %continuation1359

else1361:                                         ; preds = %continuation1350
  %906 = alloca i32, align 4
  %907 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %908 = call i32 (ptr, ...) @scanf(ptr %907, ptr %906)
  %909 = load i32, ptr %906, align 4
  %910 = icmp eq i32 %909, 0
  br label %continuation1359

continuation1359:                                 ; preds = %else1361, %then1360
  %911 = phi i1 [ %910, %else1361 ], [ true, %then1360 ]
  br i1 %911, label %then1369, label %else1370

then1369:                                         ; preds = %continuation1359
  br label %continuation1368

else1370:                                         ; preds = %continuation1359
  %912 = alloca i32, align 4
  %913 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %914 = call i32 (ptr, ...) @scanf(ptr %913, ptr %912)
  %915 = load i32, ptr %912, align 4
  %916 = icmp eq i32 %915, 0
  br label %continuation1368

continuation1368:                                 ; preds = %else1370, %then1369
  %917 = phi i1 [ %916, %else1370 ], [ true, %then1369 ]
  br i1 %917, label %then1378, label %else1379

then1378:                                         ; preds = %continuation1368
  br label %continuation1377

else1379:                                         ; preds = %continuation1368
  %918 = alloca i32, align 4
  %919 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %920 = call i32 (ptr, ...) @scanf(ptr %919, ptr %918)
  %921 = load i32, ptr %918, align 4
  %922 = icmp eq i32 %921, 0
  br label %continuation1377

continuation1377:                                 ; preds = %else1379, %then1378
  %923 = phi i1 [ %922, %else1379 ], [ true, %then1378 ]
  br i1 %923, label %then1387, label %else1388

then1387:                                         ; preds = %continuation1377
  br label %continuation1386

else1388:                                         ; preds = %continuation1377
  %924 = alloca i32, align 4
  %925 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %926 = call i32 (ptr, ...) @scanf(ptr %925, ptr %924)
  %927 = load i32, ptr %924, align 4
  %928 = icmp eq i32 %927, 0
  br label %continuation1386

continuation1386:                                 ; preds = %else1388, %then1387
  %929 = phi i1 [ %928, %else1388 ], [ true, %then1387 ]
  br i1 %929, label %then1396, label %else1397

then1396:                                         ; preds = %continuation1386
  br label %continuation1395

else1397:                                         ; preds = %continuation1386
  %930 = alloca i32, align 4
  %931 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %932 = call i32 (ptr, ...) @scanf(ptr %931, ptr %930)
  %933 = load i32, ptr %930, align 4
  %934 = icmp eq i32 %933, 0
  br label %continuation1395

continuation1395:                                 ; preds = %else1397, %then1396
  %935 = phi i1 [ %934, %else1397 ], [ true, %then1396 ]
  br i1 %935, label %then1405, label %else1406

then1405:                                         ; preds = %continuation1395
  br label %continuation1404

else1406:                                         ; preds = %continuation1395
  %936 = alloca i32, align 4
  %937 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %938 = call i32 (ptr, ...) @scanf(ptr %937, ptr %936)
  %939 = load i32, ptr %936, align 4
  %940 = icmp eq i32 %939, 0
  br label %continuation1404

continuation1404:                                 ; preds = %else1406, %then1405
  %941 = phi i1 [ %940, %else1406 ], [ true, %then1405 ]
  br i1 %941, label %then1414, label %else1415

then1414:                                         ; preds = %continuation1404
  br label %continuation1413

else1415:                                         ; preds = %continuation1404
  %942 = alloca i32, align 4
  %943 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %944 = call i32 (ptr, ...) @scanf(ptr %943, ptr %942)
  %945 = load i32, ptr %942, align 4
  %946 = icmp eq i32 %945, 0
  br label %continuation1413

continuation1413:                                 ; preds = %else1415, %then1414
  %947 = phi i1 [ %946, %else1415 ], [ true, %then1414 ]
  br i1 %947, label %then1423, label %else1424

then1423:                                         ; preds = %continuation1413
  br label %continuation1422

else1424:                                         ; preds = %continuation1413
  %948 = alloca i32, align 4
  %949 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %950 = call i32 (ptr, ...) @scanf(ptr %949, ptr %948)
  %951 = load i32, ptr %948, align 4
  %952 = icmp eq i32 %951, 0
  br label %continuation1422

continuation1422:                                 ; preds = %else1424, %then1423
  %953 = phi i1 [ %952, %else1424 ], [ true, %then1423 ]
  br i1 %953, label %then1432, label %else1433

then1432:                                         ; preds = %continuation1422
  br label %continuation1431

else1433:                                         ; preds = %continuation1422
  %954 = alloca i32, align 4
  %955 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %956 = call i32 (ptr, ...) @scanf(ptr %955, ptr %954)
  %957 = load i32, ptr %954, align 4
  %958 = icmp eq i32 %957, 0
  br label %continuation1431

continuation1431:                                 ; preds = %else1433, %then1432
  %959 = phi i1 [ %958, %else1433 ], [ true, %then1432 ]
  br i1 %959, label %then1441, label %else1442

then1441:                                         ; preds = %continuation1431
  br label %continuation1440

else1442:                                         ; preds = %continuation1431
  %960 = alloca i32, align 4
  %961 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %962 = call i32 (ptr, ...) @scanf(ptr %961, ptr %960)
  %963 = load i32, ptr %960, align 4
  %964 = icmp eq i32 %963, 0
  br label %continuation1440

continuation1440:                                 ; preds = %else1442, %then1441
  %965 = phi i1 [ %964, %else1442 ], [ true, %then1441 ]
  br i1 %965, label %then1450, label %else1451

then1450:                                         ; preds = %continuation1440
  br label %continuation1449

else1451:                                         ; preds = %continuation1440
  %966 = alloca i32, align 4
  %967 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %968 = call i32 (ptr, ...) @scanf(ptr %967, ptr %966)
  %969 = load i32, ptr %966, align 4
  %970 = icmp eq i32 %969, 0
  br label %continuation1449

continuation1449:                                 ; preds = %else1451, %then1450
  %971 = phi i1 [ %970, %else1451 ], [ true, %then1450 ]
  br i1 %971, label %then1459, label %else1460

then1459:                                         ; preds = %continuation1449
  br label %continuation1458

else1460:                                         ; preds = %continuation1449
  %972 = alloca i32, align 4
  %973 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %974 = call i32 (ptr, ...) @scanf(ptr %973, ptr %972)
  %975 = load i32, ptr %972, align 4
  %976 = icmp eq i32 %975, 0
  br label %continuation1458

continuation1458:                                 ; preds = %else1460, %then1459
  %977 = phi i1 [ %976, %else1460 ], [ true, %then1459 ]
  br i1 %977, label %then1468, label %else1469

then1468:                                         ; preds = %continuation1458
  br label %continuation1467

else1469:                                         ; preds = %continuation1458
  %978 = alloca i32, align 4
  %979 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %980 = call i32 (ptr, ...) @scanf(ptr %979, ptr %978)
  %981 = load i32, ptr %978, align 4
  %982 = icmp eq i32 %981, 0
  br label %continuation1467

continuation1467:                                 ; preds = %else1469, %then1468
  %983 = phi i1 [ %982, %else1469 ], [ true, %then1468 ]
  br i1 %983, label %then1477, label %else1478

then1477:                                         ; preds = %continuation1467
  br label %continuation1476

else1478:                                         ; preds = %continuation1467
  %984 = alloca i32, align 4
  %985 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %986 = call i32 (ptr, ...) @scanf(ptr %985, ptr %984)
  %987 = load i32, ptr %984, align 4
  %988 = icmp eq i32 %987, 0
  br label %continuation1476

continuation1476:                                 ; preds = %else1478, %then1477
  %989 = phi i1 [ %988, %else1478 ], [ true, %then1477 ]
  br i1 %989, label %then1486, label %else1487

then1486:                                         ; preds = %continuation1476
  br label %continuation1485

else1487:                                         ; preds = %continuation1476
  %990 = alloca i32, align 4
  %991 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %992 = call i32 (ptr, ...) @scanf(ptr %991, ptr %990)
  %993 = load i32, ptr %990, align 4
  %994 = icmp eq i32 %993, 0
  br label %continuation1485

continuation1485:                                 ; preds = %else1487, %then1486
  %995 = phi i1 [ %994, %else1487 ], [ true, %then1486 ]
  br i1 %995, label %then1495, label %else1496

then1495:                                         ; preds = %continuation1485
  br label %continuation1494

else1496:                                         ; preds = %continuation1485
  %996 = alloca i32, align 4
  %997 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %998 = call i32 (ptr, ...) @scanf(ptr %997, ptr %996)
  %999 = load i32, ptr %996, align 4
  %1000 = icmp eq i32 %999, 0
  br label %continuation1494

continuation1494:                                 ; preds = %else1496, %then1495
  %1001 = phi i1 [ %1000, %else1496 ], [ true, %then1495 ]
  br i1 %1001, label %then1504, label %else1505

then1504:                                         ; preds = %continuation1494
  br label %continuation1503

else1505:                                         ; preds = %continuation1494
  %1002 = alloca i32, align 4
  %1003 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1004 = call i32 (ptr, ...) @scanf(ptr %1003, ptr %1002)
  %1005 = load i32, ptr %1002, align 4
  %1006 = icmp eq i32 %1005, 0
  br label %continuation1503

continuation1503:                                 ; preds = %else1505, %then1504
  %1007 = phi i1 [ %1006, %else1505 ], [ true, %then1504 ]
  br i1 %1007, label %then1513, label %else1514

then1513:                                         ; preds = %continuation1503
  br label %continuation1512

else1514:                                         ; preds = %continuation1503
  %1008 = alloca i32, align 4
  %1009 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1010 = call i32 (ptr, ...) @scanf(ptr %1009, ptr %1008)
  %1011 = load i32, ptr %1008, align 4
  %1012 = icmp eq i32 %1011, 0
  br label %continuation1512

continuation1512:                                 ; preds = %else1514, %then1513
  %1013 = phi i1 [ %1012, %else1514 ], [ true, %then1513 ]
  br i1 %1013, label %then1522, label %else1523

then1522:                                         ; preds = %continuation1512
  br label %continuation1521

else1523:                                         ; preds = %continuation1512
  %1014 = alloca i32, align 4
  %1015 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1016 = call i32 (ptr, ...) @scanf(ptr %1015, ptr %1014)
  %1017 = load i32, ptr %1014, align 4
  %1018 = icmp eq i32 %1017, 0
  br label %continuation1521

continuation1521:                                 ; preds = %else1523, %then1522
  %1019 = phi i1 [ %1018, %else1523 ], [ true, %then1522 ]
  br i1 %1019, label %then1531, label %else1532

then1531:                                         ; preds = %continuation1521
  br label %continuation1530

else1532:                                         ; preds = %continuation1521
  %1020 = alloca i32, align 4
  %1021 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1022 = call i32 (ptr, ...) @scanf(ptr %1021, ptr %1020)
  %1023 = load i32, ptr %1020, align 4
  %1024 = icmp eq i32 %1023, 0
  br label %continuation1530

continuation1530:                                 ; preds = %else1532, %then1531
  %1025 = phi i1 [ %1024, %else1532 ], [ true, %then1531 ]
  br i1 %1025, label %then1540, label %else1541

then1540:                                         ; preds = %continuation1530
  br label %continuation1539

else1541:                                         ; preds = %continuation1530
  %1026 = alloca i32, align 4
  %1027 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1028 = call i32 (ptr, ...) @scanf(ptr %1027, ptr %1026)
  %1029 = load i32, ptr %1026, align 4
  %1030 = icmp eq i32 %1029, 0
  br label %continuation1539

continuation1539:                                 ; preds = %else1541, %then1540
  %1031 = phi i1 [ %1030, %else1541 ], [ true, %then1540 ]
  br i1 %1031, label %then1549, label %else1550

then1549:                                         ; preds = %continuation1539
  br label %continuation1548

else1550:                                         ; preds = %continuation1539
  %1032 = alloca i32, align 4
  %1033 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1034 = call i32 (ptr, ...) @scanf(ptr %1033, ptr %1032)
  %1035 = load i32, ptr %1032, align 4
  %1036 = icmp eq i32 %1035, 0
  br label %continuation1548

continuation1548:                                 ; preds = %else1550, %then1549
  %1037 = phi i1 [ %1036, %else1550 ], [ true, %then1549 ]
  br i1 %1037, label %then1558, label %else1559

then1558:                                         ; preds = %continuation1548
  br label %continuation1557

else1559:                                         ; preds = %continuation1548
  %1038 = alloca i32, align 4
  %1039 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1040 = call i32 (ptr, ...) @scanf(ptr %1039, ptr %1038)
  %1041 = load i32, ptr %1038, align 4
  %1042 = icmp eq i32 %1041, 0
  br label %continuation1557

continuation1557:                                 ; preds = %else1559, %then1558
  %1043 = phi i1 [ %1042, %else1559 ], [ true, %then1558 ]
  br i1 %1043, label %then1567, label %else1568

then1567:                                         ; preds = %continuation1557
  br label %continuation1566

else1568:                                         ; preds = %continuation1557
  %1044 = alloca i32, align 4
  %1045 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1046 = call i32 (ptr, ...) @scanf(ptr %1045, ptr %1044)
  %1047 = load i32, ptr %1044, align 4
  %1048 = icmp eq i32 %1047, 0
  br label %continuation1566

continuation1566:                                 ; preds = %else1568, %then1567
  %1049 = phi i1 [ %1048, %else1568 ], [ true, %then1567 ]
  br i1 %1049, label %then1576, label %else1577

then1576:                                         ; preds = %continuation1566
  br label %continuation1575

else1577:                                         ; preds = %continuation1566
  %1050 = alloca i32, align 4
  %1051 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1052 = call i32 (ptr, ...) @scanf(ptr %1051, ptr %1050)
  %1053 = load i32, ptr %1050, align 4
  %1054 = icmp eq i32 %1053, 0
  br label %continuation1575

continuation1575:                                 ; preds = %else1577, %then1576
  %1055 = phi i1 [ %1054, %else1577 ], [ true, %then1576 ]
  br i1 %1055, label %then1585, label %else1586

then1585:                                         ; preds = %continuation1575
  br label %continuation1584

else1586:                                         ; preds = %continuation1575
  %1056 = alloca i32, align 4
  %1057 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1058 = call i32 (ptr, ...) @scanf(ptr %1057, ptr %1056)
  %1059 = load i32, ptr %1056, align 4
  %1060 = icmp eq i32 %1059, 0
  br label %continuation1584

continuation1584:                                 ; preds = %else1586, %then1585
  %1061 = phi i1 [ %1060, %else1586 ], [ true, %then1585 ]
  br i1 %1061, label %then1594, label %else1595

then1594:                                         ; preds = %continuation1584
  br label %continuation1593

else1595:                                         ; preds = %continuation1584
  %1062 = alloca i32, align 4
  %1063 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1064 = call i32 (ptr, ...) @scanf(ptr %1063, ptr %1062)
  %1065 = load i32, ptr %1062, align 4
  %1066 = icmp eq i32 %1065, 0
  br label %continuation1593

continuation1593:                                 ; preds = %else1595, %then1594
  %1067 = phi i1 [ %1066, %else1595 ], [ true, %then1594 ]
  br i1 %1067, label %then1603, label %else1604

then1603:                                         ; preds = %continuation1593
  br label %continuation1602

else1604:                                         ; preds = %continuation1593
  %1068 = alloca i32, align 4
  %1069 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1070 = call i32 (ptr, ...) @scanf(ptr %1069, ptr %1068)
  %1071 = load i32, ptr %1068, align 4
  %1072 = icmp eq i32 %1071, 0
  br label %continuation1602

continuation1602:                                 ; preds = %else1604, %then1603
  %1073 = phi i1 [ %1072, %else1604 ], [ true, %then1603 ]
  br i1 %1073, label %then1612, label %else1613

then1612:                                         ; preds = %continuation1602
  br label %continuation1611

else1613:                                         ; preds = %continuation1602
  %1074 = alloca i32, align 4
  %1075 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1076 = call i32 (ptr, ...) @scanf(ptr %1075, ptr %1074)
  %1077 = load i32, ptr %1074, align 4
  %1078 = icmp eq i32 %1077, 0
  br label %continuation1611

continuation1611:                                 ; preds = %else1613, %then1612
  %1079 = phi i1 [ %1078, %else1613 ], [ true, %then1612 ]
  br i1 %1079, label %then1621, label %else1622

then1621:                                         ; preds = %continuation1611
  br label %continuation1620

else1622:                                         ; preds = %continuation1611
  %1080 = alloca i32, align 4
  %1081 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1082 = call i32 (ptr, ...) @scanf(ptr %1081, ptr %1080)
  %1083 = load i32, ptr %1080, align 4
  %1084 = icmp eq i32 %1083, 0
  br label %continuation1620

continuation1620:                                 ; preds = %else1622, %then1621
  %1085 = phi i1 [ %1084, %else1622 ], [ true, %then1621 ]
  br i1 %1085, label %then1630, label %else1631

then1630:                                         ; preds = %continuation1620
  br label %continuation1629

else1631:                                         ; preds = %continuation1620
  %1086 = alloca i32, align 4
  %1087 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1088 = call i32 (ptr, ...) @scanf(ptr %1087, ptr %1086)
  %1089 = load i32, ptr %1086, align 4
  %1090 = icmp eq i32 %1089, 0
  br label %continuation1629

continuation1629:                                 ; preds = %else1631, %then1630
  %1091 = phi i1 [ %1090, %else1631 ], [ true, %then1630 ]
  br i1 %1091, label %then1639, label %else1640

then1639:                                         ; preds = %continuation1629
  br label %continuation1638

else1640:                                         ; preds = %continuation1629
  %1092 = alloca i32, align 4
  %1093 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1094 = call i32 (ptr, ...) @scanf(ptr %1093, ptr %1092)
  %1095 = load i32, ptr %1092, align 4
  %1096 = icmp eq i32 %1095, 0
  br label %continuation1638

continuation1638:                                 ; preds = %else1640, %then1639
  %1097 = phi i1 [ %1096, %else1640 ], [ true, %then1639 ]
  br i1 %1097, label %then1648, label %else1649

then1648:                                         ; preds = %continuation1638
  br label %continuation1647

else1649:                                         ; preds = %continuation1638
  %1098 = alloca i32, align 4
  %1099 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1100 = call i32 (ptr, ...) @scanf(ptr %1099, ptr %1098)
  %1101 = load i32, ptr %1098, align 4
  %1102 = icmp eq i32 %1101, 0
  br label %continuation1647

continuation1647:                                 ; preds = %else1649, %then1648
  %1103 = phi i1 [ %1102, %else1649 ], [ true, %then1648 ]
  br i1 %1103, label %then1657, label %else1658

then1657:                                         ; preds = %continuation1647
  br label %continuation1656

else1658:                                         ; preds = %continuation1647
  %1104 = alloca i32, align 4
  %1105 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1106 = call i32 (ptr, ...) @scanf(ptr %1105, ptr %1104)
  %1107 = load i32, ptr %1104, align 4
  %1108 = icmp eq i32 %1107, 0
  br label %continuation1656

continuation1656:                                 ; preds = %else1658, %then1657
  %1109 = phi i1 [ %1108, %else1658 ], [ true, %then1657 ]
  br i1 %1109, label %then1666, label %else1667

then1666:                                         ; preds = %continuation1656
  br label %continuation1665

else1667:                                         ; preds = %continuation1656
  %1110 = alloca i32, align 4
  %1111 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1112 = call i32 (ptr, ...) @scanf(ptr %1111, ptr %1110)
  %1113 = load i32, ptr %1110, align 4
  %1114 = icmp eq i32 %1113, 0
  br label %continuation1665

continuation1665:                                 ; preds = %else1667, %then1666
  %1115 = phi i1 [ %1114, %else1667 ], [ true, %then1666 ]
  br i1 %1115, label %then1675, label %else1676

then1675:                                         ; preds = %continuation1665
  br label %continuation1674

else1676:                                         ; preds = %continuation1665
  %1116 = alloca i32, align 4
  %1117 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1118 = call i32 (ptr, ...) @scanf(ptr %1117, ptr %1116)
  %1119 = load i32, ptr %1116, align 4
  %1120 = icmp eq i32 %1119, 0
  br label %continuation1674

continuation1674:                                 ; preds = %else1676, %then1675
  %1121 = phi i1 [ %1120, %else1676 ], [ true, %then1675 ]
  br i1 %1121, label %then1684, label %else1685

then1684:                                         ; preds = %continuation1674
  br label %continuation1683

else1685:                                         ; preds = %continuation1674
  %1122 = alloca i32, align 4
  %1123 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1124 = call i32 (ptr, ...) @scanf(ptr %1123, ptr %1122)
  %1125 = load i32, ptr %1122, align 4
  %1126 = icmp eq i32 %1125, 0
  br label %continuation1683

continuation1683:                                 ; preds = %else1685, %then1684
  %1127 = phi i1 [ %1126, %else1685 ], [ true, %then1684 ]
  br i1 %1127, label %then1693, label %else1694

then1693:                                         ; preds = %continuation1683
  br label %continuation1692

else1694:                                         ; preds = %continuation1683
  %1128 = alloca i32, align 4
  %1129 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1130 = call i32 (ptr, ...) @scanf(ptr %1129, ptr %1128)
  %1131 = load i32, ptr %1128, align 4
  %1132 = icmp eq i32 %1131, 0
  br label %continuation1692

continuation1692:                                 ; preds = %else1694, %then1693
  %1133 = phi i1 [ %1132, %else1694 ], [ true, %then1693 ]
  br i1 %1133, label %then1702, label %else1703

then1702:                                         ; preds = %continuation1692
  br label %continuation1701

else1703:                                         ; preds = %continuation1692
  %1134 = alloca i32, align 4
  %1135 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1136 = call i32 (ptr, ...) @scanf(ptr %1135, ptr %1134)
  %1137 = load i32, ptr %1134, align 4
  %1138 = icmp eq i32 %1137, 0
  br label %continuation1701

continuation1701:                                 ; preds = %else1703, %then1702
  %1139 = phi i1 [ %1138, %else1703 ], [ true, %then1702 ]
  br i1 %1139, label %then1711, label %else1712

then1711:                                         ; preds = %continuation1701
  br label %continuation1710

else1712:                                         ; preds = %continuation1701
  %1140 = alloca i32, align 4
  %1141 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1142 = call i32 (ptr, ...) @scanf(ptr %1141, ptr %1140)
  %1143 = load i32, ptr %1140, align 4
  %1144 = icmp eq i32 %1143, 0
  br label %continuation1710

continuation1710:                                 ; preds = %else1712, %then1711
  %1145 = phi i1 [ %1144, %else1712 ], [ true, %then1711 ]
  br i1 %1145, label %then1720, label %else1721

then1720:                                         ; preds = %continuation1710
  br label %continuation1719

else1721:                                         ; preds = %continuation1710
  %1146 = alloca i32, align 4
  %1147 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1148 = call i32 (ptr, ...) @scanf(ptr %1147, ptr %1146)
  %1149 = load i32, ptr %1146, align 4
  %1150 = icmp eq i32 %1149, 0
  br label %continuation1719

continuation1719:                                 ; preds = %else1721, %then1720
  %1151 = phi i1 [ %1150, %else1721 ], [ true, %then1720 ]
  br i1 %1151, label %then1729, label %else1730

then1729:                                         ; preds = %continuation1719
  br label %continuation1728

else1730:                                         ; preds = %continuation1719
  %1152 = alloca i32, align 4
  %1153 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1154 = call i32 (ptr, ...) @scanf(ptr %1153, ptr %1152)
  %1155 = load i32, ptr %1152, align 4
  %1156 = icmp eq i32 %1155, 0
  br label %continuation1728

continuation1728:                                 ; preds = %else1730, %then1729
  %1157 = phi i1 [ %1156, %else1730 ], [ true, %then1729 ]
  br i1 %1157, label %then1738, label %else1739

then1738:                                         ; preds = %continuation1728
  br label %continuation1737

else1739:                                         ; preds = %continuation1728
  %1158 = alloca i32, align 4
  %1159 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1160 = call i32 (ptr, ...) @scanf(ptr %1159, ptr %1158)
  %1161 = load i32, ptr %1158, align 4
  %1162 = icmp eq i32 %1161, 0
  br label %continuation1737

continuation1737:                                 ; preds = %else1739, %then1738
  %1163 = phi i1 [ %1162, %else1739 ], [ true, %then1738 ]
  br i1 %1163, label %then1747, label %else1748

then1747:                                         ; preds = %continuation1737
  br label %continuation1746

else1748:                                         ; preds = %continuation1737
  %1164 = alloca i32, align 4
  %1165 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1166 = call i32 (ptr, ...) @scanf(ptr %1165, ptr %1164)
  %1167 = load i32, ptr %1164, align 4
  %1168 = icmp eq i32 %1167, 0
  br label %continuation1746

continuation1746:                                 ; preds = %else1748, %then1747
  %1169 = phi i1 [ %1168, %else1748 ], [ true, %then1747 ]
  br i1 %1169, label %then1756, label %else1757

then1756:                                         ; preds = %continuation1746
  br label %continuation1755

else1757:                                         ; preds = %continuation1746
  %1170 = alloca i32, align 4
  %1171 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1172 = call i32 (ptr, ...) @scanf(ptr %1171, ptr %1170)
  %1173 = load i32, ptr %1170, align 4
  %1174 = icmp eq i32 %1173, 0
  br label %continuation1755

continuation1755:                                 ; preds = %else1757, %then1756
  %1175 = phi i1 [ %1174, %else1757 ], [ true, %then1756 ]
  br i1 %1175, label %then1765, label %else1766

then1765:                                         ; preds = %continuation1755
  br label %continuation1764

else1766:                                         ; preds = %continuation1755
  %1176 = alloca i32, align 4
  %1177 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1178 = call i32 (ptr, ...) @scanf(ptr %1177, ptr %1176)
  %1179 = load i32, ptr %1176, align 4
  %1180 = icmp eq i32 %1179, 0
  br label %continuation1764

continuation1764:                                 ; preds = %else1766, %then1765
  %1181 = phi i1 [ %1180, %else1766 ], [ true, %then1765 ]
  br i1 %1181, label %then1774, label %else1775

then1774:                                         ; preds = %continuation1764
  br label %continuation1773

else1775:                                         ; preds = %continuation1764
  %1182 = alloca i32, align 4
  %1183 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1184 = call i32 (ptr, ...) @scanf(ptr %1183, ptr %1182)
  %1185 = load i32, ptr %1182, align 4
  %1186 = icmp eq i32 %1185, 0
  br label %continuation1773

continuation1773:                                 ; preds = %else1775, %then1774
  %1187 = phi i1 [ %1186, %else1775 ], [ true, %then1774 ]
  br i1 %1187, label %then1783, label %else1784

then1783:                                         ; preds = %continuation1773
  br label %continuation1782

else1784:                                         ; preds = %continuation1773
  %1188 = alloca i32, align 4
  %1189 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1190 = call i32 (ptr, ...) @scanf(ptr %1189, ptr %1188)
  %1191 = load i32, ptr %1188, align 4
  %1192 = icmp eq i32 %1191, 0
  br label %continuation1782

continuation1782:                                 ; preds = %else1784, %then1783
  %1193 = phi i1 [ %1192, %else1784 ], [ true, %then1783 ]
  br i1 %1193, label %then1792, label %else1793

then1792:                                         ; preds = %continuation1782
  br label %continuation1791

else1793:                                         ; preds = %continuation1782
  %1194 = alloca i32, align 4
  %1195 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1196 = call i32 (ptr, ...) @scanf(ptr %1195, ptr %1194)
  %1197 = load i32, ptr %1194, align 4
  %1198 = icmp eq i32 %1197, 0
  br label %continuation1791

continuation1791:                                 ; preds = %else1793, %then1792
  %1199 = phi i1 [ %1198, %else1793 ], [ true, %then1792 ]
  br i1 %1199, label %then1801, label %else1802

then1801:                                         ; preds = %continuation1791
  br label %continuation1800

else1802:                                         ; preds = %continuation1791
  %1200 = alloca i32, align 4
  %1201 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1202 = call i32 (ptr, ...) @scanf(ptr %1201, ptr %1200)
  %1203 = load i32, ptr %1200, align 4
  %1204 = icmp eq i32 %1203, 0
  br label %continuation1800

continuation1800:                                 ; preds = %else1802, %then1801
  %1205 = phi i1 [ %1204, %else1802 ], [ true, %then1801 ]
  br i1 %1205, label %then1810, label %else1811

then1810:                                         ; preds = %continuation1800
  br label %continuation1809

else1811:                                         ; preds = %continuation1800
  %1206 = alloca i32, align 4
  %1207 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1208 = call i32 (ptr, ...) @scanf(ptr %1207, ptr %1206)
  %1209 = load i32, ptr %1206, align 4
  %1210 = icmp eq i32 %1209, 0
  br label %continuation1809

continuation1809:                                 ; preds = %else1811, %then1810
  %1211 = phi i1 [ %1210, %else1811 ], [ true, %then1810 ]
  br i1 %1211, label %then1819, label %else1820

then1819:                                         ; preds = %continuation1809
  br label %continuation1818

else1820:                                         ; preds = %continuation1809
  %1212 = alloca i32, align 4
  %1213 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1214 = call i32 (ptr, ...) @scanf(ptr %1213, ptr %1212)
  %1215 = load i32, ptr %1212, align 4
  %1216 = icmp eq i32 %1215, 0
  br label %continuation1818

continuation1818:                                 ; preds = %else1820, %then1819
  %1217 = phi i1 [ %1216, %else1820 ], [ true, %then1819 ]
  br i1 %1217, label %then1828, label %else1829

then1828:                                         ; preds = %continuation1818
  br label %continuation1827

else1829:                                         ; preds = %continuation1818
  %1218 = alloca i32, align 4
  %1219 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1220 = call i32 (ptr, ...) @scanf(ptr %1219, ptr %1218)
  %1221 = load i32, ptr %1218, align 4
  %1222 = icmp eq i32 %1221, 0
  br label %continuation1827

continuation1827:                                 ; preds = %else1829, %then1828
  %1223 = phi i1 [ %1222, %else1829 ], [ true, %then1828 ]
  br i1 %1223, label %then1837, label %else1838

then1837:                                         ; preds = %continuation1827
  br label %continuation1836

else1838:                                         ; preds = %continuation1827
  %1224 = alloca i32, align 4
  %1225 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1226 = call i32 (ptr, ...) @scanf(ptr %1225, ptr %1224)
  %1227 = load i32, ptr %1224, align 4
  %1228 = icmp eq i32 %1227, 0
  br label %continuation1836

continuation1836:                                 ; preds = %else1838, %then1837
  %1229 = phi i1 [ %1228, %else1838 ], [ true, %then1837 ]
  br i1 %1229, label %then1846, label %else1847

then1846:                                         ; preds = %continuation1836
  br label %continuation1845

else1847:                                         ; preds = %continuation1836
  %1230 = alloca i32, align 4
  %1231 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1232 = call i32 (ptr, ...) @scanf(ptr %1231, ptr %1230)
  %1233 = load i32, ptr %1230, align 4
  %1234 = icmp eq i32 %1233, 0
  br label %continuation1845

continuation1845:                                 ; preds = %else1847, %then1846
  %1235 = phi i1 [ %1234, %else1847 ], [ true, %then1846 ]
  br i1 %1235, label %then1855, label %else1856

then1855:                                         ; preds = %continuation1845
  br label %continuation1854

else1856:                                         ; preds = %continuation1845
  %1236 = alloca i32, align 4
  %1237 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1238 = call i32 (ptr, ...) @scanf(ptr %1237, ptr %1236)
  %1239 = load i32, ptr %1236, align 4
  %1240 = icmp eq i32 %1239, 0
  br label %continuation1854

continuation1854:                                 ; preds = %else1856, %then1855
  %1241 = phi i1 [ %1240, %else1856 ], [ true, %then1855 ]
  br i1 %1241, label %then1864, label %else1865

then1864:                                         ; preds = %continuation1854
  br label %continuation1863

else1865:                                         ; preds = %continuation1854
  %1242 = alloca i32, align 4
  %1243 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1244 = call i32 (ptr, ...) @scanf(ptr %1243, ptr %1242)
  %1245 = load i32, ptr %1242, align 4
  %1246 = icmp eq i32 %1245, 0
  br label %continuation1863

continuation1863:                                 ; preds = %else1865, %then1864
  %1247 = phi i1 [ %1246, %else1865 ], [ true, %then1864 ]
  br i1 %1247, label %then1873, label %else1874

then1873:                                         ; preds = %continuation1863
  br label %continuation1872

else1874:                                         ; preds = %continuation1863
  %1248 = alloca i32, align 4
  %1249 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1250 = call i32 (ptr, ...) @scanf(ptr %1249, ptr %1248)
  %1251 = load i32, ptr %1248, align 4
  %1252 = icmp eq i32 %1251, 0
  br label %continuation1872

continuation1872:                                 ; preds = %else1874, %then1873
  %1253 = phi i1 [ %1252, %else1874 ], [ true, %then1873 ]
  br i1 %1253, label %then1882, label %else1883

then1882:                                         ; preds = %continuation1872
  br label %continuation1881

else1883:                                         ; preds = %continuation1872
  %1254 = alloca i32, align 4
  %1255 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1256 = call i32 (ptr, ...) @scanf(ptr %1255, ptr %1254)
  %1257 = load i32, ptr %1254, align 4
  %1258 = icmp eq i32 %1257, 0
  br label %continuation1881

continuation1881:                                 ; preds = %else1883, %then1882
  %1259 = phi i1 [ %1258, %else1883 ], [ true, %then1882 ]
  br i1 %1259, label %then1891, label %else1892

then1891:                                         ; preds = %continuation1881
  br label %continuation1890

else1892:                                         ; preds = %continuation1881
  %1260 = alloca i32, align 4
  %1261 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1262 = call i32 (ptr, ...) @scanf(ptr %1261, ptr %1260)
  %1263 = load i32, ptr %1260, align 4
  %1264 = icmp eq i32 %1263, 0
  br label %continuation1890

continuation1890:                                 ; preds = %else1892, %then1891
  %1265 = phi i1 [ %1264, %else1892 ], [ true, %then1891 ]
  br i1 %1265, label %then1900, label %else1901

then1900:                                         ; preds = %continuation1890
  br label %continuation1899

else1901:                                         ; preds = %continuation1890
  %1266 = alloca i32, align 4
  %1267 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1268 = call i32 (ptr, ...) @scanf(ptr %1267, ptr %1266)
  %1269 = load i32, ptr %1266, align 4
  %1270 = icmp eq i32 %1269, 0
  br label %continuation1899

continuation1899:                                 ; preds = %else1901, %then1900
  %1271 = phi i1 [ %1270, %else1901 ], [ true, %then1900 ]
  br i1 %1271, label %then1909, label %else1910

then1909:                                         ; preds = %continuation1899
  br label %continuation1908

else1910:                                         ; preds = %continuation1899
  %1272 = alloca i32, align 4
  %1273 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1274 = call i32 (ptr, ...) @scanf(ptr %1273, ptr %1272)
  %1275 = load i32, ptr %1272, align 4
  %1276 = icmp eq i32 %1275, 0
  br label %continuation1908

continuation1908:                                 ; preds = %else1910, %then1909
  %1277 = phi i1 [ %1276, %else1910 ], [ true, %then1909 ]
  br i1 %1277, label %then1918, label %else1919

then1918:                                         ; preds = %continuation1908
  br label %continuation1917

else1919:                                         ; preds = %continuation1908
  %1278 = alloca i32, align 4
  %1279 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1280 = call i32 (ptr, ...) @scanf(ptr %1279, ptr %1278)
  %1281 = load i32, ptr %1278, align 4
  %1282 = icmp eq i32 %1281, 0
  br label %continuation1917

continuation1917:                                 ; preds = %else1919, %then1918
  %1283 = phi i1 [ %1282, %else1919 ], [ true, %then1918 ]
  br i1 %1283, label %then1927, label %else1928

then1927:                                         ; preds = %continuation1917
  br label %continuation1926

else1928:                                         ; preds = %continuation1917
  %1284 = alloca i32, align 4
  %1285 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1286 = call i32 (ptr, ...) @scanf(ptr %1285, ptr %1284)
  %1287 = load i32, ptr %1284, align 4
  %1288 = icmp eq i32 %1287, 0
  br label %continuation1926

continuation1926:                                 ; preds = %else1928, %then1927
  %1289 = phi i1 [ %1288, %else1928 ], [ true, %then1927 ]
  br i1 %1289, label %then1936, label %else1937

then1936:                                         ; preds = %continuation1926
  br label %continuation1935

else1937:                                         ; preds = %continuation1926
  %1290 = alloca i32, align 4
  %1291 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1292 = call i32 (ptr, ...) @scanf(ptr %1291, ptr %1290)
  %1293 = load i32, ptr %1290, align 4
  %1294 = icmp eq i32 %1293, 0
  br label %continuation1935

continuation1935:                                 ; preds = %else1937, %then1936
  %1295 = phi i1 [ %1294, %else1937 ], [ true, %then1936 ]
  br i1 %1295, label %then1945, label %else1946

then1945:                                         ; preds = %continuation1935
  br label %continuation1944

else1946:                                         ; preds = %continuation1935
  %1296 = alloca i32, align 4
  %1297 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1298 = call i32 (ptr, ...) @scanf(ptr %1297, ptr %1296)
  %1299 = load i32, ptr %1296, align 4
  %1300 = icmp eq i32 %1299, 0
  br label %continuation1944

continuation1944:                                 ; preds = %else1946, %then1945
  %1301 = phi i1 [ %1300, %else1946 ], [ true, %then1945 ]
  br i1 %1301, label %then1954, label %else1955

then1954:                                         ; preds = %continuation1944
  br label %continuation1953

else1955:                                         ; preds = %continuation1944
  %1302 = alloca i32, align 4
  %1303 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1304 = call i32 (ptr, ...) @scanf(ptr %1303, ptr %1302)
  %1305 = load i32, ptr %1302, align 4
  %1306 = icmp eq i32 %1305, 0
  br label %continuation1953

continuation1953:                                 ; preds = %else1955, %then1954
  %1307 = phi i1 [ %1306, %else1955 ], [ true, %then1954 ]
  br i1 %1307, label %then1963, label %else1964

then1963:                                         ; preds = %continuation1953
  br label %continuation1962

else1964:                                         ; preds = %continuation1953
  %1308 = alloca i32, align 4
  %1309 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1310 = call i32 (ptr, ...) @scanf(ptr %1309, ptr %1308)
  %1311 = load i32, ptr %1308, align 4
  %1312 = icmp eq i32 %1311, 0
  br label %continuation1962

continuation1962:                                 ; preds = %else1964, %then1963
  %1313 = phi i1 [ %1312, %else1964 ], [ true, %then1963 ]
  br i1 %1313, label %then1972, label %else1973

then1972:                                         ; preds = %continuation1962
  br label %continuation1971

else1973:                                         ; preds = %continuation1962
  %1314 = alloca i32, align 4
  %1315 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1316 = call i32 (ptr, ...) @scanf(ptr %1315, ptr %1314)
  %1317 = load i32, ptr %1314, align 4
  %1318 = icmp eq i32 %1317, 0
  br label %continuation1971

continuation1971:                                 ; preds = %else1973, %then1972
  %1319 = phi i1 [ %1318, %else1973 ], [ true, %then1972 ]
  br i1 %1319, label %then1981, label %else1982

then1981:                                         ; preds = %continuation1971
  br label %continuation1980

else1982:                                         ; preds = %continuation1971
  %1320 = alloca i32, align 4
  %1321 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1322 = call i32 (ptr, ...) @scanf(ptr %1321, ptr %1320)
  %1323 = load i32, ptr %1320, align 4
  %1324 = icmp eq i32 %1323, 0
  br label %continuation1980

continuation1980:                                 ; preds = %else1982, %then1981
  %1325 = phi i1 [ %1324, %else1982 ], [ true, %then1981 ]
  br i1 %1325, label %then1990, label %else1991

then1990:                                         ; preds = %continuation1980
  br label %continuation1989

else1991:                                         ; preds = %continuation1980
  %1326 = alloca i32, align 4
  %1327 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1328 = call i32 (ptr, ...) @scanf(ptr %1327, ptr %1326)
  %1329 = load i32, ptr %1326, align 4
  %1330 = icmp eq i32 %1329, 0
  br label %continuation1989

continuation1989:                                 ; preds = %else1991, %then1990
  %1331 = phi i1 [ %1330, %else1991 ], [ true, %then1990 ]
  br i1 %1331, label %then1999, label %else2000

then1999:                                         ; preds = %continuation1989
  br label %continuation1998

else2000:                                         ; preds = %continuation1989
  %1332 = alloca i32, align 4
  %1333 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1334 = call i32 (ptr, ...) @scanf(ptr %1333, ptr %1332)
  %1335 = load i32, ptr %1332, align 4
  %1336 = icmp eq i32 %1335, 0
  br label %continuation1998

continuation1998:                                 ; preds = %else2000, %then1999
  %1337 = phi i1 [ %1336, %else2000 ], [ true, %then1999 ]
  br i1 %1337, label %then2008, label %else2009

then2008:                                         ; preds = %continuation1998
  br label %continuation2007

else2009:                                         ; preds = %continuation1998
  %1338 = alloca i32, align 4
  %1339 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1340 = call i32 (ptr, ...) @scanf(ptr %1339, ptr %1338)
  %1341 = load i32, ptr %1338, align 4
  %1342 = icmp eq i32 %1341, 0
  br label %continuation2007

continuation2007:                                 ; preds = %else2009, %then2008
  %1343 = phi i1 [ %1342, %else2009 ], [ true, %then2008 ]
  br i1 %1343, label %then2017, label %else2018

then2017:                                         ; preds = %continuation2007
  br label %continuation2016

else2018:                                         ; preds = %continuation2007
  %1344 = alloca i32, align 4
  %1345 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1346 = call i32 (ptr, ...) @scanf(ptr %1345, ptr %1344)
  %1347 = load i32, ptr %1344, align 4
  %1348 = icmp eq i32 %1347, 0
  br label %continuation2016

continuation2016:                                 ; preds = %else2018, %then2017
  %1349 = phi i1 [ %1348, %else2018 ], [ true, %then2017 ]
  br i1 %1349, label %then2026, label %else2027

then2026:                                         ; preds = %continuation2016
  br label %continuation2025

else2027:                                         ; preds = %continuation2016
  %1350 = alloca i32, align 4
  %1351 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1352 = call i32 (ptr, ...) @scanf(ptr %1351, ptr %1350)
  %1353 = load i32, ptr %1350, align 4
  %1354 = icmp eq i32 %1353, 0
  br label %continuation2025

continuation2025:                                 ; preds = %else2027, %then2026
  %1355 = phi i1 [ %1354, %else2027 ], [ true, %then2026 ]
  br i1 %1355, label %then2035, label %else2036

then2035:                                         ; preds = %continuation2025
  br label %continuation2034

else2036:                                         ; preds = %continuation2025
  %1356 = alloca i32, align 4
  %1357 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1358 = call i32 (ptr, ...) @scanf(ptr %1357, ptr %1356)
  %1359 = load i32, ptr %1356, align 4
  %1360 = icmp eq i32 %1359, 0
  br label %continuation2034

continuation2034:                                 ; preds = %else2036, %then2035
  %1361 = phi i1 [ %1360, %else2036 ], [ true, %then2035 ]
  br i1 %1361, label %then2044, label %else2045

then2044:                                         ; preds = %continuation2034
  br label %continuation2043

else2045:                                         ; preds = %continuation2034
  %1362 = alloca i32, align 4
  %1363 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1364 = call i32 (ptr, ...) @scanf(ptr %1363, ptr %1362)
  %1365 = load i32, ptr %1362, align 4
  %1366 = icmp eq i32 %1365, 0
  br label %continuation2043

continuation2043:                                 ; preds = %else2045, %then2044
  %1367 = phi i1 [ %1366, %else2045 ], [ true, %then2044 ]
  br i1 %1367, label %then2053, label %else2054

then2053:                                         ; preds = %continuation2043
  br label %continuation2052

else2054:                                         ; preds = %continuation2043
  %1368 = alloca i32, align 4
  %1369 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1370 = call i32 (ptr, ...) @scanf(ptr %1369, ptr %1368)
  %1371 = load i32, ptr %1368, align 4
  %1372 = icmp eq i32 %1371, 0
  br label %continuation2052

continuation2052:                                 ; preds = %else2054, %then2053
  %1373 = phi i1 [ %1372, %else2054 ], [ true, %then2053 ]
  br i1 %1373, label %then2062, label %else2063

then2062:                                         ; preds = %continuation2052
  br label %continuation2061

else2063:                                         ; preds = %continuation2052
  %1374 = alloca i32, align 4
  %1375 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1376 = call i32 (ptr, ...) @scanf(ptr %1375, ptr %1374)
  %1377 = load i32, ptr %1374, align 4
  %1378 = icmp eq i32 %1377, 0
  br label %continuation2061

continuation2061:                                 ; preds = %else2063, %then2062
  %1379 = phi i1 [ %1378, %else2063 ], [ true, %then2062 ]
  br i1 %1379, label %then2071, label %else2072

then2071:                                         ; preds = %continuation2061
  br label %continuation2070

else2072:                                         ; preds = %continuation2061
  %1380 = alloca i32, align 4
  %1381 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1382 = call i32 (ptr, ...) @scanf(ptr %1381, ptr %1380)
  %1383 = load i32, ptr %1380, align 4
  %1384 = icmp eq i32 %1383, 0
  br label %continuation2070

continuation2070:                                 ; preds = %else2072, %then2071
  %1385 = phi i1 [ %1384, %else2072 ], [ true, %then2071 ]
  br i1 %1385, label %then2080, label %else2081

then2080:                                         ; preds = %continuation2070
  br label %continuation2079

else2081:                                         ; preds = %continuation2070
  %1386 = alloca i32, align 4
  %1387 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1388 = call i32 (ptr, ...) @scanf(ptr %1387, ptr %1386)
  %1389 = load i32, ptr %1386, align 4
  %1390 = icmp eq i32 %1389, 0
  br label %continuation2079

continuation2079:                                 ; preds = %else2081, %then2080
  %1391 = phi i1 [ %1390, %else2081 ], [ true, %then2080 ]
  br i1 %1391, label %then2089, label %else2090

then2089:                                         ; preds = %continuation2079
  br label %continuation2088

else2090:                                         ; preds = %continuation2079
  %1392 = alloca i32, align 4
  %1393 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1394 = call i32 (ptr, ...) @scanf(ptr %1393, ptr %1392)
  %1395 = load i32, ptr %1392, align 4
  %1396 = icmp eq i32 %1395, 0
  br label %continuation2088

continuation2088:                                 ; preds = %else2090, %then2089
  %1397 = phi i1 [ %1396, %else2090 ], [ true, %then2089 ]
  br i1 %1397, label %then2098, label %else2099

then2098:                                         ; preds = %continuation2088
  br label %continuation2097

else2099:                                         ; preds = %continuation2088
  %1398 = alloca i32, align 4
  %1399 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1400 = call i32 (ptr, ...) @scanf(ptr %1399, ptr %1398)
  %1401 = load i32, ptr %1398, align 4
  %1402 = icmp eq i32 %1401, 0
  br label %continuation2097

continuation2097:                                 ; preds = %else2099, %then2098
  %1403 = phi i1 [ %1402, %else2099 ], [ true, %then2098 ]
  br i1 %1403, label %then2107, label %else2108

then2107:                                         ; preds = %continuation2097
  br label %continuation2106

else2108:                                         ; preds = %continuation2097
  %1404 = alloca i32, align 4
  %1405 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1406 = call i32 (ptr, ...) @scanf(ptr %1405, ptr %1404)
  %1407 = load i32, ptr %1404, align 4
  %1408 = icmp eq i32 %1407, 0
  br label %continuation2106

continuation2106:                                 ; preds = %else2108, %then2107
  %1409 = phi i1 [ %1408, %else2108 ], [ true, %then2107 ]
  br i1 %1409, label %then2116, label %else2117

then2116:                                         ; preds = %continuation2106
  br label %continuation2115

else2117:                                         ; preds = %continuation2106
  %1410 = alloca i32, align 4
  %1411 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1412 = call i32 (ptr, ...) @scanf(ptr %1411, ptr %1410)
  %1413 = load i32, ptr %1410, align 4
  %1414 = icmp eq i32 %1413, 0
  br label %continuation2115

continuation2115:                                 ; preds = %else2117, %then2116
  %1415 = phi i1 [ %1414, %else2117 ], [ true, %then2116 ]
  br i1 %1415, label %then2125, label %else2126

then2125:                                         ; preds = %continuation2115
  br label %continuation2124

else2126:                                         ; preds = %continuation2115
  %1416 = alloca i32, align 4
  %1417 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1418 = call i32 (ptr, ...) @scanf(ptr %1417, ptr %1416)
  %1419 = load i32, ptr %1416, align 4
  %1420 = icmp eq i32 %1419, 0
  br label %continuation2124

continuation2124:                                 ; preds = %else2126, %then2125
  %1421 = phi i1 [ %1420, %else2126 ], [ true, %then2125 ]
  br i1 %1421, label %then2134, label %else2135

then2134:                                         ; preds = %continuation2124
  br label %continuation2133

else2135:                                         ; preds = %continuation2124
  %1422 = alloca i32, align 4
  %1423 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1424 = call i32 (ptr, ...) @scanf(ptr %1423, ptr %1422)
  %1425 = load i32, ptr %1422, align 4
  %1426 = icmp eq i32 %1425, 0
  br label %continuation2133

continuation2133:                                 ; preds = %else2135, %then2134
  %1427 = phi i1 [ %1426, %else2135 ], [ true, %then2134 ]
  br i1 %1427, label %then2143, label %else2144

then2143:                                         ; preds = %continuation2133
  br label %continuation2142

else2144:                                         ; preds = %continuation2133
  %1428 = alloca i32, align 4
  %1429 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1430 = call i32 (ptr, ...) @scanf(ptr %1429, ptr %1428)
  %1431 = load i32, ptr %1428, align 4
  %1432 = icmp eq i32 %1431, 0
  br label %continuation2142

continuation2142:                                 ; preds = %else2144, %then2143
  %1433 = phi i1 [ %1432, %else2144 ], [ true, %then2143 ]
  br i1 %1433, label %then2152, label %else2153

then2152:                                         ; preds = %continuation2142
  br label %continuation2151

else2153:                                         ; preds = %continuation2142
  %1434 = alloca i32, align 4
  %1435 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1436 = call i32 (ptr, ...) @scanf(ptr %1435, ptr %1434)
  %1437 = load i32, ptr %1434, align 4
  %1438 = icmp eq i32 %1437, 0
  br label %continuation2151

continuation2151:                                 ; preds = %else2153, %then2152
  %1439 = phi i1 [ %1438, %else2153 ], [ true, %then2152 ]
  br i1 %1439, label %then2161, label %else2162

then2161:                                         ; preds = %continuation2151
  br label %continuation2160

else2162:                                         ; preds = %continuation2151
  %1440 = alloca i32, align 4
  %1441 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1442 = call i32 (ptr, ...) @scanf(ptr %1441, ptr %1440)
  %1443 = load i32, ptr %1440, align 4
  %1444 = icmp eq i32 %1443, 0
  br label %continuation2160

continuation2160:                                 ; preds = %else2162, %then2161
  %1445 = phi i1 [ %1444, %else2162 ], [ true, %then2161 ]
  br i1 %1445, label %then2170, label %else2171

then2170:                                         ; preds = %continuation2160
  br label %continuation2169

else2171:                                         ; preds = %continuation2160
  %1446 = alloca i32, align 4
  %1447 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1448 = call i32 (ptr, ...) @scanf(ptr %1447, ptr %1446)
  %1449 = load i32, ptr %1446, align 4
  %1450 = icmp eq i32 %1449, 0
  br label %continuation2169

continuation2169:                                 ; preds = %else2171, %then2170
  %1451 = phi i1 [ %1450, %else2171 ], [ true, %then2170 ]
  br i1 %1451, label %then2179, label %else2180

then2179:                                         ; preds = %continuation2169
  br label %continuation2178

else2180:                                         ; preds = %continuation2169
  %1452 = alloca i32, align 4
  %1453 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1454 = call i32 (ptr, ...) @scanf(ptr %1453, ptr %1452)
  %1455 = load i32, ptr %1452, align 4
  %1456 = icmp eq i32 %1455, 0
  br label %continuation2178

continuation2178:                                 ; preds = %else2180, %then2179
  %1457 = phi i1 [ %1456, %else2180 ], [ true, %then2179 ]
  br i1 %1457, label %then2188, label %else2189

then2188:                                         ; preds = %continuation2178
  br label %continuation2187

else2189:                                         ; preds = %continuation2178
  %1458 = alloca i32, align 4
  %1459 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1460 = call i32 (ptr, ...) @scanf(ptr %1459, ptr %1458)
  %1461 = load i32, ptr %1458, align 4
  %1462 = icmp eq i32 %1461, 0
  br label %continuation2187

continuation2187:                                 ; preds = %else2189, %then2188
  %1463 = phi i1 [ %1462, %else2189 ], [ true, %then2188 ]
  br i1 %1463, label %then2197, label %else2198

then2197:                                         ; preds = %continuation2187
  br label %continuation2196

else2198:                                         ; preds = %continuation2187
  %1464 = alloca i32, align 4
  %1465 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1466 = call i32 (ptr, ...) @scanf(ptr %1465, ptr %1464)
  %1467 = load i32, ptr %1464, align 4
  %1468 = icmp eq i32 %1467, 0
  br label %continuation2196

continuation2196:                                 ; preds = %else2198, %then2197
  %1469 = phi i1 [ %1468, %else2198 ], [ true, %then2197 ]
  br i1 %1469, label %then2206, label %else2207

then2206:                                         ; preds = %continuation2196
  br label %continuation2205

else2207:                                         ; preds = %continuation2196
  %1470 = alloca i32, align 4
  %1471 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1472 = call i32 (ptr, ...) @scanf(ptr %1471, ptr %1470)
  %1473 = load i32, ptr %1470, align 4
  %1474 = icmp eq i32 %1473, 0
  br label %continuation2205

continuation2205:                                 ; preds = %else2207, %then2206
  %1475 = phi i1 [ %1474, %else2207 ], [ true, %then2206 ]
  br i1 %1475, label %then2215, label %else2216

then2215:                                         ; preds = %continuation2205
  br label %continuation2214

else2216:                                         ; preds = %continuation2205
  %1476 = alloca i32, align 4
  %1477 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1478 = call i32 (ptr, ...) @scanf(ptr %1477, ptr %1476)
  %1479 = load i32, ptr %1476, align 4
  %1480 = icmp eq i32 %1479, 0
  br label %continuation2214

continuation2214:                                 ; preds = %else2216, %then2215
  %1481 = phi i1 [ %1480, %else2216 ], [ true, %then2215 ]
  br i1 %1481, label %then2224, label %else2225

then2224:                                         ; preds = %continuation2214
  br label %continuation2223

else2225:                                         ; preds = %continuation2214
  %1482 = alloca i32, align 4
  %1483 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1484 = call i32 (ptr, ...) @scanf(ptr %1483, ptr %1482)
  %1485 = load i32, ptr %1482, align 4
  %1486 = icmp eq i32 %1485, 0
  br label %continuation2223

continuation2223:                                 ; preds = %else2225, %then2224
  %1487 = phi i1 [ %1486, %else2225 ], [ true, %then2224 ]
  br i1 %1487, label %then2233, label %else2234

then2233:                                         ; preds = %continuation2223
  br label %continuation2232

else2234:                                         ; preds = %continuation2223
  %1488 = alloca i32, align 4
  %1489 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1490 = call i32 (ptr, ...) @scanf(ptr %1489, ptr %1488)
  %1491 = load i32, ptr %1488, align 4
  %1492 = icmp eq i32 %1491, 0
  br label %continuation2232

continuation2232:                                 ; preds = %else2234, %then2233
  %1493 = phi i1 [ %1492, %else2234 ], [ true, %then2233 ]
  br i1 %1493, label %then2242, label %else2243

then2242:                                         ; preds = %continuation2232
  br label %continuation2241

else2243:                                         ; preds = %continuation2232
  %1494 = alloca i32, align 4
  %1495 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1496 = call i32 (ptr, ...) @scanf(ptr %1495, ptr %1494)
  %1497 = load i32, ptr %1494, align 4
  %1498 = icmp eq i32 %1497, 0
  br label %continuation2241

continuation2241:                                 ; preds = %else2243, %then2242
  %1499 = phi i1 [ %1498, %else2243 ], [ true, %then2242 ]
  br i1 %1499, label %then2251, label %else2252

then2251:                                         ; preds = %continuation2241
  br label %continuation2250

else2252:                                         ; preds = %continuation2241
  %1500 = alloca i32, align 4
  %1501 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1502 = call i32 (ptr, ...) @scanf(ptr %1501, ptr %1500)
  %1503 = load i32, ptr %1500, align 4
  %1504 = icmp eq i32 %1503, 0
  br label %continuation2250

continuation2250:                                 ; preds = %else2252, %then2251
  %1505 = phi i1 [ %1504, %else2252 ], [ true, %then2251 ]
  br i1 %1505, label %then2260, label %else2261

then2260:                                         ; preds = %continuation2250
  br label %continuation2259

else2261:                                         ; preds = %continuation2250
  %1506 = alloca i32, align 4
  %1507 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1508 = call i32 (ptr, ...) @scanf(ptr %1507, ptr %1506)
  %1509 = load i32, ptr %1506, align 4
  %1510 = icmp eq i32 %1509, 0
  br label %continuation2259

continuation2259:                                 ; preds = %else2261, %then2260
  %1511 = phi i1 [ %1510, %else2261 ], [ true, %then2260 ]
  br i1 %1511, label %then2269, label %else2270

then2269:                                         ; preds = %continuation2259
  br label %continuation2268

else2270:                                         ; preds = %continuation2259
  %1512 = alloca i32, align 4
  %1513 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1514 = call i32 (ptr, ...) @scanf(ptr %1513, ptr %1512)
  %1515 = load i32, ptr %1512, align 4
  %1516 = icmp eq i32 %1515, 0
  br label %continuation2268

continuation2268:                                 ; preds = %else2270, %then2269
  %1517 = phi i1 [ %1516, %else2270 ], [ true, %then2269 ]
  br i1 %1517, label %then2278, label %else2279

then2278:                                         ; preds = %continuation2268
  br label %continuation2277

else2279:                                         ; preds = %continuation2268
  %1518 = alloca i32, align 4
  %1519 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1520 = call i32 (ptr, ...) @scanf(ptr %1519, ptr %1518)
  %1521 = load i32, ptr %1518, align 4
  %1522 = icmp eq i32 %1521, 0
  br label %continuation2277

continuation2277:                                 ; preds = %else2279, %then2278
  %1523 = phi i1 [ %1522, %else2279 ], [ true, %then2278 ]
  br i1 %1523, label %then2287, label %else2288

then2287:                                         ; preds = %continuation2277
  br label %continuation2286

else2288:                                         ; preds = %continuation2277
  %1524 = alloca i32, align 4
  %1525 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1526 = call i32 (ptr, ...) @scanf(ptr %1525, ptr %1524)
  %1527 = load i32, ptr %1524, align 4
  %1528 = icmp eq i32 %1527, 0
  br label %continuation2286

continuation2286:                                 ; preds = %else2288, %then2287
  %1529 = phi i1 [ %1528, %else2288 ], [ true, %then2287 ]
  br i1 %1529, label %then2296, label %else2297

then2296:                                         ; preds = %continuation2286
  br label %continuation2295

else2297:                                         ; preds = %continuation2286
  %1530 = alloca i32, align 4
  %1531 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1532 = call i32 (ptr, ...) @scanf(ptr %1531, ptr %1530)
  %1533 = load i32, ptr %1530, align 4
  %1534 = icmp eq i32 %1533, 0
  br label %continuation2295

continuation2295:                                 ; preds = %else2297, %then2296
  %1535 = phi i1 [ %1534, %else2297 ], [ true, %then2296 ]
  br i1 %1535, label %then2305, label %else2306

then2305:                                         ; preds = %continuation2295
  br label %continuation2304

else2306:                                         ; preds = %continuation2295
  %1536 = alloca i32, align 4
  %1537 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1538 = call i32 (ptr, ...) @scanf(ptr %1537, ptr %1536)
  %1539 = load i32, ptr %1536, align 4
  %1540 = icmp eq i32 %1539, 0
  br label %continuation2304

continuation2304:                                 ; preds = %else2306, %then2305
  %1541 = phi i1 [ %1540, %else2306 ], [ true, %then2305 ]
  br i1 %1541, label %then2314, label %else2315

then2314:                                         ; preds = %continuation2304
  br label %continuation2313

else2315:                                         ; preds = %continuation2304
  %1542 = alloca i32, align 4
  %1543 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1544 = call i32 (ptr, ...) @scanf(ptr %1543, ptr %1542)
  %1545 = load i32, ptr %1542, align 4
  %1546 = icmp eq i32 %1545, 0
  br label %continuation2313

continuation2313:                                 ; preds = %else2315, %then2314
  %1547 = phi i1 [ %1546, %else2315 ], [ true, %then2314 ]
  br i1 %1547, label %then2323, label %else2324

then2323:                                         ; preds = %continuation2313
  br label %continuation2322

else2324:                                         ; preds = %continuation2313
  %1548 = alloca i32, align 4
  %1549 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1550 = call i32 (ptr, ...) @scanf(ptr %1549, ptr %1548)
  %1551 = load i32, ptr %1548, align 4
  %1552 = icmp eq i32 %1551, 0
  br label %continuation2322

continuation2322:                                 ; preds = %else2324, %then2323
  %1553 = phi i1 [ %1552, %else2324 ], [ true, %then2323 ]
  br i1 %1553, label %then2332, label %else2333

then2332:                                         ; preds = %continuation2322
  br label %continuation2331

else2333:                                         ; preds = %continuation2322
  %1554 = alloca i32, align 4
  %1555 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1556 = call i32 (ptr, ...) @scanf(ptr %1555, ptr %1554)
  %1557 = load i32, ptr %1554, align 4
  %1558 = icmp eq i32 %1557, 0
  br label %continuation2331

continuation2331:                                 ; preds = %else2333, %then2332
  %1559 = phi i1 [ %1558, %else2333 ], [ true, %then2332 ]
  br i1 %1559, label %then2341, label %else2342

then2341:                                         ; preds = %continuation2331
  br label %continuation2340

else2342:                                         ; preds = %continuation2331
  %1560 = alloca i32, align 4
  %1561 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1562 = call i32 (ptr, ...) @scanf(ptr %1561, ptr %1560)
  %1563 = load i32, ptr %1560, align 4
  %1564 = icmp eq i32 %1563, 0
  br label %continuation2340

continuation2340:                                 ; preds = %else2342, %then2341
  %1565 = phi i1 [ %1564, %else2342 ], [ true, %then2341 ]
  br i1 %1565, label %then2350, label %else2351

then2350:                                         ; preds = %continuation2340
  br label %continuation2349

else2351:                                         ; preds = %continuation2340
  %1566 = alloca i32, align 4
  %1567 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1568 = call i32 (ptr, ...) @scanf(ptr %1567, ptr %1566)
  %1569 = load i32, ptr %1566, align 4
  %1570 = icmp eq i32 %1569, 0
  br label %continuation2349

continuation2349:                                 ; preds = %else2351, %then2350
  %1571 = phi i1 [ %1570, %else2351 ], [ true, %then2350 ]
  br i1 %1571, label %then2359, label %else2360

then2359:                                         ; preds = %continuation2349
  br label %continuation2358

else2360:                                         ; preds = %continuation2349
  %1572 = alloca i32, align 4
  %1573 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1574 = call i32 (ptr, ...) @scanf(ptr %1573, ptr %1572)
  %1575 = load i32, ptr %1572, align 4
  %1576 = icmp eq i32 %1575, 0
  br label %continuation2358

continuation2358:                                 ; preds = %else2360, %then2359
  %1577 = phi i1 [ %1576, %else2360 ], [ true, %then2359 ]
  br i1 %1577, label %then2368, label %else2369

then2368:                                         ; preds = %continuation2358
  br label %continuation2367

else2369:                                         ; preds = %continuation2358
  %1578 = alloca i32, align 4
  %1579 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1580 = call i32 (ptr, ...) @scanf(ptr %1579, ptr %1578)
  %1581 = load i32, ptr %1578, align 4
  %1582 = icmp eq i32 %1581, 0
  br label %continuation2367

continuation2367:                                 ; preds = %else2369, %then2368
  %1583 = phi i1 [ %1582, %else2369 ], [ true, %then2368 ]
  br i1 %1583, label %then2377, label %else2378

then2377:                                         ; preds = %continuation2367
  br label %continuation2376

else2378:                                         ; preds = %continuation2367
  %1584 = alloca i32, align 4
  %1585 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1586 = call i32 (ptr, ...) @scanf(ptr %1585, ptr %1584)
  %1587 = load i32, ptr %1584, align 4
  %1588 = icmp eq i32 %1587, 0
  br label %continuation2376

continuation2376:                                 ; preds = %else2378, %then2377
  %1589 = phi i1 [ %1588, %else2378 ], [ true, %then2377 ]
  br i1 %1589, label %then2386, label %else2387

then2386:                                         ; preds = %continuation2376
  br label %continuation2385

else2387:                                         ; preds = %continuation2376
  %1590 = alloca i32, align 4
  %1591 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1592 = call i32 (ptr, ...) @scanf(ptr %1591, ptr %1590)
  %1593 = load i32, ptr %1590, align 4
  %1594 = icmp eq i32 %1593, 0
  br label %continuation2385

continuation2385:                                 ; preds = %else2387, %then2386
  %1595 = phi i1 [ %1594, %else2387 ], [ true, %then2386 ]
  br i1 %1595, label %then2395, label %else2396

then2395:                                         ; preds = %continuation2385
  br label %continuation2394

else2396:                                         ; preds = %continuation2385
  %1596 = alloca i32, align 4
  %1597 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1598 = call i32 (ptr, ...) @scanf(ptr %1597, ptr %1596)
  %1599 = load i32, ptr %1596, align 4
  %1600 = icmp eq i32 %1599, 0
  br label %continuation2394

continuation2394:                                 ; preds = %else2396, %then2395
  %1601 = phi i1 [ %1600, %else2396 ], [ true, %then2395 ]
  br i1 %1601, label %then2404, label %else2405

then2404:                                         ; preds = %continuation2394
  br label %continuation2403

else2405:                                         ; preds = %continuation2394
  %1602 = alloca i32, align 4
  %1603 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1604 = call i32 (ptr, ...) @scanf(ptr %1603, ptr %1602)
  %1605 = load i32, ptr %1602, align 4
  %1606 = icmp eq i32 %1605, 0
  br label %continuation2403

continuation2403:                                 ; preds = %else2405, %then2404
  %1607 = phi i1 [ %1606, %else2405 ], [ true, %then2404 ]
  br i1 %1607, label %then2413, label %else2414

then2413:                                         ; preds = %continuation2403
  br label %continuation2412

else2414:                                         ; preds = %continuation2403
  %1608 = alloca i32, align 4
  %1609 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1610 = call i32 (ptr, ...) @scanf(ptr %1609, ptr %1608)
  %1611 = load i32, ptr %1608, align 4
  %1612 = icmp eq i32 %1611, 0
  br label %continuation2412

continuation2412:                                 ; preds = %else2414, %then2413
  %1613 = phi i1 [ %1612, %else2414 ], [ true, %then2413 ]
  br i1 %1613, label %then2422, label %else2423

then2422:                                         ; preds = %continuation2412
  br label %continuation2421

else2423:                                         ; preds = %continuation2412
  %1614 = alloca i32, align 4
  %1615 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1616 = call i32 (ptr, ...) @scanf(ptr %1615, ptr %1614)
  %1617 = load i32, ptr %1614, align 4
  %1618 = icmp eq i32 %1617, 0
  br label %continuation2421

continuation2421:                                 ; preds = %else2423, %then2422
  %1619 = phi i1 [ %1618, %else2423 ], [ true, %then2422 ]
  br i1 %1619, label %then2431, label %else2432

then2431:                                         ; preds = %continuation2421
  br label %continuation2430

else2432:                                         ; preds = %continuation2421
  %1620 = alloca i32, align 4
  %1621 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1622 = call i32 (ptr, ...) @scanf(ptr %1621, ptr %1620)
  %1623 = load i32, ptr %1620, align 4
  %1624 = icmp eq i32 %1623, 0
  br label %continuation2430

continuation2430:                                 ; preds = %else2432, %then2431
  %1625 = phi i1 [ %1624, %else2432 ], [ true, %then2431 ]
  br i1 %1625, label %then2440, label %else2441

then2440:                                         ; preds = %continuation2430
  br label %continuation2439

else2441:                                         ; preds = %continuation2430
  %1626 = alloca i32, align 4
  %1627 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1628 = call i32 (ptr, ...) @scanf(ptr %1627, ptr %1626)
  %1629 = load i32, ptr %1626, align 4
  %1630 = icmp eq i32 %1629, 0
  br label %continuation2439

continuation2439:                                 ; preds = %else2441, %then2440
  %1631 = phi i1 [ %1630, %else2441 ], [ true, %then2440 ]
  br i1 %1631, label %then2449, label %else2450

then2449:                                         ; preds = %continuation2439
  br label %continuation2448

else2450:                                         ; preds = %continuation2439
  %1632 = alloca i32, align 4
  %1633 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1634 = call i32 (ptr, ...) @scanf(ptr %1633, ptr %1632)
  %1635 = load i32, ptr %1632, align 4
  %1636 = icmp eq i32 %1635, 0
  br label %continuation2448

continuation2448:                                 ; preds = %else2450, %then2449
  %1637 = phi i1 [ %1636, %else2450 ], [ true, %then2449 ]
  br i1 %1637, label %then2458, label %else2459

then2458:                                         ; preds = %continuation2448
  br label %continuation2457

else2459:                                         ; preds = %continuation2448
  %1638 = alloca i32, align 4
  %1639 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1640 = call i32 (ptr, ...) @scanf(ptr %1639, ptr %1638)
  %1641 = load i32, ptr %1638, align 4
  %1642 = icmp eq i32 %1641, 0
  br label %continuation2457

continuation2457:                                 ; preds = %else2459, %then2458
  %1643 = phi i1 [ %1642, %else2459 ], [ true, %then2458 ]
  br i1 %1643, label %then2467, label %else2468

then2467:                                         ; preds = %continuation2457
  br label %continuation2466

else2468:                                         ; preds = %continuation2457
  %1644 = alloca i32, align 4
  %1645 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1646 = call i32 (ptr, ...) @scanf(ptr %1645, ptr %1644)
  %1647 = load i32, ptr %1644, align 4
  %1648 = icmp eq i32 %1647, 0
  br label %continuation2466

continuation2466:                                 ; preds = %else2468, %then2467
  %1649 = phi i1 [ %1648, %else2468 ], [ true, %then2467 ]
  br i1 %1649, label %then2476, label %else2477

then2476:                                         ; preds = %continuation2466
  br label %continuation2475

else2477:                                         ; preds = %continuation2466
  %1650 = alloca i32, align 4
  %1651 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1652 = call i32 (ptr, ...) @scanf(ptr %1651, ptr %1650)
  %1653 = load i32, ptr %1650, align 4
  %1654 = icmp eq i32 %1653, 0
  br label %continuation2475

continuation2475:                                 ; preds = %else2477, %then2476
  %1655 = phi i1 [ %1654, %else2477 ], [ true, %then2476 ]
  br i1 %1655, label %then2485, label %else2486

then2485:                                         ; preds = %continuation2475
  br label %continuation2484

else2486:                                         ; preds = %continuation2475
  %1656 = alloca i32, align 4
  %1657 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1658 = call i32 (ptr, ...) @scanf(ptr %1657, ptr %1656)
  %1659 = load i32, ptr %1656, align 4
  %1660 = icmp eq i32 %1659, 0
  br label %continuation2484

continuation2484:                                 ; preds = %else2486, %then2485
  %1661 = phi i1 [ %1660, %else2486 ], [ true, %then2485 ]
  br i1 %1661, label %then2494, label %else2495

then2494:                                         ; preds = %continuation2484
  br label %continuation2493

else2495:                                         ; preds = %continuation2484
  %1662 = alloca i32, align 4
  %1663 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1664 = call i32 (ptr, ...) @scanf(ptr %1663, ptr %1662)
  %1665 = load i32, ptr %1662, align 4
  %1666 = icmp eq i32 %1665, 0
  br label %continuation2493

continuation2493:                                 ; preds = %else2495, %then2494
  %1667 = phi i1 [ %1666, %else2495 ], [ true, %then2494 ]
  br i1 %1667, label %then2503, label %else2504

then2503:                                         ; preds = %continuation2493
  br label %continuation2502

else2504:                                         ; preds = %continuation2493
  %1668 = alloca i32, align 4
  %1669 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1670 = call i32 (ptr, ...) @scanf(ptr %1669, ptr %1668)
  %1671 = load i32, ptr %1668, align 4
  %1672 = icmp eq i32 %1671, 0
  br label %continuation2502

continuation2502:                                 ; preds = %else2504, %then2503
  %1673 = phi i1 [ %1672, %else2504 ], [ true, %then2503 ]
  br i1 %1673, label %then2512, label %else2513

then2512:                                         ; preds = %continuation2502
  br label %continuation2511

else2513:                                         ; preds = %continuation2502
  %1674 = alloca i32, align 4
  %1675 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1676 = call i32 (ptr, ...) @scanf(ptr %1675, ptr %1674)
  %1677 = load i32, ptr %1674, align 4
  %1678 = icmp eq i32 %1677, 0
  br label %continuation2511

continuation2511:                                 ; preds = %else2513, %then2512
  %1679 = phi i1 [ %1678, %else2513 ], [ true, %then2512 ]
  br i1 %1679, label %then2521, label %else2522

then2521:                                         ; preds = %continuation2511
  br label %continuation2520

else2522:                                         ; preds = %continuation2511
  %1680 = alloca i32, align 4
  %1681 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1682 = call i32 (ptr, ...) @scanf(ptr %1681, ptr %1680)
  %1683 = load i32, ptr %1680, align 4
  %1684 = icmp eq i32 %1683, 0
  br label %continuation2520

continuation2520:                                 ; preds = %else2522, %then2521
  %1685 = phi i1 [ %1684, %else2522 ], [ true, %then2521 ]
  br i1 %1685, label %then2530, label %else2531

then2530:                                         ; preds = %continuation2520
  br label %continuation2529

else2531:                                         ; preds = %continuation2520
  %1686 = alloca i32, align 4
  %1687 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1688 = call i32 (ptr, ...) @scanf(ptr %1687, ptr %1686)
  %1689 = load i32, ptr %1686, align 4
  %1690 = icmp eq i32 %1689, 0
  br label %continuation2529

continuation2529:                                 ; preds = %else2531, %then2530
  %1691 = phi i1 [ %1690, %else2531 ], [ true, %then2530 ]
  br i1 %1691, label %then2539, label %else2540

then2539:                                         ; preds = %continuation2529
  br label %continuation2538

else2540:                                         ; preds = %continuation2529
  %1692 = alloca i32, align 4
  %1693 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1694 = call i32 (ptr, ...) @scanf(ptr %1693, ptr %1692)
  %1695 = load i32, ptr %1692, align 4
  %1696 = icmp eq i32 %1695, 0
  br label %continuation2538

continuation2538:                                 ; preds = %else2540, %then2539
  %1697 = phi i1 [ %1696, %else2540 ], [ true, %then2539 ]
  br i1 %1697, label %then2548, label %else2549

then2548:                                         ; preds = %continuation2538
  br label %continuation2547

else2549:                                         ; preds = %continuation2538
  %1698 = alloca i32, align 4
  %1699 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1700 = call i32 (ptr, ...) @scanf(ptr %1699, ptr %1698)
  %1701 = load i32, ptr %1698, align 4
  %1702 = icmp eq i32 %1701, 0
  br label %continuation2547

continuation2547:                                 ; preds = %else2549, %then2548
  %1703 = phi i1 [ %1702, %else2549 ], [ true, %then2548 ]
  br i1 %1703, label %then2557, label %else2558

then2557:                                         ; preds = %continuation2547
  br label %continuation2556

else2558:                                         ; preds = %continuation2547
  %1704 = alloca i32, align 4
  %1705 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1706 = call i32 (ptr, ...) @scanf(ptr %1705, ptr %1704)
  %1707 = load i32, ptr %1704, align 4
  %1708 = icmp eq i32 %1707, 0
  br label %continuation2556

continuation2556:                                 ; preds = %else2558, %then2557
  %1709 = phi i1 [ %1708, %else2558 ], [ true, %then2557 ]
  br i1 %1709, label %then2566, label %else2567

then2566:                                         ; preds = %continuation2556
  br label %continuation2565

else2567:                                         ; preds = %continuation2556
  %1710 = alloca i32, align 4
  %1711 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1712 = call i32 (ptr, ...) @scanf(ptr %1711, ptr %1710)
  %1713 = load i32, ptr %1710, align 4
  %1714 = icmp eq i32 %1713, 0
  br label %continuation2565

continuation2565:                                 ; preds = %else2567, %then2566
  %1715 = phi i1 [ %1714, %else2567 ], [ true, %then2566 ]
  br i1 %1715, label %then2575, label %else2576

then2575:                                         ; preds = %continuation2565
  br label %continuation2574

else2576:                                         ; preds = %continuation2565
  %1716 = alloca i32, align 4
  %1717 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1718 = call i32 (ptr, ...) @scanf(ptr %1717, ptr %1716)
  %1719 = load i32, ptr %1716, align 4
  %1720 = icmp eq i32 %1719, 0
  br label %continuation2574

continuation2574:                                 ; preds = %else2576, %then2575
  %1721 = phi i1 [ %1720, %else2576 ], [ true, %then2575 ]
  br i1 %1721, label %then2584, label %else2585

then2584:                                         ; preds = %continuation2574
  br label %continuation2583

else2585:                                         ; preds = %continuation2574
  %1722 = alloca i32, align 4
  %1723 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1724 = call i32 (ptr, ...) @scanf(ptr %1723, ptr %1722)
  %1725 = load i32, ptr %1722, align 4
  %1726 = icmp eq i32 %1725, 0
  br label %continuation2583

continuation2583:                                 ; preds = %else2585, %then2584
  %1727 = phi i1 [ %1726, %else2585 ], [ true, %then2584 ]
  br i1 %1727, label %then2593, label %else2594

then2593:                                         ; preds = %continuation2583
  br label %continuation2592

else2594:                                         ; preds = %continuation2583
  %1728 = alloca i32, align 4
  %1729 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1730 = call i32 (ptr, ...) @scanf(ptr %1729, ptr %1728)
  %1731 = load i32, ptr %1728, align 4
  %1732 = icmp eq i32 %1731, 0
  br label %continuation2592

continuation2592:                                 ; preds = %else2594, %then2593
  %1733 = phi i1 [ %1732, %else2594 ], [ true, %then2593 ]
  br i1 %1733, label %then2602, label %else2603

then2602:                                         ; preds = %continuation2592
  br label %continuation2601

else2603:                                         ; preds = %continuation2592
  %1734 = alloca i32, align 4
  %1735 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1736 = call i32 (ptr, ...) @scanf(ptr %1735, ptr %1734)
  %1737 = load i32, ptr %1734, align 4
  %1738 = icmp eq i32 %1737, 0
  br label %continuation2601

continuation2601:                                 ; preds = %else2603, %then2602
  %1739 = phi i1 [ %1738, %else2603 ], [ true, %then2602 ]
  br i1 %1739, label %then2611, label %else2612

then2611:                                         ; preds = %continuation2601
  br label %continuation2610

else2612:                                         ; preds = %continuation2601
  %1740 = alloca i32, align 4
  %1741 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1742 = call i32 (ptr, ...) @scanf(ptr %1741, ptr %1740)
  %1743 = load i32, ptr %1740, align 4
  %1744 = icmp eq i32 %1743, 0
  br label %continuation2610

continuation2610:                                 ; preds = %else2612, %then2611
  %1745 = phi i1 [ %1744, %else2612 ], [ true, %then2611 ]
  br i1 %1745, label %then2620, label %else2621

then2620:                                         ; preds = %continuation2610
  br label %continuation2619

else2621:                                         ; preds = %continuation2610
  %1746 = alloca i32, align 4
  %1747 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1748 = call i32 (ptr, ...) @scanf(ptr %1747, ptr %1746)
  %1749 = load i32, ptr %1746, align 4
  %1750 = icmp eq i32 %1749, 0
  br label %continuation2619

continuation2619:                                 ; preds = %else2621, %then2620
  %1751 = phi i1 [ %1750, %else2621 ], [ true, %then2620 ]
  br i1 %1751, label %then2629, label %else2630

then2629:                                         ; preds = %continuation2619
  br label %continuation2628

else2630:                                         ; preds = %continuation2619
  %1752 = alloca i32, align 4
  %1753 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1754 = call i32 (ptr, ...) @scanf(ptr %1753, ptr %1752)
  %1755 = load i32, ptr %1752, align 4
  %1756 = icmp eq i32 %1755, 0
  br label %continuation2628

continuation2628:                                 ; preds = %else2630, %then2629
  %1757 = phi i1 [ %1756, %else2630 ], [ true, %then2629 ]
  br i1 %1757, label %then2638, label %else2639

then2638:                                         ; preds = %continuation2628
  br label %continuation2637

else2639:                                         ; preds = %continuation2628
  %1758 = alloca i32, align 4
  %1759 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1760 = call i32 (ptr, ...) @scanf(ptr %1759, ptr %1758)
  %1761 = load i32, ptr %1758, align 4
  %1762 = icmp eq i32 %1761, 0
  br label %continuation2637

continuation2637:                                 ; preds = %else2639, %then2638
  %1763 = phi i1 [ %1762, %else2639 ], [ true, %then2638 ]
  br i1 %1763, label %then2647, label %else2648

then2647:                                         ; preds = %continuation2637
  br label %continuation2646

else2648:                                         ; preds = %continuation2637
  %1764 = alloca i32, align 4
  %1765 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1766 = call i32 (ptr, ...) @scanf(ptr %1765, ptr %1764)
  %1767 = load i32, ptr %1764, align 4
  %1768 = icmp eq i32 %1767, 0
  br label %continuation2646

continuation2646:                                 ; preds = %else2648, %then2647
  %1769 = phi i1 [ %1768, %else2648 ], [ true, %then2647 ]
  br i1 %1769, label %then2656, label %else2657

then2656:                                         ; preds = %continuation2646
  br label %continuation2655

else2657:                                         ; preds = %continuation2646
  %1770 = alloca i32, align 4
  %1771 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1772 = call i32 (ptr, ...) @scanf(ptr %1771, ptr %1770)
  %1773 = load i32, ptr %1770, align 4
  %1774 = icmp eq i32 %1773, 0
  br label %continuation2655

continuation2655:                                 ; preds = %else2657, %then2656
  %1775 = phi i1 [ %1774, %else2657 ], [ true, %then2656 ]
  br i1 %1775, label %then2665, label %else2666

then2665:                                         ; preds = %continuation2655
  br label %continuation2664

else2666:                                         ; preds = %continuation2655
  %1776 = alloca i32, align 4
  %1777 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1778 = call i32 (ptr, ...) @scanf(ptr %1777, ptr %1776)
  %1779 = load i32, ptr %1776, align 4
  %1780 = icmp eq i32 %1779, 0
  br label %continuation2664

continuation2664:                                 ; preds = %else2666, %then2665
  %1781 = phi i1 [ %1780, %else2666 ], [ true, %then2665 ]
  br i1 %1781, label %then2674, label %else2675

then2674:                                         ; preds = %continuation2664
  br label %continuation2673

else2675:                                         ; preds = %continuation2664
  %1782 = alloca i32, align 4
  %1783 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1784 = call i32 (ptr, ...) @scanf(ptr %1783, ptr %1782)
  %1785 = load i32, ptr %1782, align 4
  %1786 = icmp eq i32 %1785, 0
  br label %continuation2673

continuation2673:                                 ; preds = %else2675, %then2674
  %1787 = phi i1 [ %1786, %else2675 ], [ true, %then2674 ]
  br i1 %1787, label %then2683, label %else2684

then2683:                                         ; preds = %continuation2673
  br label %continuation2682

else2684:                                         ; preds = %continuation2673
  %1788 = alloca i32, align 4
  %1789 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1790 = call i32 (ptr, ...) @scanf(ptr %1789, ptr %1788)
  %1791 = load i32, ptr %1788, align 4
  %1792 = icmp eq i32 %1791, 0
  br label %continuation2682

continuation2682:                                 ; preds = %else2684, %then2683
  %1793 = phi i1 [ %1792, %else2684 ], [ true, %then2683 ]
  br i1 %1793, label %then2692, label %else2693

then2692:                                         ; preds = %continuation2682
  br label %continuation2691

else2693:                                         ; preds = %continuation2682
  %1794 = alloca i32, align 4
  %1795 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1796 = call i32 (ptr, ...) @scanf(ptr %1795, ptr %1794)
  %1797 = load i32, ptr %1794, align 4
  %1798 = icmp eq i32 %1797, 0
  br label %continuation2691

continuation2691:                                 ; preds = %else2693, %then2692
  %1799 = phi i1 [ %1798, %else2693 ], [ true, %then2692 ]
  br i1 %1799, label %then2701, label %else2702

then2701:                                         ; preds = %continuation2691
  br label %continuation2700

else2702:                                         ; preds = %continuation2691
  %1800 = alloca i32, align 4
  %1801 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1802 = call i32 (ptr, ...) @scanf(ptr %1801, ptr %1800)
  %1803 = load i32, ptr %1800, align 4
  %1804 = icmp eq i32 %1803, 0
  br label %continuation2700

continuation2700:                                 ; preds = %else2702, %then2701
  %1805 = phi i1 [ %1804, %else2702 ], [ true, %then2701 ]
  br i1 %1805, label %then2710, label %else2711

then2710:                                         ; preds = %continuation2700
  br label %continuation2709

else2711:                                         ; preds = %continuation2700
  %1806 = alloca i32, align 4
  %1807 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1808 = call i32 (ptr, ...) @scanf(ptr %1807, ptr %1806)
  %1809 = load i32, ptr %1806, align 4
  %1810 = icmp eq i32 %1809, 0
  br label %continuation2709

continuation2709:                                 ; preds = %else2711, %then2710
  %1811 = phi i1 [ %1810, %else2711 ], [ true, %then2710 ]
  br i1 %1811, label %then2719, label %else2720

then2719:                                         ; preds = %continuation2709
  br label %continuation2718

else2720:                                         ; preds = %continuation2709
  %1812 = alloca i32, align 4
  %1813 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1814 = call i32 (ptr, ...) @scanf(ptr %1813, ptr %1812)
  %1815 = load i32, ptr %1812, align 4
  %1816 = icmp eq i32 %1815, 0
  br label %continuation2718

continuation2718:                                 ; preds = %else2720, %then2719
  %1817 = phi i1 [ %1816, %else2720 ], [ true, %then2719 ]
  br i1 %1817, label %then2728, label %else2729

then2728:                                         ; preds = %continuation2718
  br label %continuation2727

else2729:                                         ; preds = %continuation2718
  %1818 = alloca i32, align 4
  %1819 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1820 = call i32 (ptr, ...) @scanf(ptr %1819, ptr %1818)
  %1821 = load i32, ptr %1818, align 4
  %1822 = icmp eq i32 %1821, 0
  br label %continuation2727

continuation2727:                                 ; preds = %else2729, %then2728
  %1823 = phi i1 [ %1822, %else2729 ], [ true, %then2728 ]
  br i1 %1823, label %then2737, label %else2738

then2737:                                         ; preds = %continuation2727
  br label %continuation2736

else2738:                                         ; preds = %continuation2727
  %1824 = alloca i32, align 4
  %1825 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1826 = call i32 (ptr, ...) @scanf(ptr %1825, ptr %1824)
  %1827 = load i32, ptr %1824, align 4
  %1828 = icmp eq i32 %1827, 0
  br label %continuation2736

continuation2736:                                 ; preds = %else2738, %then2737
  %1829 = phi i1 [ %1828, %else2738 ], [ true, %then2737 ]
  br i1 %1829, label %then2746, label %else2747

then2746:                                         ; preds = %continuation2736
  br label %continuation2745

else2747:                                         ; preds = %continuation2736
  %1830 = alloca i32, align 4
  %1831 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1832 = call i32 (ptr, ...) @scanf(ptr %1831, ptr %1830)
  %1833 = load i32, ptr %1830, align 4
  %1834 = icmp eq i32 %1833, 0
  br label %continuation2745

continuation2745:                                 ; preds = %else2747, %then2746
  %1835 = phi i1 [ %1834, %else2747 ], [ true, %then2746 ]
  br i1 %1835, label %then2755, label %else2756

then2755:                                         ; preds = %continuation2745
  br label %continuation2754

else2756:                                         ; preds = %continuation2745
  %1836 = alloca i32, align 4
  %1837 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1838 = call i32 (ptr, ...) @scanf(ptr %1837, ptr %1836)
  %1839 = load i32, ptr %1836, align 4
  %1840 = icmp eq i32 %1839, 0
  br label %continuation2754

continuation2754:                                 ; preds = %else2756, %then2755
  %1841 = phi i1 [ %1840, %else2756 ], [ true, %then2755 ]
  br i1 %1841, label %then2764, label %else2765

then2764:                                         ; preds = %continuation2754
  br label %continuation2763

else2765:                                         ; preds = %continuation2754
  %1842 = alloca i32, align 4
  %1843 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1844 = call i32 (ptr, ...) @scanf(ptr %1843, ptr %1842)
  %1845 = load i32, ptr %1842, align 4
  %1846 = icmp eq i32 %1845, 0
  br label %continuation2763

continuation2763:                                 ; preds = %else2765, %then2764
  %1847 = phi i1 [ %1846, %else2765 ], [ true, %then2764 ]
  br i1 %1847, label %then2773, label %else2774

then2773:                                         ; preds = %continuation2763
  br label %continuation2772

else2774:                                         ; preds = %continuation2763
  %1848 = alloca i32, align 4
  %1849 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1850 = call i32 (ptr, ...) @scanf(ptr %1849, ptr %1848)
  %1851 = load i32, ptr %1848, align 4
  %1852 = icmp eq i32 %1851, 0
  br label %continuation2772

continuation2772:                                 ; preds = %else2774, %then2773
  %1853 = phi i1 [ %1852, %else2774 ], [ true, %then2773 ]
  br i1 %1853, label %then2782, label %else2783

then2782:                                         ; preds = %continuation2772
  br label %continuation2781

else2783:                                         ; preds = %continuation2772
  %1854 = alloca i32, align 4
  %1855 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1856 = call i32 (ptr, ...) @scanf(ptr %1855, ptr %1854)
  %1857 = load i32, ptr %1854, align 4
  %1858 = icmp eq i32 %1857, 0
  br label %continuation2781

continuation2781:                                 ; preds = %else2783, %then2782
  %1859 = phi i1 [ %1858, %else2783 ], [ true, %then2782 ]
  br i1 %1859, label %then2791, label %else2792

then2791:                                         ; preds = %continuation2781
  br label %continuation2790

else2792:                                         ; preds = %continuation2781
  %1860 = alloca i32, align 4
  %1861 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1862 = call i32 (ptr, ...) @scanf(ptr %1861, ptr %1860)
  %1863 = load i32, ptr %1860, align 4
  %1864 = icmp eq i32 %1863, 0
  br label %continuation2790

continuation2790:                                 ; preds = %else2792, %then2791
  %1865 = phi i1 [ %1864, %else2792 ], [ true, %then2791 ]
  br i1 %1865, label %then2800, label %else2801

then2800:                                         ; preds = %continuation2790
  br label %continuation2799

else2801:                                         ; preds = %continuation2790
  %1866 = alloca i32, align 4
  %1867 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1868 = call i32 (ptr, ...) @scanf(ptr %1867, ptr %1866)
  %1869 = load i32, ptr %1866, align 4
  %1870 = icmp eq i32 %1869, 0
  br label %continuation2799

continuation2799:                                 ; preds = %else2801, %then2800
  %1871 = phi i1 [ %1870, %else2801 ], [ true, %then2800 ]
  br i1 %1871, label %then2809, label %else2810

then2809:                                         ; preds = %continuation2799
  br label %continuation2808

else2810:                                         ; preds = %continuation2799
  %1872 = alloca i32, align 4
  %1873 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1874 = call i32 (ptr, ...) @scanf(ptr %1873, ptr %1872)
  %1875 = load i32, ptr %1872, align 4
  %1876 = icmp eq i32 %1875, 0
  br label %continuation2808

continuation2808:                                 ; preds = %else2810, %then2809
  %1877 = phi i1 [ %1876, %else2810 ], [ true, %then2809 ]
  br i1 %1877, label %then2818, label %else2819

then2818:                                         ; preds = %continuation2808
  br label %continuation2817

else2819:                                         ; preds = %continuation2808
  %1878 = alloca i32, align 4
  %1879 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1880 = call i32 (ptr, ...) @scanf(ptr %1879, ptr %1878)
  %1881 = load i32, ptr %1878, align 4
  %1882 = icmp eq i32 %1881, 0
  br label %continuation2817

continuation2817:                                 ; preds = %else2819, %then2818
  %1883 = phi i1 [ %1882, %else2819 ], [ true, %then2818 ]
  br i1 %1883, label %then2827, label %else2828

then2827:                                         ; preds = %continuation2817
  br label %continuation2826

else2828:                                         ; preds = %continuation2817
  %1884 = alloca i32, align 4
  %1885 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1886 = call i32 (ptr, ...) @scanf(ptr %1885, ptr %1884)
  %1887 = load i32, ptr %1884, align 4
  %1888 = icmp eq i32 %1887, 0
  br label %continuation2826

continuation2826:                                 ; preds = %else2828, %then2827
  %1889 = phi i1 [ %1888, %else2828 ], [ true, %then2827 ]
  br i1 %1889, label %then2836, label %else2837

then2836:                                         ; preds = %continuation2826
  br label %continuation2835

else2837:                                         ; preds = %continuation2826
  %1890 = alloca i32, align 4
  %1891 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1892 = call i32 (ptr, ...) @scanf(ptr %1891, ptr %1890)
  %1893 = load i32, ptr %1890, align 4
  %1894 = icmp eq i32 %1893, 0
  br label %continuation2835

continuation2835:                                 ; preds = %else2837, %then2836
  %1895 = phi i1 [ %1894, %else2837 ], [ true, %then2836 ]
  br i1 %1895, label %then2845, label %else2846

then2845:                                         ; preds = %continuation2835
  br label %continuation2844

else2846:                                         ; preds = %continuation2835
  %1896 = alloca i32, align 4
  %1897 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1898 = call i32 (ptr, ...) @scanf(ptr %1897, ptr %1896)
  %1899 = load i32, ptr %1896, align 4
  %1900 = icmp eq i32 %1899, 0
  br label %continuation2844

continuation2844:                                 ; preds = %else2846, %then2845
  %1901 = phi i1 [ %1900, %else2846 ], [ true, %then2845 ]
  br i1 %1901, label %then2854, label %else2855

then2854:                                         ; preds = %continuation2844
  br label %continuation2853

else2855:                                         ; preds = %continuation2844
  %1902 = alloca i32, align 4
  %1903 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1904 = call i32 (ptr, ...) @scanf(ptr %1903, ptr %1902)
  %1905 = load i32, ptr %1902, align 4
  %1906 = icmp eq i32 %1905, 0
  br label %continuation2853

continuation2853:                                 ; preds = %else2855, %then2854
  %1907 = phi i1 [ %1906, %else2855 ], [ true, %then2854 ]
  br i1 %1907, label %then2863, label %else2864

then2863:                                         ; preds = %continuation2853
  br label %continuation2862

else2864:                                         ; preds = %continuation2853
  %1908 = alloca i32, align 4
  %1909 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1910 = call i32 (ptr, ...) @scanf(ptr %1909, ptr %1908)
  %1911 = load i32, ptr %1908, align 4
  %1912 = icmp eq i32 %1911, 0
  br label %continuation2862

continuation2862:                                 ; preds = %else2864, %then2863
  %1913 = phi i1 [ %1912, %else2864 ], [ true, %then2863 ]
  br i1 %1913, label %then2872, label %else2873

then2872:                                         ; preds = %continuation2862
  br label %continuation2871

else2873:                                         ; preds = %continuation2862
  %1914 = alloca i32, align 4
  %1915 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1916 = call i32 (ptr, ...) @scanf(ptr %1915, ptr %1914)
  %1917 = load i32, ptr %1914, align 4
  %1918 = icmp eq i32 %1917, 0
  br label %continuation2871

continuation2871:                                 ; preds = %else2873, %then2872
  %1919 = phi i1 [ %1918, %else2873 ], [ true, %then2872 ]
  br i1 %1919, label %then2881, label %else2882

then2881:                                         ; preds = %continuation2871
  br label %continuation2880

else2882:                                         ; preds = %continuation2871
  %1920 = alloca i32, align 4
  %1921 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1922 = call i32 (ptr, ...) @scanf(ptr %1921, ptr %1920)
  %1923 = load i32, ptr %1920, align 4
  %1924 = icmp eq i32 %1923, 0
  br label %continuation2880

continuation2880:                                 ; preds = %else2882, %then2881
  %1925 = phi i1 [ %1924, %else2882 ], [ true, %then2881 ]
  br i1 %1925, label %then2890, label %else2891

then2890:                                         ; preds = %continuation2880
  br label %continuation2889

else2891:                                         ; preds = %continuation2880
  %1926 = alloca i32, align 4
  %1927 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1928 = call i32 (ptr, ...) @scanf(ptr %1927, ptr %1926)
  %1929 = load i32, ptr %1926, align 4
  %1930 = icmp eq i32 %1929, 0
  br label %continuation2889

continuation2889:                                 ; preds = %else2891, %then2890
  %1931 = phi i1 [ %1930, %else2891 ], [ true, %then2890 ]
  br i1 %1931, label %then2899, label %else2900

then2899:                                         ; preds = %continuation2889
  br label %continuation2898

else2900:                                         ; preds = %continuation2889
  %1932 = alloca i32, align 4
  %1933 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1934 = call i32 (ptr, ...) @scanf(ptr %1933, ptr %1932)
  %1935 = load i32, ptr %1932, align 4
  %1936 = icmp eq i32 %1935, 0
  br label %continuation2898

continuation2898:                                 ; preds = %else2900, %then2899
  %1937 = phi i1 [ %1936, %else2900 ], [ true, %then2899 ]
  br i1 %1937, label %then2908, label %else2909

then2908:                                         ; preds = %continuation2898
  br label %continuation2907

else2909:                                         ; preds = %continuation2898
  %1938 = alloca i32, align 4
  %1939 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1940 = call i32 (ptr, ...) @scanf(ptr %1939, ptr %1938)
  %1941 = load i32, ptr %1938, align 4
  %1942 = icmp eq i32 %1941, 0
  br label %continuation2907

continuation2907:                                 ; preds = %else2909, %then2908
  %1943 = phi i1 [ %1942, %else2909 ], [ true, %then2908 ]
  br i1 %1943, label %then2917, label %else2918

then2917:                                         ; preds = %continuation2907
  br label %continuation2916

else2918:                                         ; preds = %continuation2907
  %1944 = alloca i32, align 4
  %1945 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1946 = call i32 (ptr, ...) @scanf(ptr %1945, ptr %1944)
  %1947 = load i32, ptr %1944, align 4
  %1948 = icmp eq i32 %1947, 0
  br label %continuation2916

continuation2916:                                 ; preds = %else2918, %then2917
  %1949 = phi i1 [ %1948, %else2918 ], [ true, %then2917 ]
  br i1 %1949, label %then2926, label %else2927

then2926:                                         ; preds = %continuation2916
  br label %continuation2925

else2927:                                         ; preds = %continuation2916
  %1950 = alloca i32, align 4
  %1951 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1952 = call i32 (ptr, ...) @scanf(ptr %1951, ptr %1950)
  %1953 = load i32, ptr %1950, align 4
  %1954 = icmp eq i32 %1953, 0
  br label %continuation2925

continuation2925:                                 ; preds = %else2927, %then2926
  %1955 = phi i1 [ %1954, %else2927 ], [ true, %then2926 ]
  br i1 %1955, label %then2935, label %else2936

then2935:                                         ; preds = %continuation2925
  br label %continuation2934

else2936:                                         ; preds = %continuation2925
  %1956 = alloca i32, align 4
  %1957 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1958 = call i32 (ptr, ...) @scanf(ptr %1957, ptr %1956)
  %1959 = load i32, ptr %1956, align 4
  %1960 = icmp eq i32 %1959, 0
  br label %continuation2934

continuation2934:                                 ; preds = %else2936, %then2935
  %1961 = phi i1 [ %1960, %else2936 ], [ true, %then2935 ]
  br i1 %1961, label %then2944, label %else2945

then2944:                                         ; preds = %continuation2934
  br label %continuation2943

else2945:                                         ; preds = %continuation2934
  %1962 = alloca i32, align 4
  %1963 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1964 = call i32 (ptr, ...) @scanf(ptr %1963, ptr %1962)
  %1965 = load i32, ptr %1962, align 4
  %1966 = icmp eq i32 %1965, 0
  br label %continuation2943

continuation2943:                                 ; preds = %else2945, %then2944
  %1967 = phi i1 [ %1966, %else2945 ], [ true, %then2944 ]
  br i1 %1967, label %then2953, label %else2954

then2953:                                         ; preds = %continuation2943
  br label %continuation2952

else2954:                                         ; preds = %continuation2943
  %1968 = alloca i32, align 4
  %1969 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1970 = call i32 (ptr, ...) @scanf(ptr %1969, ptr %1968)
  %1971 = load i32, ptr %1968, align 4
  %1972 = icmp eq i32 %1971, 0
  br label %continuation2952

continuation2952:                                 ; preds = %else2954, %then2953
  %1973 = phi i1 [ %1972, %else2954 ], [ true, %then2953 ]
  br i1 %1973, label %then2962, label %else2963

then2962:                                         ; preds = %continuation2952
  br label %continuation2961

else2963:                                         ; preds = %continuation2952
  %1974 = alloca i32, align 4
  %1975 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1976 = call i32 (ptr, ...) @scanf(ptr %1975, ptr %1974)
  %1977 = load i32, ptr %1974, align 4
  %1978 = icmp eq i32 %1977, 0
  br label %continuation2961

continuation2961:                                 ; preds = %else2963, %then2962
  %1979 = phi i1 [ %1978, %else2963 ], [ true, %then2962 ]
  br i1 %1979, label %then2971, label %else2972

then2971:                                         ; preds = %continuation2961
  br label %continuation2970

else2972:                                         ; preds = %continuation2961
  %1980 = alloca i32, align 4
  %1981 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1982 = call i32 (ptr, ...) @scanf(ptr %1981, ptr %1980)
  %1983 = load i32, ptr %1980, align 4
  %1984 = icmp eq i32 %1983, 0
  br label %continuation2970

continuation2970:                                 ; preds = %else2972, %then2971
  %1985 = phi i1 [ %1984, %else2972 ], [ true, %then2971 ]
  br i1 %1985, label %then2980, label %else2981

then2980:                                         ; preds = %continuation2970
  br label %continuation2979

else2981:                                         ; preds = %continuation2970
  %1986 = alloca i32, align 4
  %1987 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1988 = call i32 (ptr, ...) @scanf(ptr %1987, ptr %1986)
  %1989 = load i32, ptr %1986, align 4
  %1990 = icmp eq i32 %1989, 0
  br label %continuation2979

continuation2979:                                 ; preds = %else2981, %then2980
  %1991 = phi i1 [ %1990, %else2981 ], [ true, %then2980 ]
  br i1 %1991, label %then2989, label %else2990

then2989:                                         ; preds = %continuation2979
  br label %continuation2988

else2990:                                         ; preds = %continuation2979
  %1992 = alloca i32, align 4
  %1993 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %1994 = call i32 (ptr, ...) @scanf(ptr %1993, ptr %1992)
  %1995 = load i32, ptr %1992, align 4
  %1996 = icmp eq i32 %1995, 0
  br label %continuation2988

continuation2988:                                 ; preds = %else2990, %then2989
  %1997 = phi i1 [ %1996, %else2990 ], [ true, %then2989 ]
  br i1 %1997, label %then2998, label %else2999

then2998:                                         ; preds = %continuation2988
  br label %continuation2997

else2999:                                         ; preds = %continuation2988
  %1998 = alloca i32, align 4
  %1999 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2000 = call i32 (ptr, ...) @scanf(ptr %1999, ptr %1998)
  %2001 = load i32, ptr %1998, align 4
  %2002 = icmp eq i32 %2001, 0
  br label %continuation2997

continuation2997:                                 ; preds = %else2999, %then2998
  %2003 = phi i1 [ %2002, %else2999 ], [ true, %then2998 ]
  br i1 %2003, label %then3007, label %else3008

then3007:                                         ; preds = %continuation2997
  br label %continuation3006

else3008:                                         ; preds = %continuation2997
  %2004 = alloca i32, align 4
  %2005 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2006 = call i32 (ptr, ...) @scanf(ptr %2005, ptr %2004)
  %2007 = load i32, ptr %2004, align 4
  %2008 = icmp eq i32 %2007, 0
  br label %continuation3006

continuation3006:                                 ; preds = %else3008, %then3007
  %2009 = phi i1 [ %2008, %else3008 ], [ true, %then3007 ]
  br i1 %2009, label %then3016, label %else3017

then3016:                                         ; preds = %continuation3006
  br label %continuation3015

else3017:                                         ; preds = %continuation3006
  %2010 = alloca i32, align 4
  %2011 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2012 = call i32 (ptr, ...) @scanf(ptr %2011, ptr %2010)
  %2013 = load i32, ptr %2010, align 4
  %2014 = icmp eq i32 %2013, 0
  br label %continuation3015

continuation3015:                                 ; preds = %else3017, %then3016
  %2015 = phi i1 [ %2014, %else3017 ], [ true, %then3016 ]
  br i1 %2015, label %then3025, label %else3026

then3025:                                         ; preds = %continuation3015
  br label %continuation3024

else3026:                                         ; preds = %continuation3015
  %2016 = alloca i32, align 4
  %2017 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2018 = call i32 (ptr, ...) @scanf(ptr %2017, ptr %2016)
  %2019 = load i32, ptr %2016, align 4
  %2020 = icmp eq i32 %2019, 0
  br label %continuation3024

continuation3024:                                 ; preds = %else3026, %then3025
  %2021 = phi i1 [ %2020, %else3026 ], [ true, %then3025 ]
  br i1 %2021, label %then3034, label %else3035

then3034:                                         ; preds = %continuation3024
  br label %continuation3033

else3035:                                         ; preds = %continuation3024
  %2022 = alloca i32, align 4
  %2023 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2024 = call i32 (ptr, ...) @scanf(ptr %2023, ptr %2022)
  %2025 = load i32, ptr %2022, align 4
  %2026 = icmp eq i32 %2025, 0
  br label %continuation3033

continuation3033:                                 ; preds = %else3035, %then3034
  %2027 = phi i1 [ %2026, %else3035 ], [ true, %then3034 ]
  br i1 %2027, label %then3043, label %else3044

then3043:                                         ; preds = %continuation3033
  br label %continuation3042

else3044:                                         ; preds = %continuation3033
  %2028 = alloca i32, align 4
  %2029 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2030 = call i32 (ptr, ...) @scanf(ptr %2029, ptr %2028)
  %2031 = load i32, ptr %2028, align 4
  %2032 = icmp eq i32 %2031, 0
  br label %continuation3042

continuation3042:                                 ; preds = %else3044, %then3043
  %2033 = phi i1 [ %2032, %else3044 ], [ true, %then3043 ]
  br i1 %2033, label %then3052, label %else3053

then3052:                                         ; preds = %continuation3042
  br label %continuation3051

else3053:                                         ; preds = %continuation3042
  %2034 = alloca i32, align 4
  %2035 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2036 = call i32 (ptr, ...) @scanf(ptr %2035, ptr %2034)
  %2037 = load i32, ptr %2034, align 4
  %2038 = icmp eq i32 %2037, 0
  br label %continuation3051

continuation3051:                                 ; preds = %else3053, %then3052
  %2039 = phi i1 [ %2038, %else3053 ], [ true, %then3052 ]
  br i1 %2039, label %then3061, label %else3062

then3061:                                         ; preds = %continuation3051
  br label %continuation3060

else3062:                                         ; preds = %continuation3051
  %2040 = alloca i32, align 4
  %2041 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2042 = call i32 (ptr, ...) @scanf(ptr %2041, ptr %2040)
  %2043 = load i32, ptr %2040, align 4
  %2044 = icmp eq i32 %2043, 0
  br label %continuation3060

continuation3060:                                 ; preds = %else3062, %then3061
  %2045 = phi i1 [ %2044, %else3062 ], [ true, %then3061 ]
  br i1 %2045, label %then3070, label %else3071

then3070:                                         ; preds = %continuation3060
  br label %continuation3069

else3071:                                         ; preds = %continuation3060
  %2046 = alloca i32, align 4
  %2047 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2048 = call i32 (ptr, ...) @scanf(ptr %2047, ptr %2046)
  %2049 = load i32, ptr %2046, align 4
  %2050 = icmp eq i32 %2049, 0
  br label %continuation3069

continuation3069:                                 ; preds = %else3071, %then3070
  %2051 = phi i1 [ %2050, %else3071 ], [ true, %then3070 ]
  br i1 %2051, label %then3079, label %else3080

then3079:                                         ; preds = %continuation3069
  br label %continuation3078

else3080:                                         ; preds = %continuation3069
  %2052 = alloca i32, align 4
  %2053 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2054 = call i32 (ptr, ...) @scanf(ptr %2053, ptr %2052)
  %2055 = load i32, ptr %2052, align 4
  %2056 = icmp eq i32 %2055, 0
  br label %continuation3078

continuation3078:                                 ; preds = %else3080, %then3079
  %2057 = phi i1 [ %2056, %else3080 ], [ true, %then3079 ]
  br i1 %2057, label %then3088, label %else3089

then3088:                                         ; preds = %continuation3078
  br label %continuation3087

else3089:                                         ; preds = %continuation3078
  %2058 = alloca i32, align 4
  %2059 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2060 = call i32 (ptr, ...) @scanf(ptr %2059, ptr %2058)
  %2061 = load i32, ptr %2058, align 4
  %2062 = icmp eq i32 %2061, 0
  br label %continuation3087

continuation3087:                                 ; preds = %else3089, %then3088
  %2063 = phi i1 [ %2062, %else3089 ], [ true, %then3088 ]
  br i1 %2063, label %then3097, label %else3098

then3097:                                         ; preds = %continuation3087
  br label %continuation3096

else3098:                                         ; preds = %continuation3087
  %2064 = alloca i32, align 4
  %2065 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2066 = call i32 (ptr, ...) @scanf(ptr %2065, ptr %2064)
  %2067 = load i32, ptr %2064, align 4
  %2068 = icmp eq i32 %2067, 0
  br label %continuation3096

continuation3096:                                 ; preds = %else3098, %then3097
  %2069 = phi i1 [ %2068, %else3098 ], [ true, %then3097 ]
  br i1 %2069, label %then3106, label %else3107

then3106:                                         ; preds = %continuation3096
  br label %continuation3105

else3107:                                         ; preds = %continuation3096
  %2070 = alloca i32, align 4
  %2071 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2072 = call i32 (ptr, ...) @scanf(ptr %2071, ptr %2070)
  %2073 = load i32, ptr %2070, align 4
  %2074 = icmp eq i32 %2073, 0
  br label %continuation3105

continuation3105:                                 ; preds = %else3107, %then3106
  %2075 = phi i1 [ %2074, %else3107 ], [ true, %then3106 ]
  br i1 %2075, label %then3115, label %else3116

then3115:                                         ; preds = %continuation3105
  br label %continuation3114

else3116:                                         ; preds = %continuation3105
  %2076 = alloca i32, align 4
  %2077 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2078 = call i32 (ptr, ...) @scanf(ptr %2077, ptr %2076)
  %2079 = load i32, ptr %2076, align 4
  %2080 = icmp eq i32 %2079, 0
  br label %continuation3114

continuation3114:                                 ; preds = %else3116, %then3115
  %2081 = phi i1 [ %2080, %else3116 ], [ true, %then3115 ]
  br i1 %2081, label %then3124, label %else3125

then3124:                                         ; preds = %continuation3114
  br label %continuation3123

else3125:                                         ; preds = %continuation3114
  %2082 = alloca i32, align 4
  %2083 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2084 = call i32 (ptr, ...) @scanf(ptr %2083, ptr %2082)
  %2085 = load i32, ptr %2082, align 4
  %2086 = icmp eq i32 %2085, 0
  br label %continuation3123

continuation3123:                                 ; preds = %else3125, %then3124
  %2087 = phi i1 [ %2086, %else3125 ], [ true, %then3124 ]
  br i1 %2087, label %then3133, label %else3134

then3133:                                         ; preds = %continuation3123
  br label %continuation3132

else3134:                                         ; preds = %continuation3123
  %2088 = alloca i32, align 4
  %2089 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2090 = call i32 (ptr, ...) @scanf(ptr %2089, ptr %2088)
  %2091 = load i32, ptr %2088, align 4
  %2092 = icmp eq i32 %2091, 0
  br label %continuation3132

continuation3132:                                 ; preds = %else3134, %then3133
  %2093 = phi i1 [ %2092, %else3134 ], [ true, %then3133 ]
  br i1 %2093, label %then3142, label %else3143

then3142:                                         ; preds = %continuation3132
  br label %continuation3141

else3143:                                         ; preds = %continuation3132
  %2094 = alloca i32, align 4
  %2095 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2096 = call i32 (ptr, ...) @scanf(ptr %2095, ptr %2094)
  %2097 = load i32, ptr %2094, align 4
  %2098 = icmp eq i32 %2097, 0
  br label %continuation3141

continuation3141:                                 ; preds = %else3143, %then3142
  %2099 = phi i1 [ %2098, %else3143 ], [ true, %then3142 ]
  br i1 %2099, label %then3151, label %else3152

then3151:                                         ; preds = %continuation3141
  br label %continuation3150

else3152:                                         ; preds = %continuation3141
  %2100 = alloca i32, align 4
  %2101 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2102 = call i32 (ptr, ...) @scanf(ptr %2101, ptr %2100)
  %2103 = load i32, ptr %2100, align 4
  %2104 = icmp eq i32 %2103, 0
  br label %continuation3150

continuation3150:                                 ; preds = %else3152, %then3151
  %2105 = phi i1 [ %2104, %else3152 ], [ true, %then3151 ]
  br i1 %2105, label %then3160, label %else3161

then3160:                                         ; preds = %continuation3150
  br label %continuation3159

else3161:                                         ; preds = %continuation3150
  %2106 = alloca i32, align 4
  %2107 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2108 = call i32 (ptr, ...) @scanf(ptr %2107, ptr %2106)
  %2109 = load i32, ptr %2106, align 4
  %2110 = icmp eq i32 %2109, 0
  br label %continuation3159

continuation3159:                                 ; preds = %else3161, %then3160
  %2111 = phi i1 [ %2110, %else3161 ], [ true, %then3160 ]
  br i1 %2111, label %then3169, label %else3170

then3169:                                         ; preds = %continuation3159
  br label %continuation3168

else3170:                                         ; preds = %continuation3159
  %2112 = alloca i32, align 4
  %2113 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2114 = call i32 (ptr, ...) @scanf(ptr %2113, ptr %2112)
  %2115 = load i32, ptr %2112, align 4
  %2116 = icmp eq i32 %2115, 0
  br label %continuation3168

continuation3168:                                 ; preds = %else3170, %then3169
  %2117 = phi i1 [ %2116, %else3170 ], [ true, %then3169 ]
  br i1 %2117, label %then3178, label %else3179

then3178:                                         ; preds = %continuation3168
  br label %continuation3177

else3179:                                         ; preds = %continuation3168
  %2118 = alloca i32, align 4
  %2119 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2120 = call i32 (ptr, ...) @scanf(ptr %2119, ptr %2118)
  %2121 = load i32, ptr %2118, align 4
  %2122 = icmp eq i32 %2121, 0
  br label %continuation3177

continuation3177:                                 ; preds = %else3179, %then3178
  %2123 = phi i1 [ %2122, %else3179 ], [ true, %then3178 ]
  br i1 %2123, label %then3187, label %else3188

then3187:                                         ; preds = %continuation3177
  br label %continuation3186

else3188:                                         ; preds = %continuation3177
  %2124 = alloca i32, align 4
  %2125 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2126 = call i32 (ptr, ...) @scanf(ptr %2125, ptr %2124)
  %2127 = load i32, ptr %2124, align 4
  %2128 = icmp eq i32 %2127, 0
  br label %continuation3186

continuation3186:                                 ; preds = %else3188, %then3187
  %2129 = phi i1 [ %2128, %else3188 ], [ true, %then3187 ]
  br i1 %2129, label %then3196, label %else3197

then3196:                                         ; preds = %continuation3186
  br label %continuation3195

else3197:                                         ; preds = %continuation3186
  %2130 = alloca i32, align 4
  %2131 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2132 = call i32 (ptr, ...) @scanf(ptr %2131, ptr %2130)
  %2133 = load i32, ptr %2130, align 4
  %2134 = icmp eq i32 %2133, 0
  br label %continuation3195

continuation3195:                                 ; preds = %else3197, %then3196
  %2135 = phi i1 [ %2134, %else3197 ], [ true, %then3196 ]
  br i1 %2135, label %then3205, label %else3206

then3205:                                         ; preds = %continuation3195
  br label %continuation3204

else3206:                                         ; preds = %continuation3195
  %2136 = alloca i32, align 4
  %2137 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2138 = call i32 (ptr, ...) @scanf(ptr %2137, ptr %2136)
  %2139 = load i32, ptr %2136, align 4
  %2140 = icmp eq i32 %2139, 0
  br label %continuation3204

continuation3204:                                 ; preds = %else3206, %then3205
  %2141 = phi i1 [ %2140, %else3206 ], [ true, %then3205 ]
  br i1 %2141, label %then3214, label %else3215

then3214:                                         ; preds = %continuation3204
  br label %continuation3213

else3215:                                         ; preds = %continuation3204
  %2142 = alloca i32, align 4
  %2143 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2144 = call i32 (ptr, ...) @scanf(ptr %2143, ptr %2142)
  %2145 = load i32, ptr %2142, align 4
  %2146 = icmp eq i32 %2145, 0
  br label %continuation3213

continuation3213:                                 ; preds = %else3215, %then3214
  %2147 = phi i1 [ %2146, %else3215 ], [ true, %then3214 ]
  br i1 %2147, label %then3223, label %else3224

then3223:                                         ; preds = %continuation3213
  br label %continuation3222

else3224:                                         ; preds = %continuation3213
  %2148 = alloca i32, align 4
  %2149 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2150 = call i32 (ptr, ...) @scanf(ptr %2149, ptr %2148)
  %2151 = load i32, ptr %2148, align 4
  %2152 = icmp eq i32 %2151, 0
  br label %continuation3222

continuation3222:                                 ; preds = %else3224, %then3223
  %2153 = phi i1 [ %2152, %else3224 ], [ true, %then3223 ]
  br i1 %2153, label %then3232, label %else3233

then3232:                                         ; preds = %continuation3222
  br label %continuation3231

else3233:                                         ; preds = %continuation3222
  %2154 = alloca i32, align 4
  %2155 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2156 = call i32 (ptr, ...) @scanf(ptr %2155, ptr %2154)
  %2157 = load i32, ptr %2154, align 4
  %2158 = icmp eq i32 %2157, 0
  br label %continuation3231

continuation3231:                                 ; preds = %else3233, %then3232
  %2159 = phi i1 [ %2158, %else3233 ], [ true, %then3232 ]
  br i1 %2159, label %then3241, label %else3242

then3241:                                         ; preds = %continuation3231
  br label %continuation3240

else3242:                                         ; preds = %continuation3231
  %2160 = alloca i32, align 4
  %2161 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2162 = call i32 (ptr, ...) @scanf(ptr %2161, ptr %2160)
  %2163 = load i32, ptr %2160, align 4
  %2164 = icmp eq i32 %2163, 0
  br label %continuation3240

continuation3240:                                 ; preds = %else3242, %then3241
  %2165 = phi i1 [ %2164, %else3242 ], [ true, %then3241 ]
  br i1 %2165, label %then3250, label %else3251

then3250:                                         ; preds = %continuation3240
  br label %continuation3249

else3251:                                         ; preds = %continuation3240
  %2166 = alloca i32, align 4
  %2167 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2168 = call i32 (ptr, ...) @scanf(ptr %2167, ptr %2166)
  %2169 = load i32, ptr %2166, align 4
  %2170 = icmp eq i32 %2169, 0
  br label %continuation3249

continuation3249:                                 ; preds = %else3251, %then3250
  %2171 = phi i1 [ %2170, %else3251 ], [ true, %then3250 ]
  br i1 %2171, label %then3259, label %else3260

then3259:                                         ; preds = %continuation3249
  br label %continuation3258

else3260:                                         ; preds = %continuation3249
  %2172 = alloca i32, align 4
  %2173 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2174 = call i32 (ptr, ...) @scanf(ptr %2173, ptr %2172)
  %2175 = load i32, ptr %2172, align 4
  %2176 = icmp eq i32 %2175, 0
  br label %continuation3258

continuation3258:                                 ; preds = %else3260, %then3259
  %2177 = phi i1 [ %2176, %else3260 ], [ true, %then3259 ]
  br i1 %2177, label %then3268, label %else3269

then3268:                                         ; preds = %continuation3258
  br label %continuation3267

else3269:                                         ; preds = %continuation3258
  %2178 = alloca i32, align 4
  %2179 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2180 = call i32 (ptr, ...) @scanf(ptr %2179, ptr %2178)
  %2181 = load i32, ptr %2178, align 4
  %2182 = icmp eq i32 %2181, 0
  br label %continuation3267

continuation3267:                                 ; preds = %else3269, %then3268
  %2183 = phi i1 [ %2182, %else3269 ], [ true, %then3268 ]
  br i1 %2183, label %then3277, label %else3278

then3277:                                         ; preds = %continuation3267
  br label %continuation3276

else3278:                                         ; preds = %continuation3267
  %2184 = alloca i32, align 4
  %2185 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2186 = call i32 (ptr, ...) @scanf(ptr %2185, ptr %2184)
  %2187 = load i32, ptr %2184, align 4
  %2188 = icmp eq i32 %2187, 0
  br label %continuation3276

continuation3276:                                 ; preds = %else3278, %then3277
  %2189 = phi i1 [ %2188, %else3278 ], [ true, %then3277 ]
  br i1 %2189, label %then3286, label %else3287

then3286:                                         ; preds = %continuation3276
  br label %continuation3285

else3287:                                         ; preds = %continuation3276
  %2190 = alloca i32, align 4
  %2191 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2192 = call i32 (ptr, ...) @scanf(ptr %2191, ptr %2190)
  %2193 = load i32, ptr %2190, align 4
  %2194 = icmp eq i32 %2193, 0
  br label %continuation3285

continuation3285:                                 ; preds = %else3287, %then3286
  %2195 = phi i1 [ %2194, %else3287 ], [ true, %then3286 ]
  br i1 %2195, label %then3295, label %else3296

then3295:                                         ; preds = %continuation3285
  br label %continuation3294

else3296:                                         ; preds = %continuation3285
  %2196 = alloca i32, align 4
  %2197 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2198 = call i32 (ptr, ...) @scanf(ptr %2197, ptr %2196)
  %2199 = load i32, ptr %2196, align 4
  %2200 = icmp eq i32 %2199, 0
  br label %continuation3294

continuation3294:                                 ; preds = %else3296, %then3295
  %2201 = phi i1 [ %2200, %else3296 ], [ true, %then3295 ]
  br i1 %2201, label %then3304, label %else3305

then3304:                                         ; preds = %continuation3294
  br label %continuation3303

else3305:                                         ; preds = %continuation3294
  %2202 = alloca i32, align 4
  %2203 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2204 = call i32 (ptr, ...) @scanf(ptr %2203, ptr %2202)
  %2205 = load i32, ptr %2202, align 4
  %2206 = icmp eq i32 %2205, 0
  br label %continuation3303

continuation3303:                                 ; preds = %else3305, %then3304
  %2207 = phi i1 [ %2206, %else3305 ], [ true, %then3304 ]
  br i1 %2207, label %then3313, label %else3314

then3313:                                         ; preds = %continuation3303
  br label %continuation3312

else3314:                                         ; preds = %continuation3303
  %2208 = alloca i32, align 4
  %2209 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2210 = call i32 (ptr, ...) @scanf(ptr %2209, ptr %2208)
  %2211 = load i32, ptr %2208, align 4
  %2212 = icmp eq i32 %2211, 0
  br label %continuation3312

continuation3312:                                 ; preds = %else3314, %then3313
  %2213 = phi i1 [ %2212, %else3314 ], [ true, %then3313 ]
  br i1 %2213, label %then3322, label %else3323

then3322:                                         ; preds = %continuation3312
  br label %continuation3321

else3323:                                         ; preds = %continuation3312
  %2214 = alloca i32, align 4
  %2215 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2216 = call i32 (ptr, ...) @scanf(ptr %2215, ptr %2214)
  %2217 = load i32, ptr %2214, align 4
  %2218 = icmp eq i32 %2217, 0
  br label %continuation3321

continuation3321:                                 ; preds = %else3323, %then3322
  %2219 = phi i1 [ %2218, %else3323 ], [ true, %then3322 ]
  br i1 %2219, label %then3331, label %else3332

then3331:                                         ; preds = %continuation3321
  br label %continuation3330

else3332:                                         ; preds = %continuation3321
  %2220 = alloca i32, align 4
  %2221 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2222 = call i32 (ptr, ...) @scanf(ptr %2221, ptr %2220)
  %2223 = load i32, ptr %2220, align 4
  %2224 = icmp eq i32 %2223, 0
  br label %continuation3330

continuation3330:                                 ; preds = %else3332, %then3331
  %2225 = phi i1 [ %2224, %else3332 ], [ true, %then3331 ]
  br i1 %2225, label %then3340, label %else3341

then3340:                                         ; preds = %continuation3330
  br label %continuation3339

else3341:                                         ; preds = %continuation3330
  %2226 = alloca i32, align 4
  %2227 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2228 = call i32 (ptr, ...) @scanf(ptr %2227, ptr %2226)
  %2229 = load i32, ptr %2226, align 4
  %2230 = icmp eq i32 %2229, 0
  br label %continuation3339

continuation3339:                                 ; preds = %else3341, %then3340
  %2231 = phi i1 [ %2230, %else3341 ], [ true, %then3340 ]
  br i1 %2231, label %then3349, label %else3350

then3349:                                         ; preds = %continuation3339
  br label %continuation3348

else3350:                                         ; preds = %continuation3339
  %2232 = alloca i32, align 4
  %2233 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2234 = call i32 (ptr, ...) @scanf(ptr %2233, ptr %2232)
  %2235 = load i32, ptr %2232, align 4
  %2236 = icmp eq i32 %2235, 0
  br label %continuation3348

continuation3348:                                 ; preds = %else3350, %then3349
  %2237 = phi i1 [ %2236, %else3350 ], [ true, %then3349 ]
  br i1 %2237, label %then3358, label %else3359

then3358:                                         ; preds = %continuation3348
  br label %continuation3357

else3359:                                         ; preds = %continuation3348
  %2238 = alloca i32, align 4
  %2239 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2240 = call i32 (ptr, ...) @scanf(ptr %2239, ptr %2238)
  %2241 = load i32, ptr %2238, align 4
  %2242 = icmp eq i32 %2241, 0
  br label %continuation3357

continuation3357:                                 ; preds = %else3359, %then3358
  %2243 = phi i1 [ %2242, %else3359 ], [ true, %then3358 ]
  br i1 %2243, label %then3367, label %else3368

then3367:                                         ; preds = %continuation3357
  br label %continuation3366

else3368:                                         ; preds = %continuation3357
  %2244 = alloca i32, align 4
  %2245 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2246 = call i32 (ptr, ...) @scanf(ptr %2245, ptr %2244)
  %2247 = load i32, ptr %2244, align 4
  %2248 = icmp eq i32 %2247, 0
  br label %continuation3366

continuation3366:                                 ; preds = %else3368, %then3367
  %2249 = phi i1 [ %2248, %else3368 ], [ true, %then3367 ]
  br i1 %2249, label %then3376, label %else3377

then3376:                                         ; preds = %continuation3366
  br label %continuation3375

else3377:                                         ; preds = %continuation3366
  %2250 = alloca i32, align 4
  %2251 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2252 = call i32 (ptr, ...) @scanf(ptr %2251, ptr %2250)
  %2253 = load i32, ptr %2250, align 4
  %2254 = icmp eq i32 %2253, 0
  br label %continuation3375

continuation3375:                                 ; preds = %else3377, %then3376
  %2255 = phi i1 [ %2254, %else3377 ], [ true, %then3376 ]
  br i1 %2255, label %then3385, label %else3386

then3385:                                         ; preds = %continuation3375
  br label %continuation3384

else3386:                                         ; preds = %continuation3375
  %2256 = alloca i32, align 4
  %2257 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2258 = call i32 (ptr, ...) @scanf(ptr %2257, ptr %2256)
  %2259 = load i32, ptr %2256, align 4
  %2260 = icmp eq i32 %2259, 0
  br label %continuation3384

continuation3384:                                 ; preds = %else3386, %then3385
  %2261 = phi i1 [ %2260, %else3386 ], [ true, %then3385 ]
  br i1 %2261, label %then3394, label %else3395

then3394:                                         ; preds = %continuation3384
  br label %continuation3393

else3395:                                         ; preds = %continuation3384
  %2262 = alloca i32, align 4
  %2263 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2264 = call i32 (ptr, ...) @scanf(ptr %2263, ptr %2262)
  %2265 = load i32, ptr %2262, align 4
  %2266 = icmp eq i32 %2265, 0
  br label %continuation3393

continuation3393:                                 ; preds = %else3395, %then3394
  %2267 = phi i1 [ %2266, %else3395 ], [ true, %then3394 ]
  br i1 %2267, label %then3403, label %else3404

then3403:                                         ; preds = %continuation3393
  br label %continuation3402

else3404:                                         ; preds = %continuation3393
  %2268 = alloca i32, align 4
  %2269 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2270 = call i32 (ptr, ...) @scanf(ptr %2269, ptr %2268)
  %2271 = load i32, ptr %2268, align 4
  %2272 = icmp eq i32 %2271, 0
  br label %continuation3402

continuation3402:                                 ; preds = %else3404, %then3403
  %2273 = phi i1 [ %2272, %else3404 ], [ true, %then3403 ]
  br i1 %2273, label %then3412, label %else3413

then3412:                                         ; preds = %continuation3402
  br label %continuation3411

else3413:                                         ; preds = %continuation3402
  %2274 = alloca i32, align 4
  %2275 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2276 = call i32 (ptr, ...) @scanf(ptr %2275, ptr %2274)
  %2277 = load i32, ptr %2274, align 4
  %2278 = icmp eq i32 %2277, 0
  br label %continuation3411

continuation3411:                                 ; preds = %else3413, %then3412
  %2279 = phi i1 [ %2278, %else3413 ], [ true, %then3412 ]
  br i1 %2279, label %then3421, label %else3422

then3421:                                         ; preds = %continuation3411
  br label %continuation3420

else3422:                                         ; preds = %continuation3411
  %2280 = alloca i32, align 4
  %2281 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2282 = call i32 (ptr, ...) @scanf(ptr %2281, ptr %2280)
  %2283 = load i32, ptr %2280, align 4
  %2284 = icmp eq i32 %2283, 0
  br label %continuation3420

continuation3420:                                 ; preds = %else3422, %then3421
  %2285 = phi i1 [ %2284, %else3422 ], [ true, %then3421 ]
  br i1 %2285, label %then3430, label %else3431

then3430:                                         ; preds = %continuation3420
  br label %continuation3429

else3431:                                         ; preds = %continuation3420
  %2286 = alloca i32, align 4
  %2287 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2288 = call i32 (ptr, ...) @scanf(ptr %2287, ptr %2286)
  %2289 = load i32, ptr %2286, align 4
  %2290 = icmp eq i32 %2289, 0
  br label %continuation3429

continuation3429:                                 ; preds = %else3431, %then3430
  %2291 = phi i1 [ %2290, %else3431 ], [ true, %then3430 ]
  br i1 %2291, label %then3439, label %else3440

then3439:                                         ; preds = %continuation3429
  br label %continuation3438

else3440:                                         ; preds = %continuation3429
  %2292 = alloca i32, align 4
  %2293 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2294 = call i32 (ptr, ...) @scanf(ptr %2293, ptr %2292)
  %2295 = load i32, ptr %2292, align 4
  %2296 = icmp eq i32 %2295, 0
  br label %continuation3438

continuation3438:                                 ; preds = %else3440, %then3439
  %2297 = phi i1 [ %2296, %else3440 ], [ true, %then3439 ]
  br i1 %2297, label %then3448, label %else3449

then3448:                                         ; preds = %continuation3438
  br label %continuation3447

else3449:                                         ; preds = %continuation3438
  %2298 = alloca i32, align 4
  %2299 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2300 = call i32 (ptr, ...) @scanf(ptr %2299, ptr %2298)
  %2301 = load i32, ptr %2298, align 4
  %2302 = icmp eq i32 %2301, 0
  br label %continuation3447

continuation3447:                                 ; preds = %else3449, %then3448
  %2303 = phi i1 [ %2302, %else3449 ], [ true, %then3448 ]
  br i1 %2303, label %then3457, label %else3458

then3457:                                         ; preds = %continuation3447
  br label %continuation3456

else3458:                                         ; preds = %continuation3447
  %2304 = alloca i32, align 4
  %2305 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2306 = call i32 (ptr, ...) @scanf(ptr %2305, ptr %2304)
  %2307 = load i32, ptr %2304, align 4
  %2308 = icmp eq i32 %2307, 0
  br label %continuation3456

continuation3456:                                 ; preds = %else3458, %then3457
  %2309 = phi i1 [ %2308, %else3458 ], [ true, %then3457 ]
  br i1 %2309, label %then3466, label %else3467

then3466:                                         ; preds = %continuation3456
  br label %continuation3465

else3467:                                         ; preds = %continuation3456
  %2310 = alloca i32, align 4
  %2311 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2312 = call i32 (ptr, ...) @scanf(ptr %2311, ptr %2310)
  %2313 = load i32, ptr %2310, align 4
  %2314 = icmp eq i32 %2313, 0
  br label %continuation3465

continuation3465:                                 ; preds = %else3467, %then3466
  %2315 = phi i1 [ %2314, %else3467 ], [ true, %then3466 ]
  br i1 %2315, label %then3475, label %else3476

then3475:                                         ; preds = %continuation3465
  br label %continuation3474

else3476:                                         ; preds = %continuation3465
  %2316 = alloca i32, align 4
  %2317 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2318 = call i32 (ptr, ...) @scanf(ptr %2317, ptr %2316)
  %2319 = load i32, ptr %2316, align 4
  %2320 = icmp eq i32 %2319, 0
  br label %continuation3474

continuation3474:                                 ; preds = %else3476, %then3475
  %2321 = phi i1 [ %2320, %else3476 ], [ true, %then3475 ]
  br i1 %2321, label %then3484, label %else3485

then3484:                                         ; preds = %continuation3474
  br label %continuation3483

else3485:                                         ; preds = %continuation3474
  %2322 = alloca i32, align 4
  %2323 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2324 = call i32 (ptr, ...) @scanf(ptr %2323, ptr %2322)
  %2325 = load i32, ptr %2322, align 4
  %2326 = icmp eq i32 %2325, 0
  br label %continuation3483

continuation3483:                                 ; preds = %else3485, %then3484
  %2327 = phi i1 [ %2326, %else3485 ], [ true, %then3484 ]
  br i1 %2327, label %then3493, label %else3494

then3493:                                         ; preds = %continuation3483
  br label %continuation3492

else3494:                                         ; preds = %continuation3483
  %2328 = alloca i32, align 4
  %2329 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2330 = call i32 (ptr, ...) @scanf(ptr %2329, ptr %2328)
  %2331 = load i32, ptr %2328, align 4
  %2332 = icmp eq i32 %2331, 0
  br label %continuation3492

continuation3492:                                 ; preds = %else3494, %then3493
  %2333 = phi i1 [ %2332, %else3494 ], [ true, %then3493 ]
  br i1 %2333, label %then3502, label %else3503

then3502:                                         ; preds = %continuation3492
  br label %continuation3501

else3503:                                         ; preds = %continuation3492
  %2334 = alloca i32, align 4
  %2335 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2336 = call i32 (ptr, ...) @scanf(ptr %2335, ptr %2334)
  %2337 = load i32, ptr %2334, align 4
  %2338 = icmp eq i32 %2337, 0
  br label %continuation3501

continuation3501:                                 ; preds = %else3503, %then3502
  %2339 = phi i1 [ %2338, %else3503 ], [ true, %then3502 ]
  br i1 %2339, label %then3511, label %else3512

then3511:                                         ; preds = %continuation3501
  br label %continuation3510

else3512:                                         ; preds = %continuation3501
  %2340 = alloca i32, align 4
  %2341 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2342 = call i32 (ptr, ...) @scanf(ptr %2341, ptr %2340)
  %2343 = load i32, ptr %2340, align 4
  %2344 = icmp eq i32 %2343, 0
  br label %continuation3510

continuation3510:                                 ; preds = %else3512, %then3511
  %2345 = phi i1 [ %2344, %else3512 ], [ true, %then3511 ]
  br i1 %2345, label %then3520, label %else3521

then3520:                                         ; preds = %continuation3510
  br label %continuation3519

else3521:                                         ; preds = %continuation3510
  %2346 = alloca i32, align 4
  %2347 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2348 = call i32 (ptr, ...) @scanf(ptr %2347, ptr %2346)
  %2349 = load i32, ptr %2346, align 4
  %2350 = icmp eq i32 %2349, 0
  br label %continuation3519

continuation3519:                                 ; preds = %else3521, %then3520
  %2351 = phi i1 [ %2350, %else3521 ], [ true, %then3520 ]
  br i1 %2351, label %then3529, label %else3530

then3529:                                         ; preds = %continuation3519
  br label %continuation3528

else3530:                                         ; preds = %continuation3519
  %2352 = alloca i32, align 4
  %2353 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2354 = call i32 (ptr, ...) @scanf(ptr %2353, ptr %2352)
  %2355 = load i32, ptr %2352, align 4
  %2356 = icmp eq i32 %2355, 0
  br label %continuation3528

continuation3528:                                 ; preds = %else3530, %then3529
  %2357 = phi i1 [ %2356, %else3530 ], [ true, %then3529 ]
  br i1 %2357, label %then3538, label %else3539

then3538:                                         ; preds = %continuation3528
  br label %continuation3537

else3539:                                         ; preds = %continuation3528
  %2358 = alloca i32, align 4
  %2359 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2360 = call i32 (ptr, ...) @scanf(ptr %2359, ptr %2358)
  %2361 = load i32, ptr %2358, align 4
  %2362 = icmp eq i32 %2361, 0
  br label %continuation3537

continuation3537:                                 ; preds = %else3539, %then3538
  %2363 = phi i1 [ %2362, %else3539 ], [ true, %then3538 ]
  br i1 %2363, label %then3547, label %else3548

then3547:                                         ; preds = %continuation3537
  br label %continuation3546

else3548:                                         ; preds = %continuation3537
  %2364 = alloca i32, align 4
  %2365 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2366 = call i32 (ptr, ...) @scanf(ptr %2365, ptr %2364)
  %2367 = load i32, ptr %2364, align 4
  %2368 = icmp eq i32 %2367, 0
  br label %continuation3546

continuation3546:                                 ; preds = %else3548, %then3547
  %2369 = phi i1 [ %2368, %else3548 ], [ true, %then3547 ]
  br i1 %2369, label %then3556, label %else3557

then3556:                                         ; preds = %continuation3546
  br label %continuation3555

else3557:                                         ; preds = %continuation3546
  %2370 = alloca i32, align 4
  %2371 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2372 = call i32 (ptr, ...) @scanf(ptr %2371, ptr %2370)
  %2373 = load i32, ptr %2370, align 4
  %2374 = icmp eq i32 %2373, 0
  br label %continuation3555

continuation3555:                                 ; preds = %else3557, %then3556
  %2375 = phi i1 [ %2374, %else3557 ], [ true, %then3556 ]
  br i1 %2375, label %then3565, label %else3566

then3565:                                         ; preds = %continuation3555
  br label %continuation3564

else3566:                                         ; preds = %continuation3555
  %2376 = alloca i32, align 4
  %2377 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2378 = call i32 (ptr, ...) @scanf(ptr %2377, ptr %2376)
  %2379 = load i32, ptr %2376, align 4
  %2380 = icmp eq i32 %2379, 0
  br label %continuation3564

continuation3564:                                 ; preds = %else3566, %then3565
  %2381 = phi i1 [ %2380, %else3566 ], [ true, %then3565 ]
  br i1 %2381, label %then3574, label %else3575

then3574:                                         ; preds = %continuation3564
  br label %continuation3573

else3575:                                         ; preds = %continuation3564
  %2382 = alloca i32, align 4
  %2383 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2384 = call i32 (ptr, ...) @scanf(ptr %2383, ptr %2382)
  %2385 = load i32, ptr %2382, align 4
  %2386 = icmp eq i32 %2385, 0
  br label %continuation3573

continuation3573:                                 ; preds = %else3575, %then3574
  %2387 = phi i1 [ %2386, %else3575 ], [ true, %then3574 ]
  br i1 %2387, label %then3583, label %else3584

then3583:                                         ; preds = %continuation3573
  br label %continuation3582

else3584:                                         ; preds = %continuation3573
  %2388 = alloca i32, align 4
  %2389 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2390 = call i32 (ptr, ...) @scanf(ptr %2389, ptr %2388)
  %2391 = load i32, ptr %2388, align 4
  %2392 = icmp eq i32 %2391, 0
  br label %continuation3582

continuation3582:                                 ; preds = %else3584, %then3583
  %2393 = phi i1 [ %2392, %else3584 ], [ true, %then3583 ]
  br i1 %2393, label %then3592, label %else3593

then3592:                                         ; preds = %continuation3582
  br label %continuation3591

else3593:                                         ; preds = %continuation3582
  %2394 = alloca i32, align 4
  %2395 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2396 = call i32 (ptr, ...) @scanf(ptr %2395, ptr %2394)
  %2397 = load i32, ptr %2394, align 4
  %2398 = icmp eq i32 %2397, 0
  br label %continuation3591

continuation3591:                                 ; preds = %else3593, %then3592
  %2399 = phi i1 [ %2398, %else3593 ], [ true, %then3592 ]
  br i1 %2399, label %then3601, label %else3602

then3601:                                         ; preds = %continuation3591
  br label %continuation3600

else3602:                                         ; preds = %continuation3591
  %2400 = alloca i32, align 4
  %2401 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2402 = call i32 (ptr, ...) @scanf(ptr %2401, ptr %2400)
  %2403 = load i32, ptr %2400, align 4
  %2404 = icmp eq i32 %2403, 0
  br label %continuation3600

continuation3600:                                 ; preds = %else3602, %then3601
  %2405 = phi i1 [ %2404, %else3602 ], [ true, %then3601 ]
  br i1 %2405, label %then3610, label %else3611

then3610:                                         ; preds = %continuation3600
  br label %continuation3609

else3611:                                         ; preds = %continuation3600
  %2406 = alloca i32, align 4
  %2407 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2408 = call i32 (ptr, ...) @scanf(ptr %2407, ptr %2406)
  %2409 = load i32, ptr %2406, align 4
  %2410 = icmp eq i32 %2409, 0
  br label %continuation3609

continuation3609:                                 ; preds = %else3611, %then3610
  %2411 = phi i1 [ %2410, %else3611 ], [ true, %then3610 ]
  br i1 %2411, label %then3619, label %else3620

then3619:                                         ; preds = %continuation3609
  br label %continuation3618

else3620:                                         ; preds = %continuation3609
  %2412 = alloca i32, align 4
  %2413 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2414 = call i32 (ptr, ...) @scanf(ptr %2413, ptr %2412)
  %2415 = load i32, ptr %2412, align 4
  %2416 = icmp eq i32 %2415, 0
  br label %continuation3618

continuation3618:                                 ; preds = %else3620, %then3619
  %2417 = phi i1 [ %2416, %else3620 ], [ true, %then3619 ]
  br i1 %2417, label %then3628, label %else3629

then3628:                                         ; preds = %continuation3618
  br label %continuation3627

else3629:                                         ; preds = %continuation3618
  %2418 = alloca i32, align 4
  %2419 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2420 = call i32 (ptr, ...) @scanf(ptr %2419, ptr %2418)
  %2421 = load i32, ptr %2418, align 4
  %2422 = icmp eq i32 %2421, 0
  br label %continuation3627

continuation3627:                                 ; preds = %else3629, %then3628
  %2423 = phi i1 [ %2422, %else3629 ], [ true, %then3628 ]
  br i1 %2423, label %then3637, label %else3638

then3637:                                         ; preds = %continuation3627
  br label %continuation3636

else3638:                                         ; preds = %continuation3627
  %2424 = alloca i32, align 4
  %2425 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2426 = call i32 (ptr, ...) @scanf(ptr %2425, ptr %2424)
  %2427 = load i32, ptr %2424, align 4
  %2428 = icmp eq i32 %2427, 0
  br label %continuation3636

continuation3636:                                 ; preds = %else3638, %then3637
  %2429 = phi i1 [ %2428, %else3638 ], [ true, %then3637 ]
  br i1 %2429, label %then3646, label %else3647

then3646:                                         ; preds = %continuation3636
  br label %continuation3645

else3647:                                         ; preds = %continuation3636
  %2430 = alloca i32, align 4
  %2431 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2432 = call i32 (ptr, ...) @scanf(ptr %2431, ptr %2430)
  %2433 = load i32, ptr %2430, align 4
  %2434 = icmp eq i32 %2433, 0
  br label %continuation3645

continuation3645:                                 ; preds = %else3647, %then3646
  %2435 = phi i1 [ %2434, %else3647 ], [ true, %then3646 ]
  br i1 %2435, label %then3655, label %else3656

then3655:                                         ; preds = %continuation3645
  br label %continuation3654

else3656:                                         ; preds = %continuation3645
  %2436 = alloca i32, align 4
  %2437 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2438 = call i32 (ptr, ...) @scanf(ptr %2437, ptr %2436)
  %2439 = load i32, ptr %2436, align 4
  %2440 = icmp eq i32 %2439, 0
  br label %continuation3654

continuation3654:                                 ; preds = %else3656, %then3655
  %2441 = phi i1 [ %2440, %else3656 ], [ true, %then3655 ]
  br i1 %2441, label %then3664, label %else3665

then3664:                                         ; preds = %continuation3654
  br label %continuation3663

else3665:                                         ; preds = %continuation3654
  %2442 = alloca i32, align 4
  %2443 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2444 = call i32 (ptr, ...) @scanf(ptr %2443, ptr %2442)
  %2445 = load i32, ptr %2442, align 4
  %2446 = icmp eq i32 %2445, 0
  br label %continuation3663

continuation3663:                                 ; preds = %else3665, %then3664
  %2447 = phi i1 [ %2446, %else3665 ], [ true, %then3664 ]
  br i1 %2447, label %then3673, label %else3674

then3673:                                         ; preds = %continuation3663
  br label %continuation3672

else3674:                                         ; preds = %continuation3663
  %2448 = alloca i32, align 4
  %2449 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2450 = call i32 (ptr, ...) @scanf(ptr %2449, ptr %2448)
  %2451 = load i32, ptr %2448, align 4
  %2452 = icmp eq i32 %2451, 0
  br label %continuation3672

continuation3672:                                 ; preds = %else3674, %then3673
  %2453 = phi i1 [ %2452, %else3674 ], [ true, %then3673 ]
  br i1 %2453, label %then3682, label %else3683

then3682:                                         ; preds = %continuation3672
  br label %continuation3681

else3683:                                         ; preds = %continuation3672
  %2454 = alloca i32, align 4
  %2455 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2456 = call i32 (ptr, ...) @scanf(ptr %2455, ptr %2454)
  %2457 = load i32, ptr %2454, align 4
  %2458 = icmp eq i32 %2457, 0
  br label %continuation3681

continuation3681:                                 ; preds = %else3683, %then3682
  %2459 = phi i1 [ %2458, %else3683 ], [ true, %then3682 ]
  br i1 %2459, label %then3691, label %else3692

then3691:                                         ; preds = %continuation3681
  br label %continuation3690

else3692:                                         ; preds = %continuation3681
  %2460 = alloca i32, align 4
  %2461 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2462 = call i32 (ptr, ...) @scanf(ptr %2461, ptr %2460)
  %2463 = load i32, ptr %2460, align 4
  %2464 = icmp eq i32 %2463, 0
  br label %continuation3690

continuation3690:                                 ; preds = %else3692, %then3691
  %2465 = phi i1 [ %2464, %else3692 ], [ true, %then3691 ]
  br i1 %2465, label %then3700, label %else3701

then3700:                                         ; preds = %continuation3690
  br label %continuation3699

else3701:                                         ; preds = %continuation3690
  %2466 = alloca i32, align 4
  %2467 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2468 = call i32 (ptr, ...) @scanf(ptr %2467, ptr %2466)
  %2469 = load i32, ptr %2466, align 4
  %2470 = icmp eq i32 %2469, 0
  br label %continuation3699

continuation3699:                                 ; preds = %else3701, %then3700
  %2471 = phi i1 [ %2470, %else3701 ], [ true, %then3700 ]
  br i1 %2471, label %then3709, label %else3710

then3709:                                         ; preds = %continuation3699
  br label %continuation3708

else3710:                                         ; preds = %continuation3699
  %2472 = alloca i32, align 4
  %2473 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2474 = call i32 (ptr, ...) @scanf(ptr %2473, ptr %2472)
  %2475 = load i32, ptr %2472, align 4
  %2476 = icmp eq i32 %2475, 0
  br label %continuation3708

continuation3708:                                 ; preds = %else3710, %then3709
  %2477 = phi i1 [ %2476, %else3710 ], [ true, %then3709 ]
  br i1 %2477, label %then3718, label %else3719

then3718:                                         ; preds = %continuation3708
  br label %continuation3717

else3719:                                         ; preds = %continuation3708
  %2478 = alloca i32, align 4
  %2479 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2480 = call i32 (ptr, ...) @scanf(ptr %2479, ptr %2478)
  %2481 = load i32, ptr %2478, align 4
  %2482 = icmp eq i32 %2481, 0
  br label %continuation3717

continuation3717:                                 ; preds = %else3719, %then3718
  %2483 = phi i1 [ %2482, %else3719 ], [ true, %then3718 ]
  br i1 %2483, label %then3727, label %else3728

then3727:                                         ; preds = %continuation3717
  br label %continuation3726

else3728:                                         ; preds = %continuation3717
  %2484 = alloca i32, align 4
  %2485 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2486 = call i32 (ptr, ...) @scanf(ptr %2485, ptr %2484)
  %2487 = load i32, ptr %2484, align 4
  %2488 = icmp eq i32 %2487, 0
  br label %continuation3726

continuation3726:                                 ; preds = %else3728, %then3727
  %2489 = phi i1 [ %2488, %else3728 ], [ true, %then3727 ]
  br i1 %2489, label %then3736, label %else3737

then3736:                                         ; preds = %continuation3726
  br label %continuation3735

else3737:                                         ; preds = %continuation3726
  %2490 = alloca i32, align 4
  %2491 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2492 = call i32 (ptr, ...) @scanf(ptr %2491, ptr %2490)
  %2493 = load i32, ptr %2490, align 4
  %2494 = icmp eq i32 %2493, 0
  br label %continuation3735

continuation3735:                                 ; preds = %else3737, %then3736
  %2495 = phi i1 [ %2494, %else3737 ], [ true, %then3736 ]
  br i1 %2495, label %then3745, label %else3746

then3745:                                         ; preds = %continuation3735
  br label %continuation3744

else3746:                                         ; preds = %continuation3735
  %2496 = alloca i32, align 4
  %2497 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2498 = call i32 (ptr, ...) @scanf(ptr %2497, ptr %2496)
  %2499 = load i32, ptr %2496, align 4
  %2500 = icmp eq i32 %2499, 0
  br label %continuation3744

continuation3744:                                 ; preds = %else3746, %then3745
  %2501 = phi i1 [ %2500, %else3746 ], [ true, %then3745 ]
  br i1 %2501, label %then3754, label %else3755

then3754:                                         ; preds = %continuation3744
  br label %continuation3753

else3755:                                         ; preds = %continuation3744
  %2502 = alloca i32, align 4
  %2503 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2504 = call i32 (ptr, ...) @scanf(ptr %2503, ptr %2502)
  %2505 = load i32, ptr %2502, align 4
  %2506 = icmp eq i32 %2505, 0
  br label %continuation3753

continuation3753:                                 ; preds = %else3755, %then3754
  %2507 = phi i1 [ %2506, %else3755 ], [ true, %then3754 ]
  br i1 %2507, label %then3763, label %else3764

then3763:                                         ; preds = %continuation3753
  br label %continuation3762

else3764:                                         ; preds = %continuation3753
  %2508 = alloca i32, align 4
  %2509 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2510 = call i32 (ptr, ...) @scanf(ptr %2509, ptr %2508)
  %2511 = load i32, ptr %2508, align 4
  %2512 = icmp eq i32 %2511, 0
  br label %continuation3762

continuation3762:                                 ; preds = %else3764, %then3763
  %2513 = phi i1 [ %2512, %else3764 ], [ true, %then3763 ]
  br i1 %2513, label %then3772, label %else3773

then3772:                                         ; preds = %continuation3762
  br label %continuation3771

else3773:                                         ; preds = %continuation3762
  %2514 = alloca i32, align 4
  %2515 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2516 = call i32 (ptr, ...) @scanf(ptr %2515, ptr %2514)
  %2517 = load i32, ptr %2514, align 4
  %2518 = icmp eq i32 %2517, 0
  br label %continuation3771

continuation3771:                                 ; preds = %else3773, %then3772
  %2519 = phi i1 [ %2518, %else3773 ], [ true, %then3772 ]
  br i1 %2519, label %then3781, label %else3782

then3781:                                         ; preds = %continuation3771
  br label %continuation3780

else3782:                                         ; preds = %continuation3771
  %2520 = alloca i32, align 4
  %2521 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2522 = call i32 (ptr, ...) @scanf(ptr %2521, ptr %2520)
  %2523 = load i32, ptr %2520, align 4
  %2524 = icmp eq i32 %2523, 0
  br label %continuation3780

continuation3780:                                 ; preds = %else3782, %then3781
  %2525 = phi i1 [ %2524, %else3782 ], [ true, %then3781 ]
  br i1 %2525, label %then3790, label %else3791

then3790:                                         ; preds = %continuation3780
  br label %continuation3789

else3791:                                         ; preds = %continuation3780
  %2526 = alloca i32, align 4
  %2527 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2528 = call i32 (ptr, ...) @scanf(ptr %2527, ptr %2526)
  %2529 = load i32, ptr %2526, align 4
  %2530 = icmp eq i32 %2529, 0
  br label %continuation3789

continuation3789:                                 ; preds = %else3791, %then3790
  %2531 = phi i1 [ %2530, %else3791 ], [ true, %then3790 ]
  br i1 %2531, label %then3799, label %else3800

then3799:                                         ; preds = %continuation3789
  br label %continuation3798

else3800:                                         ; preds = %continuation3789
  %2532 = alloca i32, align 4
  %2533 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2534 = call i32 (ptr, ...) @scanf(ptr %2533, ptr %2532)
  %2535 = load i32, ptr %2532, align 4
  %2536 = icmp eq i32 %2535, 0
  br label %continuation3798

continuation3798:                                 ; preds = %else3800, %then3799
  %2537 = phi i1 [ %2536, %else3800 ], [ true, %then3799 ]
  br i1 %2537, label %then3808, label %else3809

then3808:                                         ; preds = %continuation3798
  br label %continuation3807

else3809:                                         ; preds = %continuation3798
  %2538 = alloca i32, align 4
  %2539 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2540 = call i32 (ptr, ...) @scanf(ptr %2539, ptr %2538)
  %2541 = load i32, ptr %2538, align 4
  %2542 = icmp eq i32 %2541, 0
  br label %continuation3807

continuation3807:                                 ; preds = %else3809, %then3808
  %2543 = phi i1 [ %2542, %else3809 ], [ true, %then3808 ]
  br i1 %2543, label %then3817, label %else3818

then3817:                                         ; preds = %continuation3807
  br label %continuation3816

else3818:                                         ; preds = %continuation3807
  %2544 = alloca i32, align 4
  %2545 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2546 = call i32 (ptr, ...) @scanf(ptr %2545, ptr %2544)
  %2547 = load i32, ptr %2544, align 4
  %2548 = icmp eq i32 %2547, 0
  br label %continuation3816

continuation3816:                                 ; preds = %else3818, %then3817
  %2549 = phi i1 [ %2548, %else3818 ], [ true, %then3817 ]
  br i1 %2549, label %then3826, label %else3827

then3826:                                         ; preds = %continuation3816
  br label %continuation3825

else3827:                                         ; preds = %continuation3816
  %2550 = alloca i32, align 4
  %2551 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2552 = call i32 (ptr, ...) @scanf(ptr %2551, ptr %2550)
  %2553 = load i32, ptr %2550, align 4
  %2554 = icmp eq i32 %2553, 0
  br label %continuation3825

continuation3825:                                 ; preds = %else3827, %then3826
  %2555 = phi i1 [ %2554, %else3827 ], [ true, %then3826 ]
  br i1 %2555, label %then3835, label %else3836

then3835:                                         ; preds = %continuation3825
  br label %continuation3834

else3836:                                         ; preds = %continuation3825
  %2556 = alloca i32, align 4
  %2557 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2558 = call i32 (ptr, ...) @scanf(ptr %2557, ptr %2556)
  %2559 = load i32, ptr %2556, align 4
  %2560 = icmp eq i32 %2559, 0
  br label %continuation3834

continuation3834:                                 ; preds = %else3836, %then3835
  %2561 = phi i1 [ %2560, %else3836 ], [ true, %then3835 ]
  br i1 %2561, label %then3844, label %else3845

then3844:                                         ; preds = %continuation3834
  br label %continuation3843

else3845:                                         ; preds = %continuation3834
  %2562 = alloca i32, align 4
  %2563 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2564 = call i32 (ptr, ...) @scanf(ptr %2563, ptr %2562)
  %2565 = load i32, ptr %2562, align 4
  %2566 = icmp eq i32 %2565, 0
  br label %continuation3843

continuation3843:                                 ; preds = %else3845, %then3844
  %2567 = phi i1 [ %2566, %else3845 ], [ true, %then3844 ]
  br i1 %2567, label %then3853, label %else3854

then3853:                                         ; preds = %continuation3843
  br label %continuation3852

else3854:                                         ; preds = %continuation3843
  %2568 = alloca i32, align 4
  %2569 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2570 = call i32 (ptr, ...) @scanf(ptr %2569, ptr %2568)
  %2571 = load i32, ptr %2568, align 4
  %2572 = icmp eq i32 %2571, 0
  br label %continuation3852

continuation3852:                                 ; preds = %else3854, %then3853
  %2573 = phi i1 [ %2572, %else3854 ], [ true, %then3853 ]
  br i1 %2573, label %then3862, label %else3863

then3862:                                         ; preds = %continuation3852
  br label %continuation3861

else3863:                                         ; preds = %continuation3852
  %2574 = alloca i32, align 4
  %2575 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2576 = call i32 (ptr, ...) @scanf(ptr %2575, ptr %2574)
  %2577 = load i32, ptr %2574, align 4
  %2578 = icmp eq i32 %2577, 0
  br label %continuation3861

continuation3861:                                 ; preds = %else3863, %then3862
  %2579 = phi i1 [ %2578, %else3863 ], [ true, %then3862 ]
  br i1 %2579, label %then3871, label %else3872

then3871:                                         ; preds = %continuation3861
  br label %continuation3870

else3872:                                         ; preds = %continuation3861
  %2580 = alloca i32, align 4
  %2581 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2582 = call i32 (ptr, ...) @scanf(ptr %2581, ptr %2580)
  %2583 = load i32, ptr %2580, align 4
  %2584 = icmp eq i32 %2583, 0
  br label %continuation3870

continuation3870:                                 ; preds = %else3872, %then3871
  %2585 = phi i1 [ %2584, %else3872 ], [ true, %then3871 ]
  br i1 %2585, label %then3880, label %else3881

then3880:                                         ; preds = %continuation3870
  br label %continuation3879

else3881:                                         ; preds = %continuation3870
  %2586 = alloca i32, align 4
  %2587 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2588 = call i32 (ptr, ...) @scanf(ptr %2587, ptr %2586)
  %2589 = load i32, ptr %2586, align 4
  %2590 = icmp eq i32 %2589, 0
  br label %continuation3879

continuation3879:                                 ; preds = %else3881, %then3880
  %2591 = phi i1 [ %2590, %else3881 ], [ true, %then3880 ]
  br i1 %2591, label %then3889, label %else3890

then3889:                                         ; preds = %continuation3879
  br label %continuation3888

else3890:                                         ; preds = %continuation3879
  %2592 = alloca i32, align 4
  %2593 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2594 = call i32 (ptr, ...) @scanf(ptr %2593, ptr %2592)
  %2595 = load i32, ptr %2592, align 4
  %2596 = icmp eq i32 %2595, 0
  br label %continuation3888

continuation3888:                                 ; preds = %else3890, %then3889
  %2597 = phi i1 [ %2596, %else3890 ], [ true, %then3889 ]
  br i1 %2597, label %then3898, label %else3899

then3898:                                         ; preds = %continuation3888
  br label %continuation3897

else3899:                                         ; preds = %continuation3888
  %2598 = alloca i32, align 4
  %2599 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2600 = call i32 (ptr, ...) @scanf(ptr %2599, ptr %2598)
  %2601 = load i32, ptr %2598, align 4
  %2602 = icmp eq i32 %2601, 0
  br label %continuation3897

continuation3897:                                 ; preds = %else3899, %then3898
  %2603 = phi i1 [ %2602, %else3899 ], [ true, %then3898 ]
  br i1 %2603, label %then3907, label %else3908

then3907:                                         ; preds = %continuation3897
  br label %continuation3906

else3908:                                         ; preds = %continuation3897
  %2604 = alloca i32, align 4
  %2605 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2606 = call i32 (ptr, ...) @scanf(ptr %2605, ptr %2604)
  %2607 = load i32, ptr %2604, align 4
  %2608 = icmp eq i32 %2607, 0
  br label %continuation3906

continuation3906:                                 ; preds = %else3908, %then3907
  %2609 = phi i1 [ %2608, %else3908 ], [ true, %then3907 ]
  br i1 %2609, label %then3916, label %else3917

then3916:                                         ; preds = %continuation3906
  br label %continuation3915

else3917:                                         ; preds = %continuation3906
  %2610 = alloca i32, align 4
  %2611 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2612 = call i32 (ptr, ...) @scanf(ptr %2611, ptr %2610)
  %2613 = load i32, ptr %2610, align 4
  %2614 = icmp eq i32 %2613, 0
  br label %continuation3915

continuation3915:                                 ; preds = %else3917, %then3916
  %2615 = phi i1 [ %2614, %else3917 ], [ true, %then3916 ]
  br i1 %2615, label %then3925, label %else3926

then3925:                                         ; preds = %continuation3915
  br label %continuation3924

else3926:                                         ; preds = %continuation3915
  %2616 = alloca i32, align 4
  %2617 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2618 = call i32 (ptr, ...) @scanf(ptr %2617, ptr %2616)
  %2619 = load i32, ptr %2616, align 4
  %2620 = icmp eq i32 %2619, 0
  br label %continuation3924

continuation3924:                                 ; preds = %else3926, %then3925
  %2621 = phi i1 [ %2620, %else3926 ], [ true, %then3925 ]
  br i1 %2621, label %then3934, label %else3935

then3934:                                         ; preds = %continuation3924
  br label %continuation3933

else3935:                                         ; preds = %continuation3924
  %2622 = alloca i32, align 4
  %2623 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2624 = call i32 (ptr, ...) @scanf(ptr %2623, ptr %2622)
  %2625 = load i32, ptr %2622, align 4
  %2626 = icmp eq i32 %2625, 0
  br label %continuation3933

continuation3933:                                 ; preds = %else3935, %then3934
  %2627 = phi i1 [ %2626, %else3935 ], [ true, %then3934 ]
  br i1 %2627, label %then3943, label %else3944

then3943:                                         ; preds = %continuation3933
  br label %continuation3942

else3944:                                         ; preds = %continuation3933
  %2628 = alloca i32, align 4
  %2629 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2630 = call i32 (ptr, ...) @scanf(ptr %2629, ptr %2628)
  %2631 = load i32, ptr %2628, align 4
  %2632 = icmp eq i32 %2631, 0
  br label %continuation3942

continuation3942:                                 ; preds = %else3944, %then3943
  %2633 = phi i1 [ %2632, %else3944 ], [ true, %then3943 ]
  br i1 %2633, label %then3952, label %else3953

then3952:                                         ; preds = %continuation3942
  br label %continuation3951

else3953:                                         ; preds = %continuation3942
  %2634 = alloca i32, align 4
  %2635 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2636 = call i32 (ptr, ...) @scanf(ptr %2635, ptr %2634)
  %2637 = load i32, ptr %2634, align 4
  %2638 = icmp eq i32 %2637, 0
  br label %continuation3951

continuation3951:                                 ; preds = %else3953, %then3952
  %2639 = phi i1 [ %2638, %else3953 ], [ true, %then3952 ]
  br i1 %2639, label %then3961, label %else3962

then3961:                                         ; preds = %continuation3951
  br label %continuation3960

else3962:                                         ; preds = %continuation3951
  %2640 = alloca i32, align 4
  %2641 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2642 = call i32 (ptr, ...) @scanf(ptr %2641, ptr %2640)
  %2643 = load i32, ptr %2640, align 4
  %2644 = icmp eq i32 %2643, 0
  br label %continuation3960

continuation3960:                                 ; preds = %else3962, %then3961
  %2645 = phi i1 [ %2644, %else3962 ], [ true, %then3961 ]
  br i1 %2645, label %then3970, label %else3971

then3970:                                         ; preds = %continuation3960
  br label %continuation3969

else3971:                                         ; preds = %continuation3960
  %2646 = alloca i32, align 4
  %2647 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2648 = call i32 (ptr, ...) @scanf(ptr %2647, ptr %2646)
  %2649 = load i32, ptr %2646, align 4
  %2650 = icmp eq i32 %2649, 0
  br label %continuation3969

continuation3969:                                 ; preds = %else3971, %then3970
  %2651 = phi i1 [ %2650, %else3971 ], [ true, %then3970 ]
  br i1 %2651, label %then3979, label %else3980

then3979:                                         ; preds = %continuation3969
  br label %continuation3978

else3980:                                         ; preds = %continuation3969
  %2652 = alloca i32, align 4
  %2653 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2654 = call i32 (ptr, ...) @scanf(ptr %2653, ptr %2652)
  %2655 = load i32, ptr %2652, align 4
  %2656 = icmp eq i32 %2655, 0
  br label %continuation3978

continuation3978:                                 ; preds = %else3980, %then3979
  %2657 = phi i1 [ %2656, %else3980 ], [ true, %then3979 ]
  br i1 %2657, label %then3988, label %else3989

then3988:                                         ; preds = %continuation3978
  br label %continuation3987

else3989:                                         ; preds = %continuation3978
  %2658 = alloca i32, align 4
  %2659 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2660 = call i32 (ptr, ...) @scanf(ptr %2659, ptr %2658)
  %2661 = load i32, ptr %2658, align 4
  %2662 = icmp eq i32 %2661, 0
  br label %continuation3987

continuation3987:                                 ; preds = %else3989, %then3988
  %2663 = phi i1 [ %2662, %else3989 ], [ true, %then3988 ]
  br i1 %2663, label %then3997, label %else3998

then3997:                                         ; preds = %continuation3987
  br label %continuation3996

else3998:                                         ; preds = %continuation3987
  %2664 = alloca i32, align 4
  %2665 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2666 = call i32 (ptr, ...) @scanf(ptr %2665, ptr %2664)
  %2667 = load i32, ptr %2664, align 4
  %2668 = icmp eq i32 %2667, 0
  br label %continuation3996

continuation3996:                                 ; preds = %else3998, %then3997
  %2669 = phi i1 [ %2668, %else3998 ], [ true, %then3997 ]
  br i1 %2669, label %then4006, label %else4007

then4006:                                         ; preds = %continuation3996
  br label %continuation4005

else4007:                                         ; preds = %continuation3996
  %2670 = alloca i32, align 4
  %2671 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2672 = call i32 (ptr, ...) @scanf(ptr %2671, ptr %2670)
  %2673 = load i32, ptr %2670, align 4
  %2674 = icmp eq i32 %2673, 0
  br label %continuation4005

continuation4005:                                 ; preds = %else4007, %then4006
  %2675 = phi i1 [ %2674, %else4007 ], [ true, %then4006 ]
  br i1 %2675, label %then4015, label %else4016

then4015:                                         ; preds = %continuation4005
  br label %continuation4014

else4016:                                         ; preds = %continuation4005
  %2676 = alloca i32, align 4
  %2677 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2678 = call i32 (ptr, ...) @scanf(ptr %2677, ptr %2676)
  %2679 = load i32, ptr %2676, align 4
  %2680 = icmp eq i32 %2679, 0
  br label %continuation4014

continuation4014:                                 ; preds = %else4016, %then4015
  %2681 = phi i1 [ %2680, %else4016 ], [ true, %then4015 ]
  br i1 %2681, label %then4024, label %else4025

then4024:                                         ; preds = %continuation4014
  br label %continuation4023

else4025:                                         ; preds = %continuation4014
  %2682 = alloca i32, align 4
  %2683 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2684 = call i32 (ptr, ...) @scanf(ptr %2683, ptr %2682)
  %2685 = load i32, ptr %2682, align 4
  %2686 = icmp eq i32 %2685, 0
  br label %continuation4023

continuation4023:                                 ; preds = %else4025, %then4024
  %2687 = phi i1 [ %2686, %else4025 ], [ true, %then4024 ]
  br i1 %2687, label %then4033, label %else4034

then4033:                                         ; preds = %continuation4023
  br label %continuation4032

else4034:                                         ; preds = %continuation4023
  %2688 = alloca i32, align 4
  %2689 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2690 = call i32 (ptr, ...) @scanf(ptr %2689, ptr %2688)
  %2691 = load i32, ptr %2688, align 4
  %2692 = icmp eq i32 %2691, 0
  br label %continuation4032

continuation4032:                                 ; preds = %else4034, %then4033
  %2693 = phi i1 [ %2692, %else4034 ], [ true, %then4033 ]
  br i1 %2693, label %then4042, label %else4043

then4042:                                         ; preds = %continuation4032
  br label %continuation4041

else4043:                                         ; preds = %continuation4032
  %2694 = alloca i32, align 4
  %2695 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2696 = call i32 (ptr, ...) @scanf(ptr %2695, ptr %2694)
  %2697 = load i32, ptr %2694, align 4
  %2698 = icmp eq i32 %2697, 0
  br label %continuation4041

continuation4041:                                 ; preds = %else4043, %then4042
  %2699 = phi i1 [ %2698, %else4043 ], [ true, %then4042 ]
  br i1 %2699, label %then4051, label %else4052

then4051:                                         ; preds = %continuation4041
  br label %continuation4050

else4052:                                         ; preds = %continuation4041
  %2700 = alloca i32, align 4
  %2701 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2702 = call i32 (ptr, ...) @scanf(ptr %2701, ptr %2700)
  %2703 = load i32, ptr %2700, align 4
  %2704 = icmp eq i32 %2703, 0
  br label %continuation4050

continuation4050:                                 ; preds = %else4052, %then4051
  %2705 = phi i1 [ %2704, %else4052 ], [ true, %then4051 ]
  br i1 %2705, label %then4060, label %else4061

then4060:                                         ; preds = %continuation4050
  br label %continuation4059

else4061:                                         ; preds = %continuation4050
  %2706 = alloca i32, align 4
  %2707 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2708 = call i32 (ptr, ...) @scanf(ptr %2707, ptr %2706)
  %2709 = load i32, ptr %2706, align 4
  %2710 = icmp eq i32 %2709, 0
  br label %continuation4059

continuation4059:                                 ; preds = %else4061, %then4060
  %2711 = phi i1 [ %2710, %else4061 ], [ true, %then4060 ]
  br i1 %2711, label %then4069, label %else4070

then4069:                                         ; preds = %continuation4059
  br label %continuation4068

else4070:                                         ; preds = %continuation4059
  %2712 = alloca i32, align 4
  %2713 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2714 = call i32 (ptr, ...) @scanf(ptr %2713, ptr %2712)
  %2715 = load i32, ptr %2712, align 4
  %2716 = icmp eq i32 %2715, 0
  br label %continuation4068

continuation4068:                                 ; preds = %else4070, %then4069
  %2717 = phi i1 [ %2716, %else4070 ], [ true, %then4069 ]
  br i1 %2717, label %then4078, label %else4079

then4078:                                         ; preds = %continuation4068
  br label %continuation4077

else4079:                                         ; preds = %continuation4068
  %2718 = alloca i32, align 4
  %2719 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2720 = call i32 (ptr, ...) @scanf(ptr %2719, ptr %2718)
  %2721 = load i32, ptr %2718, align 4
  %2722 = icmp eq i32 %2721, 0
  br label %continuation4077

continuation4077:                                 ; preds = %else4079, %then4078
  %2723 = phi i1 [ %2722, %else4079 ], [ true, %then4078 ]
  br i1 %2723, label %then4087, label %else4088

then4087:                                         ; preds = %continuation4077
  br label %continuation4086

else4088:                                         ; preds = %continuation4077
  %2724 = alloca i32, align 4
  %2725 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2726 = call i32 (ptr, ...) @scanf(ptr %2725, ptr %2724)
  %2727 = load i32, ptr %2724, align 4
  %2728 = icmp eq i32 %2727, 0
  br label %continuation4086

continuation4086:                                 ; preds = %else4088, %then4087
  %2729 = phi i1 [ %2728, %else4088 ], [ true, %then4087 ]
  br i1 %2729, label %then4096, label %else4097

then4096:                                         ; preds = %continuation4086
  br label %continuation4095

else4097:                                         ; preds = %continuation4086
  %2730 = alloca i32, align 4
  %2731 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2732 = call i32 (ptr, ...) @scanf(ptr %2731, ptr %2730)
  %2733 = load i32, ptr %2730, align 4
  %2734 = icmp eq i32 %2733, 0
  br label %continuation4095

continuation4095:                                 ; preds = %else4097, %then4096
  %2735 = phi i1 [ %2734, %else4097 ], [ true, %then4096 ]
  br i1 %2735, label %then4105, label %else4106

then4105:                                         ; preds = %continuation4095
  br label %continuation4104

else4106:                                         ; preds = %continuation4095
  %2736 = alloca i32, align 4
  %2737 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2738 = call i32 (ptr, ...) @scanf(ptr %2737, ptr %2736)
  %2739 = load i32, ptr %2736, align 4
  %2740 = icmp eq i32 %2739, 0
  br label %continuation4104

continuation4104:                                 ; preds = %else4106, %then4105
  %2741 = phi i1 [ %2740, %else4106 ], [ true, %then4105 ]
  br i1 %2741, label %then4114, label %else4115

then4114:                                         ; preds = %continuation4104
  br label %continuation4113

else4115:                                         ; preds = %continuation4104
  %2742 = alloca i32, align 4
  %2743 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2744 = call i32 (ptr, ...) @scanf(ptr %2743, ptr %2742)
  %2745 = load i32, ptr %2742, align 4
  %2746 = icmp eq i32 %2745, 0
  br label %continuation4113

continuation4113:                                 ; preds = %else4115, %then4114
  %2747 = phi i1 [ %2746, %else4115 ], [ true, %then4114 ]
  br i1 %2747, label %then4123, label %else4124

then4123:                                         ; preds = %continuation4113
  br label %continuation4122

else4124:                                         ; preds = %continuation4113
  %2748 = alloca i32, align 4
  %2749 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2750 = call i32 (ptr, ...) @scanf(ptr %2749, ptr %2748)
  %2751 = load i32, ptr %2748, align 4
  %2752 = icmp eq i32 %2751, 0
  br label %continuation4122

continuation4122:                                 ; preds = %else4124, %then4123
  %2753 = phi i1 [ %2752, %else4124 ], [ true, %then4123 ]
  br i1 %2753, label %then4132, label %else4133

then4132:                                         ; preds = %continuation4122
  br label %continuation4131

else4133:                                         ; preds = %continuation4122
  %2754 = alloca i32, align 4
  %2755 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2756 = call i32 (ptr, ...) @scanf(ptr %2755, ptr %2754)
  %2757 = load i32, ptr %2754, align 4
  %2758 = icmp eq i32 %2757, 0
  br label %continuation4131

continuation4131:                                 ; preds = %else4133, %then4132
  %2759 = phi i1 [ %2758, %else4133 ], [ true, %then4132 ]
  br i1 %2759, label %then4141, label %else4142

then4141:                                         ; preds = %continuation4131
  br label %continuation4140

else4142:                                         ; preds = %continuation4131
  %2760 = alloca i32, align 4
  %2761 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2762 = call i32 (ptr, ...) @scanf(ptr %2761, ptr %2760)
  %2763 = load i32, ptr %2760, align 4
  %2764 = icmp eq i32 %2763, 0
  br label %continuation4140

continuation4140:                                 ; preds = %else4142, %then4141
  %2765 = phi i1 [ %2764, %else4142 ], [ true, %then4141 ]
  br i1 %2765, label %then4150, label %else4151

then4150:                                         ; preds = %continuation4140
  br label %continuation4149

else4151:                                         ; preds = %continuation4140
  %2766 = alloca i32, align 4
  %2767 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2768 = call i32 (ptr, ...) @scanf(ptr %2767, ptr %2766)
  %2769 = load i32, ptr %2766, align 4
  %2770 = icmp eq i32 %2769, 0
  br label %continuation4149

continuation4149:                                 ; preds = %else4151, %then4150
  %2771 = phi i1 [ %2770, %else4151 ], [ true, %then4150 ]
  br i1 %2771, label %then4159, label %else4160

then4159:                                         ; preds = %continuation4149
  br label %continuation4158

else4160:                                         ; preds = %continuation4149
  %2772 = alloca i32, align 4
  %2773 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2774 = call i32 (ptr, ...) @scanf(ptr %2773, ptr %2772)
  %2775 = load i32, ptr %2772, align 4
  %2776 = icmp eq i32 %2775, 0
  br label %continuation4158

continuation4158:                                 ; preds = %else4160, %then4159
  %2777 = phi i1 [ %2776, %else4160 ], [ true, %then4159 ]
  br i1 %2777, label %then4168, label %else4169

then4168:                                         ; preds = %continuation4158
  br label %continuation4167

else4169:                                         ; preds = %continuation4158
  %2778 = alloca i32, align 4
  %2779 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2780 = call i32 (ptr, ...) @scanf(ptr %2779, ptr %2778)
  %2781 = load i32, ptr %2778, align 4
  %2782 = icmp eq i32 %2781, 0
  br label %continuation4167

continuation4167:                                 ; preds = %else4169, %then4168
  %2783 = phi i1 [ %2782, %else4169 ], [ true, %then4168 ]
  br i1 %2783, label %then4177, label %else4178

then4177:                                         ; preds = %continuation4167
  br label %continuation4176

else4178:                                         ; preds = %continuation4167
  %2784 = alloca i32, align 4
  %2785 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2786 = call i32 (ptr, ...) @scanf(ptr %2785, ptr %2784)
  %2787 = load i32, ptr %2784, align 4
  %2788 = icmp eq i32 %2787, 0
  br label %continuation4176

continuation4176:                                 ; preds = %else4178, %then4177
  %2789 = phi i1 [ %2788, %else4178 ], [ true, %then4177 ]
  br i1 %2789, label %then4186, label %else4187

then4186:                                         ; preds = %continuation4176
  br label %continuation4185

else4187:                                         ; preds = %continuation4176
  %2790 = alloca i32, align 4
  %2791 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2792 = call i32 (ptr, ...) @scanf(ptr %2791, ptr %2790)
  %2793 = load i32, ptr %2790, align 4
  %2794 = icmp eq i32 %2793, 0
  br label %continuation4185

continuation4185:                                 ; preds = %else4187, %then4186
  %2795 = phi i1 [ %2794, %else4187 ], [ true, %then4186 ]
  br i1 %2795, label %then4195, label %else4196

then4195:                                         ; preds = %continuation4185
  br label %continuation4194

else4196:                                         ; preds = %continuation4185
  %2796 = alloca i32, align 4
  %2797 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2798 = call i32 (ptr, ...) @scanf(ptr %2797, ptr %2796)
  %2799 = load i32, ptr %2796, align 4
  %2800 = icmp eq i32 %2799, 0
  br label %continuation4194

continuation4194:                                 ; preds = %else4196, %then4195
  %2801 = phi i1 [ %2800, %else4196 ], [ true, %then4195 ]
  br i1 %2801, label %then4204, label %else4205

then4204:                                         ; preds = %continuation4194
  br label %continuation4203

else4205:                                         ; preds = %continuation4194
  %2802 = alloca i32, align 4
  %2803 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2804 = call i32 (ptr, ...) @scanf(ptr %2803, ptr %2802)
  %2805 = load i32, ptr %2802, align 4
  %2806 = icmp eq i32 %2805, 0
  br label %continuation4203

continuation4203:                                 ; preds = %else4205, %then4204
  %2807 = phi i1 [ %2806, %else4205 ], [ true, %then4204 ]
  br i1 %2807, label %then4213, label %else4214

then4213:                                         ; preds = %continuation4203
  br label %continuation4212

else4214:                                         ; preds = %continuation4203
  %2808 = alloca i32, align 4
  %2809 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2810 = call i32 (ptr, ...) @scanf(ptr %2809, ptr %2808)
  %2811 = load i32, ptr %2808, align 4
  %2812 = icmp eq i32 %2811, 0
  br label %continuation4212

continuation4212:                                 ; preds = %else4214, %then4213
  %2813 = phi i1 [ %2812, %else4214 ], [ true, %then4213 ]
  br i1 %2813, label %then4222, label %else4223

then4222:                                         ; preds = %continuation4212
  br label %continuation4221

else4223:                                         ; preds = %continuation4212
  %2814 = alloca i32, align 4
  %2815 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2816 = call i32 (ptr, ...) @scanf(ptr %2815, ptr %2814)
  %2817 = load i32, ptr %2814, align 4
  %2818 = icmp eq i32 %2817, 0
  br label %continuation4221

continuation4221:                                 ; preds = %else4223, %then4222
  %2819 = phi i1 [ %2818, %else4223 ], [ true, %then4222 ]
  br i1 %2819, label %then4231, label %else4232

then4231:                                         ; preds = %continuation4221
  br label %continuation4230

else4232:                                         ; preds = %continuation4221
  %2820 = alloca i32, align 4
  %2821 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2822 = call i32 (ptr, ...) @scanf(ptr %2821, ptr %2820)
  %2823 = load i32, ptr %2820, align 4
  %2824 = icmp eq i32 %2823, 0
  br label %continuation4230

continuation4230:                                 ; preds = %else4232, %then4231
  %2825 = phi i1 [ %2824, %else4232 ], [ true, %then4231 ]
  br i1 %2825, label %then4240, label %else4241

then4240:                                         ; preds = %continuation4230
  br label %continuation4239

else4241:                                         ; preds = %continuation4230
  %2826 = alloca i32, align 4
  %2827 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2828 = call i32 (ptr, ...) @scanf(ptr %2827, ptr %2826)
  %2829 = load i32, ptr %2826, align 4
  %2830 = icmp eq i32 %2829, 0
  br label %continuation4239

continuation4239:                                 ; preds = %else4241, %then4240
  %2831 = phi i1 [ %2830, %else4241 ], [ true, %then4240 ]
  br i1 %2831, label %then4249, label %else4250

then4249:                                         ; preds = %continuation4239
  br label %continuation4248

else4250:                                         ; preds = %continuation4239
  %2832 = alloca i32, align 4
  %2833 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2834 = call i32 (ptr, ...) @scanf(ptr %2833, ptr %2832)
  %2835 = load i32, ptr %2832, align 4
  %2836 = icmp eq i32 %2835, 0
  br label %continuation4248

continuation4248:                                 ; preds = %else4250, %then4249
  %2837 = phi i1 [ %2836, %else4250 ], [ true, %then4249 ]
  br i1 %2837, label %then4258, label %else4259

then4258:                                         ; preds = %continuation4248
  br label %continuation4257

else4259:                                         ; preds = %continuation4248
  %2838 = alloca i32, align 4
  %2839 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2840 = call i32 (ptr, ...) @scanf(ptr %2839, ptr %2838)
  %2841 = load i32, ptr %2838, align 4
  %2842 = icmp eq i32 %2841, 0
  br label %continuation4257

continuation4257:                                 ; preds = %else4259, %then4258
  %2843 = phi i1 [ %2842, %else4259 ], [ true, %then4258 ]
  br i1 %2843, label %then4267, label %else4268

then4267:                                         ; preds = %continuation4257
  br label %continuation4266

else4268:                                         ; preds = %continuation4257
  %2844 = alloca i32, align 4
  %2845 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2846 = call i32 (ptr, ...) @scanf(ptr %2845, ptr %2844)
  %2847 = load i32, ptr %2844, align 4
  %2848 = icmp eq i32 %2847, 0
  br label %continuation4266

continuation4266:                                 ; preds = %else4268, %then4267
  %2849 = phi i1 [ %2848, %else4268 ], [ true, %then4267 ]
  br i1 %2849, label %then4276, label %else4277

then4276:                                         ; preds = %continuation4266
  br label %continuation4275

else4277:                                         ; preds = %continuation4266
  %2850 = alloca i32, align 4
  %2851 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2852 = call i32 (ptr, ...) @scanf(ptr %2851, ptr %2850)
  %2853 = load i32, ptr %2850, align 4
  %2854 = icmp eq i32 %2853, 0
  br label %continuation4275

continuation4275:                                 ; preds = %else4277, %then4276
  %2855 = phi i1 [ %2854, %else4277 ], [ true, %then4276 ]
  br i1 %2855, label %then4285, label %else4286

then4285:                                         ; preds = %continuation4275
  br label %continuation4284

else4286:                                         ; preds = %continuation4275
  %2856 = alloca i32, align 4
  %2857 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2858 = call i32 (ptr, ...) @scanf(ptr %2857, ptr %2856)
  %2859 = load i32, ptr %2856, align 4
  %2860 = icmp eq i32 %2859, 0
  br label %continuation4284

continuation4284:                                 ; preds = %else4286, %then4285
  %2861 = phi i1 [ %2860, %else4286 ], [ true, %then4285 ]
  br i1 %2861, label %then4294, label %else4295

then4294:                                         ; preds = %continuation4284
  br label %continuation4293

else4295:                                         ; preds = %continuation4284
  %2862 = alloca i32, align 4
  %2863 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2864 = call i32 (ptr, ...) @scanf(ptr %2863, ptr %2862)
  %2865 = load i32, ptr %2862, align 4
  %2866 = icmp eq i32 %2865, 0
  br label %continuation4293

continuation4293:                                 ; preds = %else4295, %then4294
  %2867 = phi i1 [ %2866, %else4295 ], [ true, %then4294 ]
  br i1 %2867, label %then4303, label %else4304

then4303:                                         ; preds = %continuation4293
  br label %continuation4302

else4304:                                         ; preds = %continuation4293
  %2868 = alloca i32, align 4
  %2869 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2870 = call i32 (ptr, ...) @scanf(ptr %2869, ptr %2868)
  %2871 = load i32, ptr %2868, align 4
  %2872 = icmp eq i32 %2871, 0
  br label %continuation4302

continuation4302:                                 ; preds = %else4304, %then4303
  %2873 = phi i1 [ %2872, %else4304 ], [ true, %then4303 ]
  br i1 %2873, label %then4312, label %else4313

then4312:                                         ; preds = %continuation4302
  br label %continuation4311

else4313:                                         ; preds = %continuation4302
  %2874 = alloca i32, align 4
  %2875 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2876 = call i32 (ptr, ...) @scanf(ptr %2875, ptr %2874)
  %2877 = load i32, ptr %2874, align 4
  %2878 = icmp eq i32 %2877, 0
  br label %continuation4311

continuation4311:                                 ; preds = %else4313, %then4312
  %2879 = phi i1 [ %2878, %else4313 ], [ true, %then4312 ]
  br i1 %2879, label %then4321, label %else4322

then4321:                                         ; preds = %continuation4311
  br label %continuation4320

else4322:                                         ; preds = %continuation4311
  %2880 = alloca i32, align 4
  %2881 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2882 = call i32 (ptr, ...) @scanf(ptr %2881, ptr %2880)
  %2883 = load i32, ptr %2880, align 4
  %2884 = icmp eq i32 %2883, 0
  br label %continuation4320

continuation4320:                                 ; preds = %else4322, %then4321
  %2885 = phi i1 [ %2884, %else4322 ], [ true, %then4321 ]
  br i1 %2885, label %then4330, label %else4331

then4330:                                         ; preds = %continuation4320
  br label %continuation4329

else4331:                                         ; preds = %continuation4320
  %2886 = alloca i32, align 4
  %2887 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2888 = call i32 (ptr, ...) @scanf(ptr %2887, ptr %2886)
  %2889 = load i32, ptr %2886, align 4
  %2890 = icmp eq i32 %2889, 0
  br label %continuation4329

continuation4329:                                 ; preds = %else4331, %then4330
  %2891 = phi i1 [ %2890, %else4331 ], [ true, %then4330 ]
  br i1 %2891, label %then4339, label %else4340

then4339:                                         ; preds = %continuation4329
  br label %continuation4338

else4340:                                         ; preds = %continuation4329
  %2892 = alloca i32, align 4
  %2893 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2894 = call i32 (ptr, ...) @scanf(ptr %2893, ptr %2892)
  %2895 = load i32, ptr %2892, align 4
  %2896 = icmp eq i32 %2895, 0
  br label %continuation4338

continuation4338:                                 ; preds = %else4340, %then4339
  %2897 = phi i1 [ %2896, %else4340 ], [ true, %then4339 ]
  br i1 %2897, label %then4348, label %else4349

then4348:                                         ; preds = %continuation4338
  br label %continuation4347

else4349:                                         ; preds = %continuation4338
  %2898 = alloca i32, align 4
  %2899 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2900 = call i32 (ptr, ...) @scanf(ptr %2899, ptr %2898)
  %2901 = load i32, ptr %2898, align 4
  %2902 = icmp eq i32 %2901, 0
  br label %continuation4347

continuation4347:                                 ; preds = %else4349, %then4348
  %2903 = phi i1 [ %2902, %else4349 ], [ true, %then4348 ]
  br i1 %2903, label %then4357, label %else4358

then4357:                                         ; preds = %continuation4347
  br label %continuation4356

else4358:                                         ; preds = %continuation4347
  %2904 = alloca i32, align 4
  %2905 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2906 = call i32 (ptr, ...) @scanf(ptr %2905, ptr %2904)
  %2907 = load i32, ptr %2904, align 4
  %2908 = icmp eq i32 %2907, 0
  br label %continuation4356

continuation4356:                                 ; preds = %else4358, %then4357
  %2909 = phi i1 [ %2908, %else4358 ], [ true, %then4357 ]
  br i1 %2909, label %then4366, label %else4367

then4366:                                         ; preds = %continuation4356
  br label %continuation4365

else4367:                                         ; preds = %continuation4356
  %2910 = alloca i32, align 4
  %2911 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2912 = call i32 (ptr, ...) @scanf(ptr %2911, ptr %2910)
  %2913 = load i32, ptr %2910, align 4
  %2914 = icmp eq i32 %2913, 0
  br label %continuation4365

continuation4365:                                 ; preds = %else4367, %then4366
  %2915 = phi i1 [ %2914, %else4367 ], [ true, %then4366 ]
  br i1 %2915, label %then4375, label %else4376

then4375:                                         ; preds = %continuation4365
  br label %continuation4374

else4376:                                         ; preds = %continuation4365
  %2916 = alloca i32, align 4
  %2917 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2918 = call i32 (ptr, ...) @scanf(ptr %2917, ptr %2916)
  %2919 = load i32, ptr %2916, align 4
  %2920 = icmp eq i32 %2919, 0
  br label %continuation4374

continuation4374:                                 ; preds = %else4376, %then4375
  %2921 = phi i1 [ %2920, %else4376 ], [ true, %then4375 ]
  br i1 %2921, label %then4384, label %else4385

then4384:                                         ; preds = %continuation4374
  br label %continuation4383

else4385:                                         ; preds = %continuation4374
  %2922 = alloca i32, align 4
  %2923 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2924 = call i32 (ptr, ...) @scanf(ptr %2923, ptr %2922)
  %2925 = load i32, ptr %2922, align 4
  %2926 = icmp eq i32 %2925, 0
  br label %continuation4383

continuation4383:                                 ; preds = %else4385, %then4384
  %2927 = phi i1 [ %2926, %else4385 ], [ true, %then4384 ]
  br i1 %2927, label %then4393, label %else4394

then4393:                                         ; preds = %continuation4383
  br label %continuation4392

else4394:                                         ; preds = %continuation4383
  %2928 = alloca i32, align 4
  %2929 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2930 = call i32 (ptr, ...) @scanf(ptr %2929, ptr %2928)
  %2931 = load i32, ptr %2928, align 4
  %2932 = icmp eq i32 %2931, 0
  br label %continuation4392

continuation4392:                                 ; preds = %else4394, %then4393
  %2933 = phi i1 [ %2932, %else4394 ], [ true, %then4393 ]
  br i1 %2933, label %then4402, label %else4403

then4402:                                         ; preds = %continuation4392
  br label %continuation4401

else4403:                                         ; preds = %continuation4392
  %2934 = alloca i32, align 4
  %2935 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2936 = call i32 (ptr, ...) @scanf(ptr %2935, ptr %2934)
  %2937 = load i32, ptr %2934, align 4
  %2938 = icmp eq i32 %2937, 0
  br label %continuation4401

continuation4401:                                 ; preds = %else4403, %then4402
  %2939 = phi i1 [ %2938, %else4403 ], [ true, %then4402 ]
  br i1 %2939, label %then4411, label %else4412

then4411:                                         ; preds = %continuation4401
  br label %continuation4410

else4412:                                         ; preds = %continuation4401
  %2940 = alloca i32, align 4
  %2941 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2942 = call i32 (ptr, ...) @scanf(ptr %2941, ptr %2940)
  %2943 = load i32, ptr %2940, align 4
  %2944 = icmp eq i32 %2943, 0
  br label %continuation4410

continuation4410:                                 ; preds = %else4412, %then4411
  %2945 = phi i1 [ %2944, %else4412 ], [ true, %then4411 ]
  br i1 %2945, label %then4420, label %else4421

then4420:                                         ; preds = %continuation4410
  br label %continuation4419

else4421:                                         ; preds = %continuation4410
  %2946 = alloca i32, align 4
  %2947 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2948 = call i32 (ptr, ...) @scanf(ptr %2947, ptr %2946)
  %2949 = load i32, ptr %2946, align 4
  %2950 = icmp eq i32 %2949, 0
  br label %continuation4419

continuation4419:                                 ; preds = %else4421, %then4420
  %2951 = phi i1 [ %2950, %else4421 ], [ true, %then4420 ]
  br i1 %2951, label %then4429, label %else4430

then4429:                                         ; preds = %continuation4419
  br label %continuation4428

else4430:                                         ; preds = %continuation4419
  %2952 = alloca i32, align 4
  %2953 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2954 = call i32 (ptr, ...) @scanf(ptr %2953, ptr %2952)
  %2955 = load i32, ptr %2952, align 4
  %2956 = icmp eq i32 %2955, 0
  br label %continuation4428

continuation4428:                                 ; preds = %else4430, %then4429
  %2957 = phi i1 [ %2956, %else4430 ], [ true, %then4429 ]
  br i1 %2957, label %then4438, label %else4439

then4438:                                         ; preds = %continuation4428
  br label %continuation4437

else4439:                                         ; preds = %continuation4428
  %2958 = alloca i32, align 4
  %2959 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2960 = call i32 (ptr, ...) @scanf(ptr %2959, ptr %2958)
  %2961 = load i32, ptr %2958, align 4
  %2962 = icmp eq i32 %2961, 0
  br label %continuation4437

continuation4437:                                 ; preds = %else4439, %then4438
  %2963 = phi i1 [ %2962, %else4439 ], [ true, %then4438 ]
  br i1 %2963, label %then4447, label %else4448

then4447:                                         ; preds = %continuation4437
  br label %continuation4446

else4448:                                         ; preds = %continuation4437
  %2964 = alloca i32, align 4
  %2965 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2966 = call i32 (ptr, ...) @scanf(ptr %2965, ptr %2964)
  %2967 = load i32, ptr %2964, align 4
  %2968 = icmp eq i32 %2967, 0
  br label %continuation4446

continuation4446:                                 ; preds = %else4448, %then4447
  %2969 = phi i1 [ %2968, %else4448 ], [ true, %then4447 ]
  br i1 %2969, label %then4456, label %else4457

then4456:                                         ; preds = %continuation4446
  br label %continuation4455

else4457:                                         ; preds = %continuation4446
  %2970 = alloca i32, align 4
  %2971 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2972 = call i32 (ptr, ...) @scanf(ptr %2971, ptr %2970)
  %2973 = load i32, ptr %2970, align 4
  %2974 = icmp eq i32 %2973, 0
  br label %continuation4455

continuation4455:                                 ; preds = %else4457, %then4456
  %2975 = phi i1 [ %2974, %else4457 ], [ true, %then4456 ]
  br i1 %2975, label %then4465, label %else4466

then4465:                                         ; preds = %continuation4455
  br label %continuation4464

else4466:                                         ; preds = %continuation4455
  %2976 = alloca i32, align 4
  %2977 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2978 = call i32 (ptr, ...) @scanf(ptr %2977, ptr %2976)
  %2979 = load i32, ptr %2976, align 4
  %2980 = icmp eq i32 %2979, 0
  br label %continuation4464

continuation4464:                                 ; preds = %else4466, %then4465
  %2981 = phi i1 [ %2980, %else4466 ], [ true, %then4465 ]
  br i1 %2981, label %then4474, label %else4475

then4474:                                         ; preds = %continuation4464
  br label %continuation4473

else4475:                                         ; preds = %continuation4464
  %2982 = alloca i32, align 4
  %2983 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2984 = call i32 (ptr, ...) @scanf(ptr %2983, ptr %2982)
  %2985 = load i32, ptr %2982, align 4
  %2986 = icmp eq i32 %2985, 0
  br label %continuation4473

continuation4473:                                 ; preds = %else4475, %then4474
  %2987 = phi i1 [ %2986, %else4475 ], [ true, %then4474 ]
  br i1 %2987, label %then4483, label %else4484

then4483:                                         ; preds = %continuation4473
  br label %continuation4482

else4484:                                         ; preds = %continuation4473
  %2988 = alloca i32, align 4
  %2989 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2990 = call i32 (ptr, ...) @scanf(ptr %2989, ptr %2988)
  %2991 = load i32, ptr %2988, align 4
  %2992 = icmp eq i32 %2991, 0
  br label %continuation4482

continuation4482:                                 ; preds = %else4484, %then4483
  %2993 = phi i1 [ %2992, %else4484 ], [ true, %then4483 ]
  br i1 %2993, label %then4492, label %else4493

then4492:                                         ; preds = %continuation4482
  br label %continuation4491

else4493:                                         ; preds = %continuation4482
  %2994 = alloca i32, align 4
  %2995 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %2996 = call i32 (ptr, ...) @scanf(ptr %2995, ptr %2994)
  %2997 = load i32, ptr %2994, align 4
  %2998 = icmp eq i32 %2997, 0
  br label %continuation4491

continuation4491:                                 ; preds = %else4493, %then4492
  %2999 = phi i1 [ %2998, %else4493 ], [ true, %then4492 ]
  br i1 %2999, label %then4501, label %else4502

then4501:                                         ; preds = %continuation4491
  br label %continuation4500

else4502:                                         ; preds = %continuation4491
  %3000 = alloca i32, align 4
  %3001 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3002 = call i32 (ptr, ...) @scanf(ptr %3001, ptr %3000)
  %3003 = load i32, ptr %3000, align 4
  %3004 = icmp eq i32 %3003, 0
  br label %continuation4500

continuation4500:                                 ; preds = %else4502, %then4501
  %3005 = phi i1 [ %3004, %else4502 ], [ true, %then4501 ]
  br i1 %3005, label %then4510, label %else4511

then4510:                                         ; preds = %continuation4500
  br label %continuation4509

else4511:                                         ; preds = %continuation4500
  %3006 = alloca i32, align 4
  %3007 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3008 = call i32 (ptr, ...) @scanf(ptr %3007, ptr %3006)
  %3009 = load i32, ptr %3006, align 4
  %3010 = icmp eq i32 %3009, 0
  br label %continuation4509

continuation4509:                                 ; preds = %else4511, %then4510
  %3011 = phi i1 [ %3010, %else4511 ], [ true, %then4510 ]
  br i1 %3011, label %then4519, label %else4520

then4519:                                         ; preds = %continuation4509
  br label %continuation4518

else4520:                                         ; preds = %continuation4509
  %3012 = alloca i32, align 4
  %3013 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3014 = call i32 (ptr, ...) @scanf(ptr %3013, ptr %3012)
  %3015 = load i32, ptr %3012, align 4
  %3016 = icmp eq i32 %3015, 0
  br label %continuation4518

continuation4518:                                 ; preds = %else4520, %then4519
  %3017 = phi i1 [ %3016, %else4520 ], [ true, %then4519 ]
  br i1 %3017, label %then4528, label %else4529

then4528:                                         ; preds = %continuation4518
  br label %continuation4527

else4529:                                         ; preds = %continuation4518
  %3018 = alloca i32, align 4
  %3019 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3020 = call i32 (ptr, ...) @scanf(ptr %3019, ptr %3018)
  %3021 = load i32, ptr %3018, align 4
  %3022 = icmp eq i32 %3021, 0
  br label %continuation4527

continuation4527:                                 ; preds = %else4529, %then4528
  %3023 = phi i1 [ %3022, %else4529 ], [ true, %then4528 ]
  br i1 %3023, label %then4537, label %else4538

then4537:                                         ; preds = %continuation4527
  br label %continuation4536

else4538:                                         ; preds = %continuation4527
  %3024 = alloca i32, align 4
  %3025 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3026 = call i32 (ptr, ...) @scanf(ptr %3025, ptr %3024)
  %3027 = load i32, ptr %3024, align 4
  %3028 = icmp eq i32 %3027, 0
  br label %continuation4536

continuation4536:                                 ; preds = %else4538, %then4537
  %3029 = phi i1 [ %3028, %else4538 ], [ true, %then4537 ]
  br i1 %3029, label %then4546, label %else4547

then4546:                                         ; preds = %continuation4536
  br label %continuation4545

else4547:                                         ; preds = %continuation4536
  %3030 = alloca i32, align 4
  %3031 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3032 = call i32 (ptr, ...) @scanf(ptr %3031, ptr %3030)
  %3033 = load i32, ptr %3030, align 4
  %3034 = icmp eq i32 %3033, 0
  br label %continuation4545

continuation4545:                                 ; preds = %else4547, %then4546
  %3035 = phi i1 [ %3034, %else4547 ], [ true, %then4546 ]
  br i1 %3035, label %then4555, label %else4556

then4555:                                         ; preds = %continuation4545
  br label %continuation4554

else4556:                                         ; preds = %continuation4545
  %3036 = alloca i32, align 4
  %3037 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3038 = call i32 (ptr, ...) @scanf(ptr %3037, ptr %3036)
  %3039 = load i32, ptr %3036, align 4
  %3040 = icmp eq i32 %3039, 0
  br label %continuation4554

continuation4554:                                 ; preds = %else4556, %then4555
  %3041 = phi i1 [ %3040, %else4556 ], [ true, %then4555 ]
  br i1 %3041, label %then4564, label %else4565

then4564:                                         ; preds = %continuation4554
  br label %continuation4563

else4565:                                         ; preds = %continuation4554
  %3042 = alloca i32, align 4
  %3043 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3044 = call i32 (ptr, ...) @scanf(ptr %3043, ptr %3042)
  %3045 = load i32, ptr %3042, align 4
  %3046 = icmp eq i32 %3045, 0
  br label %continuation4563

continuation4563:                                 ; preds = %else4565, %then4564
  %3047 = phi i1 [ %3046, %else4565 ], [ true, %then4564 ]
  br i1 %3047, label %then4573, label %else4574

then4573:                                         ; preds = %continuation4563
  br label %continuation4572

else4574:                                         ; preds = %continuation4563
  %3048 = alloca i32, align 4
  %3049 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3050 = call i32 (ptr, ...) @scanf(ptr %3049, ptr %3048)
  %3051 = load i32, ptr %3048, align 4
  %3052 = icmp eq i32 %3051, 0
  br label %continuation4572

continuation4572:                                 ; preds = %else4574, %then4573
  %3053 = phi i1 [ %3052, %else4574 ], [ true, %then4573 ]
  br i1 %3053, label %then4582, label %else4583

then4582:                                         ; preds = %continuation4572
  br label %continuation4581

else4583:                                         ; preds = %continuation4572
  %3054 = alloca i32, align 4
  %3055 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3056 = call i32 (ptr, ...) @scanf(ptr %3055, ptr %3054)
  %3057 = load i32, ptr %3054, align 4
  %3058 = icmp eq i32 %3057, 0
  br label %continuation4581

continuation4581:                                 ; preds = %else4583, %then4582
  %3059 = phi i1 [ %3058, %else4583 ], [ true, %then4582 ]
  br i1 %3059, label %then4591, label %else4592

then4591:                                         ; preds = %continuation4581
  br label %continuation4590

else4592:                                         ; preds = %continuation4581
  %3060 = alloca i32, align 4
  %3061 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3062 = call i32 (ptr, ...) @scanf(ptr %3061, ptr %3060)
  %3063 = load i32, ptr %3060, align 4
  %3064 = icmp eq i32 %3063, 0
  br label %continuation4590

continuation4590:                                 ; preds = %else4592, %then4591
  %3065 = phi i1 [ %3064, %else4592 ], [ true, %then4591 ]
  br i1 %3065, label %then4600, label %else4601

then4600:                                         ; preds = %continuation4590
  br label %continuation4599

else4601:                                         ; preds = %continuation4590
  %3066 = alloca i32, align 4
  %3067 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3068 = call i32 (ptr, ...) @scanf(ptr %3067, ptr %3066)
  %3069 = load i32, ptr %3066, align 4
  %3070 = icmp eq i32 %3069, 0
  br label %continuation4599

continuation4599:                                 ; preds = %else4601, %then4600
  %3071 = phi i1 [ %3070, %else4601 ], [ true, %then4600 ]
  br i1 %3071, label %then4609, label %else4610

then4609:                                         ; preds = %continuation4599
  br label %continuation4608

else4610:                                         ; preds = %continuation4599
  %3072 = alloca i32, align 4
  %3073 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3074 = call i32 (ptr, ...) @scanf(ptr %3073, ptr %3072)
  %3075 = load i32, ptr %3072, align 4
  %3076 = icmp eq i32 %3075, 0
  br label %continuation4608

continuation4608:                                 ; preds = %else4610, %then4609
  %3077 = phi i1 [ %3076, %else4610 ], [ true, %then4609 ]
  br i1 %3077, label %then4618, label %else4619

then4618:                                         ; preds = %continuation4608
  br label %continuation4617

else4619:                                         ; preds = %continuation4608
  %3078 = alloca i32, align 4
  %3079 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3080 = call i32 (ptr, ...) @scanf(ptr %3079, ptr %3078)
  %3081 = load i32, ptr %3078, align 4
  %3082 = icmp eq i32 %3081, 0
  br label %continuation4617

continuation4617:                                 ; preds = %else4619, %then4618
  %3083 = phi i1 [ %3082, %else4619 ], [ true, %then4618 ]
  br i1 %3083, label %then4627, label %else4628

then4627:                                         ; preds = %continuation4617
  br label %continuation4626

else4628:                                         ; preds = %continuation4617
  %3084 = alloca i32, align 4
  %3085 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3086 = call i32 (ptr, ...) @scanf(ptr %3085, ptr %3084)
  %3087 = load i32, ptr %3084, align 4
  %3088 = icmp eq i32 %3087, 0
  br label %continuation4626

continuation4626:                                 ; preds = %else4628, %then4627
  %3089 = phi i1 [ %3088, %else4628 ], [ true, %then4627 ]
  br i1 %3089, label %then4636, label %else4637

then4636:                                         ; preds = %continuation4626
  br label %continuation4635

else4637:                                         ; preds = %continuation4626
  %3090 = alloca i32, align 4
  %3091 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3092 = call i32 (ptr, ...) @scanf(ptr %3091, ptr %3090)
  %3093 = load i32, ptr %3090, align 4
  %3094 = icmp eq i32 %3093, 0
  br label %continuation4635

continuation4635:                                 ; preds = %else4637, %then4636
  %3095 = phi i1 [ %3094, %else4637 ], [ true, %then4636 ]
  br i1 %3095, label %then4645, label %else4646

then4645:                                         ; preds = %continuation4635
  br label %continuation4644

else4646:                                         ; preds = %continuation4635
  %3096 = alloca i32, align 4
  %3097 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3098 = call i32 (ptr, ...) @scanf(ptr %3097, ptr %3096)
  %3099 = load i32, ptr %3096, align 4
  %3100 = icmp eq i32 %3099, 0
  br label %continuation4644

continuation4644:                                 ; preds = %else4646, %then4645
  %3101 = phi i1 [ %3100, %else4646 ], [ true, %then4645 ]
  br i1 %3101, label %then4654, label %else4655

then4654:                                         ; preds = %continuation4644
  br label %continuation4653

else4655:                                         ; preds = %continuation4644
  %3102 = alloca i32, align 4
  %3103 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3104 = call i32 (ptr, ...) @scanf(ptr %3103, ptr %3102)
  %3105 = load i32, ptr %3102, align 4
  %3106 = icmp eq i32 %3105, 0
  br label %continuation4653

continuation4653:                                 ; preds = %else4655, %then4654
  %3107 = phi i1 [ %3106, %else4655 ], [ true, %then4654 ]
  br i1 %3107, label %then4663, label %else4664

then4663:                                         ; preds = %continuation4653
  br label %continuation4662

else4664:                                         ; preds = %continuation4653
  %3108 = alloca i32, align 4
  %3109 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3110 = call i32 (ptr, ...) @scanf(ptr %3109, ptr %3108)
  %3111 = load i32, ptr %3108, align 4
  %3112 = icmp eq i32 %3111, 0
  br label %continuation4662

continuation4662:                                 ; preds = %else4664, %then4663
  %3113 = phi i1 [ %3112, %else4664 ], [ true, %then4663 ]
  br i1 %3113, label %then4672, label %else4673

then4672:                                         ; preds = %continuation4662
  br label %continuation4671

else4673:                                         ; preds = %continuation4662
  %3114 = alloca i32, align 4
  %3115 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3116 = call i32 (ptr, ...) @scanf(ptr %3115, ptr %3114)
  %3117 = load i32, ptr %3114, align 4
  %3118 = icmp eq i32 %3117, 0
  br label %continuation4671

continuation4671:                                 ; preds = %else4673, %then4672
  %3119 = phi i1 [ %3118, %else4673 ], [ true, %then4672 ]
  br i1 %3119, label %then4681, label %else4682

then4681:                                         ; preds = %continuation4671
  br label %continuation4680

else4682:                                         ; preds = %continuation4671
  %3120 = alloca i32, align 4
  %3121 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3122 = call i32 (ptr, ...) @scanf(ptr %3121, ptr %3120)
  %3123 = load i32, ptr %3120, align 4
  %3124 = icmp eq i32 %3123, 0
  br label %continuation4680

continuation4680:                                 ; preds = %else4682, %then4681
  %3125 = phi i1 [ %3124, %else4682 ], [ true, %then4681 ]
  br i1 %3125, label %then4690, label %else4691

then4690:                                         ; preds = %continuation4680
  br label %continuation4689

else4691:                                         ; preds = %continuation4680
  %3126 = alloca i32, align 4
  %3127 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3128 = call i32 (ptr, ...) @scanf(ptr %3127, ptr %3126)
  %3129 = load i32, ptr %3126, align 4
  %3130 = icmp eq i32 %3129, 0
  br label %continuation4689

continuation4689:                                 ; preds = %else4691, %then4690
  %3131 = phi i1 [ %3130, %else4691 ], [ true, %then4690 ]
  br i1 %3131, label %then4699, label %else4700

then4699:                                         ; preds = %continuation4689
  br label %continuation4698

else4700:                                         ; preds = %continuation4689
  %3132 = alloca i32, align 4
  %3133 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3134 = call i32 (ptr, ...) @scanf(ptr %3133, ptr %3132)
  %3135 = load i32, ptr %3132, align 4
  %3136 = icmp eq i32 %3135, 0
  br label %continuation4698

continuation4698:                                 ; preds = %else4700, %then4699
  %3137 = phi i1 [ %3136, %else4700 ], [ true, %then4699 ]
  br i1 %3137, label %then4708, label %else4709

then4708:                                         ; preds = %continuation4698
  br label %continuation4707

else4709:                                         ; preds = %continuation4698
  %3138 = alloca i32, align 4
  %3139 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3140 = call i32 (ptr, ...) @scanf(ptr %3139, ptr %3138)
  %3141 = load i32, ptr %3138, align 4
  %3142 = icmp eq i32 %3141, 0
  br label %continuation4707

continuation4707:                                 ; preds = %else4709, %then4708
  %3143 = phi i1 [ %3142, %else4709 ], [ true, %then4708 ]
  br i1 %3143, label %then4717, label %else4718

then4717:                                         ; preds = %continuation4707
  br label %continuation4716

else4718:                                         ; preds = %continuation4707
  %3144 = alloca i32, align 4
  %3145 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3146 = call i32 (ptr, ...) @scanf(ptr %3145, ptr %3144)
  %3147 = load i32, ptr %3144, align 4
  %3148 = icmp eq i32 %3147, 0
  br label %continuation4716

continuation4716:                                 ; preds = %else4718, %then4717
  %3149 = phi i1 [ %3148, %else4718 ], [ true, %then4717 ]
  br i1 %3149, label %then4726, label %else4727

then4726:                                         ; preds = %continuation4716
  br label %continuation4725

else4727:                                         ; preds = %continuation4716
  %3150 = alloca i32, align 4
  %3151 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3152 = call i32 (ptr, ...) @scanf(ptr %3151, ptr %3150)
  %3153 = load i32, ptr %3150, align 4
  %3154 = icmp eq i32 %3153, 0
  br label %continuation4725

continuation4725:                                 ; preds = %else4727, %then4726
  %3155 = phi i1 [ %3154, %else4727 ], [ true, %then4726 ]
  br i1 %3155, label %then4735, label %else4736

then4735:                                         ; preds = %continuation4725
  br label %continuation4734

else4736:                                         ; preds = %continuation4725
  %3156 = alloca i32, align 4
  %3157 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3158 = call i32 (ptr, ...) @scanf(ptr %3157, ptr %3156)
  %3159 = load i32, ptr %3156, align 4
  %3160 = icmp eq i32 %3159, 0
  br label %continuation4734

continuation4734:                                 ; preds = %else4736, %then4735
  %3161 = phi i1 [ %3160, %else4736 ], [ true, %then4735 ]
  br i1 %3161, label %then4744, label %else4745

then4744:                                         ; preds = %continuation4734
  br label %continuation4743

else4745:                                         ; preds = %continuation4734
  %3162 = alloca i32, align 4
  %3163 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3164 = call i32 (ptr, ...) @scanf(ptr %3163, ptr %3162)
  %3165 = load i32, ptr %3162, align 4
  %3166 = icmp eq i32 %3165, 0
  br label %continuation4743

continuation4743:                                 ; preds = %else4745, %then4744
  %3167 = phi i1 [ %3166, %else4745 ], [ true, %then4744 ]
  br i1 %3167, label %then4753, label %else4754

then4753:                                         ; preds = %continuation4743
  br label %continuation4752

else4754:                                         ; preds = %continuation4743
  %3168 = alloca i32, align 4
  %3169 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3170 = call i32 (ptr, ...) @scanf(ptr %3169, ptr %3168)
  %3171 = load i32, ptr %3168, align 4
  %3172 = icmp eq i32 %3171, 0
  br label %continuation4752

continuation4752:                                 ; preds = %else4754, %then4753
  %3173 = phi i1 [ %3172, %else4754 ], [ true, %then4753 ]
  br i1 %3173, label %then4762, label %else4763

then4762:                                         ; preds = %continuation4752
  br label %continuation4761

else4763:                                         ; preds = %continuation4752
  %3174 = alloca i32, align 4
  %3175 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3176 = call i32 (ptr, ...) @scanf(ptr %3175, ptr %3174)
  %3177 = load i32, ptr %3174, align 4
  %3178 = icmp eq i32 %3177, 0
  br label %continuation4761

continuation4761:                                 ; preds = %else4763, %then4762
  %3179 = phi i1 [ %3178, %else4763 ], [ true, %then4762 ]
  br i1 %3179, label %then4771, label %else4772

then4771:                                         ; preds = %continuation4761
  br label %continuation4770

else4772:                                         ; preds = %continuation4761
  %3180 = alloca i32, align 4
  %3181 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3182 = call i32 (ptr, ...) @scanf(ptr %3181, ptr %3180)
  %3183 = load i32, ptr %3180, align 4
  %3184 = icmp eq i32 %3183, 0
  br label %continuation4770

continuation4770:                                 ; preds = %else4772, %then4771
  %3185 = phi i1 [ %3184, %else4772 ], [ true, %then4771 ]
  br i1 %3185, label %then4780, label %else4781

then4780:                                         ; preds = %continuation4770
  br label %continuation4779

else4781:                                         ; preds = %continuation4770
  %3186 = alloca i32, align 4
  %3187 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3188 = call i32 (ptr, ...) @scanf(ptr %3187, ptr %3186)
  %3189 = load i32, ptr %3186, align 4
  %3190 = icmp eq i32 %3189, 0
  br label %continuation4779

continuation4779:                                 ; preds = %else4781, %then4780
  %3191 = phi i1 [ %3190, %else4781 ], [ true, %then4780 ]
  br i1 %3191, label %then4789, label %else4790

then4789:                                         ; preds = %continuation4779
  br label %continuation4788

else4790:                                         ; preds = %continuation4779
  %3192 = alloca i32, align 4
  %3193 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3194 = call i32 (ptr, ...) @scanf(ptr %3193, ptr %3192)
  %3195 = load i32, ptr %3192, align 4
  %3196 = icmp eq i32 %3195, 0
  br label %continuation4788

continuation4788:                                 ; preds = %else4790, %then4789
  %3197 = phi i1 [ %3196, %else4790 ], [ true, %then4789 ]
  br i1 %3197, label %then4798, label %else4799

then4798:                                         ; preds = %continuation4788
  br label %continuation4797

else4799:                                         ; preds = %continuation4788
  %3198 = alloca i32, align 4
  %3199 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3200 = call i32 (ptr, ...) @scanf(ptr %3199, ptr %3198)
  %3201 = load i32, ptr %3198, align 4
  %3202 = icmp eq i32 %3201, 0
  br label %continuation4797

continuation4797:                                 ; preds = %else4799, %then4798
  %3203 = phi i1 [ %3202, %else4799 ], [ true, %then4798 ]
  br i1 %3203, label %then4807, label %else4808

then4807:                                         ; preds = %continuation4797
  br label %continuation4806

else4808:                                         ; preds = %continuation4797
  %3204 = alloca i32, align 4
  %3205 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3206 = call i32 (ptr, ...) @scanf(ptr %3205, ptr %3204)
  %3207 = load i32, ptr %3204, align 4
  %3208 = icmp eq i32 %3207, 0
  br label %continuation4806

continuation4806:                                 ; preds = %else4808, %then4807
  %3209 = phi i1 [ %3208, %else4808 ], [ true, %then4807 ]
  br i1 %3209, label %then4816, label %else4817

then4816:                                         ; preds = %continuation4806
  br label %continuation4815

else4817:                                         ; preds = %continuation4806
  %3210 = alloca i32, align 4
  %3211 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3212 = call i32 (ptr, ...) @scanf(ptr %3211, ptr %3210)
  %3213 = load i32, ptr %3210, align 4
  %3214 = icmp eq i32 %3213, 0
  br label %continuation4815

continuation4815:                                 ; preds = %else4817, %then4816
  %3215 = phi i1 [ %3214, %else4817 ], [ true, %then4816 ]
  br i1 %3215, label %then4825, label %else4826

then4825:                                         ; preds = %continuation4815
  br label %continuation4824

else4826:                                         ; preds = %continuation4815
  %3216 = alloca i32, align 4
  %3217 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3218 = call i32 (ptr, ...) @scanf(ptr %3217, ptr %3216)
  %3219 = load i32, ptr %3216, align 4
  %3220 = icmp eq i32 %3219, 0
  br label %continuation4824

continuation4824:                                 ; preds = %else4826, %then4825
  %3221 = phi i1 [ %3220, %else4826 ], [ true, %then4825 ]
  br i1 %3221, label %then4834, label %else4835

then4834:                                         ; preds = %continuation4824
  br label %continuation4833

else4835:                                         ; preds = %continuation4824
  %3222 = alloca i32, align 4
  %3223 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3224 = call i32 (ptr, ...) @scanf(ptr %3223, ptr %3222)
  %3225 = load i32, ptr %3222, align 4
  %3226 = icmp eq i32 %3225, 0
  br label %continuation4833

continuation4833:                                 ; preds = %else4835, %then4834
  %3227 = phi i1 [ %3226, %else4835 ], [ true, %then4834 ]
  br i1 %3227, label %then4843, label %else4844

then4843:                                         ; preds = %continuation4833
  br label %continuation4842

else4844:                                         ; preds = %continuation4833
  %3228 = alloca i32, align 4
  %3229 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3230 = call i32 (ptr, ...) @scanf(ptr %3229, ptr %3228)
  %3231 = load i32, ptr %3228, align 4
  %3232 = icmp eq i32 %3231, 0
  br label %continuation4842

continuation4842:                                 ; preds = %else4844, %then4843
  %3233 = phi i1 [ %3232, %else4844 ], [ true, %then4843 ]
  br i1 %3233, label %then4852, label %else4853

then4852:                                         ; preds = %continuation4842
  br label %continuation4851

else4853:                                         ; preds = %continuation4842
  %3234 = alloca i32, align 4
  %3235 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3236 = call i32 (ptr, ...) @scanf(ptr %3235, ptr %3234)
  %3237 = load i32, ptr %3234, align 4
  %3238 = icmp eq i32 %3237, 0
  br label %continuation4851

continuation4851:                                 ; preds = %else4853, %then4852
  %3239 = phi i1 [ %3238, %else4853 ], [ true, %then4852 ]
  br i1 %3239, label %then4861, label %else4862

then4861:                                         ; preds = %continuation4851
  br label %continuation4860

else4862:                                         ; preds = %continuation4851
  %3240 = alloca i32, align 4
  %3241 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3242 = call i32 (ptr, ...) @scanf(ptr %3241, ptr %3240)
  %3243 = load i32, ptr %3240, align 4
  %3244 = icmp eq i32 %3243, 0
  br label %continuation4860

continuation4860:                                 ; preds = %else4862, %then4861
  %3245 = phi i1 [ %3244, %else4862 ], [ true, %then4861 ]
  br i1 %3245, label %then4870, label %else4871

then4870:                                         ; preds = %continuation4860
  br label %continuation4869

else4871:                                         ; preds = %continuation4860
  %3246 = alloca i32, align 4
  %3247 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3248 = call i32 (ptr, ...) @scanf(ptr %3247, ptr %3246)
  %3249 = load i32, ptr %3246, align 4
  %3250 = icmp eq i32 %3249, 0
  br label %continuation4869

continuation4869:                                 ; preds = %else4871, %then4870
  %3251 = phi i1 [ %3250, %else4871 ], [ true, %then4870 ]
  br i1 %3251, label %then4879, label %else4880

then4879:                                         ; preds = %continuation4869
  br label %continuation4878

else4880:                                         ; preds = %continuation4869
  %3252 = alloca i32, align 4
  %3253 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3254 = call i32 (ptr, ...) @scanf(ptr %3253, ptr %3252)
  %3255 = load i32, ptr %3252, align 4
  %3256 = icmp eq i32 %3255, 0
  br label %continuation4878

continuation4878:                                 ; preds = %else4880, %then4879
  %3257 = phi i1 [ %3256, %else4880 ], [ true, %then4879 ]
  br i1 %3257, label %then4888, label %else4889

then4888:                                         ; preds = %continuation4878
  br label %continuation4887

else4889:                                         ; preds = %continuation4878
  %3258 = alloca i32, align 4
  %3259 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3260 = call i32 (ptr, ...) @scanf(ptr %3259, ptr %3258)
  %3261 = load i32, ptr %3258, align 4
  %3262 = icmp eq i32 %3261, 0
  br label %continuation4887

continuation4887:                                 ; preds = %else4889, %then4888
  %3263 = phi i1 [ %3262, %else4889 ], [ true, %then4888 ]
  br i1 %3263, label %then4897, label %else4898

then4897:                                         ; preds = %continuation4887
  br label %continuation4896

else4898:                                         ; preds = %continuation4887
  %3264 = alloca i32, align 4
  %3265 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3266 = call i32 (ptr, ...) @scanf(ptr %3265, ptr %3264)
  %3267 = load i32, ptr %3264, align 4
  %3268 = icmp eq i32 %3267, 0
  br label %continuation4896

continuation4896:                                 ; preds = %else4898, %then4897
  %3269 = phi i1 [ %3268, %else4898 ], [ true, %then4897 ]
  br i1 %3269, label %then4906, label %else4907

then4906:                                         ; preds = %continuation4896
  br label %continuation4905

else4907:                                         ; preds = %continuation4896
  %3270 = alloca i32, align 4
  %3271 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3272 = call i32 (ptr, ...) @scanf(ptr %3271, ptr %3270)
  %3273 = load i32, ptr %3270, align 4
  %3274 = icmp eq i32 %3273, 0
  br label %continuation4905

continuation4905:                                 ; preds = %else4907, %then4906
  %3275 = phi i1 [ %3274, %else4907 ], [ true, %then4906 ]
  br i1 %3275, label %then4915, label %else4916

then4915:                                         ; preds = %continuation4905
  br label %continuation4914

else4916:                                         ; preds = %continuation4905
  %3276 = alloca i32, align 4
  %3277 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3278 = call i32 (ptr, ...) @scanf(ptr %3277, ptr %3276)
  %3279 = load i32, ptr %3276, align 4
  %3280 = icmp eq i32 %3279, 0
  br label %continuation4914

continuation4914:                                 ; preds = %else4916, %then4915
  %3281 = phi i1 [ %3280, %else4916 ], [ true, %then4915 ]
  br i1 %3281, label %then4924, label %else4925

then4924:                                         ; preds = %continuation4914
  br label %continuation4923

else4925:                                         ; preds = %continuation4914
  %3282 = alloca i32, align 4
  %3283 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3284 = call i32 (ptr, ...) @scanf(ptr %3283, ptr %3282)
  %3285 = load i32, ptr %3282, align 4
  %3286 = icmp eq i32 %3285, 0
  br label %continuation4923

continuation4923:                                 ; preds = %else4925, %then4924
  %3287 = phi i1 [ %3286, %else4925 ], [ true, %then4924 ]
  br i1 %3287, label %then4933, label %else4934

then4933:                                         ; preds = %continuation4923
  br label %continuation4932

else4934:                                         ; preds = %continuation4923
  %3288 = alloca i32, align 4
  %3289 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3290 = call i32 (ptr, ...) @scanf(ptr %3289, ptr %3288)
  %3291 = load i32, ptr %3288, align 4
  %3292 = icmp eq i32 %3291, 0
  br label %continuation4932

continuation4932:                                 ; preds = %else4934, %then4933
  %3293 = phi i1 [ %3292, %else4934 ], [ true, %then4933 ]
  br i1 %3293, label %then4942, label %else4943

then4942:                                         ; preds = %continuation4932
  br label %continuation4941

else4943:                                         ; preds = %continuation4932
  %3294 = alloca i32, align 4
  %3295 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3296 = call i32 (ptr, ...) @scanf(ptr %3295, ptr %3294)
  %3297 = load i32, ptr %3294, align 4
  %3298 = icmp eq i32 %3297, 0
  br label %continuation4941

continuation4941:                                 ; preds = %else4943, %then4942
  %3299 = phi i1 [ %3298, %else4943 ], [ true, %then4942 ]
  br i1 %3299, label %then4951, label %else4952

then4951:                                         ; preds = %continuation4941
  br label %continuation4950

else4952:                                         ; preds = %continuation4941
  %3300 = alloca i32, align 4
  %3301 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3302 = call i32 (ptr, ...) @scanf(ptr %3301, ptr %3300)
  %3303 = load i32, ptr %3300, align 4
  %3304 = icmp eq i32 %3303, 0
  br label %continuation4950

continuation4950:                                 ; preds = %else4952, %then4951
  %3305 = phi i1 [ %3304, %else4952 ], [ true, %then4951 ]
  br i1 %3305, label %then4960, label %else4961

then4960:                                         ; preds = %continuation4950
  br label %continuation4959

else4961:                                         ; preds = %continuation4950
  %3306 = alloca i32, align 4
  %3307 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3308 = call i32 (ptr, ...) @scanf(ptr %3307, ptr %3306)
  %3309 = load i32, ptr %3306, align 4
  %3310 = icmp eq i32 %3309, 0
  br label %continuation4959

continuation4959:                                 ; preds = %else4961, %then4960
  %3311 = phi i1 [ %3310, %else4961 ], [ true, %then4960 ]
  br i1 %3311, label %then4969, label %else4970

then4969:                                         ; preds = %continuation4959
  br label %continuation4968

else4970:                                         ; preds = %continuation4959
  %3312 = alloca i32, align 4
  %3313 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3314 = call i32 (ptr, ...) @scanf(ptr %3313, ptr %3312)
  %3315 = load i32, ptr %3312, align 4
  %3316 = icmp eq i32 %3315, 0
  br label %continuation4968

continuation4968:                                 ; preds = %else4970, %then4969
  %3317 = phi i1 [ %3316, %else4970 ], [ true, %then4969 ]
  br i1 %3317, label %then4978, label %else4979

then4978:                                         ; preds = %continuation4968
  br label %continuation4977

else4979:                                         ; preds = %continuation4968
  %3318 = alloca i32, align 4
  %3319 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3320 = call i32 (ptr, ...) @scanf(ptr %3319, ptr %3318)
  %3321 = load i32, ptr %3318, align 4
  %3322 = icmp eq i32 %3321, 0
  br label %continuation4977

continuation4977:                                 ; preds = %else4979, %then4978
  %3323 = phi i1 [ %3322, %else4979 ], [ true, %then4978 ]
  br i1 %3323, label %then4987, label %else4988

then4987:                                         ; preds = %continuation4977
  br label %continuation4986

else4988:                                         ; preds = %continuation4977
  %3324 = alloca i32, align 4
  %3325 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3326 = call i32 (ptr, ...) @scanf(ptr %3325, ptr %3324)
  %3327 = load i32, ptr %3324, align 4
  %3328 = icmp eq i32 %3327, 0
  br label %continuation4986

continuation4986:                                 ; preds = %else4988, %then4987
  %3329 = phi i1 [ %3328, %else4988 ], [ true, %then4987 ]
  br i1 %3329, label %then4996, label %else4997

then4996:                                         ; preds = %continuation4986
  br label %continuation4995

else4997:                                         ; preds = %continuation4986
  %3330 = alloca i32, align 4
  %3331 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3332 = call i32 (ptr, ...) @scanf(ptr %3331, ptr %3330)
  %3333 = load i32, ptr %3330, align 4
  %3334 = icmp eq i32 %3333, 0
  br label %continuation4995

continuation4995:                                 ; preds = %else4997, %then4996
  %3335 = phi i1 [ %3334, %else4997 ], [ true, %then4996 ]
  br i1 %3335, label %then5005, label %else5006

then5005:                                         ; preds = %continuation4995
  br label %continuation5004

else5006:                                         ; preds = %continuation4995
  %3336 = alloca i32, align 4
  %3337 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3338 = call i32 (ptr, ...) @scanf(ptr %3337, ptr %3336)
  %3339 = load i32, ptr %3336, align 4
  %3340 = icmp eq i32 %3339, 0
  br label %continuation5004

continuation5004:                                 ; preds = %else5006, %then5005
  %3341 = phi i1 [ %3340, %else5006 ], [ true, %then5005 ]
  br i1 %3341, label %then5014, label %else5015

then5014:                                         ; preds = %continuation5004
  br label %continuation5013

else5015:                                         ; preds = %continuation5004
  %3342 = alloca i32, align 4
  %3343 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3344 = call i32 (ptr, ...) @scanf(ptr %3343, ptr %3342)
  %3345 = load i32, ptr %3342, align 4
  %3346 = icmp eq i32 %3345, 0
  br label %continuation5013

continuation5013:                                 ; preds = %else5015, %then5014
  %3347 = phi i1 [ %3346, %else5015 ], [ true, %then5014 ]
  br i1 %3347, label %then5023, label %else5024

then5023:                                         ; preds = %continuation5013
  br label %continuation5022

else5024:                                         ; preds = %continuation5013
  %3348 = alloca i32, align 4
  %3349 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3350 = call i32 (ptr, ...) @scanf(ptr %3349, ptr %3348)
  %3351 = load i32, ptr %3348, align 4
  %3352 = icmp eq i32 %3351, 0
  br label %continuation5022

continuation5022:                                 ; preds = %else5024, %then5023
  %3353 = phi i1 [ %3352, %else5024 ], [ true, %then5023 ]
  br i1 %3353, label %then5032, label %else5033

then5032:                                         ; preds = %continuation5022
  br label %continuation5031

else5033:                                         ; preds = %continuation5022
  %3354 = alloca i32, align 4
  %3355 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3356 = call i32 (ptr, ...) @scanf(ptr %3355, ptr %3354)
  %3357 = load i32, ptr %3354, align 4
  %3358 = icmp eq i32 %3357, 0
  br label %continuation5031

continuation5031:                                 ; preds = %else5033, %then5032
  %3359 = phi i1 [ %3358, %else5033 ], [ true, %then5032 ]
  br i1 %3359, label %then5041, label %else5042

then5041:                                         ; preds = %continuation5031
  br label %continuation5040

else5042:                                         ; preds = %continuation5031
  %3360 = alloca i32, align 4
  %3361 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3362 = call i32 (ptr, ...) @scanf(ptr %3361, ptr %3360)
  %3363 = load i32, ptr %3360, align 4
  %3364 = icmp eq i32 %3363, 0
  br label %continuation5040

continuation5040:                                 ; preds = %else5042, %then5041
  %3365 = phi i1 [ %3364, %else5042 ], [ true, %then5041 ]
  br i1 %3365, label %then5050, label %else5051

then5050:                                         ; preds = %continuation5040
  br label %continuation5049

else5051:                                         ; preds = %continuation5040
  %3366 = alloca i32, align 4
  %3367 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3368 = call i32 (ptr, ...) @scanf(ptr %3367, ptr %3366)
  %3369 = load i32, ptr %3366, align 4
  %3370 = icmp eq i32 %3369, 0
  br label %continuation5049

continuation5049:                                 ; preds = %else5051, %then5050
  %3371 = phi i1 [ %3370, %else5051 ], [ true, %then5050 ]
  br i1 %3371, label %then5059, label %else5060

then5059:                                         ; preds = %continuation5049
  br label %continuation5058

else5060:                                         ; preds = %continuation5049
  %3372 = alloca i32, align 4
  %3373 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3374 = call i32 (ptr, ...) @scanf(ptr %3373, ptr %3372)
  %3375 = load i32, ptr %3372, align 4
  %3376 = icmp eq i32 %3375, 0
  br label %continuation5058

continuation5058:                                 ; preds = %else5060, %then5059
  %3377 = phi i1 [ %3376, %else5060 ], [ true, %then5059 ]
  br i1 %3377, label %then5068, label %else5069

then5068:                                         ; preds = %continuation5058
  br label %continuation5067

else5069:                                         ; preds = %continuation5058
  %3378 = alloca i32, align 4
  %3379 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3380 = call i32 (ptr, ...) @scanf(ptr %3379, ptr %3378)
  %3381 = load i32, ptr %3378, align 4
  %3382 = icmp eq i32 %3381, 0
  br label %continuation5067

continuation5067:                                 ; preds = %else5069, %then5068
  %3383 = phi i1 [ %3382, %else5069 ], [ true, %then5068 ]
  br i1 %3383, label %then5077, label %else5078

then5077:                                         ; preds = %continuation5067
  br label %continuation5076

else5078:                                         ; preds = %continuation5067
  %3384 = alloca i32, align 4
  %3385 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3386 = call i32 (ptr, ...) @scanf(ptr %3385, ptr %3384)
  %3387 = load i32, ptr %3384, align 4
  %3388 = icmp eq i32 %3387, 0
  br label %continuation5076

continuation5076:                                 ; preds = %else5078, %then5077
  %3389 = phi i1 [ %3388, %else5078 ], [ true, %then5077 ]
  br i1 %3389, label %then5086, label %else5087

then5086:                                         ; preds = %continuation5076
  br label %continuation5085

else5087:                                         ; preds = %continuation5076
  %3390 = alloca i32, align 4
  %3391 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3392 = call i32 (ptr, ...) @scanf(ptr %3391, ptr %3390)
  %3393 = load i32, ptr %3390, align 4
  %3394 = icmp eq i32 %3393, 0
  br label %continuation5085

continuation5085:                                 ; preds = %else5087, %then5086
  %3395 = phi i1 [ %3394, %else5087 ], [ true, %then5086 ]
  br i1 %3395, label %then5095, label %else5096

then5095:                                         ; preds = %continuation5085
  br label %continuation5094

else5096:                                         ; preds = %continuation5085
  %3396 = alloca i32, align 4
  %3397 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3398 = call i32 (ptr, ...) @scanf(ptr %3397, ptr %3396)
  %3399 = load i32, ptr %3396, align 4
  %3400 = icmp eq i32 %3399, 0
  br label %continuation5094

continuation5094:                                 ; preds = %else5096, %then5095
  %3401 = phi i1 [ %3400, %else5096 ], [ true, %then5095 ]
  br i1 %3401, label %then5104, label %else5105

then5104:                                         ; preds = %continuation5094
  br label %continuation5103

else5105:                                         ; preds = %continuation5094
  %3402 = alloca i32, align 4
  %3403 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3404 = call i32 (ptr, ...) @scanf(ptr %3403, ptr %3402)
  %3405 = load i32, ptr %3402, align 4
  %3406 = icmp eq i32 %3405, 0
  br label %continuation5103

continuation5103:                                 ; preds = %else5105, %then5104
  %3407 = phi i1 [ %3406, %else5105 ], [ true, %then5104 ]
  br i1 %3407, label %then5113, label %else5114

then5113:                                         ; preds = %continuation5103
  br label %continuation5112

else5114:                                         ; preds = %continuation5103
  %3408 = alloca i32, align 4
  %3409 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3410 = call i32 (ptr, ...) @scanf(ptr %3409, ptr %3408)
  %3411 = load i32, ptr %3408, align 4
  %3412 = icmp eq i32 %3411, 0
  br label %continuation5112

continuation5112:                                 ; preds = %else5114, %then5113
  %3413 = phi i1 [ %3412, %else5114 ], [ true, %then5113 ]
  br i1 %3413, label %then5122, label %else5123

then5122:                                         ; preds = %continuation5112
  br label %continuation5121

else5123:                                         ; preds = %continuation5112
  %3414 = alloca i32, align 4
  %3415 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3416 = call i32 (ptr, ...) @scanf(ptr %3415, ptr %3414)
  %3417 = load i32, ptr %3414, align 4
  %3418 = icmp eq i32 %3417, 0
  br label %continuation5121

continuation5121:                                 ; preds = %else5123, %then5122
  %3419 = phi i1 [ %3418, %else5123 ], [ true, %then5122 ]
  br i1 %3419, label %then5131, label %else5132

then5131:                                         ; preds = %continuation5121
  br label %continuation5130

else5132:                                         ; preds = %continuation5121
  %3420 = alloca i32, align 4
  %3421 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3422 = call i32 (ptr, ...) @scanf(ptr %3421, ptr %3420)
  %3423 = load i32, ptr %3420, align 4
  %3424 = icmp eq i32 %3423, 0
  br label %continuation5130

continuation5130:                                 ; preds = %else5132, %then5131
  %3425 = phi i1 [ %3424, %else5132 ], [ true, %then5131 ]
  br i1 %3425, label %then5140, label %else5141

then5140:                                         ; preds = %continuation5130
  br label %continuation5139

else5141:                                         ; preds = %continuation5130
  %3426 = alloca i32, align 4
  %3427 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3428 = call i32 (ptr, ...) @scanf(ptr %3427, ptr %3426)
  %3429 = load i32, ptr %3426, align 4
  %3430 = icmp eq i32 %3429, 0
  br label %continuation5139

continuation5139:                                 ; preds = %else5141, %then5140
  %3431 = phi i1 [ %3430, %else5141 ], [ true, %then5140 ]
  br i1 %3431, label %then5149, label %else5150

then5149:                                         ; preds = %continuation5139
  br label %continuation5148

else5150:                                         ; preds = %continuation5139
  %3432 = alloca i32, align 4
  %3433 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3434 = call i32 (ptr, ...) @scanf(ptr %3433, ptr %3432)
  %3435 = load i32, ptr %3432, align 4
  %3436 = icmp eq i32 %3435, 0
  br label %continuation5148

continuation5148:                                 ; preds = %else5150, %then5149
  %3437 = phi i1 [ %3436, %else5150 ], [ true, %then5149 ]
  br i1 %3437, label %then5158, label %else5159

then5158:                                         ; preds = %continuation5148
  br label %continuation5157

else5159:                                         ; preds = %continuation5148
  %3438 = alloca i32, align 4
  %3439 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3440 = call i32 (ptr, ...) @scanf(ptr %3439, ptr %3438)
  %3441 = load i32, ptr %3438, align 4
  %3442 = icmp eq i32 %3441, 0
  br label %continuation5157

continuation5157:                                 ; preds = %else5159, %then5158
  %3443 = phi i1 [ %3442, %else5159 ], [ true, %then5158 ]
  br i1 %3443, label %then5167, label %else5168

then5167:                                         ; preds = %continuation5157
  br label %continuation5166

else5168:                                         ; preds = %continuation5157
  %3444 = alloca i32, align 4
  %3445 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3446 = call i32 (ptr, ...) @scanf(ptr %3445, ptr %3444)
  %3447 = load i32, ptr %3444, align 4
  %3448 = icmp eq i32 %3447, 0
  br label %continuation5166

continuation5166:                                 ; preds = %else5168, %then5167
  %3449 = phi i1 [ %3448, %else5168 ], [ true, %then5167 ]
  br i1 %3449, label %then5176, label %else5177

then5176:                                         ; preds = %continuation5166
  br label %continuation5175

else5177:                                         ; preds = %continuation5166
  %3450 = alloca i32, align 4
  %3451 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3452 = call i32 (ptr, ...) @scanf(ptr %3451, ptr %3450)
  %3453 = load i32, ptr %3450, align 4
  %3454 = icmp eq i32 %3453, 0
  br label %continuation5175

continuation5175:                                 ; preds = %else5177, %then5176
  %3455 = phi i1 [ %3454, %else5177 ], [ true, %then5176 ]
  br i1 %3455, label %then5185, label %else5186

then5185:                                         ; preds = %continuation5175
  br label %continuation5184

else5186:                                         ; preds = %continuation5175
  %3456 = alloca i32, align 4
  %3457 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3458 = call i32 (ptr, ...) @scanf(ptr %3457, ptr %3456)
  %3459 = load i32, ptr %3456, align 4
  %3460 = icmp eq i32 %3459, 0
  br label %continuation5184

continuation5184:                                 ; preds = %else5186, %then5185
  %3461 = phi i1 [ %3460, %else5186 ], [ true, %then5185 ]
  br i1 %3461, label %then5194, label %else5195

then5194:                                         ; preds = %continuation5184
  br label %continuation5193

else5195:                                         ; preds = %continuation5184
  %3462 = alloca i32, align 4
  %3463 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3464 = call i32 (ptr, ...) @scanf(ptr %3463, ptr %3462)
  %3465 = load i32, ptr %3462, align 4
  %3466 = icmp eq i32 %3465, 0
  br label %continuation5193

continuation5193:                                 ; preds = %else5195, %then5194
  %3467 = phi i1 [ %3466, %else5195 ], [ true, %then5194 ]
  br i1 %3467, label %then5203, label %else5204

then5203:                                         ; preds = %continuation5193
  br label %continuation5202

else5204:                                         ; preds = %continuation5193
  %3468 = alloca i32, align 4
  %3469 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3470 = call i32 (ptr, ...) @scanf(ptr %3469, ptr %3468)
  %3471 = load i32, ptr %3468, align 4
  %3472 = icmp eq i32 %3471, 0
  br label %continuation5202

continuation5202:                                 ; preds = %else5204, %then5203
  %3473 = phi i1 [ %3472, %else5204 ], [ true, %then5203 ]
  br i1 %3473, label %then5212, label %else5213

then5212:                                         ; preds = %continuation5202
  br label %continuation5211

else5213:                                         ; preds = %continuation5202
  %3474 = alloca i32, align 4
  %3475 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3476 = call i32 (ptr, ...) @scanf(ptr %3475, ptr %3474)
  %3477 = load i32, ptr %3474, align 4
  %3478 = icmp eq i32 %3477, 0
  br label %continuation5211

continuation5211:                                 ; preds = %else5213, %then5212
  %3479 = phi i1 [ %3478, %else5213 ], [ true, %then5212 ]
  br i1 %3479, label %then5221, label %else5222

then5221:                                         ; preds = %continuation5211
  br label %continuation5220

else5222:                                         ; preds = %continuation5211
  %3480 = alloca i32, align 4
  %3481 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3482 = call i32 (ptr, ...) @scanf(ptr %3481, ptr %3480)
  %3483 = load i32, ptr %3480, align 4
  %3484 = icmp eq i32 %3483, 0
  br label %continuation5220

continuation5220:                                 ; preds = %else5222, %then5221
  %3485 = phi i1 [ %3484, %else5222 ], [ true, %then5221 ]
  br i1 %3485, label %then5230, label %else5231

then5230:                                         ; preds = %continuation5220
  br label %continuation5229

else5231:                                         ; preds = %continuation5220
  %3486 = alloca i32, align 4
  %3487 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3488 = call i32 (ptr, ...) @scanf(ptr %3487, ptr %3486)
  %3489 = load i32, ptr %3486, align 4
  %3490 = icmp eq i32 %3489, 0
  br label %continuation5229

continuation5229:                                 ; preds = %else5231, %then5230
  %3491 = phi i1 [ %3490, %else5231 ], [ true, %then5230 ]
  br i1 %3491, label %then5239, label %else5240

then5239:                                         ; preds = %continuation5229
  br label %continuation5238

else5240:                                         ; preds = %continuation5229
  %3492 = alloca i32, align 4
  %3493 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3494 = call i32 (ptr, ...) @scanf(ptr %3493, ptr %3492)
  %3495 = load i32, ptr %3492, align 4
  %3496 = icmp eq i32 %3495, 0
  br label %continuation5238

continuation5238:                                 ; preds = %else5240, %then5239
  %3497 = phi i1 [ %3496, %else5240 ], [ true, %then5239 ]
  br i1 %3497, label %then5248, label %else5249

then5248:                                         ; preds = %continuation5238
  br label %continuation5247

else5249:                                         ; preds = %continuation5238
  %3498 = alloca i32, align 4
  %3499 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3500 = call i32 (ptr, ...) @scanf(ptr %3499, ptr %3498)
  %3501 = load i32, ptr %3498, align 4
  %3502 = icmp eq i32 %3501, 0
  br label %continuation5247

continuation5247:                                 ; preds = %else5249, %then5248
  %3503 = phi i1 [ %3502, %else5249 ], [ true, %then5248 ]
  br i1 %3503, label %then5257, label %else5258

then5257:                                         ; preds = %continuation5247
  br label %continuation5256

else5258:                                         ; preds = %continuation5247
  %3504 = alloca i32, align 4
  %3505 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3506 = call i32 (ptr, ...) @scanf(ptr %3505, ptr %3504)
  %3507 = load i32, ptr %3504, align 4
  %3508 = icmp eq i32 %3507, 0
  br label %continuation5256

continuation5256:                                 ; preds = %else5258, %then5257
  %3509 = phi i1 [ %3508, %else5258 ], [ true, %then5257 ]
  br i1 %3509, label %then5266, label %else5267

then5266:                                         ; preds = %continuation5256
  br label %continuation5265

else5267:                                         ; preds = %continuation5256
  %3510 = alloca i32, align 4
  %3511 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3512 = call i32 (ptr, ...) @scanf(ptr %3511, ptr %3510)
  %3513 = load i32, ptr %3510, align 4
  %3514 = icmp eq i32 %3513, 0
  br label %continuation5265

continuation5265:                                 ; preds = %else5267, %then5266
  %3515 = phi i1 [ %3514, %else5267 ], [ true, %then5266 ]
  br i1 %3515, label %then5275, label %else5276

then5275:                                         ; preds = %continuation5265
  br label %continuation5274

else5276:                                         ; preds = %continuation5265
  %3516 = alloca i32, align 4
  %3517 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3518 = call i32 (ptr, ...) @scanf(ptr %3517, ptr %3516)
  %3519 = load i32, ptr %3516, align 4
  %3520 = icmp eq i32 %3519, 0
  br label %continuation5274

continuation5274:                                 ; preds = %else5276, %then5275
  %3521 = phi i1 [ %3520, %else5276 ], [ true, %then5275 ]
  br i1 %3521, label %then5284, label %else5285

then5284:                                         ; preds = %continuation5274
  br label %continuation5283

else5285:                                         ; preds = %continuation5274
  %3522 = alloca i32, align 4
  %3523 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3524 = call i32 (ptr, ...) @scanf(ptr %3523, ptr %3522)
  %3525 = load i32, ptr %3522, align 4
  %3526 = icmp eq i32 %3525, 0
  br label %continuation5283

continuation5283:                                 ; preds = %else5285, %then5284
  %3527 = phi i1 [ %3526, %else5285 ], [ true, %then5284 ]
  br i1 %3527, label %then5293, label %else5294

then5293:                                         ; preds = %continuation5283
  br label %continuation5292

else5294:                                         ; preds = %continuation5283
  %3528 = alloca i32, align 4
  %3529 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3530 = call i32 (ptr, ...) @scanf(ptr %3529, ptr %3528)
  %3531 = load i32, ptr %3528, align 4
  %3532 = icmp eq i32 %3531, 0
  br label %continuation5292

continuation5292:                                 ; preds = %else5294, %then5293
  %3533 = phi i1 [ %3532, %else5294 ], [ true, %then5293 ]
  br i1 %3533, label %then5302, label %else5303

then5302:                                         ; preds = %continuation5292
  br label %continuation5301

else5303:                                         ; preds = %continuation5292
  %3534 = alloca i32, align 4
  %3535 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3536 = call i32 (ptr, ...) @scanf(ptr %3535, ptr %3534)
  %3537 = load i32, ptr %3534, align 4
  %3538 = icmp eq i32 %3537, 0
  br label %continuation5301

continuation5301:                                 ; preds = %else5303, %then5302
  %3539 = phi i1 [ %3538, %else5303 ], [ true, %then5302 ]
  br i1 %3539, label %then5311, label %else5312

then5311:                                         ; preds = %continuation5301
  br label %continuation5310

else5312:                                         ; preds = %continuation5301
  %3540 = alloca i32, align 4
  %3541 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3542 = call i32 (ptr, ...) @scanf(ptr %3541, ptr %3540)
  %3543 = load i32, ptr %3540, align 4
  %3544 = icmp eq i32 %3543, 0
  br label %continuation5310

continuation5310:                                 ; preds = %else5312, %then5311
  %3545 = phi i1 [ %3544, %else5312 ], [ true, %then5311 ]
  br i1 %3545, label %then5320, label %else5321

then5320:                                         ; preds = %continuation5310
  br label %continuation5319

else5321:                                         ; preds = %continuation5310
  %3546 = alloca i32, align 4
  %3547 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3548 = call i32 (ptr, ...) @scanf(ptr %3547, ptr %3546)
  %3549 = load i32, ptr %3546, align 4
  %3550 = icmp eq i32 %3549, 0
  br label %continuation5319

continuation5319:                                 ; preds = %else5321, %then5320
  %3551 = phi i1 [ %3550, %else5321 ], [ true, %then5320 ]
  br i1 %3551, label %then5329, label %else5330

then5329:                                         ; preds = %continuation5319
  br label %continuation5328

else5330:                                         ; preds = %continuation5319
  %3552 = alloca i32, align 4
  %3553 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3554 = call i32 (ptr, ...) @scanf(ptr %3553, ptr %3552)
  %3555 = load i32, ptr %3552, align 4
  %3556 = icmp eq i32 %3555, 0
  br label %continuation5328

continuation5328:                                 ; preds = %else5330, %then5329
  %3557 = phi i1 [ %3556, %else5330 ], [ true, %then5329 ]
  br i1 %3557, label %then5338, label %else5339

then5338:                                         ; preds = %continuation5328
  br label %continuation5337

else5339:                                         ; preds = %continuation5328
  %3558 = alloca i32, align 4
  %3559 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3560 = call i32 (ptr, ...) @scanf(ptr %3559, ptr %3558)
  %3561 = load i32, ptr %3558, align 4
  %3562 = icmp eq i32 %3561, 0
  br label %continuation5337

continuation5337:                                 ; preds = %else5339, %then5338
  %3563 = phi i1 [ %3562, %else5339 ], [ true, %then5338 ]
  br i1 %3563, label %then5347, label %else5348

then5347:                                         ; preds = %continuation5337
  br label %continuation5346

else5348:                                         ; preds = %continuation5337
  %3564 = alloca i32, align 4
  %3565 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3566 = call i32 (ptr, ...) @scanf(ptr %3565, ptr %3564)
  %3567 = load i32, ptr %3564, align 4
  %3568 = icmp eq i32 %3567, 0
  br label %continuation5346

continuation5346:                                 ; preds = %else5348, %then5347
  %3569 = phi i1 [ %3568, %else5348 ], [ true, %then5347 ]
  br i1 %3569, label %then5356, label %else5357

then5356:                                         ; preds = %continuation5346
  br label %continuation5355

else5357:                                         ; preds = %continuation5346
  %3570 = alloca i32, align 4
  %3571 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3572 = call i32 (ptr, ...) @scanf(ptr %3571, ptr %3570)
  %3573 = load i32, ptr %3570, align 4
  %3574 = icmp eq i32 %3573, 0
  br label %continuation5355

continuation5355:                                 ; preds = %else5357, %then5356
  %3575 = phi i1 [ %3574, %else5357 ], [ true, %then5356 ]
  br i1 %3575, label %then5365, label %else5366

then5365:                                         ; preds = %continuation5355
  br label %continuation5364

else5366:                                         ; preds = %continuation5355
  %3576 = alloca i32, align 4
  %3577 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3578 = call i32 (ptr, ...) @scanf(ptr %3577, ptr %3576)
  %3579 = load i32, ptr %3576, align 4
  %3580 = icmp eq i32 %3579, 0
  br label %continuation5364

continuation5364:                                 ; preds = %else5366, %then5365
  %3581 = phi i1 [ %3580, %else5366 ], [ true, %then5365 ]
  br i1 %3581, label %then5374, label %else5375

then5374:                                         ; preds = %continuation5364
  br label %continuation5373

else5375:                                         ; preds = %continuation5364
  %3582 = alloca i32, align 4
  %3583 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3584 = call i32 (ptr, ...) @scanf(ptr %3583, ptr %3582)
  %3585 = load i32, ptr %3582, align 4
  %3586 = icmp eq i32 %3585, 0
  br label %continuation5373

continuation5373:                                 ; preds = %else5375, %then5374
  %3587 = phi i1 [ %3586, %else5375 ], [ true, %then5374 ]
  br i1 %3587, label %then5383, label %else5384

then5383:                                         ; preds = %continuation5373
  br label %continuation5382

else5384:                                         ; preds = %continuation5373
  %3588 = alloca i32, align 4
  %3589 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3590 = call i32 (ptr, ...) @scanf(ptr %3589, ptr %3588)
  %3591 = load i32, ptr %3588, align 4
  %3592 = icmp eq i32 %3591, 0
  br label %continuation5382

continuation5382:                                 ; preds = %else5384, %then5383
  %3593 = phi i1 [ %3592, %else5384 ], [ true, %then5383 ]
  br i1 %3593, label %then5392, label %else5393

then5392:                                         ; preds = %continuation5382
  br label %continuation5391

else5393:                                         ; preds = %continuation5382
  %3594 = alloca i32, align 4
  %3595 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3596 = call i32 (ptr, ...) @scanf(ptr %3595, ptr %3594)
  %3597 = load i32, ptr %3594, align 4
  %3598 = icmp eq i32 %3597, 0
  br label %continuation5391

continuation5391:                                 ; preds = %else5393, %then5392
  %3599 = phi i1 [ %3598, %else5393 ], [ true, %then5392 ]
  br i1 %3599, label %then5401, label %else5402

then5401:                                         ; preds = %continuation5391
  br label %continuation5400

else5402:                                         ; preds = %continuation5391
  %3600 = alloca i32, align 4
  %3601 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3602 = call i32 (ptr, ...) @scanf(ptr %3601, ptr %3600)
  %3603 = load i32, ptr %3600, align 4
  %3604 = icmp eq i32 %3603, 0
  br label %continuation5400

continuation5400:                                 ; preds = %else5402, %then5401
  %3605 = phi i1 [ %3604, %else5402 ], [ true, %then5401 ]
  br i1 %3605, label %then5410, label %else5411

then5410:                                         ; preds = %continuation5400
  br label %continuation5409

else5411:                                         ; preds = %continuation5400
  %3606 = alloca i32, align 4
  %3607 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3608 = call i32 (ptr, ...) @scanf(ptr %3607, ptr %3606)
  %3609 = load i32, ptr %3606, align 4
  %3610 = icmp eq i32 %3609, 0
  br label %continuation5409

continuation5409:                                 ; preds = %else5411, %then5410
  %3611 = phi i1 [ %3610, %else5411 ], [ true, %then5410 ]
  br i1 %3611, label %then5419, label %else5420

then5419:                                         ; preds = %continuation5409
  br label %continuation5418

else5420:                                         ; preds = %continuation5409
  %3612 = alloca i32, align 4
  %3613 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3614 = call i32 (ptr, ...) @scanf(ptr %3613, ptr %3612)
  %3615 = load i32, ptr %3612, align 4
  %3616 = icmp eq i32 %3615, 0
  br label %continuation5418

continuation5418:                                 ; preds = %else5420, %then5419
  %3617 = phi i1 [ %3616, %else5420 ], [ true, %then5419 ]
  br i1 %3617, label %then5428, label %else5429

then5428:                                         ; preds = %continuation5418
  br label %continuation5427

else5429:                                         ; preds = %continuation5418
  %3618 = alloca i32, align 4
  %3619 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3620 = call i32 (ptr, ...) @scanf(ptr %3619, ptr %3618)
  %3621 = load i32, ptr %3618, align 4
  %3622 = icmp eq i32 %3621, 0
  br label %continuation5427

continuation5427:                                 ; preds = %else5429, %then5428
  %3623 = phi i1 [ %3622, %else5429 ], [ true, %then5428 ]
  br i1 %3623, label %then5437, label %else5438

then5437:                                         ; preds = %continuation5427
  br label %continuation5436

else5438:                                         ; preds = %continuation5427
  %3624 = alloca i32, align 4
  %3625 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3626 = call i32 (ptr, ...) @scanf(ptr %3625, ptr %3624)
  %3627 = load i32, ptr %3624, align 4
  %3628 = icmp eq i32 %3627, 0
  br label %continuation5436

continuation5436:                                 ; preds = %else5438, %then5437
  %3629 = phi i1 [ %3628, %else5438 ], [ true, %then5437 ]
  br i1 %3629, label %then5446, label %else5447

then5446:                                         ; preds = %continuation5436
  br label %continuation5445

else5447:                                         ; preds = %continuation5436
  %3630 = alloca i32, align 4
  %3631 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3632 = call i32 (ptr, ...) @scanf(ptr %3631, ptr %3630)
  %3633 = load i32, ptr %3630, align 4
  %3634 = icmp eq i32 %3633, 0
  br label %continuation5445

continuation5445:                                 ; preds = %else5447, %then5446
  %3635 = phi i1 [ %3634, %else5447 ], [ true, %then5446 ]
  br i1 %3635, label %then5455, label %else5456

then5455:                                         ; preds = %continuation5445
  br label %continuation5454

else5456:                                         ; preds = %continuation5445
  %3636 = alloca i32, align 4
  %3637 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3638 = call i32 (ptr, ...) @scanf(ptr %3637, ptr %3636)
  %3639 = load i32, ptr %3636, align 4
  %3640 = icmp eq i32 %3639, 0
  br label %continuation5454

continuation5454:                                 ; preds = %else5456, %then5455
  %3641 = phi i1 [ %3640, %else5456 ], [ true, %then5455 ]
  br i1 %3641, label %then5464, label %else5465

then5464:                                         ; preds = %continuation5454
  br label %continuation5463

else5465:                                         ; preds = %continuation5454
  %3642 = alloca i32, align 4
  %3643 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3644 = call i32 (ptr, ...) @scanf(ptr %3643, ptr %3642)
  %3645 = load i32, ptr %3642, align 4
  %3646 = icmp eq i32 %3645, 0
  br label %continuation5463

continuation5463:                                 ; preds = %else5465, %then5464
  %3647 = phi i1 [ %3646, %else5465 ], [ true, %then5464 ]
  br i1 %3647, label %then5473, label %else5474

then5473:                                         ; preds = %continuation5463
  br label %continuation5472

else5474:                                         ; preds = %continuation5463
  %3648 = alloca i32, align 4
  %3649 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3650 = call i32 (ptr, ...) @scanf(ptr %3649, ptr %3648)
  %3651 = load i32, ptr %3648, align 4
  %3652 = icmp eq i32 %3651, 0
  br label %continuation5472

continuation5472:                                 ; preds = %else5474, %then5473
  %3653 = phi i1 [ %3652, %else5474 ], [ true, %then5473 ]
  br i1 %3653, label %then5482, label %else5483

then5482:                                         ; preds = %continuation5472
  br label %continuation5481

else5483:                                         ; preds = %continuation5472
  %3654 = alloca i32, align 4
  %3655 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3656 = call i32 (ptr, ...) @scanf(ptr %3655, ptr %3654)
  %3657 = load i32, ptr %3654, align 4
  %3658 = icmp eq i32 %3657, 0
  br label %continuation5481

continuation5481:                                 ; preds = %else5483, %then5482
  %3659 = phi i1 [ %3658, %else5483 ], [ true, %then5482 ]
  br i1 %3659, label %then5491, label %else5492

then5491:                                         ; preds = %continuation5481
  br label %continuation5490

else5492:                                         ; preds = %continuation5481
  %3660 = alloca i32, align 4
  %3661 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3662 = call i32 (ptr, ...) @scanf(ptr %3661, ptr %3660)
  %3663 = load i32, ptr %3660, align 4
  %3664 = icmp eq i32 %3663, 0
  br label %continuation5490

continuation5490:                                 ; preds = %else5492, %then5491
  %3665 = phi i1 [ %3664, %else5492 ], [ true, %then5491 ]
  br i1 %3665, label %then5500, label %else5501

then5500:                                         ; preds = %continuation5490
  br label %continuation5499

else5501:                                         ; preds = %continuation5490
  %3666 = alloca i32, align 4
  %3667 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3668 = call i32 (ptr, ...) @scanf(ptr %3667, ptr %3666)
  %3669 = load i32, ptr %3666, align 4
  %3670 = icmp eq i32 %3669, 0
  br label %continuation5499

continuation5499:                                 ; preds = %else5501, %then5500
  %3671 = phi i1 [ %3670, %else5501 ], [ true, %then5500 ]
  br i1 %3671, label %then5509, label %else5510

then5509:                                         ; preds = %continuation5499
  br label %continuation5508

else5510:                                         ; preds = %continuation5499
  %3672 = alloca i32, align 4
  %3673 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3674 = call i32 (ptr, ...) @scanf(ptr %3673, ptr %3672)
  %3675 = load i32, ptr %3672, align 4
  %3676 = icmp eq i32 %3675, 0
  br label %continuation5508

continuation5508:                                 ; preds = %else5510, %then5509
  %3677 = phi i1 [ %3676, %else5510 ], [ true, %then5509 ]
  br i1 %3677, label %then5518, label %else5519

then5518:                                         ; preds = %continuation5508
  br label %continuation5517

else5519:                                         ; preds = %continuation5508
  %3678 = alloca i32, align 4
  %3679 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3680 = call i32 (ptr, ...) @scanf(ptr %3679, ptr %3678)
  %3681 = load i32, ptr %3678, align 4
  %3682 = icmp eq i32 %3681, 0
  br label %continuation5517

continuation5517:                                 ; preds = %else5519, %then5518
  %3683 = phi i1 [ %3682, %else5519 ], [ true, %then5518 ]
  br i1 %3683, label %then5527, label %else5528

then5527:                                         ; preds = %continuation5517
  br label %continuation5526

else5528:                                         ; preds = %continuation5517
  %3684 = alloca i32, align 4
  %3685 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3686 = call i32 (ptr, ...) @scanf(ptr %3685, ptr %3684)
  %3687 = load i32, ptr %3684, align 4
  %3688 = icmp eq i32 %3687, 0
  br label %continuation5526

continuation5526:                                 ; preds = %else5528, %then5527
  %3689 = phi i1 [ %3688, %else5528 ], [ true, %then5527 ]
  br i1 %3689, label %then5536, label %else5537

then5536:                                         ; preds = %continuation5526
  br label %continuation5535

else5537:                                         ; preds = %continuation5526
  %3690 = alloca i32, align 4
  %3691 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3692 = call i32 (ptr, ...) @scanf(ptr %3691, ptr %3690)
  %3693 = load i32, ptr %3690, align 4
  %3694 = icmp eq i32 %3693, 0
  br label %continuation5535

continuation5535:                                 ; preds = %else5537, %then5536
  %3695 = phi i1 [ %3694, %else5537 ], [ true, %then5536 ]
  br i1 %3695, label %then5545, label %else5546

then5545:                                         ; preds = %continuation5535
  br label %continuation5544

else5546:                                         ; preds = %continuation5535
  %3696 = alloca i32, align 4
  %3697 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3698 = call i32 (ptr, ...) @scanf(ptr %3697, ptr %3696)
  %3699 = load i32, ptr %3696, align 4
  %3700 = icmp eq i32 %3699, 0
  br label %continuation5544

continuation5544:                                 ; preds = %else5546, %then5545
  %3701 = phi i1 [ %3700, %else5546 ], [ true, %then5545 ]
  br i1 %3701, label %then5554, label %else5555

then5554:                                         ; preds = %continuation5544
  br label %continuation5553

else5555:                                         ; preds = %continuation5544
  %3702 = alloca i32, align 4
  %3703 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3704 = call i32 (ptr, ...) @scanf(ptr %3703, ptr %3702)
  %3705 = load i32, ptr %3702, align 4
  %3706 = icmp eq i32 %3705, 0
  br label %continuation5553

continuation5553:                                 ; preds = %else5555, %then5554
  %3707 = phi i1 [ %3706, %else5555 ], [ true, %then5554 ]
  br i1 %3707, label %then5563, label %else5564

then5563:                                         ; preds = %continuation5553
  br label %continuation5562

else5564:                                         ; preds = %continuation5553
  %3708 = alloca i32, align 4
  %3709 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3710 = call i32 (ptr, ...) @scanf(ptr %3709, ptr %3708)
  %3711 = load i32, ptr %3708, align 4
  %3712 = icmp eq i32 %3711, 0
  br label %continuation5562

continuation5562:                                 ; preds = %else5564, %then5563
  %3713 = phi i1 [ %3712, %else5564 ], [ true, %then5563 ]
  br i1 %3713, label %then5572, label %else5573

then5572:                                         ; preds = %continuation5562
  br label %continuation5571

else5573:                                         ; preds = %continuation5562
  %3714 = alloca i32, align 4
  %3715 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3716 = call i32 (ptr, ...) @scanf(ptr %3715, ptr %3714)
  %3717 = load i32, ptr %3714, align 4
  %3718 = icmp eq i32 %3717, 0
  br label %continuation5571

continuation5571:                                 ; preds = %else5573, %then5572
  %3719 = phi i1 [ %3718, %else5573 ], [ true, %then5572 ]
  br i1 %3719, label %then5581, label %else5582

then5581:                                         ; preds = %continuation5571
  br label %continuation5580

else5582:                                         ; preds = %continuation5571
  %3720 = alloca i32, align 4
  %3721 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3722 = call i32 (ptr, ...) @scanf(ptr %3721, ptr %3720)
  %3723 = load i32, ptr %3720, align 4
  %3724 = icmp eq i32 %3723, 0
  br label %continuation5580

continuation5580:                                 ; preds = %else5582, %then5581
  %3725 = phi i1 [ %3724, %else5582 ], [ true, %then5581 ]
  br i1 %3725, label %then5590, label %else5591

then5590:                                         ; preds = %continuation5580
  br label %continuation5589

else5591:                                         ; preds = %continuation5580
  %3726 = alloca i32, align 4
  %3727 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3728 = call i32 (ptr, ...) @scanf(ptr %3727, ptr %3726)
  %3729 = load i32, ptr %3726, align 4
  %3730 = icmp eq i32 %3729, 0
  br label %continuation5589

continuation5589:                                 ; preds = %else5591, %then5590
  %3731 = phi i1 [ %3730, %else5591 ], [ true, %then5590 ]
  br i1 %3731, label %then5599, label %else5600

then5599:                                         ; preds = %continuation5589
  br label %continuation5598

else5600:                                         ; preds = %continuation5589
  %3732 = alloca i32, align 4
  %3733 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3734 = call i32 (ptr, ...) @scanf(ptr %3733, ptr %3732)
  %3735 = load i32, ptr %3732, align 4
  %3736 = icmp eq i32 %3735, 0
  br label %continuation5598

continuation5598:                                 ; preds = %else5600, %then5599
  %3737 = phi i1 [ %3736, %else5600 ], [ true, %then5599 ]
  br i1 %3737, label %then5608, label %else5609

then5608:                                         ; preds = %continuation5598
  br label %continuation5607

else5609:                                         ; preds = %continuation5598
  %3738 = alloca i32, align 4
  %3739 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3740 = call i32 (ptr, ...) @scanf(ptr %3739, ptr %3738)
  %3741 = load i32, ptr %3738, align 4
  %3742 = icmp eq i32 %3741, 0
  br label %continuation5607

continuation5607:                                 ; preds = %else5609, %then5608
  %3743 = phi i1 [ %3742, %else5609 ], [ true, %then5608 ]
  br i1 %3743, label %then5617, label %else5618

then5617:                                         ; preds = %continuation5607
  br label %continuation5616

else5618:                                         ; preds = %continuation5607
  %3744 = alloca i32, align 4
  %3745 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3746 = call i32 (ptr, ...) @scanf(ptr %3745, ptr %3744)
  %3747 = load i32, ptr %3744, align 4
  %3748 = icmp eq i32 %3747, 0
  br label %continuation5616

continuation5616:                                 ; preds = %else5618, %then5617
  %3749 = phi i1 [ %3748, %else5618 ], [ true, %then5617 ]
  br i1 %3749, label %then5626, label %else5627

then5626:                                         ; preds = %continuation5616
  br label %continuation5625

else5627:                                         ; preds = %continuation5616
  %3750 = alloca i32, align 4
  %3751 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3752 = call i32 (ptr, ...) @scanf(ptr %3751, ptr %3750)
  %3753 = load i32, ptr %3750, align 4
  %3754 = icmp eq i32 %3753, 0
  br label %continuation5625

continuation5625:                                 ; preds = %else5627, %then5626
  %3755 = phi i1 [ %3754, %else5627 ], [ true, %then5626 ]
  br i1 %3755, label %then5635, label %else5636

then5635:                                         ; preds = %continuation5625
  br label %continuation5634

else5636:                                         ; preds = %continuation5625
  %3756 = alloca i32, align 4
  %3757 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3758 = call i32 (ptr, ...) @scanf(ptr %3757, ptr %3756)
  %3759 = load i32, ptr %3756, align 4
  %3760 = icmp eq i32 %3759, 0
  br label %continuation5634

continuation5634:                                 ; preds = %else5636, %then5635
  %3761 = phi i1 [ %3760, %else5636 ], [ true, %then5635 ]
  br i1 %3761, label %then5644, label %else5645

then5644:                                         ; preds = %continuation5634
  br label %continuation5643

else5645:                                         ; preds = %continuation5634
  %3762 = alloca i32, align 4
  %3763 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3764 = call i32 (ptr, ...) @scanf(ptr %3763, ptr %3762)
  %3765 = load i32, ptr %3762, align 4
  %3766 = icmp eq i32 %3765, 0
  br label %continuation5643

continuation5643:                                 ; preds = %else5645, %then5644
  %3767 = phi i1 [ %3766, %else5645 ], [ true, %then5644 ]
  br i1 %3767, label %then5653, label %else5654

then5653:                                         ; preds = %continuation5643
  br label %continuation5652

else5654:                                         ; preds = %continuation5643
  %3768 = alloca i32, align 4
  %3769 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3770 = call i32 (ptr, ...) @scanf(ptr %3769, ptr %3768)
  %3771 = load i32, ptr %3768, align 4
  %3772 = icmp eq i32 %3771, 0
  br label %continuation5652

continuation5652:                                 ; preds = %else5654, %then5653
  %3773 = phi i1 [ %3772, %else5654 ], [ true, %then5653 ]
  br i1 %3773, label %then5662, label %else5663

then5662:                                         ; preds = %continuation5652
  br label %continuation5661

else5663:                                         ; preds = %continuation5652
  %3774 = alloca i32, align 4
  %3775 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3776 = call i32 (ptr, ...) @scanf(ptr %3775, ptr %3774)
  %3777 = load i32, ptr %3774, align 4
  %3778 = icmp eq i32 %3777, 0
  br label %continuation5661

continuation5661:                                 ; preds = %else5663, %then5662
  %3779 = phi i1 [ %3778, %else5663 ], [ true, %then5662 ]
  br i1 %3779, label %then5671, label %else5672

then5671:                                         ; preds = %continuation5661
  br label %continuation5670

else5672:                                         ; preds = %continuation5661
  %3780 = alloca i32, align 4
  %3781 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3782 = call i32 (ptr, ...) @scanf(ptr %3781, ptr %3780)
  %3783 = load i32, ptr %3780, align 4
  %3784 = icmp eq i32 %3783, 0
  br label %continuation5670

continuation5670:                                 ; preds = %else5672, %then5671
  %3785 = phi i1 [ %3784, %else5672 ], [ true, %then5671 ]
  br i1 %3785, label %then5680, label %else5681

then5680:                                         ; preds = %continuation5670
  br label %continuation5679

else5681:                                         ; preds = %continuation5670
  %3786 = alloca i32, align 4
  %3787 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3788 = call i32 (ptr, ...) @scanf(ptr %3787, ptr %3786)
  %3789 = load i32, ptr %3786, align 4
  %3790 = icmp eq i32 %3789, 0
  br label %continuation5679

continuation5679:                                 ; preds = %else5681, %then5680
  %3791 = phi i1 [ %3790, %else5681 ], [ true, %then5680 ]
  br i1 %3791, label %then5689, label %else5690

then5689:                                         ; preds = %continuation5679
  br label %continuation5688

else5690:                                         ; preds = %continuation5679
  %3792 = alloca i32, align 4
  %3793 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3794 = call i32 (ptr, ...) @scanf(ptr %3793, ptr %3792)
  %3795 = load i32, ptr %3792, align 4
  %3796 = icmp eq i32 %3795, 0
  br label %continuation5688

continuation5688:                                 ; preds = %else5690, %then5689
  %3797 = phi i1 [ %3796, %else5690 ], [ true, %then5689 ]
  br i1 %3797, label %then5698, label %else5699

then5698:                                         ; preds = %continuation5688
  br label %continuation5697

else5699:                                         ; preds = %continuation5688
  %3798 = alloca i32, align 4
  %3799 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3800 = call i32 (ptr, ...) @scanf(ptr %3799, ptr %3798)
  %3801 = load i32, ptr %3798, align 4
  %3802 = icmp eq i32 %3801, 0
  br label %continuation5697

continuation5697:                                 ; preds = %else5699, %then5698
  %3803 = phi i1 [ %3802, %else5699 ], [ true, %then5698 ]
  br i1 %3803, label %then5707, label %else5708

then5707:                                         ; preds = %continuation5697
  br label %continuation5706

else5708:                                         ; preds = %continuation5697
  %3804 = alloca i32, align 4
  %3805 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3806 = call i32 (ptr, ...) @scanf(ptr %3805, ptr %3804)
  %3807 = load i32, ptr %3804, align 4
  %3808 = icmp eq i32 %3807, 0
  br label %continuation5706

continuation5706:                                 ; preds = %else5708, %then5707
  %3809 = phi i1 [ %3808, %else5708 ], [ true, %then5707 ]
  br i1 %3809, label %then5716, label %else5717

then5716:                                         ; preds = %continuation5706
  br label %continuation5715

else5717:                                         ; preds = %continuation5706
  %3810 = alloca i32, align 4
  %3811 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3812 = call i32 (ptr, ...) @scanf(ptr %3811, ptr %3810)
  %3813 = load i32, ptr %3810, align 4
  %3814 = icmp eq i32 %3813, 0
  br label %continuation5715

continuation5715:                                 ; preds = %else5717, %then5716
  %3815 = phi i1 [ %3814, %else5717 ], [ true, %then5716 ]
  br i1 %3815, label %then5725, label %else5726

then5725:                                         ; preds = %continuation5715
  br label %continuation5724

else5726:                                         ; preds = %continuation5715
  %3816 = alloca i32, align 4
  %3817 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3818 = call i32 (ptr, ...) @scanf(ptr %3817, ptr %3816)
  %3819 = load i32, ptr %3816, align 4
  %3820 = icmp eq i32 %3819, 0
  br label %continuation5724

continuation5724:                                 ; preds = %else5726, %then5725
  %3821 = phi i1 [ %3820, %else5726 ], [ true, %then5725 ]
  br i1 %3821, label %then5734, label %else5735

then5734:                                         ; preds = %continuation5724
  br label %continuation5733

else5735:                                         ; preds = %continuation5724
  %3822 = alloca i32, align 4
  %3823 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3824 = call i32 (ptr, ...) @scanf(ptr %3823, ptr %3822)
  %3825 = load i32, ptr %3822, align 4
  %3826 = icmp eq i32 %3825, 0
  br label %continuation5733

continuation5733:                                 ; preds = %else5735, %then5734
  %3827 = phi i1 [ %3826, %else5735 ], [ true, %then5734 ]
  br i1 %3827, label %then5743, label %else5744

then5743:                                         ; preds = %continuation5733
  br label %continuation5742

else5744:                                         ; preds = %continuation5733
  %3828 = alloca i32, align 4
  %3829 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3830 = call i32 (ptr, ...) @scanf(ptr %3829, ptr %3828)
  %3831 = load i32, ptr %3828, align 4
  %3832 = icmp eq i32 %3831, 0
  br label %continuation5742

continuation5742:                                 ; preds = %else5744, %then5743
  %3833 = phi i1 [ %3832, %else5744 ], [ true, %then5743 ]
  br i1 %3833, label %then5752, label %else5753

then5752:                                         ; preds = %continuation5742
  br label %continuation5751

else5753:                                         ; preds = %continuation5742
  %3834 = alloca i32, align 4
  %3835 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3836 = call i32 (ptr, ...) @scanf(ptr %3835, ptr %3834)
  %3837 = load i32, ptr %3834, align 4
  %3838 = icmp eq i32 %3837, 0
  br label %continuation5751

continuation5751:                                 ; preds = %else5753, %then5752
  %3839 = phi i1 [ %3838, %else5753 ], [ true, %then5752 ]
  br i1 %3839, label %then5761, label %else5762

then5761:                                         ; preds = %continuation5751
  br label %continuation5760

else5762:                                         ; preds = %continuation5751
  %3840 = alloca i32, align 4
  %3841 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3842 = call i32 (ptr, ...) @scanf(ptr %3841, ptr %3840)
  %3843 = load i32, ptr %3840, align 4
  %3844 = icmp eq i32 %3843, 0
  br label %continuation5760

continuation5760:                                 ; preds = %else5762, %then5761
  %3845 = phi i1 [ %3844, %else5762 ], [ true, %then5761 ]
  br i1 %3845, label %then5770, label %else5771

then5770:                                         ; preds = %continuation5760
  br label %continuation5769

else5771:                                         ; preds = %continuation5760
  %3846 = alloca i32, align 4
  %3847 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3848 = call i32 (ptr, ...) @scanf(ptr %3847, ptr %3846)
  %3849 = load i32, ptr %3846, align 4
  %3850 = icmp eq i32 %3849, 0
  br label %continuation5769

continuation5769:                                 ; preds = %else5771, %then5770
  %3851 = phi i1 [ %3850, %else5771 ], [ true, %then5770 ]
  br i1 %3851, label %then5779, label %else5780

then5779:                                         ; preds = %continuation5769
  br label %continuation5778

else5780:                                         ; preds = %continuation5769
  %3852 = alloca i32, align 4
  %3853 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3854 = call i32 (ptr, ...) @scanf(ptr %3853, ptr %3852)
  %3855 = load i32, ptr %3852, align 4
  %3856 = icmp eq i32 %3855, 0
  br label %continuation5778

continuation5778:                                 ; preds = %else5780, %then5779
  %3857 = phi i1 [ %3856, %else5780 ], [ true, %then5779 ]
  br i1 %3857, label %then5788, label %else5789

then5788:                                         ; preds = %continuation5778
  br label %continuation5787

else5789:                                         ; preds = %continuation5778
  %3858 = alloca i32, align 4
  %3859 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3860 = call i32 (ptr, ...) @scanf(ptr %3859, ptr %3858)
  %3861 = load i32, ptr %3858, align 4
  %3862 = icmp eq i32 %3861, 0
  br label %continuation5787

continuation5787:                                 ; preds = %else5789, %then5788
  %3863 = phi i1 [ %3862, %else5789 ], [ true, %then5788 ]
  br i1 %3863, label %then5797, label %else5798

then5797:                                         ; preds = %continuation5787
  br label %continuation5796

else5798:                                         ; preds = %continuation5787
  %3864 = alloca i32, align 4
  %3865 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3866 = call i32 (ptr, ...) @scanf(ptr %3865, ptr %3864)
  %3867 = load i32, ptr %3864, align 4
  %3868 = icmp eq i32 %3867, 0
  br label %continuation5796

continuation5796:                                 ; preds = %else5798, %then5797
  %3869 = phi i1 [ %3868, %else5798 ], [ true, %then5797 ]
  br i1 %3869, label %then5806, label %else5807

then5806:                                         ; preds = %continuation5796
  br label %continuation5805

else5807:                                         ; preds = %continuation5796
  %3870 = alloca i32, align 4
  %3871 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3872 = call i32 (ptr, ...) @scanf(ptr %3871, ptr %3870)
  %3873 = load i32, ptr %3870, align 4
  %3874 = icmp eq i32 %3873, 0
  br label %continuation5805

continuation5805:                                 ; preds = %else5807, %then5806
  %3875 = phi i1 [ %3874, %else5807 ], [ true, %then5806 ]
  br i1 %3875, label %then5815, label %else5816

then5815:                                         ; preds = %continuation5805
  br label %continuation5814

else5816:                                         ; preds = %continuation5805
  %3876 = alloca i32, align 4
  %3877 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3878 = call i32 (ptr, ...) @scanf(ptr %3877, ptr %3876)
  %3879 = load i32, ptr %3876, align 4
  %3880 = icmp eq i32 %3879, 0
  br label %continuation5814

continuation5814:                                 ; preds = %else5816, %then5815
  %3881 = phi i1 [ %3880, %else5816 ], [ true, %then5815 ]
  br i1 %3881, label %then5824, label %else5825

then5824:                                         ; preds = %continuation5814
  br label %continuation5823

else5825:                                         ; preds = %continuation5814
  %3882 = alloca i32, align 4
  %3883 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3884 = call i32 (ptr, ...) @scanf(ptr %3883, ptr %3882)
  %3885 = load i32, ptr %3882, align 4
  %3886 = icmp eq i32 %3885, 0
  br label %continuation5823

continuation5823:                                 ; preds = %else5825, %then5824
  %3887 = phi i1 [ %3886, %else5825 ], [ true, %then5824 ]
  br i1 %3887, label %then5833, label %else5834

then5833:                                         ; preds = %continuation5823
  br label %continuation5832

else5834:                                         ; preds = %continuation5823
  %3888 = alloca i32, align 4
  %3889 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3890 = call i32 (ptr, ...) @scanf(ptr %3889, ptr %3888)
  %3891 = load i32, ptr %3888, align 4
  %3892 = icmp eq i32 %3891, 0
  br label %continuation5832

continuation5832:                                 ; preds = %else5834, %then5833
  %3893 = phi i1 [ %3892, %else5834 ], [ true, %then5833 ]
  br i1 %3893, label %then5842, label %else5843

then5842:                                         ; preds = %continuation5832
  br label %continuation5841

else5843:                                         ; preds = %continuation5832
  %3894 = alloca i32, align 4
  %3895 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3896 = call i32 (ptr, ...) @scanf(ptr %3895, ptr %3894)
  %3897 = load i32, ptr %3894, align 4
  %3898 = icmp eq i32 %3897, 0
  br label %continuation5841

continuation5841:                                 ; preds = %else5843, %then5842
  %3899 = phi i1 [ %3898, %else5843 ], [ true, %then5842 ]
  br i1 %3899, label %then5851, label %else5852

then5851:                                         ; preds = %continuation5841
  br label %continuation5850

else5852:                                         ; preds = %continuation5841
  %3900 = alloca i32, align 4
  %3901 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3902 = call i32 (ptr, ...) @scanf(ptr %3901, ptr %3900)
  %3903 = load i32, ptr %3900, align 4
  %3904 = icmp eq i32 %3903, 0
  br label %continuation5850

continuation5850:                                 ; preds = %else5852, %then5851
  %3905 = phi i1 [ %3904, %else5852 ], [ true, %then5851 ]
  br i1 %3905, label %then5860, label %else5861

then5860:                                         ; preds = %continuation5850
  br label %continuation5859

else5861:                                         ; preds = %continuation5850
  %3906 = alloca i32, align 4
  %3907 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3908 = call i32 (ptr, ...) @scanf(ptr %3907, ptr %3906)
  %3909 = load i32, ptr %3906, align 4
  %3910 = icmp eq i32 %3909, 0
  br label %continuation5859

continuation5859:                                 ; preds = %else5861, %then5860
  %3911 = phi i1 [ %3910, %else5861 ], [ true, %then5860 ]
  br i1 %3911, label %then5869, label %else5870

then5869:                                         ; preds = %continuation5859
  br label %continuation5868

else5870:                                         ; preds = %continuation5859
  %3912 = alloca i32, align 4
  %3913 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3914 = call i32 (ptr, ...) @scanf(ptr %3913, ptr %3912)
  %3915 = load i32, ptr %3912, align 4
  %3916 = icmp eq i32 %3915, 0
  br label %continuation5868

continuation5868:                                 ; preds = %else5870, %then5869
  %3917 = phi i1 [ %3916, %else5870 ], [ true, %then5869 ]
  br i1 %3917, label %then5878, label %else5879

then5878:                                         ; preds = %continuation5868
  br label %continuation5877

else5879:                                         ; preds = %continuation5868
  %3918 = alloca i32, align 4
  %3919 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3920 = call i32 (ptr, ...) @scanf(ptr %3919, ptr %3918)
  %3921 = load i32, ptr %3918, align 4
  %3922 = icmp eq i32 %3921, 0
  br label %continuation5877

continuation5877:                                 ; preds = %else5879, %then5878
  %3923 = phi i1 [ %3922, %else5879 ], [ true, %then5878 ]
  br i1 %3923, label %then5887, label %else5888

then5887:                                         ; preds = %continuation5877
  br label %continuation5886

else5888:                                         ; preds = %continuation5877
  %3924 = alloca i32, align 4
  %3925 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3926 = call i32 (ptr, ...) @scanf(ptr %3925, ptr %3924)
  %3927 = load i32, ptr %3924, align 4
  %3928 = icmp eq i32 %3927, 0
  br label %continuation5886

continuation5886:                                 ; preds = %else5888, %then5887
  %3929 = phi i1 [ %3928, %else5888 ], [ true, %then5887 ]
  br i1 %3929, label %then5896, label %else5897

then5896:                                         ; preds = %continuation5886
  br label %continuation5895

else5897:                                         ; preds = %continuation5886
  %3930 = alloca i32, align 4
  %3931 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3932 = call i32 (ptr, ...) @scanf(ptr %3931, ptr %3930)
  %3933 = load i32, ptr %3930, align 4
  %3934 = icmp eq i32 %3933, 0
  br label %continuation5895

continuation5895:                                 ; preds = %else5897, %then5896
  %3935 = phi i1 [ %3934, %else5897 ], [ true, %then5896 ]
  br i1 %3935, label %then5905, label %else5906

then5905:                                         ; preds = %continuation5895
  br label %continuation5904

else5906:                                         ; preds = %continuation5895
  %3936 = alloca i32, align 4
  %3937 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3938 = call i32 (ptr, ...) @scanf(ptr %3937, ptr %3936)
  %3939 = load i32, ptr %3936, align 4
  %3940 = icmp eq i32 %3939, 0
  br label %continuation5904

continuation5904:                                 ; preds = %else5906, %then5905
  %3941 = phi i1 [ %3940, %else5906 ], [ true, %then5905 ]
  br i1 %3941, label %then5914, label %else5915

then5914:                                         ; preds = %continuation5904
  br label %continuation5913

else5915:                                         ; preds = %continuation5904
  %3942 = alloca i32, align 4
  %3943 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3944 = call i32 (ptr, ...) @scanf(ptr %3943, ptr %3942)
  %3945 = load i32, ptr %3942, align 4
  %3946 = icmp eq i32 %3945, 0
  br label %continuation5913

continuation5913:                                 ; preds = %else5915, %then5914
  %3947 = phi i1 [ %3946, %else5915 ], [ true, %then5914 ]
  br i1 %3947, label %then5923, label %else5924

then5923:                                         ; preds = %continuation5913
  br label %continuation5922

else5924:                                         ; preds = %continuation5913
  %3948 = alloca i32, align 4
  %3949 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3950 = call i32 (ptr, ...) @scanf(ptr %3949, ptr %3948)
  %3951 = load i32, ptr %3948, align 4
  %3952 = icmp eq i32 %3951, 0
  br label %continuation5922

continuation5922:                                 ; preds = %else5924, %then5923
  %3953 = phi i1 [ %3952, %else5924 ], [ true, %then5923 ]
  br i1 %3953, label %then5932, label %else5933

then5932:                                         ; preds = %continuation5922
  br label %continuation5931

else5933:                                         ; preds = %continuation5922
  %3954 = alloca i32, align 4
  %3955 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3956 = call i32 (ptr, ...) @scanf(ptr %3955, ptr %3954)
  %3957 = load i32, ptr %3954, align 4
  %3958 = icmp eq i32 %3957, 0
  br label %continuation5931

continuation5931:                                 ; preds = %else5933, %then5932
  %3959 = phi i1 [ %3958, %else5933 ], [ true, %then5932 ]
  br i1 %3959, label %then5941, label %else5942

then5941:                                         ; preds = %continuation5931
  br label %continuation5940

else5942:                                         ; preds = %continuation5931
  %3960 = alloca i32, align 4
  %3961 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3962 = call i32 (ptr, ...) @scanf(ptr %3961, ptr %3960)
  %3963 = load i32, ptr %3960, align 4
  %3964 = icmp eq i32 %3963, 0
  br label %continuation5940

continuation5940:                                 ; preds = %else5942, %then5941
  %3965 = phi i1 [ %3964, %else5942 ], [ true, %then5941 ]
  br i1 %3965, label %then5950, label %else5951

then5950:                                         ; preds = %continuation5940
  br label %continuation5949

else5951:                                         ; preds = %continuation5940
  %3966 = alloca i32, align 4
  %3967 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3968 = call i32 (ptr, ...) @scanf(ptr %3967, ptr %3966)
  %3969 = load i32, ptr %3966, align 4
  %3970 = icmp eq i32 %3969, 0
  br label %continuation5949

continuation5949:                                 ; preds = %else5951, %then5950
  %3971 = phi i1 [ %3970, %else5951 ], [ true, %then5950 ]
  br i1 %3971, label %then5959, label %else5960

then5959:                                         ; preds = %continuation5949
  br label %continuation5958

else5960:                                         ; preds = %continuation5949
  %3972 = alloca i32, align 4
  %3973 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3974 = call i32 (ptr, ...) @scanf(ptr %3973, ptr %3972)
  %3975 = load i32, ptr %3972, align 4
  %3976 = icmp eq i32 %3975, 0
  br label %continuation5958

continuation5958:                                 ; preds = %else5960, %then5959
  %3977 = phi i1 [ %3976, %else5960 ], [ true, %then5959 ]
  br i1 %3977, label %then5968, label %else5969

then5968:                                         ; preds = %continuation5958
  br label %continuation5967

else5969:                                         ; preds = %continuation5958
  %3978 = alloca i32, align 4
  %3979 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3980 = call i32 (ptr, ...) @scanf(ptr %3979, ptr %3978)
  %3981 = load i32, ptr %3978, align 4
  %3982 = icmp eq i32 %3981, 0
  br label %continuation5967

continuation5967:                                 ; preds = %else5969, %then5968
  %3983 = phi i1 [ %3982, %else5969 ], [ true, %then5968 ]
  br i1 %3983, label %then5977, label %else5978

then5977:                                         ; preds = %continuation5967
  br label %continuation5976

else5978:                                         ; preds = %continuation5967
  %3984 = alloca i32, align 4
  %3985 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3986 = call i32 (ptr, ...) @scanf(ptr %3985, ptr %3984)
  %3987 = load i32, ptr %3984, align 4
  %3988 = icmp eq i32 %3987, 0
  br label %continuation5976

continuation5976:                                 ; preds = %else5978, %then5977
  %3989 = phi i1 [ %3988, %else5978 ], [ true, %then5977 ]
  br i1 %3989, label %then5986, label %else5987

then5986:                                         ; preds = %continuation5976
  br label %continuation5985

else5987:                                         ; preds = %continuation5976
  %3990 = alloca i32, align 4
  %3991 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3992 = call i32 (ptr, ...) @scanf(ptr %3991, ptr %3990)
  %3993 = load i32, ptr %3990, align 4
  %3994 = icmp eq i32 %3993, 0
  br label %continuation5985

continuation5985:                                 ; preds = %else5987, %then5986
  %3995 = phi i1 [ %3994, %else5987 ], [ true, %then5986 ]
  br i1 %3995, label %then5995, label %else5996

then5995:                                         ; preds = %continuation5985
  br label %continuation5994

else5996:                                         ; preds = %continuation5985
  %3996 = alloca i32, align 4
  %3997 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %3998 = call i32 (ptr, ...) @scanf(ptr %3997, ptr %3996)
  %3999 = load i32, ptr %3996, align 4
  %4000 = icmp eq i32 %3999, 0
  br label %continuation5994

continuation5994:                                 ; preds = %else5996, %then5995
  %4001 = phi i1 [ %4000, %else5996 ], [ true, %then5995 ]
  br i1 %4001, label %then6004, label %else6005

then6004:                                         ; preds = %continuation5994
  br label %continuation6003

else6005:                                         ; preds = %continuation5994
  %4002 = alloca i32, align 4
  %4003 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4004 = call i32 (ptr, ...) @scanf(ptr %4003, ptr %4002)
  %4005 = load i32, ptr %4002, align 4
  %4006 = icmp eq i32 %4005, 0
  br label %continuation6003

continuation6003:                                 ; preds = %else6005, %then6004
  %4007 = phi i1 [ %4006, %else6005 ], [ true, %then6004 ]
  br i1 %4007, label %then6013, label %else6014

then6013:                                         ; preds = %continuation6003
  br label %continuation6012

else6014:                                         ; preds = %continuation6003
  %4008 = alloca i32, align 4
  %4009 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4010 = call i32 (ptr, ...) @scanf(ptr %4009, ptr %4008)
  %4011 = load i32, ptr %4008, align 4
  %4012 = icmp eq i32 %4011, 0
  br label %continuation6012

continuation6012:                                 ; preds = %else6014, %then6013
  %4013 = phi i1 [ %4012, %else6014 ], [ true, %then6013 ]
  br i1 %4013, label %then6022, label %else6023

then6022:                                         ; preds = %continuation6012
  br label %continuation6021

else6023:                                         ; preds = %continuation6012
  %4014 = alloca i32, align 4
  %4015 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4016 = call i32 (ptr, ...) @scanf(ptr %4015, ptr %4014)
  %4017 = load i32, ptr %4014, align 4
  %4018 = icmp eq i32 %4017, 0
  br label %continuation6021

continuation6021:                                 ; preds = %else6023, %then6022
  %4019 = phi i1 [ %4018, %else6023 ], [ true, %then6022 ]
  br i1 %4019, label %then6031, label %else6032

then6031:                                         ; preds = %continuation6021
  br label %continuation6030

else6032:                                         ; preds = %continuation6021
  %4020 = alloca i32, align 4
  %4021 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4022 = call i32 (ptr, ...) @scanf(ptr %4021, ptr %4020)
  %4023 = load i32, ptr %4020, align 4
  %4024 = icmp eq i32 %4023, 0
  br label %continuation6030

continuation6030:                                 ; preds = %else6032, %then6031
  %4025 = phi i1 [ %4024, %else6032 ], [ true, %then6031 ]
  br i1 %4025, label %then6040, label %else6041

then6040:                                         ; preds = %continuation6030
  br label %continuation6039

else6041:                                         ; preds = %continuation6030
  %4026 = alloca i32, align 4
  %4027 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4028 = call i32 (ptr, ...) @scanf(ptr %4027, ptr %4026)
  %4029 = load i32, ptr %4026, align 4
  %4030 = icmp eq i32 %4029, 0
  br label %continuation6039

continuation6039:                                 ; preds = %else6041, %then6040
  %4031 = phi i1 [ %4030, %else6041 ], [ true, %then6040 ]
  br i1 %4031, label %then6049, label %else6050

then6049:                                         ; preds = %continuation6039
  br label %continuation6048

else6050:                                         ; preds = %continuation6039
  %4032 = alloca i32, align 4
  %4033 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4034 = call i32 (ptr, ...) @scanf(ptr %4033, ptr %4032)
  %4035 = load i32, ptr %4032, align 4
  %4036 = icmp eq i32 %4035, 0
  br label %continuation6048

continuation6048:                                 ; preds = %else6050, %then6049
  %4037 = phi i1 [ %4036, %else6050 ], [ true, %then6049 ]
  br i1 %4037, label %then6058, label %else6059

then6058:                                         ; preds = %continuation6048
  br label %continuation6057

else6059:                                         ; preds = %continuation6048
  %4038 = alloca i32, align 4
  %4039 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4040 = call i32 (ptr, ...) @scanf(ptr %4039, ptr %4038)
  %4041 = load i32, ptr %4038, align 4
  %4042 = icmp eq i32 %4041, 0
  br label %continuation6057

continuation6057:                                 ; preds = %else6059, %then6058
  %4043 = phi i1 [ %4042, %else6059 ], [ true, %then6058 ]
  br i1 %4043, label %then6067, label %else6068

then6067:                                         ; preds = %continuation6057
  br label %continuation6066

else6068:                                         ; preds = %continuation6057
  %4044 = alloca i32, align 4
  %4045 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4046 = call i32 (ptr, ...) @scanf(ptr %4045, ptr %4044)
  %4047 = load i32, ptr %4044, align 4
  %4048 = icmp eq i32 %4047, 0
  br label %continuation6066

continuation6066:                                 ; preds = %else6068, %then6067
  %4049 = phi i1 [ %4048, %else6068 ], [ true, %then6067 ]
  br i1 %4049, label %then6076, label %else6077

then6076:                                         ; preds = %continuation6066
  br label %continuation6075

else6077:                                         ; preds = %continuation6066
  %4050 = alloca i32, align 4
  %4051 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4052 = call i32 (ptr, ...) @scanf(ptr %4051, ptr %4050)
  %4053 = load i32, ptr %4050, align 4
  %4054 = icmp eq i32 %4053, 0
  br label %continuation6075

continuation6075:                                 ; preds = %else6077, %then6076
  %4055 = phi i1 [ %4054, %else6077 ], [ true, %then6076 ]
  br i1 %4055, label %then6085, label %else6086

then6085:                                         ; preds = %continuation6075
  br label %continuation6084

else6086:                                         ; preds = %continuation6075
  %4056 = alloca i32, align 4
  %4057 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4058 = call i32 (ptr, ...) @scanf(ptr %4057, ptr %4056)
  %4059 = load i32, ptr %4056, align 4
  %4060 = icmp eq i32 %4059, 0
  br label %continuation6084

continuation6084:                                 ; preds = %else6086, %then6085
  %4061 = phi i1 [ %4060, %else6086 ], [ true, %then6085 ]
  br i1 %4061, label %then6094, label %else6095

then6094:                                         ; preds = %continuation6084
  br label %continuation6093

else6095:                                         ; preds = %continuation6084
  %4062 = alloca i32, align 4
  %4063 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4064 = call i32 (ptr, ...) @scanf(ptr %4063, ptr %4062)
  %4065 = load i32, ptr %4062, align 4
  %4066 = icmp eq i32 %4065, 0
  br label %continuation6093

continuation6093:                                 ; preds = %else6095, %then6094
  %4067 = phi i1 [ %4066, %else6095 ], [ true, %then6094 ]
  br i1 %4067, label %then6103, label %else6104

then6103:                                         ; preds = %continuation6093
  br label %continuation6102

else6104:                                         ; preds = %continuation6093
  %4068 = alloca i32, align 4
  %4069 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4070 = call i32 (ptr, ...) @scanf(ptr %4069, ptr %4068)
  %4071 = load i32, ptr %4068, align 4
  %4072 = icmp eq i32 %4071, 0
  br label %continuation6102

continuation6102:                                 ; preds = %else6104, %then6103
  %4073 = phi i1 [ %4072, %else6104 ], [ true, %then6103 ]
  br i1 %4073, label %then6112, label %else6113

then6112:                                         ; preds = %continuation6102
  br label %continuation6111

else6113:                                         ; preds = %continuation6102
  %4074 = alloca i32, align 4
  %4075 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4076 = call i32 (ptr, ...) @scanf(ptr %4075, ptr %4074)
  %4077 = load i32, ptr %4074, align 4
  %4078 = icmp eq i32 %4077, 0
  br label %continuation6111

continuation6111:                                 ; preds = %else6113, %then6112
  %4079 = phi i1 [ %4078, %else6113 ], [ true, %then6112 ]
  br i1 %4079, label %then6121, label %else6122

then6121:                                         ; preds = %continuation6111
  br label %continuation6120

else6122:                                         ; preds = %continuation6111
  %4080 = alloca i32, align 4
  %4081 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4082 = call i32 (ptr, ...) @scanf(ptr %4081, ptr %4080)
  %4083 = load i32, ptr %4080, align 4
  %4084 = icmp eq i32 %4083, 0
  br label %continuation6120

continuation6120:                                 ; preds = %else6122, %then6121
  %4085 = phi i1 [ %4084, %else6122 ], [ true, %then6121 ]
  br i1 %4085, label %then6130, label %else6131

then6130:                                         ; preds = %continuation6120
  br label %continuation6129

else6131:                                         ; preds = %continuation6120
  %4086 = alloca i32, align 4
  %4087 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4088 = call i32 (ptr, ...) @scanf(ptr %4087, ptr %4086)
  %4089 = load i32, ptr %4086, align 4
  %4090 = icmp eq i32 %4089, 0
  br label %continuation6129

continuation6129:                                 ; preds = %else6131, %then6130
  %4091 = phi i1 [ %4090, %else6131 ], [ true, %then6130 ]
  br i1 %4091, label %then6139, label %else6140

then6139:                                         ; preds = %continuation6129
  br label %continuation6138

else6140:                                         ; preds = %continuation6129
  %4092 = alloca i32, align 4
  %4093 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4094 = call i32 (ptr, ...) @scanf(ptr %4093, ptr %4092)
  %4095 = load i32, ptr %4092, align 4
  %4096 = icmp eq i32 %4095, 0
  br label %continuation6138

continuation6138:                                 ; preds = %else6140, %then6139
  %4097 = phi i1 [ %4096, %else6140 ], [ true, %then6139 ]
  br i1 %4097, label %then6148, label %else6149

then6148:                                         ; preds = %continuation6138
  br label %continuation6147

else6149:                                         ; preds = %continuation6138
  %4098 = alloca i32, align 4
  %4099 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4100 = call i32 (ptr, ...) @scanf(ptr %4099, ptr %4098)
  %4101 = load i32, ptr %4098, align 4
  %4102 = icmp eq i32 %4101, 0
  br label %continuation6147

continuation6147:                                 ; preds = %else6149, %then6148
  %4103 = phi i1 [ %4102, %else6149 ], [ true, %then6148 ]
  br i1 %4103, label %then6157, label %else6158

then6157:                                         ; preds = %continuation6147
  br label %continuation6156

else6158:                                         ; preds = %continuation6147
  %4104 = alloca i32, align 4
  %4105 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4106 = call i32 (ptr, ...) @scanf(ptr %4105, ptr %4104)
  %4107 = load i32, ptr %4104, align 4
  %4108 = icmp eq i32 %4107, 0
  br label %continuation6156

continuation6156:                                 ; preds = %else6158, %then6157
  %4109 = phi i1 [ %4108, %else6158 ], [ true, %then6157 ]
  br i1 %4109, label %then6166, label %else6167

then6166:                                         ; preds = %continuation6156
  br label %continuation6165

else6167:                                         ; preds = %continuation6156
  %4110 = alloca i32, align 4
  %4111 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4112 = call i32 (ptr, ...) @scanf(ptr %4111, ptr %4110)
  %4113 = load i32, ptr %4110, align 4
  %4114 = icmp eq i32 %4113, 0
  br label %continuation6165

continuation6165:                                 ; preds = %else6167, %then6166
  %4115 = phi i1 [ %4114, %else6167 ], [ true, %then6166 ]
  br i1 %4115, label %then6175, label %else6176

then6175:                                         ; preds = %continuation6165
  br label %continuation6174

else6176:                                         ; preds = %continuation6165
  %4116 = alloca i32, align 4
  %4117 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4118 = call i32 (ptr, ...) @scanf(ptr %4117, ptr %4116)
  %4119 = load i32, ptr %4116, align 4
  %4120 = icmp eq i32 %4119, 0
  br label %continuation6174

continuation6174:                                 ; preds = %else6176, %then6175
  %4121 = phi i1 [ %4120, %else6176 ], [ true, %then6175 ]
  br i1 %4121, label %then6184, label %else6185

then6184:                                         ; preds = %continuation6174
  br label %continuation6183

else6185:                                         ; preds = %continuation6174
  %4122 = alloca i32, align 4
  %4123 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4124 = call i32 (ptr, ...) @scanf(ptr %4123, ptr %4122)
  %4125 = load i32, ptr %4122, align 4
  %4126 = icmp eq i32 %4125, 0
  br label %continuation6183

continuation6183:                                 ; preds = %else6185, %then6184
  %4127 = phi i1 [ %4126, %else6185 ], [ true, %then6184 ]
  br i1 %4127, label %then6193, label %else6194

then6193:                                         ; preds = %continuation6183
  br label %continuation6192

else6194:                                         ; preds = %continuation6183
  %4128 = alloca i32, align 4
  %4129 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4130 = call i32 (ptr, ...) @scanf(ptr %4129, ptr %4128)
  %4131 = load i32, ptr %4128, align 4
  %4132 = icmp eq i32 %4131, 0
  br label %continuation6192

continuation6192:                                 ; preds = %else6194, %then6193
  %4133 = phi i1 [ %4132, %else6194 ], [ true, %then6193 ]
  br i1 %4133, label %then6202, label %else6203

then6202:                                         ; preds = %continuation6192
  br label %continuation6201

else6203:                                         ; preds = %continuation6192
  %4134 = alloca i32, align 4
  %4135 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4136 = call i32 (ptr, ...) @scanf(ptr %4135, ptr %4134)
  %4137 = load i32, ptr %4134, align 4
  %4138 = icmp eq i32 %4137, 0
  br label %continuation6201

continuation6201:                                 ; preds = %else6203, %then6202
  %4139 = phi i1 [ %4138, %else6203 ], [ true, %then6202 ]
  br i1 %4139, label %then6211, label %else6212

then6211:                                         ; preds = %continuation6201
  br label %continuation6210

else6212:                                         ; preds = %continuation6201
  %4140 = alloca i32, align 4
  %4141 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4142 = call i32 (ptr, ...) @scanf(ptr %4141, ptr %4140)
  %4143 = load i32, ptr %4140, align 4
  %4144 = icmp eq i32 %4143, 0
  br label %continuation6210

continuation6210:                                 ; preds = %else6212, %then6211
  %4145 = phi i1 [ %4144, %else6212 ], [ true, %then6211 ]
  br i1 %4145, label %then6220, label %else6221

then6220:                                         ; preds = %continuation6210
  br label %continuation6219

else6221:                                         ; preds = %continuation6210
  %4146 = alloca i32, align 4
  %4147 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4148 = call i32 (ptr, ...) @scanf(ptr %4147, ptr %4146)
  %4149 = load i32, ptr %4146, align 4
  %4150 = icmp eq i32 %4149, 0
  br label %continuation6219

continuation6219:                                 ; preds = %else6221, %then6220
  %4151 = phi i1 [ %4150, %else6221 ], [ true, %then6220 ]
  br i1 %4151, label %then6229, label %else6230

then6229:                                         ; preds = %continuation6219
  br label %continuation6228

else6230:                                         ; preds = %continuation6219
  %4152 = alloca i32, align 4
  %4153 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4154 = call i32 (ptr, ...) @scanf(ptr %4153, ptr %4152)
  %4155 = load i32, ptr %4152, align 4
  %4156 = icmp eq i32 %4155, 0
  br label %continuation6228

continuation6228:                                 ; preds = %else6230, %then6229
  %4157 = phi i1 [ %4156, %else6230 ], [ true, %then6229 ]
  br i1 %4157, label %then6238, label %else6239

then6238:                                         ; preds = %continuation6228
  br label %continuation6237

else6239:                                         ; preds = %continuation6228
  %4158 = alloca i32, align 4
  %4159 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4160 = call i32 (ptr, ...) @scanf(ptr %4159, ptr %4158)
  %4161 = load i32, ptr %4158, align 4
  %4162 = icmp eq i32 %4161, 0
  br label %continuation6237

continuation6237:                                 ; preds = %else6239, %then6238
  %4163 = phi i1 [ %4162, %else6239 ], [ true, %then6238 ]
  br i1 %4163, label %then6247, label %else6248

then6247:                                         ; preds = %continuation6237
  br label %continuation6246

else6248:                                         ; preds = %continuation6237
  %4164 = alloca i32, align 4
  %4165 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4166 = call i32 (ptr, ...) @scanf(ptr %4165, ptr %4164)
  %4167 = load i32, ptr %4164, align 4
  %4168 = icmp eq i32 %4167, 0
  br label %continuation6246

continuation6246:                                 ; preds = %else6248, %then6247
  %4169 = phi i1 [ %4168, %else6248 ], [ true, %then6247 ]
  br i1 %4169, label %then6256, label %else6257

then6256:                                         ; preds = %continuation6246
  br label %continuation6255

else6257:                                         ; preds = %continuation6246
  %4170 = alloca i32, align 4
  %4171 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4172 = call i32 (ptr, ...) @scanf(ptr %4171, ptr %4170)
  %4173 = load i32, ptr %4170, align 4
  %4174 = icmp eq i32 %4173, 0
  br label %continuation6255

continuation6255:                                 ; preds = %else6257, %then6256
  %4175 = phi i1 [ %4174, %else6257 ], [ true, %then6256 ]
  br i1 %4175, label %then6265, label %else6266

then6265:                                         ; preds = %continuation6255
  br label %continuation6264

else6266:                                         ; preds = %continuation6255
  %4176 = alloca i32, align 4
  %4177 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4178 = call i32 (ptr, ...) @scanf(ptr %4177, ptr %4176)
  %4179 = load i32, ptr %4176, align 4
  %4180 = icmp eq i32 %4179, 0
  br label %continuation6264

continuation6264:                                 ; preds = %else6266, %then6265
  %4181 = phi i1 [ %4180, %else6266 ], [ true, %then6265 ]
  br i1 %4181, label %then6274, label %else6275

then6274:                                         ; preds = %continuation6264
  br label %continuation6273

else6275:                                         ; preds = %continuation6264
  %4182 = alloca i32, align 4
  %4183 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4184 = call i32 (ptr, ...) @scanf(ptr %4183, ptr %4182)
  %4185 = load i32, ptr %4182, align 4
  %4186 = icmp eq i32 %4185, 0
  br label %continuation6273

continuation6273:                                 ; preds = %else6275, %then6274
  %4187 = phi i1 [ %4186, %else6275 ], [ true, %then6274 ]
  br i1 %4187, label %then6283, label %else6284

then6283:                                         ; preds = %continuation6273
  br label %continuation6282

else6284:                                         ; preds = %continuation6273
  %4188 = alloca i32, align 4
  %4189 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4190 = call i32 (ptr, ...) @scanf(ptr %4189, ptr %4188)
  %4191 = load i32, ptr %4188, align 4
  %4192 = icmp eq i32 %4191, 0
  br label %continuation6282

continuation6282:                                 ; preds = %else6284, %then6283
  %4193 = phi i1 [ %4192, %else6284 ], [ true, %then6283 ]
  br i1 %4193, label %then6292, label %else6293

then6292:                                         ; preds = %continuation6282
  br label %continuation6291

else6293:                                         ; preds = %continuation6282
  %4194 = alloca i32, align 4
  %4195 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4196 = call i32 (ptr, ...) @scanf(ptr %4195, ptr %4194)
  %4197 = load i32, ptr %4194, align 4
  %4198 = icmp eq i32 %4197, 0
  br label %continuation6291

continuation6291:                                 ; preds = %else6293, %then6292
  %4199 = phi i1 [ %4198, %else6293 ], [ true, %then6292 ]
  br i1 %4199, label %then6301, label %else6302

then6301:                                         ; preds = %continuation6291
  br label %continuation6300

else6302:                                         ; preds = %continuation6291
  %4200 = alloca i32, align 4
  %4201 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4202 = call i32 (ptr, ...) @scanf(ptr %4201, ptr %4200)
  %4203 = load i32, ptr %4200, align 4
  %4204 = icmp eq i32 %4203, 0
  br label %continuation6300

continuation6300:                                 ; preds = %else6302, %then6301
  %4205 = phi i1 [ %4204, %else6302 ], [ true, %then6301 ]
  br i1 %4205, label %then6310, label %else6311

then6310:                                         ; preds = %continuation6300
  br label %continuation6309

else6311:                                         ; preds = %continuation6300
  %4206 = alloca i32, align 4
  %4207 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4208 = call i32 (ptr, ...) @scanf(ptr %4207, ptr %4206)
  %4209 = load i32, ptr %4206, align 4
  %4210 = icmp eq i32 %4209, 0
  br label %continuation6309

continuation6309:                                 ; preds = %else6311, %then6310
  %4211 = phi i1 [ %4210, %else6311 ], [ true, %then6310 ]
  br i1 %4211, label %then6319, label %else6320

then6319:                                         ; preds = %continuation6309
  br label %continuation6318

else6320:                                         ; preds = %continuation6309
  %4212 = alloca i32, align 4
  %4213 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4214 = call i32 (ptr, ...) @scanf(ptr %4213, ptr %4212)
  %4215 = load i32, ptr %4212, align 4
  %4216 = icmp eq i32 %4215, 0
  br label %continuation6318

continuation6318:                                 ; preds = %else6320, %then6319
  %4217 = phi i1 [ %4216, %else6320 ], [ true, %then6319 ]
  br i1 %4217, label %then6328, label %else6329

then6328:                                         ; preds = %continuation6318
  br label %continuation6327

else6329:                                         ; preds = %continuation6318
  %4218 = alloca i32, align 4
  %4219 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4220 = call i32 (ptr, ...) @scanf(ptr %4219, ptr %4218)
  %4221 = load i32, ptr %4218, align 4
  %4222 = icmp eq i32 %4221, 0
  br label %continuation6327

continuation6327:                                 ; preds = %else6329, %then6328
  %4223 = phi i1 [ %4222, %else6329 ], [ true, %then6328 ]
  br i1 %4223, label %then6337, label %else6338

then6337:                                         ; preds = %continuation6327
  br label %continuation6336

else6338:                                         ; preds = %continuation6327
  %4224 = alloca i32, align 4
  %4225 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4226 = call i32 (ptr, ...) @scanf(ptr %4225, ptr %4224)
  %4227 = load i32, ptr %4224, align 4
  %4228 = icmp eq i32 %4227, 0
  br label %continuation6336

continuation6336:                                 ; preds = %else6338, %then6337
  %4229 = phi i1 [ %4228, %else6338 ], [ true, %then6337 ]
  br i1 %4229, label %then6346, label %else6347

then6346:                                         ; preds = %continuation6336
  br label %continuation6345

else6347:                                         ; preds = %continuation6336
  %4230 = alloca i32, align 4
  %4231 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4232 = call i32 (ptr, ...) @scanf(ptr %4231, ptr %4230)
  %4233 = load i32, ptr %4230, align 4
  %4234 = icmp eq i32 %4233, 0
  br label %continuation6345

continuation6345:                                 ; preds = %else6347, %then6346
  %4235 = phi i1 [ %4234, %else6347 ], [ true, %then6346 ]
  br i1 %4235, label %then6355, label %else6356

then6355:                                         ; preds = %continuation6345
  br label %continuation6354

else6356:                                         ; preds = %continuation6345
  %4236 = alloca i32, align 4
  %4237 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4238 = call i32 (ptr, ...) @scanf(ptr %4237, ptr %4236)
  %4239 = load i32, ptr %4236, align 4
  %4240 = icmp eq i32 %4239, 0
  br label %continuation6354

continuation6354:                                 ; preds = %else6356, %then6355
  %4241 = phi i1 [ %4240, %else6356 ], [ true, %then6355 ]
  br i1 %4241, label %then6364, label %else6365

then6364:                                         ; preds = %continuation6354
  br label %continuation6363

else6365:                                         ; preds = %continuation6354
  %4242 = alloca i32, align 4
  %4243 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4244 = call i32 (ptr, ...) @scanf(ptr %4243, ptr %4242)
  %4245 = load i32, ptr %4242, align 4
  %4246 = icmp eq i32 %4245, 0
  br label %continuation6363

continuation6363:                                 ; preds = %else6365, %then6364
  %4247 = phi i1 [ %4246, %else6365 ], [ true, %then6364 ]
  br i1 %4247, label %then6373, label %else6374

then6373:                                         ; preds = %continuation6363
  br label %continuation6372

else6374:                                         ; preds = %continuation6363
  %4248 = alloca i32, align 4
  %4249 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4250 = call i32 (ptr, ...) @scanf(ptr %4249, ptr %4248)
  %4251 = load i32, ptr %4248, align 4
  %4252 = icmp eq i32 %4251, 0
  br label %continuation6372

continuation6372:                                 ; preds = %else6374, %then6373
  %4253 = phi i1 [ %4252, %else6374 ], [ true, %then6373 ]
  br i1 %4253, label %then6382, label %else6383

then6382:                                         ; preds = %continuation6372
  br label %continuation6381

else6383:                                         ; preds = %continuation6372
  %4254 = alloca i32, align 4
  %4255 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4256 = call i32 (ptr, ...) @scanf(ptr %4255, ptr %4254)
  %4257 = load i32, ptr %4254, align 4
  %4258 = icmp eq i32 %4257, 0
  br label %continuation6381

continuation6381:                                 ; preds = %else6383, %then6382
  %4259 = phi i1 [ %4258, %else6383 ], [ true, %then6382 ]
  br i1 %4259, label %then6391, label %else6392

then6391:                                         ; preds = %continuation6381
  br label %continuation6390

else6392:                                         ; preds = %continuation6381
  %4260 = alloca i32, align 4
  %4261 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4262 = call i32 (ptr, ...) @scanf(ptr %4261, ptr %4260)
  %4263 = load i32, ptr %4260, align 4
  %4264 = icmp eq i32 %4263, 0
  br label %continuation6390

continuation6390:                                 ; preds = %else6392, %then6391
  %4265 = phi i1 [ %4264, %else6392 ], [ true, %then6391 ]
  br i1 %4265, label %then6400, label %else6401

then6400:                                         ; preds = %continuation6390
  br label %continuation6399

else6401:                                         ; preds = %continuation6390
  %4266 = alloca i32, align 4
  %4267 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4268 = call i32 (ptr, ...) @scanf(ptr %4267, ptr %4266)
  %4269 = load i32, ptr %4266, align 4
  %4270 = icmp eq i32 %4269, 0
  br label %continuation6399

continuation6399:                                 ; preds = %else6401, %then6400
  %4271 = phi i1 [ %4270, %else6401 ], [ true, %then6400 ]
  br i1 %4271, label %then6409, label %else6410

then6409:                                         ; preds = %continuation6399
  br label %continuation6408

else6410:                                         ; preds = %continuation6399
  %4272 = alloca i32, align 4
  %4273 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4274 = call i32 (ptr, ...) @scanf(ptr %4273, ptr %4272)
  %4275 = load i32, ptr %4272, align 4
  %4276 = icmp eq i32 %4275, 0
  br label %continuation6408

continuation6408:                                 ; preds = %else6410, %then6409
  %4277 = phi i1 [ %4276, %else6410 ], [ true, %then6409 ]
  br i1 %4277, label %then6418, label %else6419

then6418:                                         ; preds = %continuation6408
  br label %continuation6417

else6419:                                         ; preds = %continuation6408
  %4278 = alloca i32, align 4
  %4279 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4280 = call i32 (ptr, ...) @scanf(ptr %4279, ptr %4278)
  %4281 = load i32, ptr %4278, align 4
  %4282 = icmp eq i32 %4281, 0
  br label %continuation6417

continuation6417:                                 ; preds = %else6419, %then6418
  %4283 = phi i1 [ %4282, %else6419 ], [ true, %then6418 ]
  br i1 %4283, label %then6427, label %else6428

then6427:                                         ; preds = %continuation6417
  br label %continuation6426

else6428:                                         ; preds = %continuation6417
  %4284 = alloca i32, align 4
  %4285 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4286 = call i32 (ptr, ...) @scanf(ptr %4285, ptr %4284)
  %4287 = load i32, ptr %4284, align 4
  %4288 = icmp eq i32 %4287, 0
  br label %continuation6426

continuation6426:                                 ; preds = %else6428, %then6427
  %4289 = phi i1 [ %4288, %else6428 ], [ true, %then6427 ]
  br i1 %4289, label %then6436, label %else6437

then6436:                                         ; preds = %continuation6426
  br label %continuation6435

else6437:                                         ; preds = %continuation6426
  %4290 = alloca i32, align 4
  %4291 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4292 = call i32 (ptr, ...) @scanf(ptr %4291, ptr %4290)
  %4293 = load i32, ptr %4290, align 4
  %4294 = icmp eq i32 %4293, 0
  br label %continuation6435

continuation6435:                                 ; preds = %else6437, %then6436
  %4295 = phi i1 [ %4294, %else6437 ], [ true, %then6436 ]
  br i1 %4295, label %then6445, label %else6446

then6445:                                         ; preds = %continuation6435
  br label %continuation6444

else6446:                                         ; preds = %continuation6435
  %4296 = alloca i32, align 4
  %4297 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4298 = call i32 (ptr, ...) @scanf(ptr %4297, ptr %4296)
  %4299 = load i32, ptr %4296, align 4
  %4300 = icmp eq i32 %4299, 0
  br label %continuation6444

continuation6444:                                 ; preds = %else6446, %then6445
  %4301 = phi i1 [ %4300, %else6446 ], [ true, %then6445 ]
  br i1 %4301, label %then6454, label %else6455

then6454:                                         ; preds = %continuation6444
  br label %continuation6453

else6455:                                         ; preds = %continuation6444
  %4302 = alloca i32, align 4
  %4303 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4304 = call i32 (ptr, ...) @scanf(ptr %4303, ptr %4302)
  %4305 = load i32, ptr %4302, align 4
  %4306 = icmp eq i32 %4305, 0
  br label %continuation6453

continuation6453:                                 ; preds = %else6455, %then6454
  %4307 = phi i1 [ %4306, %else6455 ], [ true, %then6454 ]
  br i1 %4307, label %then6463, label %else6464

then6463:                                         ; preds = %continuation6453
  br label %continuation6462

else6464:                                         ; preds = %continuation6453
  %4308 = alloca i32, align 4
  %4309 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4310 = call i32 (ptr, ...) @scanf(ptr %4309, ptr %4308)
  %4311 = load i32, ptr %4308, align 4
  %4312 = icmp eq i32 %4311, 0
  br label %continuation6462

continuation6462:                                 ; preds = %else6464, %then6463
  %4313 = phi i1 [ %4312, %else6464 ], [ true, %then6463 ]
  br i1 %4313, label %then6472, label %else6473

then6472:                                         ; preds = %continuation6462
  br label %continuation6471

else6473:                                         ; preds = %continuation6462
  %4314 = alloca i32, align 4
  %4315 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4316 = call i32 (ptr, ...) @scanf(ptr %4315, ptr %4314)
  %4317 = load i32, ptr %4314, align 4
  %4318 = icmp eq i32 %4317, 0
  br label %continuation6471

continuation6471:                                 ; preds = %else6473, %then6472
  %4319 = phi i1 [ %4318, %else6473 ], [ true, %then6472 ]
  br i1 %4319, label %then6481, label %else6482

then6481:                                         ; preds = %continuation6471
  br label %continuation6480

else6482:                                         ; preds = %continuation6471
  %4320 = alloca i32, align 4
  %4321 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4322 = call i32 (ptr, ...) @scanf(ptr %4321, ptr %4320)
  %4323 = load i32, ptr %4320, align 4
  %4324 = icmp eq i32 %4323, 0
  br label %continuation6480

continuation6480:                                 ; preds = %else6482, %then6481
  %4325 = phi i1 [ %4324, %else6482 ], [ true, %then6481 ]
  br i1 %4325, label %then6490, label %else6491

then6490:                                         ; preds = %continuation6480
  br label %continuation6489

else6491:                                         ; preds = %continuation6480
  %4326 = alloca i32, align 4
  %4327 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4328 = call i32 (ptr, ...) @scanf(ptr %4327, ptr %4326)
  %4329 = load i32, ptr %4326, align 4
  %4330 = icmp eq i32 %4329, 0
  br label %continuation6489

continuation6489:                                 ; preds = %else6491, %then6490
  %4331 = phi i1 [ %4330, %else6491 ], [ true, %then6490 ]
  br i1 %4331, label %then6499, label %else6500

then6499:                                         ; preds = %continuation6489
  br label %continuation6498

else6500:                                         ; preds = %continuation6489
  %4332 = alloca i32, align 4
  %4333 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4334 = call i32 (ptr, ...) @scanf(ptr %4333, ptr %4332)
  %4335 = load i32, ptr %4332, align 4
  %4336 = icmp eq i32 %4335, 0
  br label %continuation6498

continuation6498:                                 ; preds = %else6500, %then6499
  %4337 = phi i1 [ %4336, %else6500 ], [ true, %then6499 ]
  br i1 %4337, label %then6508, label %else6509

then6508:                                         ; preds = %continuation6498
  br label %continuation6507

else6509:                                         ; preds = %continuation6498
  %4338 = alloca i32, align 4
  %4339 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4340 = call i32 (ptr, ...) @scanf(ptr %4339, ptr %4338)
  %4341 = load i32, ptr %4338, align 4
  %4342 = icmp eq i32 %4341, 0
  br label %continuation6507

continuation6507:                                 ; preds = %else6509, %then6508
  %4343 = phi i1 [ %4342, %else6509 ], [ true, %then6508 ]
  br i1 %4343, label %then6517, label %else6518

then6517:                                         ; preds = %continuation6507
  br label %continuation6516

else6518:                                         ; preds = %continuation6507
  %4344 = alloca i32, align 4
  %4345 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4346 = call i32 (ptr, ...) @scanf(ptr %4345, ptr %4344)
  %4347 = load i32, ptr %4344, align 4
  %4348 = icmp eq i32 %4347, 0
  br label %continuation6516

continuation6516:                                 ; preds = %else6518, %then6517
  %4349 = phi i1 [ %4348, %else6518 ], [ true, %then6517 ]
  br i1 %4349, label %then6526, label %else6527

then6526:                                         ; preds = %continuation6516
  br label %continuation6525

else6527:                                         ; preds = %continuation6516
  %4350 = alloca i32, align 4
  %4351 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4352 = call i32 (ptr, ...) @scanf(ptr %4351, ptr %4350)
  %4353 = load i32, ptr %4350, align 4
  %4354 = icmp eq i32 %4353, 0
  br label %continuation6525

continuation6525:                                 ; preds = %else6527, %then6526
  %4355 = phi i1 [ %4354, %else6527 ], [ true, %then6526 ]
  br i1 %4355, label %then6535, label %else6536

then6535:                                         ; preds = %continuation6525
  br label %continuation6534

else6536:                                         ; preds = %continuation6525
  %4356 = alloca i32, align 4
  %4357 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4358 = call i32 (ptr, ...) @scanf(ptr %4357, ptr %4356)
  %4359 = load i32, ptr %4356, align 4
  %4360 = icmp eq i32 %4359, 0
  br label %continuation6534

continuation6534:                                 ; preds = %else6536, %then6535
  %4361 = phi i1 [ %4360, %else6536 ], [ true, %then6535 ]
  br i1 %4361, label %then6544, label %else6545

then6544:                                         ; preds = %continuation6534
  br label %continuation6543

else6545:                                         ; preds = %continuation6534
  %4362 = alloca i32, align 4
  %4363 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4364 = call i32 (ptr, ...) @scanf(ptr %4363, ptr %4362)
  %4365 = load i32, ptr %4362, align 4
  %4366 = icmp eq i32 %4365, 0
  br label %continuation6543

continuation6543:                                 ; preds = %else6545, %then6544
  %4367 = phi i1 [ %4366, %else6545 ], [ true, %then6544 ]
  br i1 %4367, label %then6553, label %else6554

then6553:                                         ; preds = %continuation6543
  br label %continuation6552

else6554:                                         ; preds = %continuation6543
  %4368 = alloca i32, align 4
  %4369 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4370 = call i32 (ptr, ...) @scanf(ptr %4369, ptr %4368)
  %4371 = load i32, ptr %4368, align 4
  %4372 = icmp eq i32 %4371, 0
  br label %continuation6552

continuation6552:                                 ; preds = %else6554, %then6553
  %4373 = phi i1 [ %4372, %else6554 ], [ true, %then6553 ]
  br i1 %4373, label %then6562, label %else6563

then6562:                                         ; preds = %continuation6552
  br label %continuation6561

else6563:                                         ; preds = %continuation6552
  %4374 = alloca i32, align 4
  %4375 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4376 = call i32 (ptr, ...) @scanf(ptr %4375, ptr %4374)
  %4377 = load i32, ptr %4374, align 4
  %4378 = icmp eq i32 %4377, 0
  br label %continuation6561

continuation6561:                                 ; preds = %else6563, %then6562
  %4379 = phi i1 [ %4378, %else6563 ], [ true, %then6562 ]
  br i1 %4379, label %then6571, label %else6572

then6571:                                         ; preds = %continuation6561
  br label %continuation6570

else6572:                                         ; preds = %continuation6561
  %4380 = alloca i32, align 4
  %4381 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4382 = call i32 (ptr, ...) @scanf(ptr %4381, ptr %4380)
  %4383 = load i32, ptr %4380, align 4
  %4384 = icmp eq i32 %4383, 0
  br label %continuation6570

continuation6570:                                 ; preds = %else6572, %then6571
  %4385 = phi i1 [ %4384, %else6572 ], [ true, %then6571 ]
  br i1 %4385, label %then6580, label %else6581

then6580:                                         ; preds = %continuation6570
  br label %continuation6579

else6581:                                         ; preds = %continuation6570
  %4386 = alloca i32, align 4
  %4387 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4388 = call i32 (ptr, ...) @scanf(ptr %4387, ptr %4386)
  %4389 = load i32, ptr %4386, align 4
  %4390 = icmp eq i32 %4389, 0
  br label %continuation6579

continuation6579:                                 ; preds = %else6581, %then6580
  %4391 = phi i1 [ %4390, %else6581 ], [ true, %then6580 ]
  br i1 %4391, label %then6589, label %else6590

then6589:                                         ; preds = %continuation6579
  br label %continuation6588

else6590:                                         ; preds = %continuation6579
  %4392 = alloca i32, align 4
  %4393 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4394 = call i32 (ptr, ...) @scanf(ptr %4393, ptr %4392)
  %4395 = load i32, ptr %4392, align 4
  %4396 = icmp eq i32 %4395, 0
  br label %continuation6588

continuation6588:                                 ; preds = %else6590, %then6589
  %4397 = phi i1 [ %4396, %else6590 ], [ true, %then6589 ]
  br i1 %4397, label %then6598, label %else6599

then6598:                                         ; preds = %continuation6588
  br label %continuation6597

else6599:                                         ; preds = %continuation6588
  %4398 = alloca i32, align 4
  %4399 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4400 = call i32 (ptr, ...) @scanf(ptr %4399, ptr %4398)
  %4401 = load i32, ptr %4398, align 4
  %4402 = icmp eq i32 %4401, 0
  br label %continuation6597

continuation6597:                                 ; preds = %else6599, %then6598
  %4403 = phi i1 [ %4402, %else6599 ], [ true, %then6598 ]
  br i1 %4403, label %then6607, label %else6608

then6607:                                         ; preds = %continuation6597
  br label %continuation6606

else6608:                                         ; preds = %continuation6597
  %4404 = alloca i32, align 4
  %4405 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4406 = call i32 (ptr, ...) @scanf(ptr %4405, ptr %4404)
  %4407 = load i32, ptr %4404, align 4
  %4408 = icmp eq i32 %4407, 0
  br label %continuation6606

continuation6606:                                 ; preds = %else6608, %then6607
  %4409 = phi i1 [ %4408, %else6608 ], [ true, %then6607 ]
  br i1 %4409, label %then6616, label %else6617

then6616:                                         ; preds = %continuation6606
  br label %continuation6615

else6617:                                         ; preds = %continuation6606
  %4410 = alloca i32, align 4
  %4411 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4412 = call i32 (ptr, ...) @scanf(ptr %4411, ptr %4410)
  %4413 = load i32, ptr %4410, align 4
  %4414 = icmp eq i32 %4413, 0
  br label %continuation6615

continuation6615:                                 ; preds = %else6617, %then6616
  %4415 = phi i1 [ %4414, %else6617 ], [ true, %then6616 ]
  br i1 %4415, label %then6625, label %else6626

then6625:                                         ; preds = %continuation6615
  br label %continuation6624

else6626:                                         ; preds = %continuation6615
  %4416 = alloca i32, align 4
  %4417 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4418 = call i32 (ptr, ...) @scanf(ptr %4417, ptr %4416)
  %4419 = load i32, ptr %4416, align 4
  %4420 = icmp eq i32 %4419, 0
  br label %continuation6624

continuation6624:                                 ; preds = %else6626, %then6625
  %4421 = phi i1 [ %4420, %else6626 ], [ true, %then6625 ]
  br i1 %4421, label %then6634, label %else6635

then6634:                                         ; preds = %continuation6624
  br label %continuation6633

else6635:                                         ; preds = %continuation6624
  %4422 = alloca i32, align 4
  %4423 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4424 = call i32 (ptr, ...) @scanf(ptr %4423, ptr %4422)
  %4425 = load i32, ptr %4422, align 4
  %4426 = icmp eq i32 %4425, 0
  br label %continuation6633

continuation6633:                                 ; preds = %else6635, %then6634
  %4427 = phi i1 [ %4426, %else6635 ], [ true, %then6634 ]
  br i1 %4427, label %then6643, label %else6644

then6643:                                         ; preds = %continuation6633
  br label %continuation6642

else6644:                                         ; preds = %continuation6633
  %4428 = alloca i32, align 4
  %4429 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4430 = call i32 (ptr, ...) @scanf(ptr %4429, ptr %4428)
  %4431 = load i32, ptr %4428, align 4
  %4432 = icmp eq i32 %4431, 0
  br label %continuation6642

continuation6642:                                 ; preds = %else6644, %then6643
  %4433 = phi i1 [ %4432, %else6644 ], [ true, %then6643 ]
  br i1 %4433, label %then6652, label %else6653

then6652:                                         ; preds = %continuation6642
  br label %continuation6651

else6653:                                         ; preds = %continuation6642
  %4434 = alloca i32, align 4
  %4435 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4436 = call i32 (ptr, ...) @scanf(ptr %4435, ptr %4434)
  %4437 = load i32, ptr %4434, align 4
  %4438 = icmp eq i32 %4437, 0
  br label %continuation6651

continuation6651:                                 ; preds = %else6653, %then6652
  %4439 = phi i1 [ %4438, %else6653 ], [ true, %then6652 ]
  br i1 %4439, label %then6661, label %else6662

then6661:                                         ; preds = %continuation6651
  br label %continuation6660

else6662:                                         ; preds = %continuation6651
  %4440 = alloca i32, align 4
  %4441 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4442 = call i32 (ptr, ...) @scanf(ptr %4441, ptr %4440)
  %4443 = load i32, ptr %4440, align 4
  %4444 = icmp eq i32 %4443, 0
  br label %continuation6660

continuation6660:                                 ; preds = %else6662, %then6661
  %4445 = phi i1 [ %4444, %else6662 ], [ true, %then6661 ]
  br i1 %4445, label %then6670, label %else6671

then6670:                                         ; preds = %continuation6660
  br label %continuation6669

else6671:                                         ; preds = %continuation6660
  %4446 = alloca i32, align 4
  %4447 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4448 = call i32 (ptr, ...) @scanf(ptr %4447, ptr %4446)
  %4449 = load i32, ptr %4446, align 4
  %4450 = icmp eq i32 %4449, 0
  br label %continuation6669

continuation6669:                                 ; preds = %else6671, %then6670
  %4451 = phi i1 [ %4450, %else6671 ], [ true, %then6670 ]
  br i1 %4451, label %then6679, label %else6680

then6679:                                         ; preds = %continuation6669
  br label %continuation6678

else6680:                                         ; preds = %continuation6669
  %4452 = alloca i32, align 4
  %4453 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4454 = call i32 (ptr, ...) @scanf(ptr %4453, ptr %4452)
  %4455 = load i32, ptr %4452, align 4
  %4456 = icmp eq i32 %4455, 0
  br label %continuation6678

continuation6678:                                 ; preds = %else6680, %then6679
  %4457 = phi i1 [ %4456, %else6680 ], [ true, %then6679 ]
  br i1 %4457, label %then6688, label %else6689

then6688:                                         ; preds = %continuation6678
  br label %continuation6687

else6689:                                         ; preds = %continuation6678
  %4458 = alloca i32, align 4
  %4459 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4460 = call i32 (ptr, ...) @scanf(ptr %4459, ptr %4458)
  %4461 = load i32, ptr %4458, align 4
  %4462 = icmp eq i32 %4461, 0
  br label %continuation6687

continuation6687:                                 ; preds = %else6689, %then6688
  %4463 = phi i1 [ %4462, %else6689 ], [ true, %then6688 ]
  br i1 %4463, label %then6697, label %else6698

then6697:                                         ; preds = %continuation6687
  br label %continuation6696

else6698:                                         ; preds = %continuation6687
  %4464 = alloca i32, align 4
  %4465 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4466 = call i32 (ptr, ...) @scanf(ptr %4465, ptr %4464)
  %4467 = load i32, ptr %4464, align 4
  %4468 = icmp eq i32 %4467, 0
  br label %continuation6696

continuation6696:                                 ; preds = %else6698, %then6697
  %4469 = phi i1 [ %4468, %else6698 ], [ true, %then6697 ]
  br i1 %4469, label %then6706, label %else6707

then6706:                                         ; preds = %continuation6696
  br label %continuation6705

else6707:                                         ; preds = %continuation6696
  %4470 = alloca i32, align 4
  %4471 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4472 = call i32 (ptr, ...) @scanf(ptr %4471, ptr %4470)
  %4473 = load i32, ptr %4470, align 4
  %4474 = icmp eq i32 %4473, 0
  br label %continuation6705

continuation6705:                                 ; preds = %else6707, %then6706
  %4475 = phi i1 [ %4474, %else6707 ], [ true, %then6706 ]
  br i1 %4475, label %then6715, label %else6716

then6715:                                         ; preds = %continuation6705
  br label %continuation6714

else6716:                                         ; preds = %continuation6705
  %4476 = alloca i32, align 4
  %4477 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4478 = call i32 (ptr, ...) @scanf(ptr %4477, ptr %4476)
  %4479 = load i32, ptr %4476, align 4
  %4480 = icmp eq i32 %4479, 0
  br label %continuation6714

continuation6714:                                 ; preds = %else6716, %then6715
  %4481 = phi i1 [ %4480, %else6716 ], [ true, %then6715 ]
  br i1 %4481, label %then6724, label %else6725

then6724:                                         ; preds = %continuation6714
  br label %continuation6723

else6725:                                         ; preds = %continuation6714
  %4482 = alloca i32, align 4
  %4483 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4484 = call i32 (ptr, ...) @scanf(ptr %4483, ptr %4482)
  %4485 = load i32, ptr %4482, align 4
  %4486 = icmp eq i32 %4485, 0
  br label %continuation6723

continuation6723:                                 ; preds = %else6725, %then6724
  %4487 = phi i1 [ %4486, %else6725 ], [ true, %then6724 ]
  br i1 %4487, label %then6733, label %else6734

then6733:                                         ; preds = %continuation6723
  br label %continuation6732

else6734:                                         ; preds = %continuation6723
  %4488 = alloca i32, align 4
  %4489 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4490 = call i32 (ptr, ...) @scanf(ptr %4489, ptr %4488)
  %4491 = load i32, ptr %4488, align 4
  %4492 = icmp eq i32 %4491, 0
  br label %continuation6732

continuation6732:                                 ; preds = %else6734, %then6733
  %4493 = phi i1 [ %4492, %else6734 ], [ true, %then6733 ]
  br i1 %4493, label %then6742, label %else6743

then6742:                                         ; preds = %continuation6732
  br label %continuation6741

else6743:                                         ; preds = %continuation6732
  %4494 = alloca i32, align 4
  %4495 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4496 = call i32 (ptr, ...) @scanf(ptr %4495, ptr %4494)
  %4497 = load i32, ptr %4494, align 4
  %4498 = icmp eq i32 %4497, 0
  br label %continuation6741

continuation6741:                                 ; preds = %else6743, %then6742
  %4499 = phi i1 [ %4498, %else6743 ], [ true, %then6742 ]
  br i1 %4499, label %then6751, label %else6752

then6751:                                         ; preds = %continuation6741
  br label %continuation6750

else6752:                                         ; preds = %continuation6741
  %4500 = alloca i32, align 4
  %4501 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4502 = call i32 (ptr, ...) @scanf(ptr %4501, ptr %4500)
  %4503 = load i32, ptr %4500, align 4
  %4504 = icmp eq i32 %4503, 0
  br label %continuation6750

continuation6750:                                 ; preds = %else6752, %then6751
  %4505 = phi i1 [ %4504, %else6752 ], [ true, %then6751 ]
  br i1 %4505, label %then6760, label %else6761

then6760:                                         ; preds = %continuation6750
  br label %continuation6759

else6761:                                         ; preds = %continuation6750
  %4506 = alloca i32, align 4
  %4507 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4508 = call i32 (ptr, ...) @scanf(ptr %4507, ptr %4506)
  %4509 = load i32, ptr %4506, align 4
  %4510 = icmp eq i32 %4509, 0
  br label %continuation6759

continuation6759:                                 ; preds = %else6761, %then6760
  %4511 = phi i1 [ %4510, %else6761 ], [ true, %then6760 ]
  br i1 %4511, label %then6769, label %else6770

then6769:                                         ; preds = %continuation6759
  br label %continuation6768

else6770:                                         ; preds = %continuation6759
  %4512 = alloca i32, align 4
  %4513 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4514 = call i32 (ptr, ...) @scanf(ptr %4513, ptr %4512)
  %4515 = load i32, ptr %4512, align 4
  %4516 = icmp eq i32 %4515, 0
  br label %continuation6768

continuation6768:                                 ; preds = %else6770, %then6769
  %4517 = phi i1 [ %4516, %else6770 ], [ true, %then6769 ]
  br i1 %4517, label %then6778, label %else6779

then6778:                                         ; preds = %continuation6768
  br label %continuation6777

else6779:                                         ; preds = %continuation6768
  %4518 = alloca i32, align 4
  %4519 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4520 = call i32 (ptr, ...) @scanf(ptr %4519, ptr %4518)
  %4521 = load i32, ptr %4518, align 4
  %4522 = icmp eq i32 %4521, 0
  br label %continuation6777

continuation6777:                                 ; preds = %else6779, %then6778
  %4523 = phi i1 [ %4522, %else6779 ], [ true, %then6778 ]
  br i1 %4523, label %then6787, label %else6788

then6787:                                         ; preds = %continuation6777
  br label %continuation6786

else6788:                                         ; preds = %continuation6777
  %4524 = alloca i32, align 4
  %4525 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4526 = call i32 (ptr, ...) @scanf(ptr %4525, ptr %4524)
  %4527 = load i32, ptr %4524, align 4
  %4528 = icmp eq i32 %4527, 0
  br label %continuation6786

continuation6786:                                 ; preds = %else6788, %then6787
  %4529 = phi i1 [ %4528, %else6788 ], [ true, %then6787 ]
  br i1 %4529, label %then6796, label %else6797

then6796:                                         ; preds = %continuation6786
  br label %continuation6795

else6797:                                         ; preds = %continuation6786
  %4530 = alloca i32, align 4
  %4531 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4532 = call i32 (ptr, ...) @scanf(ptr %4531, ptr %4530)
  %4533 = load i32, ptr %4530, align 4
  %4534 = icmp eq i32 %4533, 0
  br label %continuation6795

continuation6795:                                 ; preds = %else6797, %then6796
  %4535 = phi i1 [ %4534, %else6797 ], [ true, %then6796 ]
  br i1 %4535, label %then6805, label %else6806

then6805:                                         ; preds = %continuation6795
  br label %continuation6804

else6806:                                         ; preds = %continuation6795
  %4536 = alloca i32, align 4
  %4537 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4538 = call i32 (ptr, ...) @scanf(ptr %4537, ptr %4536)
  %4539 = load i32, ptr %4536, align 4
  %4540 = icmp eq i32 %4539, 0
  br label %continuation6804

continuation6804:                                 ; preds = %else6806, %then6805
  %4541 = phi i1 [ %4540, %else6806 ], [ true, %then6805 ]
  br i1 %4541, label %then6814, label %else6815

then6814:                                         ; preds = %continuation6804
  br label %continuation6813

else6815:                                         ; preds = %continuation6804
  %4542 = alloca i32, align 4
  %4543 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4544 = call i32 (ptr, ...) @scanf(ptr %4543, ptr %4542)
  %4545 = load i32, ptr %4542, align 4
  %4546 = icmp eq i32 %4545, 0
  br label %continuation6813

continuation6813:                                 ; preds = %else6815, %then6814
  %4547 = phi i1 [ %4546, %else6815 ], [ true, %then6814 ]
  br i1 %4547, label %then6823, label %else6824

then6823:                                         ; preds = %continuation6813
  br label %continuation6822

else6824:                                         ; preds = %continuation6813
  %4548 = alloca i32, align 4
  %4549 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4550 = call i32 (ptr, ...) @scanf(ptr %4549, ptr %4548)
  %4551 = load i32, ptr %4548, align 4
  %4552 = icmp eq i32 %4551, 0
  br label %continuation6822

continuation6822:                                 ; preds = %else6824, %then6823
  %4553 = phi i1 [ %4552, %else6824 ], [ true, %then6823 ]
  br i1 %4553, label %then6832, label %else6833

then6832:                                         ; preds = %continuation6822
  br label %continuation6831

else6833:                                         ; preds = %continuation6822
  %4554 = alloca i32, align 4
  %4555 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4556 = call i32 (ptr, ...) @scanf(ptr %4555, ptr %4554)
  %4557 = load i32, ptr %4554, align 4
  %4558 = icmp eq i32 %4557, 0
  br label %continuation6831

continuation6831:                                 ; preds = %else6833, %then6832
  %4559 = phi i1 [ %4558, %else6833 ], [ true, %then6832 ]
  br i1 %4559, label %then6841, label %else6842

then6841:                                         ; preds = %continuation6831
  br label %continuation6840

else6842:                                         ; preds = %continuation6831
  %4560 = alloca i32, align 4
  %4561 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4562 = call i32 (ptr, ...) @scanf(ptr %4561, ptr %4560)
  %4563 = load i32, ptr %4560, align 4
  %4564 = icmp eq i32 %4563, 0
  br label %continuation6840

continuation6840:                                 ; preds = %else6842, %then6841
  %4565 = phi i1 [ %4564, %else6842 ], [ true, %then6841 ]
  br i1 %4565, label %then6850, label %else6851

then6850:                                         ; preds = %continuation6840
  br label %continuation6849

else6851:                                         ; preds = %continuation6840
  %4566 = alloca i32, align 4
  %4567 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4568 = call i32 (ptr, ...) @scanf(ptr %4567, ptr %4566)
  %4569 = load i32, ptr %4566, align 4
  %4570 = icmp eq i32 %4569, 0
  br label %continuation6849

continuation6849:                                 ; preds = %else6851, %then6850
  %4571 = phi i1 [ %4570, %else6851 ], [ true, %then6850 ]
  br i1 %4571, label %then6859, label %else6860

then6859:                                         ; preds = %continuation6849
  br label %continuation6858

else6860:                                         ; preds = %continuation6849
  %4572 = alloca i32, align 4
  %4573 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4574 = call i32 (ptr, ...) @scanf(ptr %4573, ptr %4572)
  %4575 = load i32, ptr %4572, align 4
  %4576 = icmp eq i32 %4575, 0
  br label %continuation6858

continuation6858:                                 ; preds = %else6860, %then6859
  %4577 = phi i1 [ %4576, %else6860 ], [ true, %then6859 ]
  br i1 %4577, label %then6868, label %else6869

then6868:                                         ; preds = %continuation6858
  br label %continuation6867

else6869:                                         ; preds = %continuation6858
  %4578 = alloca i32, align 4
  %4579 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4580 = call i32 (ptr, ...) @scanf(ptr %4579, ptr %4578)
  %4581 = load i32, ptr %4578, align 4
  %4582 = icmp eq i32 %4581, 0
  br label %continuation6867

continuation6867:                                 ; preds = %else6869, %then6868
  %4583 = phi i1 [ %4582, %else6869 ], [ true, %then6868 ]
  br i1 %4583, label %then6877, label %else6878

then6877:                                         ; preds = %continuation6867
  br label %continuation6876

else6878:                                         ; preds = %continuation6867
  %4584 = alloca i32, align 4
  %4585 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4586 = call i32 (ptr, ...) @scanf(ptr %4585, ptr %4584)
  %4587 = load i32, ptr %4584, align 4
  %4588 = icmp eq i32 %4587, 0
  br label %continuation6876

continuation6876:                                 ; preds = %else6878, %then6877
  %4589 = phi i1 [ %4588, %else6878 ], [ true, %then6877 ]
  br i1 %4589, label %then6886, label %else6887

then6886:                                         ; preds = %continuation6876
  br label %continuation6885

else6887:                                         ; preds = %continuation6876
  %4590 = alloca i32, align 4
  %4591 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4592 = call i32 (ptr, ...) @scanf(ptr %4591, ptr %4590)
  %4593 = load i32, ptr %4590, align 4
  %4594 = icmp eq i32 %4593, 0
  br label %continuation6885

continuation6885:                                 ; preds = %else6887, %then6886
  %4595 = phi i1 [ %4594, %else6887 ], [ true, %then6886 ]
  br i1 %4595, label %then6895, label %else6896

then6895:                                         ; preds = %continuation6885
  br label %continuation6894

else6896:                                         ; preds = %continuation6885
  %4596 = alloca i32, align 4
  %4597 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4598 = call i32 (ptr, ...) @scanf(ptr %4597, ptr %4596)
  %4599 = load i32, ptr %4596, align 4
  %4600 = icmp eq i32 %4599, 0
  br label %continuation6894

continuation6894:                                 ; preds = %else6896, %then6895
  %4601 = phi i1 [ %4600, %else6896 ], [ true, %then6895 ]
  br i1 %4601, label %then6904, label %else6905

then6904:                                         ; preds = %continuation6894
  br label %continuation6903

else6905:                                         ; preds = %continuation6894
  %4602 = alloca i32, align 4
  %4603 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4604 = call i32 (ptr, ...) @scanf(ptr %4603, ptr %4602)
  %4605 = load i32, ptr %4602, align 4
  %4606 = icmp eq i32 %4605, 0
  br label %continuation6903

continuation6903:                                 ; preds = %else6905, %then6904
  %4607 = phi i1 [ %4606, %else6905 ], [ true, %then6904 ]
  br i1 %4607, label %then6913, label %else6914

then6913:                                         ; preds = %continuation6903
  br label %continuation6912

else6914:                                         ; preds = %continuation6903
  %4608 = alloca i32, align 4
  %4609 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4610 = call i32 (ptr, ...) @scanf(ptr %4609, ptr %4608)
  %4611 = load i32, ptr %4608, align 4
  %4612 = icmp eq i32 %4611, 0
  br label %continuation6912

continuation6912:                                 ; preds = %else6914, %then6913
  %4613 = phi i1 [ %4612, %else6914 ], [ true, %then6913 ]
  br i1 %4613, label %then6922, label %else6923

then6922:                                         ; preds = %continuation6912
  br label %continuation6921

else6923:                                         ; preds = %continuation6912
  %4614 = alloca i32, align 4
  %4615 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4616 = call i32 (ptr, ...) @scanf(ptr %4615, ptr %4614)
  %4617 = load i32, ptr %4614, align 4
  %4618 = icmp eq i32 %4617, 0
  br label %continuation6921

continuation6921:                                 ; preds = %else6923, %then6922
  %4619 = phi i1 [ %4618, %else6923 ], [ true, %then6922 ]
  br i1 %4619, label %then6931, label %else6932

then6931:                                         ; preds = %continuation6921
  br label %continuation6930

else6932:                                         ; preds = %continuation6921
  %4620 = alloca i32, align 4
  %4621 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4622 = call i32 (ptr, ...) @scanf(ptr %4621, ptr %4620)
  %4623 = load i32, ptr %4620, align 4
  %4624 = icmp eq i32 %4623, 0
  br label %continuation6930

continuation6930:                                 ; preds = %else6932, %then6931
  %4625 = phi i1 [ %4624, %else6932 ], [ true, %then6931 ]
  br i1 %4625, label %then6940, label %else6941

then6940:                                         ; preds = %continuation6930
  br label %continuation6939

else6941:                                         ; preds = %continuation6930
  %4626 = alloca i32, align 4
  %4627 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4628 = call i32 (ptr, ...) @scanf(ptr %4627, ptr %4626)
  %4629 = load i32, ptr %4626, align 4
  %4630 = icmp eq i32 %4629, 0
  br label %continuation6939

continuation6939:                                 ; preds = %else6941, %then6940
  %4631 = phi i1 [ %4630, %else6941 ], [ true, %then6940 ]
  br i1 %4631, label %then6949, label %else6950

then6949:                                         ; preds = %continuation6939
  br label %continuation6948

else6950:                                         ; preds = %continuation6939
  %4632 = alloca i32, align 4
  %4633 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4634 = call i32 (ptr, ...) @scanf(ptr %4633, ptr %4632)
  %4635 = load i32, ptr %4632, align 4
  %4636 = icmp eq i32 %4635, 0
  br label %continuation6948

continuation6948:                                 ; preds = %else6950, %then6949
  %4637 = phi i1 [ %4636, %else6950 ], [ true, %then6949 ]
  br i1 %4637, label %then6958, label %else6959

then6958:                                         ; preds = %continuation6948
  br label %continuation6957

else6959:                                         ; preds = %continuation6948
  %4638 = alloca i32, align 4
  %4639 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4640 = call i32 (ptr, ...) @scanf(ptr %4639, ptr %4638)
  %4641 = load i32, ptr %4638, align 4
  %4642 = icmp eq i32 %4641, 0
  br label %continuation6957

continuation6957:                                 ; preds = %else6959, %then6958
  %4643 = phi i1 [ %4642, %else6959 ], [ true, %then6958 ]
  br i1 %4643, label %then6967, label %else6968

then6967:                                         ; preds = %continuation6957
  br label %continuation6966

else6968:                                         ; preds = %continuation6957
  %4644 = alloca i32, align 4
  %4645 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4646 = call i32 (ptr, ...) @scanf(ptr %4645, ptr %4644)
  %4647 = load i32, ptr %4644, align 4
  %4648 = icmp eq i32 %4647, 0
  br label %continuation6966

continuation6966:                                 ; preds = %else6968, %then6967
  %4649 = phi i1 [ %4648, %else6968 ], [ true, %then6967 ]
  br i1 %4649, label %then6976, label %else6977

then6976:                                         ; preds = %continuation6966
  br label %continuation6975

else6977:                                         ; preds = %continuation6966
  %4650 = alloca i32, align 4
  %4651 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4652 = call i32 (ptr, ...) @scanf(ptr %4651, ptr %4650)
  %4653 = load i32, ptr %4650, align 4
  %4654 = icmp eq i32 %4653, 0
  br label %continuation6975

continuation6975:                                 ; preds = %else6977, %then6976
  %4655 = phi i1 [ %4654, %else6977 ], [ true, %then6976 ]
  br i1 %4655, label %then6985, label %else6986

then6985:                                         ; preds = %continuation6975
  br label %continuation6984

else6986:                                         ; preds = %continuation6975
  %4656 = alloca i32, align 4
  %4657 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4658 = call i32 (ptr, ...) @scanf(ptr %4657, ptr %4656)
  %4659 = load i32, ptr %4656, align 4
  %4660 = icmp eq i32 %4659, 0
  br label %continuation6984

continuation6984:                                 ; preds = %else6986, %then6985
  %4661 = phi i1 [ %4660, %else6986 ], [ true, %then6985 ]
  br i1 %4661, label %then6994, label %else6995

then6994:                                         ; preds = %continuation6984
  br label %continuation6993

else6995:                                         ; preds = %continuation6984
  %4662 = alloca i32, align 4
  %4663 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4664 = call i32 (ptr, ...) @scanf(ptr %4663, ptr %4662)
  %4665 = load i32, ptr %4662, align 4
  %4666 = icmp eq i32 %4665, 0
  br label %continuation6993

continuation6993:                                 ; preds = %else6995, %then6994
  %4667 = phi i1 [ %4666, %else6995 ], [ true, %then6994 ]
  br i1 %4667, label %then7003, label %else7004

then7003:                                         ; preds = %continuation6993
  br label %continuation7002

else7004:                                         ; preds = %continuation6993
  %4668 = alloca i32, align 4
  %4669 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4670 = call i32 (ptr, ...) @scanf(ptr %4669, ptr %4668)
  %4671 = load i32, ptr %4668, align 4
  %4672 = icmp eq i32 %4671, 0
  br label %continuation7002

continuation7002:                                 ; preds = %else7004, %then7003
  %4673 = phi i1 [ %4672, %else7004 ], [ true, %then7003 ]
  br i1 %4673, label %then7012, label %else7013

then7012:                                         ; preds = %continuation7002
  br label %continuation7011

else7013:                                         ; preds = %continuation7002
  %4674 = alloca i32, align 4
  %4675 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4676 = call i32 (ptr, ...) @scanf(ptr %4675, ptr %4674)
  %4677 = load i32, ptr %4674, align 4
  %4678 = icmp eq i32 %4677, 0
  br label %continuation7011

continuation7011:                                 ; preds = %else7013, %then7012
  %4679 = phi i1 [ %4678, %else7013 ], [ true, %then7012 ]
  br i1 %4679, label %then7021, label %else7022

then7021:                                         ; preds = %continuation7011
  br label %continuation7020

else7022:                                         ; preds = %continuation7011
  %4680 = alloca i32, align 4
  %4681 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4682 = call i32 (ptr, ...) @scanf(ptr %4681, ptr %4680)
  %4683 = load i32, ptr %4680, align 4
  %4684 = icmp eq i32 %4683, 0
  br label %continuation7020

continuation7020:                                 ; preds = %else7022, %then7021
  %4685 = phi i1 [ %4684, %else7022 ], [ true, %then7021 ]
  br i1 %4685, label %then7030, label %else7031

then7030:                                         ; preds = %continuation7020
  br label %continuation7029

else7031:                                         ; preds = %continuation7020
  %4686 = alloca i32, align 4
  %4687 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4688 = call i32 (ptr, ...) @scanf(ptr %4687, ptr %4686)
  %4689 = load i32, ptr %4686, align 4
  %4690 = icmp eq i32 %4689, 0
  br label %continuation7029

continuation7029:                                 ; preds = %else7031, %then7030
  %4691 = phi i1 [ %4690, %else7031 ], [ true, %then7030 ]
  br i1 %4691, label %then7039, label %else7040

then7039:                                         ; preds = %continuation7029
  br label %continuation7038

else7040:                                         ; preds = %continuation7029
  %4692 = alloca i32, align 4
  %4693 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4694 = call i32 (ptr, ...) @scanf(ptr %4693, ptr %4692)
  %4695 = load i32, ptr %4692, align 4
  %4696 = icmp eq i32 %4695, 0
  br label %continuation7038

continuation7038:                                 ; preds = %else7040, %then7039
  %4697 = phi i1 [ %4696, %else7040 ], [ true, %then7039 ]
  br i1 %4697, label %then7048, label %else7049

then7048:                                         ; preds = %continuation7038
  br label %continuation7047

else7049:                                         ; preds = %continuation7038
  %4698 = alloca i32, align 4
  %4699 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4700 = call i32 (ptr, ...) @scanf(ptr %4699, ptr %4698)
  %4701 = load i32, ptr %4698, align 4
  %4702 = icmp eq i32 %4701, 0
  br label %continuation7047

continuation7047:                                 ; preds = %else7049, %then7048
  %4703 = phi i1 [ %4702, %else7049 ], [ true, %then7048 ]
  br i1 %4703, label %then7057, label %else7058

then7057:                                         ; preds = %continuation7047
  br label %continuation7056

else7058:                                         ; preds = %continuation7047
  %4704 = alloca i32, align 4
  %4705 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4706 = call i32 (ptr, ...) @scanf(ptr %4705, ptr %4704)
  %4707 = load i32, ptr %4704, align 4
  %4708 = icmp eq i32 %4707, 0
  br label %continuation7056

continuation7056:                                 ; preds = %else7058, %then7057
  %4709 = phi i1 [ %4708, %else7058 ], [ true, %then7057 ]
  br i1 %4709, label %then7066, label %else7067

then7066:                                         ; preds = %continuation7056
  br label %continuation7065

else7067:                                         ; preds = %continuation7056
  %4710 = alloca i32, align 4
  %4711 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4712 = call i32 (ptr, ...) @scanf(ptr %4711, ptr %4710)
  %4713 = load i32, ptr %4710, align 4
  %4714 = icmp eq i32 %4713, 0
  br label %continuation7065

continuation7065:                                 ; preds = %else7067, %then7066
  %4715 = phi i1 [ %4714, %else7067 ], [ true, %then7066 ]
  br i1 %4715, label %then7075, label %else7076

then7075:                                         ; preds = %continuation7065
  br label %continuation7074

else7076:                                         ; preds = %continuation7065
  %4716 = alloca i32, align 4
  %4717 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4718 = call i32 (ptr, ...) @scanf(ptr %4717, ptr %4716)
  %4719 = load i32, ptr %4716, align 4
  %4720 = icmp eq i32 %4719, 0
  br label %continuation7074

continuation7074:                                 ; preds = %else7076, %then7075
  %4721 = phi i1 [ %4720, %else7076 ], [ true, %then7075 ]
  br i1 %4721, label %then7084, label %else7085

then7084:                                         ; preds = %continuation7074
  br label %continuation7083

else7085:                                         ; preds = %continuation7074
  %4722 = alloca i32, align 4
  %4723 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4724 = call i32 (ptr, ...) @scanf(ptr %4723, ptr %4722)
  %4725 = load i32, ptr %4722, align 4
  %4726 = icmp eq i32 %4725, 0
  br label %continuation7083

continuation7083:                                 ; preds = %else7085, %then7084
  %4727 = phi i1 [ %4726, %else7085 ], [ true, %then7084 ]
  br i1 %4727, label %then7093, label %else7094

then7093:                                         ; preds = %continuation7083
  br label %continuation7092

else7094:                                         ; preds = %continuation7083
  %4728 = alloca i32, align 4
  %4729 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4730 = call i32 (ptr, ...) @scanf(ptr %4729, ptr %4728)
  %4731 = load i32, ptr %4728, align 4
  %4732 = icmp eq i32 %4731, 0
  br label %continuation7092

continuation7092:                                 ; preds = %else7094, %then7093
  %4733 = phi i1 [ %4732, %else7094 ], [ true, %then7093 ]
  br i1 %4733, label %then7102, label %else7103

then7102:                                         ; preds = %continuation7092
  br label %continuation7101

else7103:                                         ; preds = %continuation7092
  %4734 = alloca i32, align 4
  %4735 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4736 = call i32 (ptr, ...) @scanf(ptr %4735, ptr %4734)
  %4737 = load i32, ptr %4734, align 4
  %4738 = icmp eq i32 %4737, 0
  br label %continuation7101

continuation7101:                                 ; preds = %else7103, %then7102
  %4739 = phi i1 [ %4738, %else7103 ], [ true, %then7102 ]
  br i1 %4739, label %then7111, label %else7112

then7111:                                         ; preds = %continuation7101
  br label %continuation7110

else7112:                                         ; preds = %continuation7101
  %4740 = alloca i32, align 4
  %4741 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4742 = call i32 (ptr, ...) @scanf(ptr %4741, ptr %4740)
  %4743 = load i32, ptr %4740, align 4
  %4744 = icmp eq i32 %4743, 0
  br label %continuation7110

continuation7110:                                 ; preds = %else7112, %then7111
  %4745 = phi i1 [ %4744, %else7112 ], [ true, %then7111 ]
  br i1 %4745, label %then7120, label %else7121

then7120:                                         ; preds = %continuation7110
  br label %continuation7119

else7121:                                         ; preds = %continuation7110
  %4746 = alloca i32, align 4
  %4747 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4748 = call i32 (ptr, ...) @scanf(ptr %4747, ptr %4746)
  %4749 = load i32, ptr %4746, align 4
  %4750 = icmp eq i32 %4749, 0
  br label %continuation7119

continuation7119:                                 ; preds = %else7121, %then7120
  %4751 = phi i1 [ %4750, %else7121 ], [ true, %then7120 ]
  br i1 %4751, label %then7129, label %else7130

then7129:                                         ; preds = %continuation7119
  br label %continuation7128

else7130:                                         ; preds = %continuation7119
  %4752 = alloca i32, align 4
  %4753 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4754 = call i32 (ptr, ...) @scanf(ptr %4753, ptr %4752)
  %4755 = load i32, ptr %4752, align 4
  %4756 = icmp eq i32 %4755, 0
  br label %continuation7128

continuation7128:                                 ; preds = %else7130, %then7129
  %4757 = phi i1 [ %4756, %else7130 ], [ true, %then7129 ]
  br i1 %4757, label %then7138, label %else7139

then7138:                                         ; preds = %continuation7128
  br label %continuation7137

else7139:                                         ; preds = %continuation7128
  %4758 = alloca i32, align 4
  %4759 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4760 = call i32 (ptr, ...) @scanf(ptr %4759, ptr %4758)
  %4761 = load i32, ptr %4758, align 4
  %4762 = icmp eq i32 %4761, 0
  br label %continuation7137

continuation7137:                                 ; preds = %else7139, %then7138
  %4763 = phi i1 [ %4762, %else7139 ], [ true, %then7138 ]
  br i1 %4763, label %then7147, label %else7148

then7147:                                         ; preds = %continuation7137
  br label %continuation7146

else7148:                                         ; preds = %continuation7137
  %4764 = alloca i32, align 4
  %4765 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4766 = call i32 (ptr, ...) @scanf(ptr %4765, ptr %4764)
  %4767 = load i32, ptr %4764, align 4
  %4768 = icmp eq i32 %4767, 0
  br label %continuation7146

continuation7146:                                 ; preds = %else7148, %then7147
  %4769 = phi i1 [ %4768, %else7148 ], [ true, %then7147 ]
  br i1 %4769, label %then7156, label %else7157

then7156:                                         ; preds = %continuation7146
  br label %continuation7155

else7157:                                         ; preds = %continuation7146
  %4770 = alloca i32, align 4
  %4771 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4772 = call i32 (ptr, ...) @scanf(ptr %4771, ptr %4770)
  %4773 = load i32, ptr %4770, align 4
  %4774 = icmp eq i32 %4773, 0
  br label %continuation7155

continuation7155:                                 ; preds = %else7157, %then7156
  %4775 = phi i1 [ %4774, %else7157 ], [ true, %then7156 ]
  br i1 %4775, label %then7165, label %else7166

then7165:                                         ; preds = %continuation7155
  br label %continuation7164

else7166:                                         ; preds = %continuation7155
  %4776 = alloca i32, align 4
  %4777 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4778 = call i32 (ptr, ...) @scanf(ptr %4777, ptr %4776)
  %4779 = load i32, ptr %4776, align 4
  %4780 = icmp eq i32 %4779, 0
  br label %continuation7164

continuation7164:                                 ; preds = %else7166, %then7165
  %4781 = phi i1 [ %4780, %else7166 ], [ true, %then7165 ]
  br i1 %4781, label %then7174, label %else7175

then7174:                                         ; preds = %continuation7164
  br label %continuation7173

else7175:                                         ; preds = %continuation7164
  %4782 = alloca i32, align 4
  %4783 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4784 = call i32 (ptr, ...) @scanf(ptr %4783, ptr %4782)
  %4785 = load i32, ptr %4782, align 4
  %4786 = icmp eq i32 %4785, 0
  br label %continuation7173

continuation7173:                                 ; preds = %else7175, %then7174
  %4787 = phi i1 [ %4786, %else7175 ], [ true, %then7174 ]
  br i1 %4787, label %then7183, label %else7184

then7183:                                         ; preds = %continuation7173
  br label %continuation7182

else7184:                                         ; preds = %continuation7173
  %4788 = alloca i32, align 4
  %4789 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4790 = call i32 (ptr, ...) @scanf(ptr %4789, ptr %4788)
  %4791 = load i32, ptr %4788, align 4
  %4792 = icmp eq i32 %4791, 0
  br label %continuation7182

continuation7182:                                 ; preds = %else7184, %then7183
  %4793 = phi i1 [ %4792, %else7184 ], [ true, %then7183 ]
  br i1 %4793, label %then7192, label %else7193

then7192:                                         ; preds = %continuation7182
  br label %continuation7191

else7193:                                         ; preds = %continuation7182
  %4794 = alloca i32, align 4
  %4795 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4796 = call i32 (ptr, ...) @scanf(ptr %4795, ptr %4794)
  %4797 = load i32, ptr %4794, align 4
  %4798 = icmp eq i32 %4797, 0
  br label %continuation7191

continuation7191:                                 ; preds = %else7193, %then7192
  %4799 = phi i1 [ %4798, %else7193 ], [ true, %then7192 ]
  br i1 %4799, label %then7201, label %else7202

then7201:                                         ; preds = %continuation7191
  br label %continuation7200

else7202:                                         ; preds = %continuation7191
  %4800 = alloca i32, align 4
  %4801 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4802 = call i32 (ptr, ...) @scanf(ptr %4801, ptr %4800)
  %4803 = load i32, ptr %4800, align 4
  %4804 = icmp eq i32 %4803, 0
  br label %continuation7200

continuation7200:                                 ; preds = %else7202, %then7201
  %4805 = phi i1 [ %4804, %else7202 ], [ true, %then7201 ]
  br i1 %4805, label %then7210, label %else7211

then7210:                                         ; preds = %continuation7200
  br label %continuation7209

else7211:                                         ; preds = %continuation7200
  %4806 = alloca i32, align 4
  %4807 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4808 = call i32 (ptr, ...) @scanf(ptr %4807, ptr %4806)
  %4809 = load i32, ptr %4806, align 4
  %4810 = icmp eq i32 %4809, 0
  br label %continuation7209

continuation7209:                                 ; preds = %else7211, %then7210
  %4811 = phi i1 [ %4810, %else7211 ], [ true, %then7210 ]
  br i1 %4811, label %then7219, label %else7220

then7219:                                         ; preds = %continuation7209
  br label %continuation7218

else7220:                                         ; preds = %continuation7209
  %4812 = alloca i32, align 4
  %4813 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4814 = call i32 (ptr, ...) @scanf(ptr %4813, ptr %4812)
  %4815 = load i32, ptr %4812, align 4
  %4816 = icmp eq i32 %4815, 0
  br label %continuation7218

continuation7218:                                 ; preds = %else7220, %then7219
  %4817 = phi i1 [ %4816, %else7220 ], [ true, %then7219 ]
  br i1 %4817, label %then7228, label %else7229

then7228:                                         ; preds = %continuation7218
  br label %continuation7227

else7229:                                         ; preds = %continuation7218
  %4818 = alloca i32, align 4
  %4819 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4820 = call i32 (ptr, ...) @scanf(ptr %4819, ptr %4818)
  %4821 = load i32, ptr %4818, align 4
  %4822 = icmp eq i32 %4821, 0
  br label %continuation7227

continuation7227:                                 ; preds = %else7229, %then7228
  %4823 = phi i1 [ %4822, %else7229 ], [ true, %then7228 ]
  br i1 %4823, label %then7237, label %else7238

then7237:                                         ; preds = %continuation7227
  br label %continuation7236

else7238:                                         ; preds = %continuation7227
  %4824 = alloca i32, align 4
  %4825 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4826 = call i32 (ptr, ...) @scanf(ptr %4825, ptr %4824)
  %4827 = load i32, ptr %4824, align 4
  %4828 = icmp eq i32 %4827, 0
  br label %continuation7236

continuation7236:                                 ; preds = %else7238, %then7237
  %4829 = phi i1 [ %4828, %else7238 ], [ true, %then7237 ]
  br i1 %4829, label %then7246, label %else7247

then7246:                                         ; preds = %continuation7236
  br label %continuation7245

else7247:                                         ; preds = %continuation7236
  %4830 = alloca i32, align 4
  %4831 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4832 = call i32 (ptr, ...) @scanf(ptr %4831, ptr %4830)
  %4833 = load i32, ptr %4830, align 4
  %4834 = icmp eq i32 %4833, 0
  br label %continuation7245

continuation7245:                                 ; preds = %else7247, %then7246
  %4835 = phi i1 [ %4834, %else7247 ], [ true, %then7246 ]
  br i1 %4835, label %then7255, label %else7256

then7255:                                         ; preds = %continuation7245
  br label %continuation7254

else7256:                                         ; preds = %continuation7245
  %4836 = alloca i32, align 4
  %4837 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4838 = call i32 (ptr, ...) @scanf(ptr %4837, ptr %4836)
  %4839 = load i32, ptr %4836, align 4
  %4840 = icmp eq i32 %4839, 0
  br label %continuation7254

continuation7254:                                 ; preds = %else7256, %then7255
  %4841 = phi i1 [ %4840, %else7256 ], [ true, %then7255 ]
  br i1 %4841, label %then7264, label %else7265

then7264:                                         ; preds = %continuation7254
  br label %continuation7263

else7265:                                         ; preds = %continuation7254
  %4842 = alloca i32, align 4
  %4843 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4844 = call i32 (ptr, ...) @scanf(ptr %4843, ptr %4842)
  %4845 = load i32, ptr %4842, align 4
  %4846 = icmp eq i32 %4845, 0
  br label %continuation7263

continuation7263:                                 ; preds = %else7265, %then7264
  %4847 = phi i1 [ %4846, %else7265 ], [ true, %then7264 ]
  br i1 %4847, label %then7273, label %else7274

then7273:                                         ; preds = %continuation7263
  br label %continuation7272

else7274:                                         ; preds = %continuation7263
  %4848 = alloca i32, align 4
  %4849 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4850 = call i32 (ptr, ...) @scanf(ptr %4849, ptr %4848)
  %4851 = load i32, ptr %4848, align 4
  %4852 = icmp eq i32 %4851, 0
  br label %continuation7272

continuation7272:                                 ; preds = %else7274, %then7273
  %4853 = phi i1 [ %4852, %else7274 ], [ true, %then7273 ]
  br i1 %4853, label %then7282, label %else7283

then7282:                                         ; preds = %continuation7272
  br label %continuation7281

else7283:                                         ; preds = %continuation7272
  %4854 = alloca i32, align 4
  %4855 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4856 = call i32 (ptr, ...) @scanf(ptr %4855, ptr %4854)
  %4857 = load i32, ptr %4854, align 4
  %4858 = icmp eq i32 %4857, 0
  br label %continuation7281

continuation7281:                                 ; preds = %else7283, %then7282
  %4859 = phi i1 [ %4858, %else7283 ], [ true, %then7282 ]
  br i1 %4859, label %then7291, label %else7292

then7291:                                         ; preds = %continuation7281
  br label %continuation7290

else7292:                                         ; preds = %continuation7281
  %4860 = alloca i32, align 4
  %4861 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4862 = call i32 (ptr, ...) @scanf(ptr %4861, ptr %4860)
  %4863 = load i32, ptr %4860, align 4
  %4864 = icmp eq i32 %4863, 0
  br label %continuation7290

continuation7290:                                 ; preds = %else7292, %then7291
  %4865 = phi i1 [ %4864, %else7292 ], [ true, %then7291 ]
  br i1 %4865, label %then7300, label %else7301

then7300:                                         ; preds = %continuation7290
  br label %continuation7299

else7301:                                         ; preds = %continuation7290
  %4866 = alloca i32, align 4
  %4867 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4868 = call i32 (ptr, ...) @scanf(ptr %4867, ptr %4866)
  %4869 = load i32, ptr %4866, align 4
  %4870 = icmp eq i32 %4869, 0
  br label %continuation7299

continuation7299:                                 ; preds = %else7301, %then7300
  %4871 = phi i1 [ %4870, %else7301 ], [ true, %then7300 ]
  br i1 %4871, label %then7309, label %else7310

then7309:                                         ; preds = %continuation7299
  br label %continuation7308

else7310:                                         ; preds = %continuation7299
  %4872 = alloca i32, align 4
  %4873 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4874 = call i32 (ptr, ...) @scanf(ptr %4873, ptr %4872)
  %4875 = load i32, ptr %4872, align 4
  %4876 = icmp eq i32 %4875, 0
  br label %continuation7308

continuation7308:                                 ; preds = %else7310, %then7309
  %4877 = phi i1 [ %4876, %else7310 ], [ true, %then7309 ]
  br i1 %4877, label %then7318, label %else7319

then7318:                                         ; preds = %continuation7308
  br label %continuation7317

else7319:                                         ; preds = %continuation7308
  %4878 = alloca i32, align 4
  %4879 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4880 = call i32 (ptr, ...) @scanf(ptr %4879, ptr %4878)
  %4881 = load i32, ptr %4878, align 4
  %4882 = icmp eq i32 %4881, 0
  br label %continuation7317

continuation7317:                                 ; preds = %else7319, %then7318
  %4883 = phi i1 [ %4882, %else7319 ], [ true, %then7318 ]
  br i1 %4883, label %then7327, label %else7328

then7327:                                         ; preds = %continuation7317
  br label %continuation7326

else7328:                                         ; preds = %continuation7317
  %4884 = alloca i32, align 4
  %4885 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4886 = call i32 (ptr, ...) @scanf(ptr %4885, ptr %4884)
  %4887 = load i32, ptr %4884, align 4
  %4888 = icmp eq i32 %4887, 0
  br label %continuation7326

continuation7326:                                 ; preds = %else7328, %then7327
  %4889 = phi i1 [ %4888, %else7328 ], [ true, %then7327 ]
  br i1 %4889, label %then7336, label %else7337

then7336:                                         ; preds = %continuation7326
  br label %continuation7335

else7337:                                         ; preds = %continuation7326
  %4890 = alloca i32, align 4
  %4891 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4892 = call i32 (ptr, ...) @scanf(ptr %4891, ptr %4890)
  %4893 = load i32, ptr %4890, align 4
  %4894 = icmp eq i32 %4893, 0
  br label %continuation7335

continuation7335:                                 ; preds = %else7337, %then7336
  %4895 = phi i1 [ %4894, %else7337 ], [ true, %then7336 ]
  br i1 %4895, label %then7345, label %else7346

then7345:                                         ; preds = %continuation7335
  br label %continuation7344

else7346:                                         ; preds = %continuation7335
  %4896 = alloca i32, align 4
  %4897 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4898 = call i32 (ptr, ...) @scanf(ptr %4897, ptr %4896)
  %4899 = load i32, ptr %4896, align 4
  %4900 = icmp eq i32 %4899, 0
  br label %continuation7344

continuation7344:                                 ; preds = %else7346, %then7345
  %4901 = phi i1 [ %4900, %else7346 ], [ true, %then7345 ]
  br i1 %4901, label %then7354, label %else7355

then7354:                                         ; preds = %continuation7344
  br label %continuation7353

else7355:                                         ; preds = %continuation7344
  %4902 = alloca i32, align 4
  %4903 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4904 = call i32 (ptr, ...) @scanf(ptr %4903, ptr %4902)
  %4905 = load i32, ptr %4902, align 4
  %4906 = icmp eq i32 %4905, 0
  br label %continuation7353

continuation7353:                                 ; preds = %else7355, %then7354
  %4907 = phi i1 [ %4906, %else7355 ], [ true, %then7354 ]
  br i1 %4907, label %then7363, label %else7364

then7363:                                         ; preds = %continuation7353
  br label %continuation7362

else7364:                                         ; preds = %continuation7353
  %4908 = alloca i32, align 4
  %4909 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4910 = call i32 (ptr, ...) @scanf(ptr %4909, ptr %4908)
  %4911 = load i32, ptr %4908, align 4
  %4912 = icmp eq i32 %4911, 0
  br label %continuation7362

continuation7362:                                 ; preds = %else7364, %then7363
  %4913 = phi i1 [ %4912, %else7364 ], [ true, %then7363 ]
  br i1 %4913, label %then7372, label %else7373

then7372:                                         ; preds = %continuation7362
  br label %continuation7371

else7373:                                         ; preds = %continuation7362
  %4914 = alloca i32, align 4
  %4915 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4916 = call i32 (ptr, ...) @scanf(ptr %4915, ptr %4914)
  %4917 = load i32, ptr %4914, align 4
  %4918 = icmp eq i32 %4917, 0
  br label %continuation7371

continuation7371:                                 ; preds = %else7373, %then7372
  %4919 = phi i1 [ %4918, %else7373 ], [ true, %then7372 ]
  br i1 %4919, label %then7381, label %else7382

then7381:                                         ; preds = %continuation7371
  br label %continuation7380

else7382:                                         ; preds = %continuation7371
  %4920 = alloca i32, align 4
  %4921 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4922 = call i32 (ptr, ...) @scanf(ptr %4921, ptr %4920)
  %4923 = load i32, ptr %4920, align 4
  %4924 = icmp eq i32 %4923, 0
  br label %continuation7380

continuation7380:                                 ; preds = %else7382, %then7381
  %4925 = phi i1 [ %4924, %else7382 ], [ true, %then7381 ]
  br i1 %4925, label %then7390, label %else7391

then7390:                                         ; preds = %continuation7380
  br label %continuation7389

else7391:                                         ; preds = %continuation7380
  %4926 = alloca i32, align 4
  %4927 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4928 = call i32 (ptr, ...) @scanf(ptr %4927, ptr %4926)
  %4929 = load i32, ptr %4926, align 4
  %4930 = icmp eq i32 %4929, 0
  br label %continuation7389

continuation7389:                                 ; preds = %else7391, %then7390
  %4931 = phi i1 [ %4930, %else7391 ], [ true, %then7390 ]
  br i1 %4931, label %then7399, label %else7400

then7399:                                         ; preds = %continuation7389
  br label %continuation7398

else7400:                                         ; preds = %continuation7389
  %4932 = alloca i32, align 4
  %4933 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4934 = call i32 (ptr, ...) @scanf(ptr %4933, ptr %4932)
  %4935 = load i32, ptr %4932, align 4
  %4936 = icmp eq i32 %4935, 0
  br label %continuation7398

continuation7398:                                 ; preds = %else7400, %then7399
  %4937 = phi i1 [ %4936, %else7400 ], [ true, %then7399 ]
  br i1 %4937, label %then7408, label %else7409

then7408:                                         ; preds = %continuation7398
  br label %continuation7407

else7409:                                         ; preds = %continuation7398
  %4938 = alloca i32, align 4
  %4939 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4940 = call i32 (ptr, ...) @scanf(ptr %4939, ptr %4938)
  %4941 = load i32, ptr %4938, align 4
  %4942 = icmp eq i32 %4941, 0
  br label %continuation7407

continuation7407:                                 ; preds = %else7409, %then7408
  %4943 = phi i1 [ %4942, %else7409 ], [ true, %then7408 ]
  br i1 %4943, label %then7417, label %else7418

then7417:                                         ; preds = %continuation7407
  br label %continuation7416

else7418:                                         ; preds = %continuation7407
  %4944 = alloca i32, align 4
  %4945 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4946 = call i32 (ptr, ...) @scanf(ptr %4945, ptr %4944)
  %4947 = load i32, ptr %4944, align 4
  %4948 = icmp eq i32 %4947, 0
  br label %continuation7416

continuation7416:                                 ; preds = %else7418, %then7417
  %4949 = phi i1 [ %4948, %else7418 ], [ true, %then7417 ]
  br i1 %4949, label %then7426, label %else7427

then7426:                                         ; preds = %continuation7416
  br label %continuation7425

else7427:                                         ; preds = %continuation7416
  %4950 = alloca i32, align 4
  %4951 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4952 = call i32 (ptr, ...) @scanf(ptr %4951, ptr %4950)
  %4953 = load i32, ptr %4950, align 4
  %4954 = icmp eq i32 %4953, 0
  br label %continuation7425

continuation7425:                                 ; preds = %else7427, %then7426
  %4955 = phi i1 [ %4954, %else7427 ], [ true, %then7426 ]
  br i1 %4955, label %then7435, label %else7436

then7435:                                         ; preds = %continuation7425
  br label %continuation7434

else7436:                                         ; preds = %continuation7425
  %4956 = alloca i32, align 4
  %4957 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4958 = call i32 (ptr, ...) @scanf(ptr %4957, ptr %4956)
  %4959 = load i32, ptr %4956, align 4
  %4960 = icmp eq i32 %4959, 0
  br label %continuation7434

continuation7434:                                 ; preds = %else7436, %then7435
  %4961 = phi i1 [ %4960, %else7436 ], [ true, %then7435 ]
  br i1 %4961, label %then7444, label %else7445

then7444:                                         ; preds = %continuation7434
  br label %continuation7443

else7445:                                         ; preds = %continuation7434
  %4962 = alloca i32, align 4
  %4963 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4964 = call i32 (ptr, ...) @scanf(ptr %4963, ptr %4962)
  %4965 = load i32, ptr %4962, align 4
  %4966 = icmp eq i32 %4965, 0
  br label %continuation7443

continuation7443:                                 ; preds = %else7445, %then7444
  %4967 = phi i1 [ %4966, %else7445 ], [ true, %then7444 ]
  br i1 %4967, label %then7453, label %else7454

then7453:                                         ; preds = %continuation7443
  br label %continuation7452

else7454:                                         ; preds = %continuation7443
  %4968 = alloca i32, align 4
  %4969 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4970 = call i32 (ptr, ...) @scanf(ptr %4969, ptr %4968)
  %4971 = load i32, ptr %4968, align 4
  %4972 = icmp eq i32 %4971, 0
  br label %continuation7452

continuation7452:                                 ; preds = %else7454, %then7453
  %4973 = phi i1 [ %4972, %else7454 ], [ true, %then7453 ]
  br i1 %4973, label %then7462, label %else7463

then7462:                                         ; preds = %continuation7452
  br label %continuation7461

else7463:                                         ; preds = %continuation7452
  %4974 = alloca i32, align 4
  %4975 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4976 = call i32 (ptr, ...) @scanf(ptr %4975, ptr %4974)
  %4977 = load i32, ptr %4974, align 4
  %4978 = icmp eq i32 %4977, 0
  br label %continuation7461

continuation7461:                                 ; preds = %else7463, %then7462
  %4979 = phi i1 [ %4978, %else7463 ], [ true, %then7462 ]
  br i1 %4979, label %then7471, label %else7472

then7471:                                         ; preds = %continuation7461
  br label %continuation7470

else7472:                                         ; preds = %continuation7461
  %4980 = alloca i32, align 4
  %4981 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4982 = call i32 (ptr, ...) @scanf(ptr %4981, ptr %4980)
  %4983 = load i32, ptr %4980, align 4
  %4984 = icmp eq i32 %4983, 0
  br label %continuation7470

continuation7470:                                 ; preds = %else7472, %then7471
  %4985 = phi i1 [ %4984, %else7472 ], [ true, %then7471 ]
  br i1 %4985, label %then7480, label %else7481

then7480:                                         ; preds = %continuation7470
  br label %continuation7479

else7481:                                         ; preds = %continuation7470
  %4986 = alloca i32, align 4
  %4987 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4988 = call i32 (ptr, ...) @scanf(ptr %4987, ptr %4986)
  %4989 = load i32, ptr %4986, align 4
  %4990 = icmp eq i32 %4989, 0
  br label %continuation7479

continuation7479:                                 ; preds = %else7481, %then7480
  %4991 = phi i1 [ %4990, %else7481 ], [ true, %then7480 ]
  br i1 %4991, label %then7489, label %else7490

then7489:                                         ; preds = %continuation7479
  br label %continuation7488

else7490:                                         ; preds = %continuation7479
  %4992 = alloca i32, align 4
  %4993 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %4994 = call i32 (ptr, ...) @scanf(ptr %4993, ptr %4992)
  %4995 = load i32, ptr %4992, align 4
  %4996 = icmp eq i32 %4995, 0
  br label %continuation7488

continuation7488:                                 ; preds = %else7490, %then7489
  %4997 = phi i1 [ %4996, %else7490 ], [ true, %then7489 ]
  br i1 %4997, label %then7498, label %else7499

then7498:                                         ; preds = %continuation7488
  br label %continuation7497

else7499:                                         ; preds = %continuation7488
  %4998 = alloca i32, align 4
  %4999 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5000 = call i32 (ptr, ...) @scanf(ptr %4999, ptr %4998)
  %5001 = load i32, ptr %4998, align 4
  %5002 = icmp eq i32 %5001, 0
  br label %continuation7497

continuation7497:                                 ; preds = %else7499, %then7498
  %5003 = phi i1 [ %5002, %else7499 ], [ true, %then7498 ]
  br i1 %5003, label %then7507, label %else7508

then7507:                                         ; preds = %continuation7497
  br label %continuation7506

else7508:                                         ; preds = %continuation7497
  %5004 = alloca i32, align 4
  %5005 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5006 = call i32 (ptr, ...) @scanf(ptr %5005, ptr %5004)
  %5007 = load i32, ptr %5004, align 4
  %5008 = icmp eq i32 %5007, 0
  br label %continuation7506

continuation7506:                                 ; preds = %else7508, %then7507
  %5009 = phi i1 [ %5008, %else7508 ], [ true, %then7507 ]
  br i1 %5009, label %then7516, label %else7517

then7516:                                         ; preds = %continuation7506
  br label %continuation7515

else7517:                                         ; preds = %continuation7506
  %5010 = alloca i32, align 4
  %5011 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5012 = call i32 (ptr, ...) @scanf(ptr %5011, ptr %5010)
  %5013 = load i32, ptr %5010, align 4
  %5014 = icmp eq i32 %5013, 0
  br label %continuation7515

continuation7515:                                 ; preds = %else7517, %then7516
  %5015 = phi i1 [ %5014, %else7517 ], [ true, %then7516 ]
  br i1 %5015, label %then7525, label %else7526

then7525:                                         ; preds = %continuation7515
  br label %continuation7524

else7526:                                         ; preds = %continuation7515
  %5016 = alloca i32, align 4
  %5017 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5018 = call i32 (ptr, ...) @scanf(ptr %5017, ptr %5016)
  %5019 = load i32, ptr %5016, align 4
  %5020 = icmp eq i32 %5019, 0
  br label %continuation7524

continuation7524:                                 ; preds = %else7526, %then7525
  %5021 = phi i1 [ %5020, %else7526 ], [ true, %then7525 ]
  br i1 %5021, label %then7534, label %else7535

then7534:                                         ; preds = %continuation7524
  br label %continuation7533

else7535:                                         ; preds = %continuation7524
  %5022 = alloca i32, align 4
  %5023 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5024 = call i32 (ptr, ...) @scanf(ptr %5023, ptr %5022)
  %5025 = load i32, ptr %5022, align 4
  %5026 = icmp eq i32 %5025, 0
  br label %continuation7533

continuation7533:                                 ; preds = %else7535, %then7534
  %5027 = phi i1 [ %5026, %else7535 ], [ true, %then7534 ]
  br i1 %5027, label %then7543, label %else7544

then7543:                                         ; preds = %continuation7533
  br label %continuation7542

else7544:                                         ; preds = %continuation7533
  %5028 = alloca i32, align 4
  %5029 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5030 = call i32 (ptr, ...) @scanf(ptr %5029, ptr %5028)
  %5031 = load i32, ptr %5028, align 4
  %5032 = icmp eq i32 %5031, 0
  br label %continuation7542

continuation7542:                                 ; preds = %else7544, %then7543
  %5033 = phi i1 [ %5032, %else7544 ], [ true, %then7543 ]
  br i1 %5033, label %then7552, label %else7553

then7552:                                         ; preds = %continuation7542
  br label %continuation7551

else7553:                                         ; preds = %continuation7542
  %5034 = alloca i32, align 4
  %5035 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5036 = call i32 (ptr, ...) @scanf(ptr %5035, ptr %5034)
  %5037 = load i32, ptr %5034, align 4
  %5038 = icmp eq i32 %5037, 0
  br label %continuation7551

continuation7551:                                 ; preds = %else7553, %then7552
  %5039 = phi i1 [ %5038, %else7553 ], [ true, %then7552 ]
  br i1 %5039, label %then7561, label %else7562

then7561:                                         ; preds = %continuation7551
  br label %continuation7560

else7562:                                         ; preds = %continuation7551
  %5040 = alloca i32, align 4
  %5041 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5042 = call i32 (ptr, ...) @scanf(ptr %5041, ptr %5040)
  %5043 = load i32, ptr %5040, align 4
  %5044 = icmp eq i32 %5043, 0
  br label %continuation7560

continuation7560:                                 ; preds = %else7562, %then7561
  %5045 = phi i1 [ %5044, %else7562 ], [ true, %then7561 ]
  br i1 %5045, label %then7570, label %else7571

then7570:                                         ; preds = %continuation7560
  br label %continuation7569

else7571:                                         ; preds = %continuation7560
  %5046 = alloca i32, align 4
  %5047 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5048 = call i32 (ptr, ...) @scanf(ptr %5047, ptr %5046)
  %5049 = load i32, ptr %5046, align 4
  %5050 = icmp eq i32 %5049, 0
  br label %continuation7569

continuation7569:                                 ; preds = %else7571, %then7570
  %5051 = phi i1 [ %5050, %else7571 ], [ true, %then7570 ]
  br i1 %5051, label %then7579, label %else7580

then7579:                                         ; preds = %continuation7569
  br label %continuation7578

else7580:                                         ; preds = %continuation7569
  %5052 = alloca i32, align 4
  %5053 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5054 = call i32 (ptr, ...) @scanf(ptr %5053, ptr %5052)
  %5055 = load i32, ptr %5052, align 4
  %5056 = icmp eq i32 %5055, 0
  br label %continuation7578

continuation7578:                                 ; preds = %else7580, %then7579
  %5057 = phi i1 [ %5056, %else7580 ], [ true, %then7579 ]
  br i1 %5057, label %then7588, label %else7589

then7588:                                         ; preds = %continuation7578
  br label %continuation7587

else7589:                                         ; preds = %continuation7578
  %5058 = alloca i32, align 4
  %5059 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5060 = call i32 (ptr, ...) @scanf(ptr %5059, ptr %5058)
  %5061 = load i32, ptr %5058, align 4
  %5062 = icmp eq i32 %5061, 0
  br label %continuation7587

continuation7587:                                 ; preds = %else7589, %then7588
  %5063 = phi i1 [ %5062, %else7589 ], [ true, %then7588 ]
  br i1 %5063, label %then7597, label %else7598

then7597:                                         ; preds = %continuation7587
  br label %continuation7596

else7598:                                         ; preds = %continuation7587
  %5064 = alloca i32, align 4
  %5065 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5066 = call i32 (ptr, ...) @scanf(ptr %5065, ptr %5064)
  %5067 = load i32, ptr %5064, align 4
  %5068 = icmp eq i32 %5067, 0
  br label %continuation7596

continuation7596:                                 ; preds = %else7598, %then7597
  %5069 = phi i1 [ %5068, %else7598 ], [ true, %then7597 ]
  br i1 %5069, label %then7606, label %else7607

then7606:                                         ; preds = %continuation7596
  br label %continuation7605

else7607:                                         ; preds = %continuation7596
  %5070 = alloca i32, align 4
  %5071 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5072 = call i32 (ptr, ...) @scanf(ptr %5071, ptr %5070)
  %5073 = load i32, ptr %5070, align 4
  %5074 = icmp eq i32 %5073, 0
  br label %continuation7605

continuation7605:                                 ; preds = %else7607, %then7606
  %5075 = phi i1 [ %5074, %else7607 ], [ true, %then7606 ]
  br i1 %5075, label %then7615, label %else7616

then7615:                                         ; preds = %continuation7605
  br label %continuation7614

else7616:                                         ; preds = %continuation7605
  %5076 = alloca i32, align 4
  %5077 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5078 = call i32 (ptr, ...) @scanf(ptr %5077, ptr %5076)
  %5079 = load i32, ptr %5076, align 4
  %5080 = icmp eq i32 %5079, 0
  br label %continuation7614

continuation7614:                                 ; preds = %else7616, %then7615
  %5081 = phi i1 [ %5080, %else7616 ], [ true, %then7615 ]
  br i1 %5081, label %then7624, label %else7625

then7624:                                         ; preds = %continuation7614
  br label %continuation7623

else7625:                                         ; preds = %continuation7614
  %5082 = alloca i32, align 4
  %5083 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5084 = call i32 (ptr, ...) @scanf(ptr %5083, ptr %5082)
  %5085 = load i32, ptr %5082, align 4
  %5086 = icmp eq i32 %5085, 0
  br label %continuation7623

continuation7623:                                 ; preds = %else7625, %then7624
  %5087 = phi i1 [ %5086, %else7625 ], [ true, %then7624 ]
  br i1 %5087, label %then7633, label %else7634

then7633:                                         ; preds = %continuation7623
  br label %continuation7632

else7634:                                         ; preds = %continuation7623
  %5088 = alloca i32, align 4
  %5089 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5090 = call i32 (ptr, ...) @scanf(ptr %5089, ptr %5088)
  %5091 = load i32, ptr %5088, align 4
  %5092 = icmp eq i32 %5091, 0
  br label %continuation7632

continuation7632:                                 ; preds = %else7634, %then7633
  %5093 = phi i1 [ %5092, %else7634 ], [ true, %then7633 ]
  br i1 %5093, label %then7642, label %else7643

then7642:                                         ; preds = %continuation7632
  br label %continuation7641

else7643:                                         ; preds = %continuation7632
  %5094 = alloca i32, align 4
  %5095 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5096 = call i32 (ptr, ...) @scanf(ptr %5095, ptr %5094)
  %5097 = load i32, ptr %5094, align 4
  %5098 = icmp eq i32 %5097, 0
  br label %continuation7641

continuation7641:                                 ; preds = %else7643, %then7642
  %5099 = phi i1 [ %5098, %else7643 ], [ true, %then7642 ]
  br i1 %5099, label %then7651, label %else7652

then7651:                                         ; preds = %continuation7641
  br label %continuation7650

else7652:                                         ; preds = %continuation7641
  %5100 = alloca i32, align 4
  %5101 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5102 = call i32 (ptr, ...) @scanf(ptr %5101, ptr %5100)
  %5103 = load i32, ptr %5100, align 4
  %5104 = icmp eq i32 %5103, 0
  br label %continuation7650

continuation7650:                                 ; preds = %else7652, %then7651
  %5105 = phi i1 [ %5104, %else7652 ], [ true, %then7651 ]
  br i1 %5105, label %then7660, label %else7661

then7660:                                         ; preds = %continuation7650
  br label %continuation7659

else7661:                                         ; preds = %continuation7650
  %5106 = alloca i32, align 4
  %5107 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5108 = call i32 (ptr, ...) @scanf(ptr %5107, ptr %5106)
  %5109 = load i32, ptr %5106, align 4
  %5110 = icmp eq i32 %5109, 0
  br label %continuation7659

continuation7659:                                 ; preds = %else7661, %then7660
  %5111 = phi i1 [ %5110, %else7661 ], [ true, %then7660 ]
  br i1 %5111, label %then7669, label %else7670

then7669:                                         ; preds = %continuation7659
  br label %continuation7668

else7670:                                         ; preds = %continuation7659
  %5112 = alloca i32, align 4
  %5113 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5114 = call i32 (ptr, ...) @scanf(ptr %5113, ptr %5112)
  %5115 = load i32, ptr %5112, align 4
  %5116 = icmp eq i32 %5115, 0
  br label %continuation7668

continuation7668:                                 ; preds = %else7670, %then7669
  %5117 = phi i1 [ %5116, %else7670 ], [ true, %then7669 ]
  br i1 %5117, label %then7678, label %else7679

then7678:                                         ; preds = %continuation7668
  br label %continuation7677

else7679:                                         ; preds = %continuation7668
  %5118 = alloca i32, align 4
  %5119 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5120 = call i32 (ptr, ...) @scanf(ptr %5119, ptr %5118)
  %5121 = load i32, ptr %5118, align 4
  %5122 = icmp eq i32 %5121, 0
  br label %continuation7677

continuation7677:                                 ; preds = %else7679, %then7678
  %5123 = phi i1 [ %5122, %else7679 ], [ true, %then7678 ]
  br i1 %5123, label %then7687, label %else7688

then7687:                                         ; preds = %continuation7677
  br label %continuation7686

else7688:                                         ; preds = %continuation7677
  %5124 = alloca i32, align 4
  %5125 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5126 = call i32 (ptr, ...) @scanf(ptr %5125, ptr %5124)
  %5127 = load i32, ptr %5124, align 4
  %5128 = icmp eq i32 %5127, 0
  br label %continuation7686

continuation7686:                                 ; preds = %else7688, %then7687
  %5129 = phi i1 [ %5128, %else7688 ], [ true, %then7687 ]
  br i1 %5129, label %then7696, label %else7697

then7696:                                         ; preds = %continuation7686
  br label %continuation7695

else7697:                                         ; preds = %continuation7686
  %5130 = alloca i32, align 4
  %5131 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5132 = call i32 (ptr, ...) @scanf(ptr %5131, ptr %5130)
  %5133 = load i32, ptr %5130, align 4
  %5134 = icmp eq i32 %5133, 0
  br label %continuation7695

continuation7695:                                 ; preds = %else7697, %then7696
  %5135 = phi i1 [ %5134, %else7697 ], [ true, %then7696 ]
  br i1 %5135, label %then7705, label %else7706

then7705:                                         ; preds = %continuation7695
  br label %continuation7704

else7706:                                         ; preds = %continuation7695
  %5136 = alloca i32, align 4
  %5137 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5138 = call i32 (ptr, ...) @scanf(ptr %5137, ptr %5136)
  %5139 = load i32, ptr %5136, align 4
  %5140 = icmp eq i32 %5139, 0
  br label %continuation7704

continuation7704:                                 ; preds = %else7706, %then7705
  %5141 = phi i1 [ %5140, %else7706 ], [ true, %then7705 ]
  br i1 %5141, label %then7714, label %else7715

then7714:                                         ; preds = %continuation7704
  br label %continuation7713

else7715:                                         ; preds = %continuation7704
  %5142 = alloca i32, align 4
  %5143 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5144 = call i32 (ptr, ...) @scanf(ptr %5143, ptr %5142)
  %5145 = load i32, ptr %5142, align 4
  %5146 = icmp eq i32 %5145, 0
  br label %continuation7713

continuation7713:                                 ; preds = %else7715, %then7714
  %5147 = phi i1 [ %5146, %else7715 ], [ true, %then7714 ]
  br i1 %5147, label %then7723, label %else7724

then7723:                                         ; preds = %continuation7713
  br label %continuation7722

else7724:                                         ; preds = %continuation7713
  %5148 = alloca i32, align 4
  %5149 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5150 = call i32 (ptr, ...) @scanf(ptr %5149, ptr %5148)
  %5151 = load i32, ptr %5148, align 4
  %5152 = icmp eq i32 %5151, 0
  br label %continuation7722

continuation7722:                                 ; preds = %else7724, %then7723
  %5153 = phi i1 [ %5152, %else7724 ], [ true, %then7723 ]
  br i1 %5153, label %then7732, label %else7733

then7732:                                         ; preds = %continuation7722
  br label %continuation7731

else7733:                                         ; preds = %continuation7722
  %5154 = alloca i32, align 4
  %5155 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5156 = call i32 (ptr, ...) @scanf(ptr %5155, ptr %5154)
  %5157 = load i32, ptr %5154, align 4
  %5158 = icmp eq i32 %5157, 0
  br label %continuation7731

continuation7731:                                 ; preds = %else7733, %then7732
  %5159 = phi i1 [ %5158, %else7733 ], [ true, %then7732 ]
  br i1 %5159, label %then7741, label %else7742

then7741:                                         ; preds = %continuation7731
  br label %continuation7740

else7742:                                         ; preds = %continuation7731
  %5160 = alloca i32, align 4
  %5161 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5162 = call i32 (ptr, ...) @scanf(ptr %5161, ptr %5160)
  %5163 = load i32, ptr %5160, align 4
  %5164 = icmp eq i32 %5163, 0
  br label %continuation7740

continuation7740:                                 ; preds = %else7742, %then7741
  %5165 = phi i1 [ %5164, %else7742 ], [ true, %then7741 ]
  br i1 %5165, label %then7750, label %else7751

then7750:                                         ; preds = %continuation7740
  br label %continuation7749

else7751:                                         ; preds = %continuation7740
  %5166 = alloca i32, align 4
  %5167 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5168 = call i32 (ptr, ...) @scanf(ptr %5167, ptr %5166)
  %5169 = load i32, ptr %5166, align 4
  %5170 = icmp eq i32 %5169, 0
  br label %continuation7749

continuation7749:                                 ; preds = %else7751, %then7750
  %5171 = phi i1 [ %5170, %else7751 ], [ true, %then7750 ]
  br i1 %5171, label %then7759, label %else7760

then7759:                                         ; preds = %continuation7749
  br label %continuation7758

else7760:                                         ; preds = %continuation7749
  %5172 = alloca i32, align 4
  %5173 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5174 = call i32 (ptr, ...) @scanf(ptr %5173, ptr %5172)
  %5175 = load i32, ptr %5172, align 4
  %5176 = icmp eq i32 %5175, 0
  br label %continuation7758

continuation7758:                                 ; preds = %else7760, %then7759
  %5177 = phi i1 [ %5176, %else7760 ], [ true, %then7759 ]
  br i1 %5177, label %then7768, label %else7769

then7768:                                         ; preds = %continuation7758
  br label %continuation7767

else7769:                                         ; preds = %continuation7758
  %5178 = alloca i32, align 4
  %5179 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5180 = call i32 (ptr, ...) @scanf(ptr %5179, ptr %5178)
  %5181 = load i32, ptr %5178, align 4
  %5182 = icmp eq i32 %5181, 0
  br label %continuation7767

continuation7767:                                 ; preds = %else7769, %then7768
  %5183 = phi i1 [ %5182, %else7769 ], [ true, %then7768 ]
  br i1 %5183, label %then7777, label %else7778

then7777:                                         ; preds = %continuation7767
  br label %continuation7776

else7778:                                         ; preds = %continuation7767
  %5184 = alloca i32, align 4
  %5185 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5186 = call i32 (ptr, ...) @scanf(ptr %5185, ptr %5184)
  %5187 = load i32, ptr %5184, align 4
  %5188 = icmp eq i32 %5187, 0
  br label %continuation7776

continuation7776:                                 ; preds = %else7778, %then7777
  %5189 = phi i1 [ %5188, %else7778 ], [ true, %then7777 ]
  br i1 %5189, label %then7786, label %else7787

then7786:                                         ; preds = %continuation7776
  br label %continuation7785

else7787:                                         ; preds = %continuation7776
  %5190 = alloca i32, align 4
  %5191 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5192 = call i32 (ptr, ...) @scanf(ptr %5191, ptr %5190)
  %5193 = load i32, ptr %5190, align 4
  %5194 = icmp eq i32 %5193, 0
  br label %continuation7785

continuation7785:                                 ; preds = %else7787, %then7786
  %5195 = phi i1 [ %5194, %else7787 ], [ true, %then7786 ]
  br i1 %5195, label %then7795, label %else7796

then7795:                                         ; preds = %continuation7785
  br label %continuation7794

else7796:                                         ; preds = %continuation7785
  %5196 = alloca i32, align 4
  %5197 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5198 = call i32 (ptr, ...) @scanf(ptr %5197, ptr %5196)
  %5199 = load i32, ptr %5196, align 4
  %5200 = icmp eq i32 %5199, 0
  br label %continuation7794

continuation7794:                                 ; preds = %else7796, %then7795
  %5201 = phi i1 [ %5200, %else7796 ], [ true, %then7795 ]
  br i1 %5201, label %then7804, label %else7805

then7804:                                         ; preds = %continuation7794
  br label %continuation7803

else7805:                                         ; preds = %continuation7794
  %5202 = alloca i32, align 4
  %5203 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5204 = call i32 (ptr, ...) @scanf(ptr %5203, ptr %5202)
  %5205 = load i32, ptr %5202, align 4
  %5206 = icmp eq i32 %5205, 0
  br label %continuation7803

continuation7803:                                 ; preds = %else7805, %then7804
  %5207 = phi i1 [ %5206, %else7805 ], [ true, %then7804 ]
  br i1 %5207, label %then7813, label %else7814

then7813:                                         ; preds = %continuation7803
  br label %continuation7812

else7814:                                         ; preds = %continuation7803
  %5208 = alloca i32, align 4
  %5209 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5210 = call i32 (ptr, ...) @scanf(ptr %5209, ptr %5208)
  %5211 = load i32, ptr %5208, align 4
  %5212 = icmp eq i32 %5211, 0
  br label %continuation7812

continuation7812:                                 ; preds = %else7814, %then7813
  %5213 = phi i1 [ %5212, %else7814 ], [ true, %then7813 ]
  br i1 %5213, label %then7822, label %else7823

then7822:                                         ; preds = %continuation7812
  br label %continuation7821

else7823:                                         ; preds = %continuation7812
  %5214 = alloca i32, align 4
  %5215 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5216 = call i32 (ptr, ...) @scanf(ptr %5215, ptr %5214)
  %5217 = load i32, ptr %5214, align 4
  %5218 = icmp eq i32 %5217, 0
  br label %continuation7821

continuation7821:                                 ; preds = %else7823, %then7822
  %5219 = phi i1 [ %5218, %else7823 ], [ true, %then7822 ]
  br i1 %5219, label %then7831, label %else7832

then7831:                                         ; preds = %continuation7821
  br label %continuation7830

else7832:                                         ; preds = %continuation7821
  %5220 = alloca i32, align 4
  %5221 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5222 = call i32 (ptr, ...) @scanf(ptr %5221, ptr %5220)
  %5223 = load i32, ptr %5220, align 4
  %5224 = icmp eq i32 %5223, 0
  br label %continuation7830

continuation7830:                                 ; preds = %else7832, %then7831
  %5225 = phi i1 [ %5224, %else7832 ], [ true, %then7831 ]
  br i1 %5225, label %then7840, label %else7841

then7840:                                         ; preds = %continuation7830
  br label %continuation7839

else7841:                                         ; preds = %continuation7830
  %5226 = alloca i32, align 4
  %5227 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5228 = call i32 (ptr, ...) @scanf(ptr %5227, ptr %5226)
  %5229 = load i32, ptr %5226, align 4
  %5230 = icmp eq i32 %5229, 0
  br label %continuation7839

continuation7839:                                 ; preds = %else7841, %then7840
  %5231 = phi i1 [ %5230, %else7841 ], [ true, %then7840 ]
  br i1 %5231, label %then7849, label %else7850

then7849:                                         ; preds = %continuation7839
  br label %continuation7848

else7850:                                         ; preds = %continuation7839
  %5232 = alloca i32, align 4
  %5233 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5234 = call i32 (ptr, ...) @scanf(ptr %5233, ptr %5232)
  %5235 = load i32, ptr %5232, align 4
  %5236 = icmp eq i32 %5235, 0
  br label %continuation7848

continuation7848:                                 ; preds = %else7850, %then7849
  %5237 = phi i1 [ %5236, %else7850 ], [ true, %then7849 ]
  br i1 %5237, label %then7858, label %else7859

then7858:                                         ; preds = %continuation7848
  br label %continuation7857

else7859:                                         ; preds = %continuation7848
  %5238 = alloca i32, align 4
  %5239 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5240 = call i32 (ptr, ...) @scanf(ptr %5239, ptr %5238)
  %5241 = load i32, ptr %5238, align 4
  %5242 = icmp eq i32 %5241, 0
  br label %continuation7857

continuation7857:                                 ; preds = %else7859, %then7858
  %5243 = phi i1 [ %5242, %else7859 ], [ true, %then7858 ]
  br i1 %5243, label %then7867, label %else7868

then7867:                                         ; preds = %continuation7857
  br label %continuation7866

else7868:                                         ; preds = %continuation7857
  %5244 = alloca i32, align 4
  %5245 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5246 = call i32 (ptr, ...) @scanf(ptr %5245, ptr %5244)
  %5247 = load i32, ptr %5244, align 4
  %5248 = icmp eq i32 %5247, 0
  br label %continuation7866

continuation7866:                                 ; preds = %else7868, %then7867
  %5249 = phi i1 [ %5248, %else7868 ], [ true, %then7867 ]
  br i1 %5249, label %then7876, label %else7877

then7876:                                         ; preds = %continuation7866
  br label %continuation7875

else7877:                                         ; preds = %continuation7866
  %5250 = alloca i32, align 4
  %5251 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5252 = call i32 (ptr, ...) @scanf(ptr %5251, ptr %5250)
  %5253 = load i32, ptr %5250, align 4
  %5254 = icmp eq i32 %5253, 0
  br label %continuation7875

continuation7875:                                 ; preds = %else7877, %then7876
  %5255 = phi i1 [ %5254, %else7877 ], [ true, %then7876 ]
  br i1 %5255, label %then7885, label %else7886

then7885:                                         ; preds = %continuation7875
  br label %continuation7884

else7886:                                         ; preds = %continuation7875
  %5256 = alloca i32, align 4
  %5257 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5258 = call i32 (ptr, ...) @scanf(ptr %5257, ptr %5256)
  %5259 = load i32, ptr %5256, align 4
  %5260 = icmp eq i32 %5259, 0
  br label %continuation7884

continuation7884:                                 ; preds = %else7886, %then7885
  %5261 = phi i1 [ %5260, %else7886 ], [ true, %then7885 ]
  br i1 %5261, label %then7894, label %else7895

then7894:                                         ; preds = %continuation7884
  br label %continuation7893

else7895:                                         ; preds = %continuation7884
  %5262 = alloca i32, align 4
  %5263 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5264 = call i32 (ptr, ...) @scanf(ptr %5263, ptr %5262)
  %5265 = load i32, ptr %5262, align 4
  %5266 = icmp eq i32 %5265, 0
  br label %continuation7893

continuation7893:                                 ; preds = %else7895, %then7894
  %5267 = phi i1 [ %5266, %else7895 ], [ true, %then7894 ]
  br i1 %5267, label %then7903, label %else7904

then7903:                                         ; preds = %continuation7893
  br label %continuation7902

else7904:                                         ; preds = %continuation7893
  %5268 = alloca i32, align 4
  %5269 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5270 = call i32 (ptr, ...) @scanf(ptr %5269, ptr %5268)
  %5271 = load i32, ptr %5268, align 4
  %5272 = icmp eq i32 %5271, 0
  br label %continuation7902

continuation7902:                                 ; preds = %else7904, %then7903
  %5273 = phi i1 [ %5272, %else7904 ], [ true, %then7903 ]
  br i1 %5273, label %then7912, label %else7913

then7912:                                         ; preds = %continuation7902
  br label %continuation7911

else7913:                                         ; preds = %continuation7902
  %5274 = alloca i32, align 4
  %5275 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5276 = call i32 (ptr, ...) @scanf(ptr %5275, ptr %5274)
  %5277 = load i32, ptr %5274, align 4
  %5278 = icmp eq i32 %5277, 0
  br label %continuation7911

continuation7911:                                 ; preds = %else7913, %then7912
  %5279 = phi i1 [ %5278, %else7913 ], [ true, %then7912 ]
  br i1 %5279, label %then7921, label %else7922

then7921:                                         ; preds = %continuation7911
  br label %continuation7920

else7922:                                         ; preds = %continuation7911
  %5280 = alloca i32, align 4
  %5281 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5282 = call i32 (ptr, ...) @scanf(ptr %5281, ptr %5280)
  %5283 = load i32, ptr %5280, align 4
  %5284 = icmp eq i32 %5283, 0
  br label %continuation7920

continuation7920:                                 ; preds = %else7922, %then7921
  %5285 = phi i1 [ %5284, %else7922 ], [ true, %then7921 ]
  br i1 %5285, label %then7930, label %else7931

then7930:                                         ; preds = %continuation7920
  br label %continuation7929

else7931:                                         ; preds = %continuation7920
  %5286 = alloca i32, align 4
  %5287 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5288 = call i32 (ptr, ...) @scanf(ptr %5287, ptr %5286)
  %5289 = load i32, ptr %5286, align 4
  %5290 = icmp eq i32 %5289, 0
  br label %continuation7929

continuation7929:                                 ; preds = %else7931, %then7930
  %5291 = phi i1 [ %5290, %else7931 ], [ true, %then7930 ]
  br i1 %5291, label %then7939, label %else7940

then7939:                                         ; preds = %continuation7929
  br label %continuation7938

else7940:                                         ; preds = %continuation7929
  %5292 = alloca i32, align 4
  %5293 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5294 = call i32 (ptr, ...) @scanf(ptr %5293, ptr %5292)
  %5295 = load i32, ptr %5292, align 4
  %5296 = icmp eq i32 %5295, 0
  br label %continuation7938

continuation7938:                                 ; preds = %else7940, %then7939
  %5297 = phi i1 [ %5296, %else7940 ], [ true, %then7939 ]
  br i1 %5297, label %then7948, label %else7949

then7948:                                         ; preds = %continuation7938
  br label %continuation7947

else7949:                                         ; preds = %continuation7938
  %5298 = alloca i32, align 4
  %5299 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5300 = call i32 (ptr, ...) @scanf(ptr %5299, ptr %5298)
  %5301 = load i32, ptr %5298, align 4
  %5302 = icmp eq i32 %5301, 0
  br label %continuation7947

continuation7947:                                 ; preds = %else7949, %then7948
  %5303 = phi i1 [ %5302, %else7949 ], [ true, %then7948 ]
  br i1 %5303, label %then7957, label %else7958

then7957:                                         ; preds = %continuation7947
  br label %continuation7956

else7958:                                         ; preds = %continuation7947
  %5304 = alloca i32, align 4
  %5305 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5306 = call i32 (ptr, ...) @scanf(ptr %5305, ptr %5304)
  %5307 = load i32, ptr %5304, align 4
  %5308 = icmp eq i32 %5307, 0
  br label %continuation7956

continuation7956:                                 ; preds = %else7958, %then7957
  %5309 = phi i1 [ %5308, %else7958 ], [ true, %then7957 ]
  br i1 %5309, label %then7966, label %else7967

then7966:                                         ; preds = %continuation7956
  br label %continuation7965

else7967:                                         ; preds = %continuation7956
  %5310 = alloca i32, align 4
  %5311 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5312 = call i32 (ptr, ...) @scanf(ptr %5311, ptr %5310)
  %5313 = load i32, ptr %5310, align 4
  %5314 = icmp eq i32 %5313, 0
  br label %continuation7965

continuation7965:                                 ; preds = %else7967, %then7966
  %5315 = phi i1 [ %5314, %else7967 ], [ true, %then7966 ]
  br i1 %5315, label %then7975, label %else7976

then7975:                                         ; preds = %continuation7965
  br label %continuation7974

else7976:                                         ; preds = %continuation7965
  %5316 = alloca i32, align 4
  %5317 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5318 = call i32 (ptr, ...) @scanf(ptr %5317, ptr %5316)
  %5319 = load i32, ptr %5316, align 4
  %5320 = icmp eq i32 %5319, 0
  br label %continuation7974

continuation7974:                                 ; preds = %else7976, %then7975
  %5321 = phi i1 [ %5320, %else7976 ], [ true, %then7975 ]
  br i1 %5321, label %then7984, label %else7985

then7984:                                         ; preds = %continuation7974
  br label %continuation7983

else7985:                                         ; preds = %continuation7974
  %5322 = alloca i32, align 4
  %5323 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5324 = call i32 (ptr, ...) @scanf(ptr %5323, ptr %5322)
  %5325 = load i32, ptr %5322, align 4
  %5326 = icmp eq i32 %5325, 0
  br label %continuation7983

continuation7983:                                 ; preds = %else7985, %then7984
  %5327 = phi i1 [ %5326, %else7985 ], [ true, %then7984 ]
  br i1 %5327, label %then7993, label %else7994

then7993:                                         ; preds = %continuation7983
  br label %continuation7992

else7994:                                         ; preds = %continuation7983
  %5328 = alloca i32, align 4
  %5329 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5330 = call i32 (ptr, ...) @scanf(ptr %5329, ptr %5328)
  %5331 = load i32, ptr %5328, align 4
  %5332 = icmp eq i32 %5331, 0
  br label %continuation7992

continuation7992:                                 ; preds = %else7994, %then7993
  %5333 = phi i1 [ %5332, %else7994 ], [ true, %then7993 ]
  br i1 %5333, label %then8002, label %else8003

then8002:                                         ; preds = %continuation7992
  br label %continuation8001

else8003:                                         ; preds = %continuation7992
  %5334 = alloca i32, align 4
  %5335 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5336 = call i32 (ptr, ...) @scanf(ptr %5335, ptr %5334)
  %5337 = load i32, ptr %5334, align 4
  %5338 = icmp eq i32 %5337, 0
  br label %continuation8001

continuation8001:                                 ; preds = %else8003, %then8002
  %5339 = phi i1 [ %5338, %else8003 ], [ true, %then8002 ]
  br i1 %5339, label %then8011, label %else8012

then8011:                                         ; preds = %continuation8001
  br label %continuation8010

else8012:                                         ; preds = %continuation8001
  %5340 = alloca i32, align 4
  %5341 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5342 = call i32 (ptr, ...) @scanf(ptr %5341, ptr %5340)
  %5343 = load i32, ptr %5340, align 4
  %5344 = icmp eq i32 %5343, 0
  br label %continuation8010

continuation8010:                                 ; preds = %else8012, %then8011
  %5345 = phi i1 [ %5344, %else8012 ], [ true, %then8011 ]
  br i1 %5345, label %then8020, label %else8021

then8020:                                         ; preds = %continuation8010
  br label %continuation8019

else8021:                                         ; preds = %continuation8010
  %5346 = alloca i32, align 4
  %5347 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5348 = call i32 (ptr, ...) @scanf(ptr %5347, ptr %5346)
  %5349 = load i32, ptr %5346, align 4
  %5350 = icmp eq i32 %5349, 0
  br label %continuation8019

continuation8019:                                 ; preds = %else8021, %then8020
  %5351 = phi i1 [ %5350, %else8021 ], [ true, %then8020 ]
  br i1 %5351, label %then8029, label %else8030

then8029:                                         ; preds = %continuation8019
  br label %continuation8028

else8030:                                         ; preds = %continuation8019
  %5352 = alloca i32, align 4
  %5353 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5354 = call i32 (ptr, ...) @scanf(ptr %5353, ptr %5352)
  %5355 = load i32, ptr %5352, align 4
  %5356 = icmp eq i32 %5355, 0
  br label %continuation8028

continuation8028:                                 ; preds = %else8030, %then8029
  %5357 = phi i1 [ %5356, %else8030 ], [ true, %then8029 ]
  br i1 %5357, label %then8038, label %else8039

then8038:                                         ; preds = %continuation8028
  br label %continuation8037

else8039:                                         ; preds = %continuation8028
  %5358 = alloca i32, align 4
  %5359 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5360 = call i32 (ptr, ...) @scanf(ptr %5359, ptr %5358)
  %5361 = load i32, ptr %5358, align 4
  %5362 = icmp eq i32 %5361, 0
  br label %continuation8037

continuation8037:                                 ; preds = %else8039, %then8038
  %5363 = phi i1 [ %5362, %else8039 ], [ true, %then8038 ]
  br i1 %5363, label %then8047, label %else8048

then8047:                                         ; preds = %continuation8037
  br label %continuation8046

else8048:                                         ; preds = %continuation8037
  %5364 = alloca i32, align 4
  %5365 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5366 = call i32 (ptr, ...) @scanf(ptr %5365, ptr %5364)
  %5367 = load i32, ptr %5364, align 4
  %5368 = icmp eq i32 %5367, 0
  br label %continuation8046

continuation8046:                                 ; preds = %else8048, %then8047
  %5369 = phi i1 [ %5368, %else8048 ], [ true, %then8047 ]
  br i1 %5369, label %then8056, label %else8057

then8056:                                         ; preds = %continuation8046
  br label %continuation8055

else8057:                                         ; preds = %continuation8046
  %5370 = alloca i32, align 4
  %5371 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5372 = call i32 (ptr, ...) @scanf(ptr %5371, ptr %5370)
  %5373 = load i32, ptr %5370, align 4
  %5374 = icmp eq i32 %5373, 0
  br label %continuation8055

continuation8055:                                 ; preds = %else8057, %then8056
  %5375 = phi i1 [ %5374, %else8057 ], [ true, %then8056 ]
  br i1 %5375, label %then8065, label %else8066

then8065:                                         ; preds = %continuation8055
  br label %continuation8064

else8066:                                         ; preds = %continuation8055
  %5376 = alloca i32, align 4
  %5377 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5378 = call i32 (ptr, ...) @scanf(ptr %5377, ptr %5376)
  %5379 = load i32, ptr %5376, align 4
  %5380 = icmp eq i32 %5379, 0
  br label %continuation8064

continuation8064:                                 ; preds = %else8066, %then8065
  %5381 = phi i1 [ %5380, %else8066 ], [ true, %then8065 ]
  br i1 %5381, label %then8074, label %else8075

then8074:                                         ; preds = %continuation8064
  br label %continuation8073

else8075:                                         ; preds = %continuation8064
  %5382 = alloca i32, align 4
  %5383 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5384 = call i32 (ptr, ...) @scanf(ptr %5383, ptr %5382)
  %5385 = load i32, ptr %5382, align 4
  %5386 = icmp eq i32 %5385, 0
  br label %continuation8073

continuation8073:                                 ; preds = %else8075, %then8074
  %5387 = phi i1 [ %5386, %else8075 ], [ true, %then8074 ]
  br i1 %5387, label %then8083, label %else8084

then8083:                                         ; preds = %continuation8073
  br label %continuation8082

else8084:                                         ; preds = %continuation8073
  %5388 = alloca i32, align 4
  %5389 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5390 = call i32 (ptr, ...) @scanf(ptr %5389, ptr %5388)
  %5391 = load i32, ptr %5388, align 4
  %5392 = icmp eq i32 %5391, 0
  br label %continuation8082

continuation8082:                                 ; preds = %else8084, %then8083
  %5393 = phi i1 [ %5392, %else8084 ], [ true, %then8083 ]
  br i1 %5393, label %then8092, label %else8093

then8092:                                         ; preds = %continuation8082
  br label %continuation8091

else8093:                                         ; preds = %continuation8082
  %5394 = alloca i32, align 4
  %5395 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5396 = call i32 (ptr, ...) @scanf(ptr %5395, ptr %5394)
  %5397 = load i32, ptr %5394, align 4
  %5398 = icmp eq i32 %5397, 0
  br label %continuation8091

continuation8091:                                 ; preds = %else8093, %then8092
  %5399 = phi i1 [ %5398, %else8093 ], [ true, %then8092 ]
  br i1 %5399, label %then8101, label %else8102

then8101:                                         ; preds = %continuation8091
  br label %continuation8100

else8102:                                         ; preds = %continuation8091
  %5400 = alloca i32, align 4
  %5401 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5402 = call i32 (ptr, ...) @scanf(ptr %5401, ptr %5400)
  %5403 = load i32, ptr %5400, align 4
  %5404 = icmp eq i32 %5403, 0
  br label %continuation8100

continuation8100:                                 ; preds = %else8102, %then8101
  %5405 = phi i1 [ %5404, %else8102 ], [ true, %then8101 ]
  br i1 %5405, label %then8110, label %else8111

then8110:                                         ; preds = %continuation8100
  br label %continuation8109

else8111:                                         ; preds = %continuation8100
  %5406 = alloca i32, align 4
  %5407 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5408 = call i32 (ptr, ...) @scanf(ptr %5407, ptr %5406)
  %5409 = load i32, ptr %5406, align 4
  %5410 = icmp eq i32 %5409, 0
  br label %continuation8109

continuation8109:                                 ; preds = %else8111, %then8110
  %5411 = phi i1 [ %5410, %else8111 ], [ true, %then8110 ]
  br i1 %5411, label %then8119, label %else8120

then8119:                                         ; preds = %continuation8109
  br label %continuation8118

else8120:                                         ; preds = %continuation8109
  %5412 = alloca i32, align 4
  %5413 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5414 = call i32 (ptr, ...) @scanf(ptr %5413, ptr %5412)
  %5415 = load i32, ptr %5412, align 4
  %5416 = icmp eq i32 %5415, 0
  br label %continuation8118

continuation8118:                                 ; preds = %else8120, %then8119
  %5417 = phi i1 [ %5416, %else8120 ], [ true, %then8119 ]
  br i1 %5417, label %then8128, label %else8129

then8128:                                         ; preds = %continuation8118
  br label %continuation8127

else8129:                                         ; preds = %continuation8118
  %5418 = alloca i32, align 4
  %5419 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5420 = call i32 (ptr, ...) @scanf(ptr %5419, ptr %5418)
  %5421 = load i32, ptr %5418, align 4
  %5422 = icmp eq i32 %5421, 0
  br label %continuation8127

continuation8127:                                 ; preds = %else8129, %then8128
  %5423 = phi i1 [ %5422, %else8129 ], [ true, %then8128 ]
  br i1 %5423, label %then8137, label %else8138

then8137:                                         ; preds = %continuation8127
  br label %continuation8136

else8138:                                         ; preds = %continuation8127
  %5424 = alloca i32, align 4
  %5425 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5426 = call i32 (ptr, ...) @scanf(ptr %5425, ptr %5424)
  %5427 = load i32, ptr %5424, align 4
  %5428 = icmp eq i32 %5427, 0
  br label %continuation8136

continuation8136:                                 ; preds = %else8138, %then8137
  %5429 = phi i1 [ %5428, %else8138 ], [ true, %then8137 ]
  br i1 %5429, label %then8146, label %else8147

then8146:                                         ; preds = %continuation8136
  br label %continuation8145

else8147:                                         ; preds = %continuation8136
  %5430 = alloca i32, align 4
  %5431 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5432 = call i32 (ptr, ...) @scanf(ptr %5431, ptr %5430)
  %5433 = load i32, ptr %5430, align 4
  %5434 = icmp eq i32 %5433, 0
  br label %continuation8145

continuation8145:                                 ; preds = %else8147, %then8146
  %5435 = phi i1 [ %5434, %else8147 ], [ true, %then8146 ]
  br i1 %5435, label %then8155, label %else8156

then8155:                                         ; preds = %continuation8145
  br label %continuation8154

else8156:                                         ; preds = %continuation8145
  %5436 = alloca i32, align 4
  %5437 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5438 = call i32 (ptr, ...) @scanf(ptr %5437, ptr %5436)
  %5439 = load i32, ptr %5436, align 4
  %5440 = icmp eq i32 %5439, 0
  br label %continuation8154

continuation8154:                                 ; preds = %else8156, %then8155
  %5441 = phi i1 [ %5440, %else8156 ], [ true, %then8155 ]
  br i1 %5441, label %then8164, label %else8165

then8164:                                         ; preds = %continuation8154
  br label %continuation8163

else8165:                                         ; preds = %continuation8154
  %5442 = alloca i32, align 4
  %5443 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5444 = call i32 (ptr, ...) @scanf(ptr %5443, ptr %5442)
  %5445 = load i32, ptr %5442, align 4
  %5446 = icmp eq i32 %5445, 0
  br label %continuation8163

continuation8163:                                 ; preds = %else8165, %then8164
  %5447 = phi i1 [ %5446, %else8165 ], [ true, %then8164 ]
  br i1 %5447, label %then8173, label %else8174

then8173:                                         ; preds = %continuation8163
  br label %continuation8172

else8174:                                         ; preds = %continuation8163
  %5448 = alloca i32, align 4
  %5449 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5450 = call i32 (ptr, ...) @scanf(ptr %5449, ptr %5448)
  %5451 = load i32, ptr %5448, align 4
  %5452 = icmp eq i32 %5451, 0
  br label %continuation8172

continuation8172:                                 ; preds = %else8174, %then8173
  %5453 = phi i1 [ %5452, %else8174 ], [ true, %then8173 ]
  br i1 %5453, label %then8182, label %else8183

then8182:                                         ; preds = %continuation8172
  br label %continuation8181

else8183:                                         ; preds = %continuation8172
  %5454 = alloca i32, align 4
  %5455 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5456 = call i32 (ptr, ...) @scanf(ptr %5455, ptr %5454)
  %5457 = load i32, ptr %5454, align 4
  %5458 = icmp eq i32 %5457, 0
  br label %continuation8181

continuation8181:                                 ; preds = %else8183, %then8182
  %5459 = phi i1 [ %5458, %else8183 ], [ true, %then8182 ]
  br i1 %5459, label %then8191, label %else8192

then8191:                                         ; preds = %continuation8181
  br label %continuation8190

else8192:                                         ; preds = %continuation8181
  %5460 = alloca i32, align 4
  %5461 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5462 = call i32 (ptr, ...) @scanf(ptr %5461, ptr %5460)
  %5463 = load i32, ptr %5460, align 4
  %5464 = icmp eq i32 %5463, 0
  br label %continuation8190

continuation8190:                                 ; preds = %else8192, %then8191
  %5465 = phi i1 [ %5464, %else8192 ], [ true, %then8191 ]
  br i1 %5465, label %then8200, label %else8201

then8200:                                         ; preds = %continuation8190
  br label %continuation8199

else8201:                                         ; preds = %continuation8190
  %5466 = alloca i32, align 4
  %5467 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5468 = call i32 (ptr, ...) @scanf(ptr %5467, ptr %5466)
  %5469 = load i32, ptr %5466, align 4
  %5470 = icmp eq i32 %5469, 0
  br label %continuation8199

continuation8199:                                 ; preds = %else8201, %then8200
  %5471 = phi i1 [ %5470, %else8201 ], [ true, %then8200 ]
  br i1 %5471, label %then8209, label %else8210

then8209:                                         ; preds = %continuation8199
  br label %continuation8208

else8210:                                         ; preds = %continuation8199
  %5472 = alloca i32, align 4
  %5473 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5474 = call i32 (ptr, ...) @scanf(ptr %5473, ptr %5472)
  %5475 = load i32, ptr %5472, align 4
  %5476 = icmp eq i32 %5475, 0
  br label %continuation8208

continuation8208:                                 ; preds = %else8210, %then8209
  %5477 = phi i1 [ %5476, %else8210 ], [ true, %then8209 ]
  br i1 %5477, label %then8218, label %else8219

then8218:                                         ; preds = %continuation8208
  br label %continuation8217

else8219:                                         ; preds = %continuation8208
  %5478 = alloca i32, align 4
  %5479 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5480 = call i32 (ptr, ...) @scanf(ptr %5479, ptr %5478)
  %5481 = load i32, ptr %5478, align 4
  %5482 = icmp eq i32 %5481, 0
  br label %continuation8217

continuation8217:                                 ; preds = %else8219, %then8218
  %5483 = phi i1 [ %5482, %else8219 ], [ true, %then8218 ]
  br i1 %5483, label %then8227, label %else8228

then8227:                                         ; preds = %continuation8217
  br label %continuation8226

else8228:                                         ; preds = %continuation8217
  %5484 = alloca i32, align 4
  %5485 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5486 = call i32 (ptr, ...) @scanf(ptr %5485, ptr %5484)
  %5487 = load i32, ptr %5484, align 4
  %5488 = icmp eq i32 %5487, 0
  br label %continuation8226

continuation8226:                                 ; preds = %else8228, %then8227
  %5489 = phi i1 [ %5488, %else8228 ], [ true, %then8227 ]
  br i1 %5489, label %then8236, label %else8237

then8236:                                         ; preds = %continuation8226
  br label %continuation8235

else8237:                                         ; preds = %continuation8226
  %5490 = alloca i32, align 4
  %5491 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5492 = call i32 (ptr, ...) @scanf(ptr %5491, ptr %5490)
  %5493 = load i32, ptr %5490, align 4
  %5494 = icmp eq i32 %5493, 0
  br label %continuation8235

continuation8235:                                 ; preds = %else8237, %then8236
  %5495 = phi i1 [ %5494, %else8237 ], [ true, %then8236 ]
  br i1 %5495, label %then8245, label %else8246

then8245:                                         ; preds = %continuation8235
  br label %continuation8244

else8246:                                         ; preds = %continuation8235
  %5496 = alloca i32, align 4
  %5497 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5498 = call i32 (ptr, ...) @scanf(ptr %5497, ptr %5496)
  %5499 = load i32, ptr %5496, align 4
  %5500 = icmp eq i32 %5499, 0
  br label %continuation8244

continuation8244:                                 ; preds = %else8246, %then8245
  %5501 = phi i1 [ %5500, %else8246 ], [ true, %then8245 ]
  br i1 %5501, label %then8254, label %else8255

then8254:                                         ; preds = %continuation8244
  br label %continuation8253

else8255:                                         ; preds = %continuation8244
  %5502 = alloca i32, align 4
  %5503 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5504 = call i32 (ptr, ...) @scanf(ptr %5503, ptr %5502)
  %5505 = load i32, ptr %5502, align 4
  %5506 = icmp eq i32 %5505, 0
  br label %continuation8253

continuation8253:                                 ; preds = %else8255, %then8254
  %5507 = phi i1 [ %5506, %else8255 ], [ true, %then8254 ]
  br i1 %5507, label %then8263, label %else8264

then8263:                                         ; preds = %continuation8253
  br label %continuation8262

else8264:                                         ; preds = %continuation8253
  %5508 = alloca i32, align 4
  %5509 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5510 = call i32 (ptr, ...) @scanf(ptr %5509, ptr %5508)
  %5511 = load i32, ptr %5508, align 4
  %5512 = icmp eq i32 %5511, 0
  br label %continuation8262

continuation8262:                                 ; preds = %else8264, %then8263
  %5513 = phi i1 [ %5512, %else8264 ], [ true, %then8263 ]
  br i1 %5513, label %then8272, label %else8273

then8272:                                         ; preds = %continuation8262
  br label %continuation8271

else8273:                                         ; preds = %continuation8262
  %5514 = alloca i32, align 4
  %5515 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5516 = call i32 (ptr, ...) @scanf(ptr %5515, ptr %5514)
  %5517 = load i32, ptr %5514, align 4
  %5518 = icmp eq i32 %5517, 0
  br label %continuation8271

continuation8271:                                 ; preds = %else8273, %then8272
  %5519 = phi i1 [ %5518, %else8273 ], [ true, %then8272 ]
  br i1 %5519, label %then8281, label %else8282

then8281:                                         ; preds = %continuation8271
  br label %continuation8280

else8282:                                         ; preds = %continuation8271
  %5520 = alloca i32, align 4
  %5521 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5522 = call i32 (ptr, ...) @scanf(ptr %5521, ptr %5520)
  %5523 = load i32, ptr %5520, align 4
  %5524 = icmp eq i32 %5523, 0
  br label %continuation8280

continuation8280:                                 ; preds = %else8282, %then8281
  %5525 = phi i1 [ %5524, %else8282 ], [ true, %then8281 ]
  br i1 %5525, label %then8290, label %else8291

then8290:                                         ; preds = %continuation8280
  br label %continuation8289

else8291:                                         ; preds = %continuation8280
  %5526 = alloca i32, align 4
  %5527 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5528 = call i32 (ptr, ...) @scanf(ptr %5527, ptr %5526)
  %5529 = load i32, ptr %5526, align 4
  %5530 = icmp eq i32 %5529, 0
  br label %continuation8289

continuation8289:                                 ; preds = %else8291, %then8290
  %5531 = phi i1 [ %5530, %else8291 ], [ true, %then8290 ]
  br i1 %5531, label %then8299, label %else8300

then8299:                                         ; preds = %continuation8289
  br label %continuation8298

else8300:                                         ; preds = %continuation8289
  %5532 = alloca i32, align 4
  %5533 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5534 = call i32 (ptr, ...) @scanf(ptr %5533, ptr %5532)
  %5535 = load i32, ptr %5532, align 4
  %5536 = icmp eq i32 %5535, 0
  br label %continuation8298

continuation8298:                                 ; preds = %else8300, %then8299
  %5537 = phi i1 [ %5536, %else8300 ], [ true, %then8299 ]
  br i1 %5537, label %then8308, label %else8309

then8308:                                         ; preds = %continuation8298
  br label %continuation8307

else8309:                                         ; preds = %continuation8298
  %5538 = alloca i32, align 4
  %5539 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5540 = call i32 (ptr, ...) @scanf(ptr %5539, ptr %5538)
  %5541 = load i32, ptr %5538, align 4
  %5542 = icmp eq i32 %5541, 0
  br label %continuation8307

continuation8307:                                 ; preds = %else8309, %then8308
  %5543 = phi i1 [ %5542, %else8309 ], [ true, %then8308 ]
  br i1 %5543, label %then8317, label %else8318

then8317:                                         ; preds = %continuation8307
  br label %continuation8316

else8318:                                         ; preds = %continuation8307
  %5544 = alloca i32, align 4
  %5545 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5546 = call i32 (ptr, ...) @scanf(ptr %5545, ptr %5544)
  %5547 = load i32, ptr %5544, align 4
  %5548 = icmp eq i32 %5547, 0
  br label %continuation8316

continuation8316:                                 ; preds = %else8318, %then8317
  %5549 = phi i1 [ %5548, %else8318 ], [ true, %then8317 ]
  br i1 %5549, label %then8326, label %else8327

then8326:                                         ; preds = %continuation8316
  br label %continuation8325

else8327:                                         ; preds = %continuation8316
  %5550 = alloca i32, align 4
  %5551 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5552 = call i32 (ptr, ...) @scanf(ptr %5551, ptr %5550)
  %5553 = load i32, ptr %5550, align 4
  %5554 = icmp eq i32 %5553, 0
  br label %continuation8325

continuation8325:                                 ; preds = %else8327, %then8326
  %5555 = phi i1 [ %5554, %else8327 ], [ true, %then8326 ]
  br i1 %5555, label %then8335, label %else8336

then8335:                                         ; preds = %continuation8325
  br label %continuation8334

else8336:                                         ; preds = %continuation8325
  %5556 = alloca i32, align 4
  %5557 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5558 = call i32 (ptr, ...) @scanf(ptr %5557, ptr %5556)
  %5559 = load i32, ptr %5556, align 4
  %5560 = icmp eq i32 %5559, 0
  br label %continuation8334

continuation8334:                                 ; preds = %else8336, %then8335
  %5561 = phi i1 [ %5560, %else8336 ], [ true, %then8335 ]
  br i1 %5561, label %then8344, label %else8345

then8344:                                         ; preds = %continuation8334
  br label %continuation8343

else8345:                                         ; preds = %continuation8334
  %5562 = alloca i32, align 4
  %5563 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5564 = call i32 (ptr, ...) @scanf(ptr %5563, ptr %5562)
  %5565 = load i32, ptr %5562, align 4
  %5566 = icmp eq i32 %5565, 0
  br label %continuation8343

continuation8343:                                 ; preds = %else8345, %then8344
  %5567 = phi i1 [ %5566, %else8345 ], [ true, %then8344 ]
  br i1 %5567, label %then8353, label %else8354

then8353:                                         ; preds = %continuation8343
  br label %continuation8352

else8354:                                         ; preds = %continuation8343
  %5568 = alloca i32, align 4
  %5569 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5570 = call i32 (ptr, ...) @scanf(ptr %5569, ptr %5568)
  %5571 = load i32, ptr %5568, align 4
  %5572 = icmp eq i32 %5571, 0
  br label %continuation8352

continuation8352:                                 ; preds = %else8354, %then8353
  %5573 = phi i1 [ %5572, %else8354 ], [ true, %then8353 ]
  br i1 %5573, label %then8362, label %else8363

then8362:                                         ; preds = %continuation8352
  br label %continuation8361

else8363:                                         ; preds = %continuation8352
  %5574 = alloca i32, align 4
  %5575 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5576 = call i32 (ptr, ...) @scanf(ptr %5575, ptr %5574)
  %5577 = load i32, ptr %5574, align 4
  %5578 = icmp eq i32 %5577, 0
  br label %continuation8361

continuation8361:                                 ; preds = %else8363, %then8362
  %5579 = phi i1 [ %5578, %else8363 ], [ true, %then8362 ]
  br i1 %5579, label %then8371, label %else8372

then8371:                                         ; preds = %continuation8361
  br label %continuation8370

else8372:                                         ; preds = %continuation8361
  %5580 = alloca i32, align 4
  %5581 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5582 = call i32 (ptr, ...) @scanf(ptr %5581, ptr %5580)
  %5583 = load i32, ptr %5580, align 4
  %5584 = icmp eq i32 %5583, 0
  br label %continuation8370

continuation8370:                                 ; preds = %else8372, %then8371
  %5585 = phi i1 [ %5584, %else8372 ], [ true, %then8371 ]
  br i1 %5585, label %then8380, label %else8381

then8380:                                         ; preds = %continuation8370
  br label %continuation8379

else8381:                                         ; preds = %continuation8370
  %5586 = alloca i32, align 4
  %5587 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5588 = call i32 (ptr, ...) @scanf(ptr %5587, ptr %5586)
  %5589 = load i32, ptr %5586, align 4
  %5590 = icmp eq i32 %5589, 0
  br label %continuation8379

continuation8379:                                 ; preds = %else8381, %then8380
  %5591 = phi i1 [ %5590, %else8381 ], [ true, %then8380 ]
  br i1 %5591, label %then8389, label %else8390

then8389:                                         ; preds = %continuation8379
  br label %continuation8388

else8390:                                         ; preds = %continuation8379
  %5592 = alloca i32, align 4
  %5593 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5594 = call i32 (ptr, ...) @scanf(ptr %5593, ptr %5592)
  %5595 = load i32, ptr %5592, align 4
  %5596 = icmp eq i32 %5595, 0
  br label %continuation8388

continuation8388:                                 ; preds = %else8390, %then8389
  %5597 = phi i1 [ %5596, %else8390 ], [ true, %then8389 ]
  br i1 %5597, label %then8398, label %else8399

then8398:                                         ; preds = %continuation8388
  br label %continuation8397

else8399:                                         ; preds = %continuation8388
  %5598 = alloca i32, align 4
  %5599 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5600 = call i32 (ptr, ...) @scanf(ptr %5599, ptr %5598)
  %5601 = load i32, ptr %5598, align 4
  %5602 = icmp eq i32 %5601, 0
  br label %continuation8397

continuation8397:                                 ; preds = %else8399, %then8398
  %5603 = phi i1 [ %5602, %else8399 ], [ true, %then8398 ]
  br i1 %5603, label %then8407, label %else8408

then8407:                                         ; preds = %continuation8397
  br label %continuation8406

else8408:                                         ; preds = %continuation8397
  %5604 = alloca i32, align 4
  %5605 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5606 = call i32 (ptr, ...) @scanf(ptr %5605, ptr %5604)
  %5607 = load i32, ptr %5604, align 4
  %5608 = icmp eq i32 %5607, 0
  br label %continuation8406

continuation8406:                                 ; preds = %else8408, %then8407
  %5609 = phi i1 [ %5608, %else8408 ], [ true, %then8407 ]
  br i1 %5609, label %then8416, label %else8417

then8416:                                         ; preds = %continuation8406
  br label %continuation8415

else8417:                                         ; preds = %continuation8406
  %5610 = alloca i32, align 4
  %5611 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5612 = call i32 (ptr, ...) @scanf(ptr %5611, ptr %5610)
  %5613 = load i32, ptr %5610, align 4
  %5614 = icmp eq i32 %5613, 0
  br label %continuation8415

continuation8415:                                 ; preds = %else8417, %then8416
  %5615 = phi i1 [ %5614, %else8417 ], [ true, %then8416 ]
  br i1 %5615, label %then8425, label %else8426

then8425:                                         ; preds = %continuation8415
  br label %continuation8424

else8426:                                         ; preds = %continuation8415
  %5616 = alloca i32, align 4
  %5617 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5618 = call i32 (ptr, ...) @scanf(ptr %5617, ptr %5616)
  %5619 = load i32, ptr %5616, align 4
  %5620 = icmp eq i32 %5619, 0
  br label %continuation8424

continuation8424:                                 ; preds = %else8426, %then8425
  %5621 = phi i1 [ %5620, %else8426 ], [ true, %then8425 ]
  br i1 %5621, label %then8434, label %else8435

then8434:                                         ; preds = %continuation8424
  br label %continuation8433

else8435:                                         ; preds = %continuation8424
  %5622 = alloca i32, align 4
  %5623 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5624 = call i32 (ptr, ...) @scanf(ptr %5623, ptr %5622)
  %5625 = load i32, ptr %5622, align 4
  %5626 = icmp eq i32 %5625, 0
  br label %continuation8433

continuation8433:                                 ; preds = %else8435, %then8434
  %5627 = phi i1 [ %5626, %else8435 ], [ true, %then8434 ]
  br i1 %5627, label %then8443, label %else8444

then8443:                                         ; preds = %continuation8433
  br label %continuation8442

else8444:                                         ; preds = %continuation8433
  %5628 = alloca i32, align 4
  %5629 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5630 = call i32 (ptr, ...) @scanf(ptr %5629, ptr %5628)
  %5631 = load i32, ptr %5628, align 4
  %5632 = icmp eq i32 %5631, 0
  br label %continuation8442

continuation8442:                                 ; preds = %else8444, %then8443
  %5633 = phi i1 [ %5632, %else8444 ], [ true, %then8443 ]
  br i1 %5633, label %then8452, label %else8453

then8452:                                         ; preds = %continuation8442
  br label %continuation8451

else8453:                                         ; preds = %continuation8442
  %5634 = alloca i32, align 4
  %5635 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5636 = call i32 (ptr, ...) @scanf(ptr %5635, ptr %5634)
  %5637 = load i32, ptr %5634, align 4
  %5638 = icmp eq i32 %5637, 0
  br label %continuation8451

continuation8451:                                 ; preds = %else8453, %then8452
  %5639 = phi i1 [ %5638, %else8453 ], [ true, %then8452 ]
  br i1 %5639, label %then8461, label %else8462

then8461:                                         ; preds = %continuation8451
  br label %continuation8460

else8462:                                         ; preds = %continuation8451
  %5640 = alloca i32, align 4
  %5641 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5642 = call i32 (ptr, ...) @scanf(ptr %5641, ptr %5640)
  %5643 = load i32, ptr %5640, align 4
  %5644 = icmp eq i32 %5643, 0
  br label %continuation8460

continuation8460:                                 ; preds = %else8462, %then8461
  %5645 = phi i1 [ %5644, %else8462 ], [ true, %then8461 ]
  br i1 %5645, label %then8470, label %else8471

then8470:                                         ; preds = %continuation8460
  br label %continuation8469

else8471:                                         ; preds = %continuation8460
  %5646 = alloca i32, align 4
  %5647 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5648 = call i32 (ptr, ...) @scanf(ptr %5647, ptr %5646)
  %5649 = load i32, ptr %5646, align 4
  %5650 = icmp eq i32 %5649, 0
  br label %continuation8469

continuation8469:                                 ; preds = %else8471, %then8470
  %5651 = phi i1 [ %5650, %else8471 ], [ true, %then8470 ]
  br i1 %5651, label %then8479, label %else8480

then8479:                                         ; preds = %continuation8469
  br label %continuation8478

else8480:                                         ; preds = %continuation8469
  %5652 = alloca i32, align 4
  %5653 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5654 = call i32 (ptr, ...) @scanf(ptr %5653, ptr %5652)
  %5655 = load i32, ptr %5652, align 4
  %5656 = icmp eq i32 %5655, 0
  br label %continuation8478

continuation8478:                                 ; preds = %else8480, %then8479
  %5657 = phi i1 [ %5656, %else8480 ], [ true, %then8479 ]
  br i1 %5657, label %then8488, label %else8489

then8488:                                         ; preds = %continuation8478
  br label %continuation8487

else8489:                                         ; preds = %continuation8478
  %5658 = alloca i32, align 4
  %5659 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5660 = call i32 (ptr, ...) @scanf(ptr %5659, ptr %5658)
  %5661 = load i32, ptr %5658, align 4
  %5662 = icmp eq i32 %5661, 0
  br label %continuation8487

continuation8487:                                 ; preds = %else8489, %then8488
  %5663 = phi i1 [ %5662, %else8489 ], [ true, %then8488 ]
  br i1 %5663, label %then8497, label %else8498

then8497:                                         ; preds = %continuation8487
  br label %continuation8496

else8498:                                         ; preds = %continuation8487
  %5664 = alloca i32, align 4
  %5665 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5666 = call i32 (ptr, ...) @scanf(ptr %5665, ptr %5664)
  %5667 = load i32, ptr %5664, align 4
  %5668 = icmp eq i32 %5667, 0
  br label %continuation8496

continuation8496:                                 ; preds = %else8498, %then8497
  %5669 = phi i1 [ %5668, %else8498 ], [ true, %then8497 ]
  br i1 %5669, label %then8506, label %else8507

then8506:                                         ; preds = %continuation8496
  br label %continuation8505

else8507:                                         ; preds = %continuation8496
  %5670 = alloca i32, align 4
  %5671 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5672 = call i32 (ptr, ...) @scanf(ptr %5671, ptr %5670)
  %5673 = load i32, ptr %5670, align 4
  %5674 = icmp eq i32 %5673, 0
  br label %continuation8505

continuation8505:                                 ; preds = %else8507, %then8506
  %5675 = phi i1 [ %5674, %else8507 ], [ true, %then8506 ]
  br i1 %5675, label %then8515, label %else8516

then8515:                                         ; preds = %continuation8505
  br label %continuation8514

else8516:                                         ; preds = %continuation8505
  %5676 = alloca i32, align 4
  %5677 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5678 = call i32 (ptr, ...) @scanf(ptr %5677, ptr %5676)
  %5679 = load i32, ptr %5676, align 4
  %5680 = icmp eq i32 %5679, 0
  br label %continuation8514

continuation8514:                                 ; preds = %else8516, %then8515
  %5681 = phi i1 [ %5680, %else8516 ], [ true, %then8515 ]
  br i1 %5681, label %then8524, label %else8525

then8524:                                         ; preds = %continuation8514
  br label %continuation8523

else8525:                                         ; preds = %continuation8514
  %5682 = alloca i32, align 4
  %5683 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5684 = call i32 (ptr, ...) @scanf(ptr %5683, ptr %5682)
  %5685 = load i32, ptr %5682, align 4
  %5686 = icmp eq i32 %5685, 0
  br label %continuation8523

continuation8523:                                 ; preds = %else8525, %then8524
  %5687 = phi i1 [ %5686, %else8525 ], [ true, %then8524 ]
  br i1 %5687, label %then8533, label %else8534

then8533:                                         ; preds = %continuation8523
  br label %continuation8532

else8534:                                         ; preds = %continuation8523
  %5688 = alloca i32, align 4
  %5689 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5690 = call i32 (ptr, ...) @scanf(ptr %5689, ptr %5688)
  %5691 = load i32, ptr %5688, align 4
  %5692 = icmp eq i32 %5691, 0
  br label %continuation8532

continuation8532:                                 ; preds = %else8534, %then8533
  %5693 = phi i1 [ %5692, %else8534 ], [ true, %then8533 ]
  br i1 %5693, label %then8542, label %else8543

then8542:                                         ; preds = %continuation8532
  br label %continuation8541

else8543:                                         ; preds = %continuation8532
  %5694 = alloca i32, align 4
  %5695 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5696 = call i32 (ptr, ...) @scanf(ptr %5695, ptr %5694)
  %5697 = load i32, ptr %5694, align 4
  %5698 = icmp eq i32 %5697, 0
  br label %continuation8541

continuation8541:                                 ; preds = %else8543, %then8542
  %5699 = phi i1 [ %5698, %else8543 ], [ true, %then8542 ]
  br i1 %5699, label %then8551, label %else8552

then8551:                                         ; preds = %continuation8541
  br label %continuation8550

else8552:                                         ; preds = %continuation8541
  %5700 = alloca i32, align 4
  %5701 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5702 = call i32 (ptr, ...) @scanf(ptr %5701, ptr %5700)
  %5703 = load i32, ptr %5700, align 4
  %5704 = icmp eq i32 %5703, 0
  br label %continuation8550

continuation8550:                                 ; preds = %else8552, %then8551
  %5705 = phi i1 [ %5704, %else8552 ], [ true, %then8551 ]
  br i1 %5705, label %then8560, label %else8561

then8560:                                         ; preds = %continuation8550
  br label %continuation8559

else8561:                                         ; preds = %continuation8550
  %5706 = alloca i32, align 4
  %5707 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5708 = call i32 (ptr, ...) @scanf(ptr %5707, ptr %5706)
  %5709 = load i32, ptr %5706, align 4
  %5710 = icmp eq i32 %5709, 0
  br label %continuation8559

continuation8559:                                 ; preds = %else8561, %then8560
  %5711 = phi i1 [ %5710, %else8561 ], [ true, %then8560 ]
  br i1 %5711, label %then8569, label %else8570

then8569:                                         ; preds = %continuation8559
  br label %continuation8568

else8570:                                         ; preds = %continuation8559
  %5712 = alloca i32, align 4
  %5713 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5714 = call i32 (ptr, ...) @scanf(ptr %5713, ptr %5712)
  %5715 = load i32, ptr %5712, align 4
  %5716 = icmp eq i32 %5715, 0
  br label %continuation8568

continuation8568:                                 ; preds = %else8570, %then8569
  %5717 = phi i1 [ %5716, %else8570 ], [ true, %then8569 ]
  br i1 %5717, label %then8578, label %else8579

then8578:                                         ; preds = %continuation8568
  br label %continuation8577

else8579:                                         ; preds = %continuation8568
  %5718 = alloca i32, align 4
  %5719 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5720 = call i32 (ptr, ...) @scanf(ptr %5719, ptr %5718)
  %5721 = load i32, ptr %5718, align 4
  %5722 = icmp eq i32 %5721, 0
  br label %continuation8577

continuation8577:                                 ; preds = %else8579, %then8578
  %5723 = phi i1 [ %5722, %else8579 ], [ true, %then8578 ]
  br i1 %5723, label %then8587, label %else8588

then8587:                                         ; preds = %continuation8577
  br label %continuation8586

else8588:                                         ; preds = %continuation8577
  %5724 = alloca i32, align 4
  %5725 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5726 = call i32 (ptr, ...) @scanf(ptr %5725, ptr %5724)
  %5727 = load i32, ptr %5724, align 4
  %5728 = icmp eq i32 %5727, 0
  br label %continuation8586

continuation8586:                                 ; preds = %else8588, %then8587
  %5729 = phi i1 [ %5728, %else8588 ], [ true, %then8587 ]
  br i1 %5729, label %then8596, label %else8597

then8596:                                         ; preds = %continuation8586
  br label %continuation8595

else8597:                                         ; preds = %continuation8586
  %5730 = alloca i32, align 4
  %5731 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5732 = call i32 (ptr, ...) @scanf(ptr %5731, ptr %5730)
  %5733 = load i32, ptr %5730, align 4
  %5734 = icmp eq i32 %5733, 0
  br label %continuation8595

continuation8595:                                 ; preds = %else8597, %then8596
  %5735 = phi i1 [ %5734, %else8597 ], [ true, %then8596 ]
  br i1 %5735, label %then8605, label %else8606

then8605:                                         ; preds = %continuation8595
  br label %continuation8604

else8606:                                         ; preds = %continuation8595
  %5736 = alloca i32, align 4
  %5737 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5738 = call i32 (ptr, ...) @scanf(ptr %5737, ptr %5736)
  %5739 = load i32, ptr %5736, align 4
  %5740 = icmp eq i32 %5739, 0
  br label %continuation8604

continuation8604:                                 ; preds = %else8606, %then8605
  %5741 = phi i1 [ %5740, %else8606 ], [ true, %then8605 ]
  br i1 %5741, label %then8614, label %else8615

then8614:                                         ; preds = %continuation8604
  br label %continuation8613

else8615:                                         ; preds = %continuation8604
  %5742 = alloca i32, align 4
  %5743 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5744 = call i32 (ptr, ...) @scanf(ptr %5743, ptr %5742)
  %5745 = load i32, ptr %5742, align 4
  %5746 = icmp eq i32 %5745, 0
  br label %continuation8613

continuation8613:                                 ; preds = %else8615, %then8614
  %5747 = phi i1 [ %5746, %else8615 ], [ true, %then8614 ]
  br i1 %5747, label %then8623, label %else8624

then8623:                                         ; preds = %continuation8613
  br label %continuation8622

else8624:                                         ; preds = %continuation8613
  %5748 = alloca i32, align 4
  %5749 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5750 = call i32 (ptr, ...) @scanf(ptr %5749, ptr %5748)
  %5751 = load i32, ptr %5748, align 4
  %5752 = icmp eq i32 %5751, 0
  br label %continuation8622

continuation8622:                                 ; preds = %else8624, %then8623
  %5753 = phi i1 [ %5752, %else8624 ], [ true, %then8623 ]
  br i1 %5753, label %then8632, label %else8633

then8632:                                         ; preds = %continuation8622
  br label %continuation8631

else8633:                                         ; preds = %continuation8622
  %5754 = alloca i32, align 4
  %5755 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5756 = call i32 (ptr, ...) @scanf(ptr %5755, ptr %5754)
  %5757 = load i32, ptr %5754, align 4
  %5758 = icmp eq i32 %5757, 0
  br label %continuation8631

continuation8631:                                 ; preds = %else8633, %then8632
  %5759 = phi i1 [ %5758, %else8633 ], [ true, %then8632 ]
  br i1 %5759, label %then8641, label %else8642

then8641:                                         ; preds = %continuation8631
  br label %continuation8640

else8642:                                         ; preds = %continuation8631
  %5760 = alloca i32, align 4
  %5761 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5762 = call i32 (ptr, ...) @scanf(ptr %5761, ptr %5760)
  %5763 = load i32, ptr %5760, align 4
  %5764 = icmp eq i32 %5763, 0
  br label %continuation8640

continuation8640:                                 ; preds = %else8642, %then8641
  %5765 = phi i1 [ %5764, %else8642 ], [ true, %then8641 ]
  br i1 %5765, label %then8650, label %else8651

then8650:                                         ; preds = %continuation8640
  br label %continuation8649

else8651:                                         ; preds = %continuation8640
  %5766 = alloca i32, align 4
  %5767 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5768 = call i32 (ptr, ...) @scanf(ptr %5767, ptr %5766)
  %5769 = load i32, ptr %5766, align 4
  %5770 = icmp eq i32 %5769, 0
  br label %continuation8649

continuation8649:                                 ; preds = %else8651, %then8650
  %5771 = phi i1 [ %5770, %else8651 ], [ true, %then8650 ]
  br i1 %5771, label %then8659, label %else8660

then8659:                                         ; preds = %continuation8649
  br label %continuation8658

else8660:                                         ; preds = %continuation8649
  %5772 = alloca i32, align 4
  %5773 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5774 = call i32 (ptr, ...) @scanf(ptr %5773, ptr %5772)
  %5775 = load i32, ptr %5772, align 4
  %5776 = icmp eq i32 %5775, 0
  br label %continuation8658

continuation8658:                                 ; preds = %else8660, %then8659
  %5777 = phi i1 [ %5776, %else8660 ], [ true, %then8659 ]
  br i1 %5777, label %then8668, label %else8669

then8668:                                         ; preds = %continuation8658
  br label %continuation8667

else8669:                                         ; preds = %continuation8658
  %5778 = alloca i32, align 4
  %5779 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5780 = call i32 (ptr, ...) @scanf(ptr %5779, ptr %5778)
  %5781 = load i32, ptr %5778, align 4
  %5782 = icmp eq i32 %5781, 0
  br label %continuation8667

continuation8667:                                 ; preds = %else8669, %then8668
  %5783 = phi i1 [ %5782, %else8669 ], [ true, %then8668 ]
  br i1 %5783, label %then8677, label %else8678

then8677:                                         ; preds = %continuation8667
  br label %continuation8676

else8678:                                         ; preds = %continuation8667
  %5784 = alloca i32, align 4
  %5785 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5786 = call i32 (ptr, ...) @scanf(ptr %5785, ptr %5784)
  %5787 = load i32, ptr %5784, align 4
  %5788 = icmp eq i32 %5787, 0
  br label %continuation8676

continuation8676:                                 ; preds = %else8678, %then8677
  %5789 = phi i1 [ %5788, %else8678 ], [ true, %then8677 ]
  br i1 %5789, label %then8686, label %else8687

then8686:                                         ; preds = %continuation8676
  br label %continuation8685

else8687:                                         ; preds = %continuation8676
  %5790 = alloca i32, align 4
  %5791 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5792 = call i32 (ptr, ...) @scanf(ptr %5791, ptr %5790)
  %5793 = load i32, ptr %5790, align 4
  %5794 = icmp eq i32 %5793, 0
  br label %continuation8685

continuation8685:                                 ; preds = %else8687, %then8686
  %5795 = phi i1 [ %5794, %else8687 ], [ true, %then8686 ]
  br i1 %5795, label %then8695, label %else8696

then8695:                                         ; preds = %continuation8685
  br label %continuation8694

else8696:                                         ; preds = %continuation8685
  %5796 = alloca i32, align 4
  %5797 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5798 = call i32 (ptr, ...) @scanf(ptr %5797, ptr %5796)
  %5799 = load i32, ptr %5796, align 4
  %5800 = icmp eq i32 %5799, 0
  br label %continuation8694

continuation8694:                                 ; preds = %else8696, %then8695
  %5801 = phi i1 [ %5800, %else8696 ], [ true, %then8695 ]
  br i1 %5801, label %then8704, label %else8705

then8704:                                         ; preds = %continuation8694
  br label %continuation8703

else8705:                                         ; preds = %continuation8694
  %5802 = alloca i32, align 4
  %5803 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5804 = call i32 (ptr, ...) @scanf(ptr %5803, ptr %5802)
  %5805 = load i32, ptr %5802, align 4
  %5806 = icmp eq i32 %5805, 0
  br label %continuation8703

continuation8703:                                 ; preds = %else8705, %then8704
  %5807 = phi i1 [ %5806, %else8705 ], [ true, %then8704 ]
  br i1 %5807, label %then8713, label %else8714

then8713:                                         ; preds = %continuation8703
  br label %continuation8712

else8714:                                         ; preds = %continuation8703
  %5808 = alloca i32, align 4
  %5809 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5810 = call i32 (ptr, ...) @scanf(ptr %5809, ptr %5808)
  %5811 = load i32, ptr %5808, align 4
  %5812 = icmp eq i32 %5811, 0
  br label %continuation8712

continuation8712:                                 ; preds = %else8714, %then8713
  %5813 = phi i1 [ %5812, %else8714 ], [ true, %then8713 ]
  br i1 %5813, label %then8722, label %else8723

then8722:                                         ; preds = %continuation8712
  br label %continuation8721

else8723:                                         ; preds = %continuation8712
  %5814 = alloca i32, align 4
  %5815 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5816 = call i32 (ptr, ...) @scanf(ptr %5815, ptr %5814)
  %5817 = load i32, ptr %5814, align 4
  %5818 = icmp eq i32 %5817, 0
  br label %continuation8721

continuation8721:                                 ; preds = %else8723, %then8722
  %5819 = phi i1 [ %5818, %else8723 ], [ true, %then8722 ]
  br i1 %5819, label %then8731, label %else8732

then8731:                                         ; preds = %continuation8721
  br label %continuation8730

else8732:                                         ; preds = %continuation8721
  %5820 = alloca i32, align 4
  %5821 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5822 = call i32 (ptr, ...) @scanf(ptr %5821, ptr %5820)
  %5823 = load i32, ptr %5820, align 4
  %5824 = icmp eq i32 %5823, 0
  br label %continuation8730

continuation8730:                                 ; preds = %else8732, %then8731
  %5825 = phi i1 [ %5824, %else8732 ], [ true, %then8731 ]
  br i1 %5825, label %then8740, label %else8741

then8740:                                         ; preds = %continuation8730
  br label %continuation8739

else8741:                                         ; preds = %continuation8730
  %5826 = alloca i32, align 4
  %5827 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5828 = call i32 (ptr, ...) @scanf(ptr %5827, ptr %5826)
  %5829 = load i32, ptr %5826, align 4
  %5830 = icmp eq i32 %5829, 0
  br label %continuation8739

continuation8739:                                 ; preds = %else8741, %then8740
  %5831 = phi i1 [ %5830, %else8741 ], [ true, %then8740 ]
  br i1 %5831, label %then8749, label %else8750

then8749:                                         ; preds = %continuation8739
  br label %continuation8748

else8750:                                         ; preds = %continuation8739
  %5832 = alloca i32, align 4
  %5833 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5834 = call i32 (ptr, ...) @scanf(ptr %5833, ptr %5832)
  %5835 = load i32, ptr %5832, align 4
  %5836 = icmp eq i32 %5835, 0
  br label %continuation8748

continuation8748:                                 ; preds = %else8750, %then8749
  %5837 = phi i1 [ %5836, %else8750 ], [ true, %then8749 ]
  br i1 %5837, label %then8758, label %else8759

then8758:                                         ; preds = %continuation8748
  br label %continuation8757

else8759:                                         ; preds = %continuation8748
  %5838 = alloca i32, align 4
  %5839 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5840 = call i32 (ptr, ...) @scanf(ptr %5839, ptr %5838)
  %5841 = load i32, ptr %5838, align 4
  %5842 = icmp eq i32 %5841, 0
  br label %continuation8757

continuation8757:                                 ; preds = %else8759, %then8758
  %5843 = phi i1 [ %5842, %else8759 ], [ true, %then8758 ]
  br i1 %5843, label %then8767, label %else8768

then8767:                                         ; preds = %continuation8757
  br label %continuation8766

else8768:                                         ; preds = %continuation8757
  %5844 = alloca i32, align 4
  %5845 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5846 = call i32 (ptr, ...) @scanf(ptr %5845, ptr %5844)
  %5847 = load i32, ptr %5844, align 4
  %5848 = icmp eq i32 %5847, 0
  br label %continuation8766

continuation8766:                                 ; preds = %else8768, %then8767
  %5849 = phi i1 [ %5848, %else8768 ], [ true, %then8767 ]
  br i1 %5849, label %then8776, label %else8777

then8776:                                         ; preds = %continuation8766
  br label %continuation8775

else8777:                                         ; preds = %continuation8766
  %5850 = alloca i32, align 4
  %5851 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5852 = call i32 (ptr, ...) @scanf(ptr %5851, ptr %5850)
  %5853 = load i32, ptr %5850, align 4
  %5854 = icmp eq i32 %5853, 0
  br label %continuation8775

continuation8775:                                 ; preds = %else8777, %then8776
  %5855 = phi i1 [ %5854, %else8777 ], [ true, %then8776 ]
  br i1 %5855, label %then8785, label %else8786

then8785:                                         ; preds = %continuation8775
  br label %continuation8784

else8786:                                         ; preds = %continuation8775
  %5856 = alloca i32, align 4
  %5857 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5858 = call i32 (ptr, ...) @scanf(ptr %5857, ptr %5856)
  %5859 = load i32, ptr %5856, align 4
  %5860 = icmp eq i32 %5859, 0
  br label %continuation8784

continuation8784:                                 ; preds = %else8786, %then8785
  %5861 = phi i1 [ %5860, %else8786 ], [ true, %then8785 ]
  br i1 %5861, label %then8794, label %else8795

then8794:                                         ; preds = %continuation8784
  br label %continuation8793

else8795:                                         ; preds = %continuation8784
  %5862 = alloca i32, align 4
  %5863 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5864 = call i32 (ptr, ...) @scanf(ptr %5863, ptr %5862)
  %5865 = load i32, ptr %5862, align 4
  %5866 = icmp eq i32 %5865, 0
  br label %continuation8793

continuation8793:                                 ; preds = %else8795, %then8794
  %5867 = phi i1 [ %5866, %else8795 ], [ true, %then8794 ]
  br i1 %5867, label %then8803, label %else8804

then8803:                                         ; preds = %continuation8793
  br label %continuation8802

else8804:                                         ; preds = %continuation8793
  %5868 = alloca i32, align 4
  %5869 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5870 = call i32 (ptr, ...) @scanf(ptr %5869, ptr %5868)
  %5871 = load i32, ptr %5868, align 4
  %5872 = icmp eq i32 %5871, 0
  br label %continuation8802

continuation8802:                                 ; preds = %else8804, %then8803
  %5873 = phi i1 [ %5872, %else8804 ], [ true, %then8803 ]
  br i1 %5873, label %then8812, label %else8813

then8812:                                         ; preds = %continuation8802
  br label %continuation8811

else8813:                                         ; preds = %continuation8802
  %5874 = alloca i32, align 4
  %5875 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5876 = call i32 (ptr, ...) @scanf(ptr %5875, ptr %5874)
  %5877 = load i32, ptr %5874, align 4
  %5878 = icmp eq i32 %5877, 0
  br label %continuation8811

continuation8811:                                 ; preds = %else8813, %then8812
  %5879 = phi i1 [ %5878, %else8813 ], [ true, %then8812 ]
  br i1 %5879, label %then8821, label %else8822

then8821:                                         ; preds = %continuation8811
  br label %continuation8820

else8822:                                         ; preds = %continuation8811
  %5880 = alloca i32, align 4
  %5881 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5882 = call i32 (ptr, ...) @scanf(ptr %5881, ptr %5880)
  %5883 = load i32, ptr %5880, align 4
  %5884 = icmp eq i32 %5883, 0
  br label %continuation8820

continuation8820:                                 ; preds = %else8822, %then8821
  %5885 = phi i1 [ %5884, %else8822 ], [ true, %then8821 ]
  br i1 %5885, label %then8830, label %else8831

then8830:                                         ; preds = %continuation8820
  br label %continuation8829

else8831:                                         ; preds = %continuation8820
  %5886 = alloca i32, align 4
  %5887 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5888 = call i32 (ptr, ...) @scanf(ptr %5887, ptr %5886)
  %5889 = load i32, ptr %5886, align 4
  %5890 = icmp eq i32 %5889, 0
  br label %continuation8829

continuation8829:                                 ; preds = %else8831, %then8830
  %5891 = phi i1 [ %5890, %else8831 ], [ true, %then8830 ]
  br i1 %5891, label %then8839, label %else8840

then8839:                                         ; preds = %continuation8829
  br label %continuation8838

else8840:                                         ; preds = %continuation8829
  %5892 = alloca i32, align 4
  %5893 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5894 = call i32 (ptr, ...) @scanf(ptr %5893, ptr %5892)
  %5895 = load i32, ptr %5892, align 4
  %5896 = icmp eq i32 %5895, 0
  br label %continuation8838

continuation8838:                                 ; preds = %else8840, %then8839
  %5897 = phi i1 [ %5896, %else8840 ], [ true, %then8839 ]
  br i1 %5897, label %then8848, label %else8849

then8848:                                         ; preds = %continuation8838
  br label %continuation8847

else8849:                                         ; preds = %continuation8838
  %5898 = alloca i32, align 4
  %5899 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5900 = call i32 (ptr, ...) @scanf(ptr %5899, ptr %5898)
  %5901 = load i32, ptr %5898, align 4
  %5902 = icmp eq i32 %5901, 0
  br label %continuation8847

continuation8847:                                 ; preds = %else8849, %then8848
  %5903 = phi i1 [ %5902, %else8849 ], [ true, %then8848 ]
  br i1 %5903, label %then8857, label %else8858

then8857:                                         ; preds = %continuation8847
  br label %continuation8856

else8858:                                         ; preds = %continuation8847
  %5904 = alloca i32, align 4
  %5905 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5906 = call i32 (ptr, ...) @scanf(ptr %5905, ptr %5904)
  %5907 = load i32, ptr %5904, align 4
  %5908 = icmp eq i32 %5907, 0
  br label %continuation8856

continuation8856:                                 ; preds = %else8858, %then8857
  %5909 = phi i1 [ %5908, %else8858 ], [ true, %then8857 ]
  br i1 %5909, label %then8866, label %else8867

then8866:                                         ; preds = %continuation8856
  br label %continuation8865

else8867:                                         ; preds = %continuation8856
  %5910 = alloca i32, align 4
  %5911 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5912 = call i32 (ptr, ...) @scanf(ptr %5911, ptr %5910)
  %5913 = load i32, ptr %5910, align 4
  %5914 = icmp eq i32 %5913, 0
  br label %continuation8865

continuation8865:                                 ; preds = %else8867, %then8866
  %5915 = phi i1 [ %5914, %else8867 ], [ true, %then8866 ]
  br i1 %5915, label %then8875, label %else8876

then8875:                                         ; preds = %continuation8865
  br label %continuation8874

else8876:                                         ; preds = %continuation8865
  %5916 = alloca i32, align 4
  %5917 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5918 = call i32 (ptr, ...) @scanf(ptr %5917, ptr %5916)
  %5919 = load i32, ptr %5916, align 4
  %5920 = icmp eq i32 %5919, 0
  br label %continuation8874

continuation8874:                                 ; preds = %else8876, %then8875
  %5921 = phi i1 [ %5920, %else8876 ], [ true, %then8875 ]
  br i1 %5921, label %then8884, label %else8885

then8884:                                         ; preds = %continuation8874
  br label %continuation8883

else8885:                                         ; preds = %continuation8874
  %5922 = alloca i32, align 4
  %5923 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5924 = call i32 (ptr, ...) @scanf(ptr %5923, ptr %5922)
  %5925 = load i32, ptr %5922, align 4
  %5926 = icmp eq i32 %5925, 0
  br label %continuation8883

continuation8883:                                 ; preds = %else8885, %then8884
  %5927 = phi i1 [ %5926, %else8885 ], [ true, %then8884 ]
  br i1 %5927, label %then8893, label %else8894

then8893:                                         ; preds = %continuation8883
  br label %continuation8892

else8894:                                         ; preds = %continuation8883
  %5928 = alloca i32, align 4
  %5929 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5930 = call i32 (ptr, ...) @scanf(ptr %5929, ptr %5928)
  %5931 = load i32, ptr %5928, align 4
  %5932 = icmp eq i32 %5931, 0
  br label %continuation8892

continuation8892:                                 ; preds = %else8894, %then8893
  %5933 = phi i1 [ %5932, %else8894 ], [ true, %then8893 ]
  br i1 %5933, label %then8902, label %else8903

then8902:                                         ; preds = %continuation8892
  br label %continuation8901

else8903:                                         ; preds = %continuation8892
  %5934 = alloca i32, align 4
  %5935 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5936 = call i32 (ptr, ...) @scanf(ptr %5935, ptr %5934)
  %5937 = load i32, ptr %5934, align 4
  %5938 = icmp eq i32 %5937, 0
  br label %continuation8901

continuation8901:                                 ; preds = %else8903, %then8902
  %5939 = phi i1 [ %5938, %else8903 ], [ true, %then8902 ]
  br i1 %5939, label %then8911, label %else8912

then8911:                                         ; preds = %continuation8901
  br label %continuation8910

else8912:                                         ; preds = %continuation8901
  %5940 = alloca i32, align 4
  %5941 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5942 = call i32 (ptr, ...) @scanf(ptr %5941, ptr %5940)
  %5943 = load i32, ptr %5940, align 4
  %5944 = icmp eq i32 %5943, 0
  br label %continuation8910

continuation8910:                                 ; preds = %else8912, %then8911
  %5945 = phi i1 [ %5944, %else8912 ], [ true, %then8911 ]
  br i1 %5945, label %then8920, label %else8921

then8920:                                         ; preds = %continuation8910
  br label %continuation8919

else8921:                                         ; preds = %continuation8910
  %5946 = alloca i32, align 4
  %5947 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5948 = call i32 (ptr, ...) @scanf(ptr %5947, ptr %5946)
  %5949 = load i32, ptr %5946, align 4
  %5950 = icmp eq i32 %5949, 0
  br label %continuation8919

continuation8919:                                 ; preds = %else8921, %then8920
  %5951 = phi i1 [ %5950, %else8921 ], [ true, %then8920 ]
  br i1 %5951, label %then8929, label %else8930

then8929:                                         ; preds = %continuation8919
  br label %continuation8928

else8930:                                         ; preds = %continuation8919
  %5952 = alloca i32, align 4
  %5953 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5954 = call i32 (ptr, ...) @scanf(ptr %5953, ptr %5952)
  %5955 = load i32, ptr %5952, align 4
  %5956 = icmp eq i32 %5955, 0
  br label %continuation8928

continuation8928:                                 ; preds = %else8930, %then8929
  %5957 = phi i1 [ %5956, %else8930 ], [ true, %then8929 ]
  br i1 %5957, label %then8938, label %else8939

then8938:                                         ; preds = %continuation8928
  br label %continuation8937

else8939:                                         ; preds = %continuation8928
  %5958 = alloca i32, align 4
  %5959 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5960 = call i32 (ptr, ...) @scanf(ptr %5959, ptr %5958)
  %5961 = load i32, ptr %5958, align 4
  %5962 = icmp eq i32 %5961, 0
  br label %continuation8937

continuation8937:                                 ; preds = %else8939, %then8938
  %5963 = phi i1 [ %5962, %else8939 ], [ true, %then8938 ]
  br i1 %5963, label %then8947, label %else8948

then8947:                                         ; preds = %continuation8937
  br label %continuation8946

else8948:                                         ; preds = %continuation8937
  %5964 = alloca i32, align 4
  %5965 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5966 = call i32 (ptr, ...) @scanf(ptr %5965, ptr %5964)
  %5967 = load i32, ptr %5964, align 4
  %5968 = icmp eq i32 %5967, 0
  br label %continuation8946

continuation8946:                                 ; preds = %else8948, %then8947
  %5969 = phi i1 [ %5968, %else8948 ], [ true, %then8947 ]
  br i1 %5969, label %then8956, label %else8957

then8956:                                         ; preds = %continuation8946
  br label %continuation8955

else8957:                                         ; preds = %continuation8946
  %5970 = alloca i32, align 4
  %5971 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5972 = call i32 (ptr, ...) @scanf(ptr %5971, ptr %5970)
  %5973 = load i32, ptr %5970, align 4
  %5974 = icmp eq i32 %5973, 0
  br label %continuation8955

continuation8955:                                 ; preds = %else8957, %then8956
  %5975 = phi i1 [ %5974, %else8957 ], [ true, %then8956 ]
  br i1 %5975, label %then8965, label %else8966

then8965:                                         ; preds = %continuation8955
  br label %continuation8964

else8966:                                         ; preds = %continuation8955
  %5976 = alloca i32, align 4
  %5977 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5978 = call i32 (ptr, ...) @scanf(ptr %5977, ptr %5976)
  %5979 = load i32, ptr %5976, align 4
  %5980 = icmp eq i32 %5979, 0
  br label %continuation8964

continuation8964:                                 ; preds = %else8966, %then8965
  %5981 = phi i1 [ %5980, %else8966 ], [ true, %then8965 ]
  br i1 %5981, label %then8974, label %else8975

then8974:                                         ; preds = %continuation8964
  br label %continuation8973

else8975:                                         ; preds = %continuation8964
  %5982 = alloca i32, align 4
  %5983 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5984 = call i32 (ptr, ...) @scanf(ptr %5983, ptr %5982)
  %5985 = load i32, ptr %5982, align 4
  %5986 = icmp eq i32 %5985, 0
  br label %continuation8973

continuation8973:                                 ; preds = %else8975, %then8974
  %5987 = phi i1 [ %5986, %else8975 ], [ true, %then8974 ]
  br i1 %5987, label %then8983, label %else8984

then8983:                                         ; preds = %continuation8973
  br label %continuation8982

else8984:                                         ; preds = %continuation8973
  %5988 = alloca i32, align 4
  %5989 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5990 = call i32 (ptr, ...) @scanf(ptr %5989, ptr %5988)
  %5991 = load i32, ptr %5988, align 4
  %5992 = icmp eq i32 %5991, 0
  br label %continuation8982

continuation8982:                                 ; preds = %else8984, %then8983
  %5993 = phi i1 [ %5992, %else8984 ], [ true, %then8983 ]
  br i1 %5993, label %then8992, label %else8993

then8992:                                         ; preds = %continuation8982
  br label %continuation8991

else8993:                                         ; preds = %continuation8982
  %5994 = alloca i32, align 4
  %5995 = getelementptr [4 x i8], ptr @scanf_integer_format, i32 0, i32 0
  %5996 = call i32 (ptr, ...) @scanf(ptr %5995, ptr %5994)
  %5997 = load i32, ptr %5994, align 4
  %5998 = icmp eq i32 %5997, 0
  br label %continuation8991

continuation8991:                                 ; preds = %else8993, %then8992
  %5999 = phi i1 [ %5998, %else8993 ], [ true, %then8992 ]
  br i1 %5999, label %then9001, label %else9002

then9001:                                         ; preds = %continuation8991
  %6000 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6001 = call i32 (ptr, ...) @printf(ptr %6000, i32 1)
  br label %continuation9000

else9002:                                         ; preds = %continuation8991
  %6002 = getelementptr [4 x i8], ptr @printf_integer_format, i32 0, i32 0
  %6003 = call i32 (ptr, ...) @printf(ptr %6002, i32 0)
  br label %continuation9000

continuation9000:                                 ; preds = %else9002, %then9001
  br label %exit

exit:                                             ; preds = %continuation9000
  ret i32 0
}

attributes #0 = { nounwind }
