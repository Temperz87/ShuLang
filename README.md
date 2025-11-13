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

`value ::= identifier`

RCO shall treat function calls (right now only `print` and `read_input`) as complex values. 
