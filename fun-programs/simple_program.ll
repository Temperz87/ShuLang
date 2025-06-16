; ModuleID = 'Module'
source_filename = "simple_program.sl"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %x.0 = alloca i32, align 4
  store i32 5, ptr %x.0, align 4
  %x.01 = load i32, ptr %x.0, align 4
  %0 = call i32 (ptr, ...) @printf(ptr @printf_integer_format, i32 %x.01)
  ret i32 0
}
