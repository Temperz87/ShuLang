; ModuleID = 'Module'
source_filename = "../test-cases/phase_1_programs/as_simple_as_it_gets.sl"

@printf_integer_format = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(ptr, ...)

define i32 @main() {
entry:
  %0 = call i32 (ptr, ...) @printf(ptr @printf_integer_format, i32 1)
  ret i32 0
}
