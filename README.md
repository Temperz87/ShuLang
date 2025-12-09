# ShuLang
This langauge is in part being made to garner skills that I currently don't have (e.g. LLVM and C++), and in part for fun. I intend for this langauge to be as close to English as possible, while also taking heavy inspiration from the STLC. The "as close to english" should be appearant when you see variable like:

```
bind x to 5
```

Programmers are all to familiar with the common `x = 5` syntax, and instead of reinventing the wheel I intend to shatter and create it from the ground up. You'll also notice that there are s-expressions, which will probably be a pain to compile, however they are here because I am functional programming pilled.

I intend for this compiler to have at the minimum 5 Acts, which will be loosely based on the [book we used in the IU compiler class](https://github.com/IUCompilerCourse/Essentials-of-Compilation). Between each Act I'll maybe have an intermission where I'll either do something cool or talk about how I need to refactor things. Of course the compiler is in C++ and not Python/Racket which will provide many differences, and a lot of the features aren't translatable one to one into ShuLang, but I still think this approach will be better than doing everything at once.

This language is using a recursive descent parser and tokenization is pretty much just a linear scan of a file.

If you want to mess around with writing some ShuLang programs then clone the repository and run `make build` in `/src`. After that, you'll be given a `shuc` executable that you can use to compile programs!

If you want a timeline of what I've done and what's next, one can be find in [timeline.md](timeline.md). Here's what I'm currently working on:

## Act 4: Optimizations
Constant folding, constant propagation, and dead code elimination. 

With all of the features currently in the language, we can constant fold EVERY program to just be "print thing". Hence before we start optimizing, it's time to add user input. This shouldn't be too hard on its own, so let's also add a little bit to this to start supporting functions. Now we can add function calls into ShuLang, but not have a way for users to define functions yet.

`statement ::= identifier()`

`value ::= identifier()`

We can now get rid of ShuLang's (not SIR's) print AST node in favor of function call nodes. Type checking will have to check arity as well as set argument type. RCO shall of course treat function calls (right now only `print` and `read_input`) as complex values. 

The parser was in such a bad state when it came to parsing precedence that when I tried parsing functions everything broke. Instead of doing "parse_term_hi" and "parse_term_low" nonsense I didn't understand, it now does [operator precedence climbing](https://en.wikipedia.org/wiki/Operator-precedence_parser#Precedence_climbing_method)!

Instruction selection is where things get interesting as `print` and `read_input` have a lot abstracted away. For example in C's `printf` (what ShuLang is levaraging for print nodes), a string containing the format of how to print a value is the first argument; however avid ShuLang users (all 0 of them) won't have to deal with this, because shuc will place it for them. To help out LLVM lowering, what we'll do is translate all calls to `print` to a `PrintNode` (which is what we did before), and similarly all calls to `read_input` to an `InputNode`. Notably `InputNode` is a value NOT an instruction, so we'll also place a definition and which gets bound to the result of `read_input` return a reference to said definition.

Lowering `PrintNode`'s hasn't changed, but for lowering `InputNode`'s we first create a global format ` %d` (note the space before the `%d`), then call [one of C's most unsafe functions `scanf`](https://sekrit.de/webdocs/c/beginners-guide-away-from-scanf.html). Technically this means that, at this moment, ShuLang is now an unsafe programming language! An alloca is needed to store the output of `scanf`, because it returns how many fields got scanned in not its input. With all of this mess, user input is now working!

