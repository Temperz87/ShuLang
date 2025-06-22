# ShuLang
This langauge is in part being made to garner skills that I currently don't have (e.g. LLVM and C++), and in part for fun. I intend for this langauge to be as close to English as possible, while also taking heavy inspiration from the STLC. The "as close to english" should be appearant when you see variable like:

```
bind x to 5
```

Programmers are all to familiar with the common `x = 5` syntax, and instead of reinventing the wheel I intend to shatter and create it from the ground up. You'll also notice that there are s-expressions, which will probably be a pain to compile, however they are here because I am functional programming pilled.

I intend for this compiler to have at the minimum 5 Acts, which will be loosely based on the [book we used in the IU compiler class](https://github.com/IUCompilerCourse/Essentials-of-Compilation). Between each Act I'll maybe have an intermission where I'll either do something cool or talk about how I need to refactor things. Of course the compiler is in C++ and not Python/Racket which will provide many differences, and a lot of the features aren't translatable one to one into ShuLang, but I still think this approach will be better than doing everything at once.

This language is using a recursive descent parser and tokenization is pretty much just a linear scan of a file.

If you want a timeline of whats going on, one can be find in [timeline.md](timeline.md). Here's what I'm currently working on.

## INTERMISSION: General cleanup and making pointers smart
I used zero smart pointers so now I have to go back and decide on how ownership should work. I also want to create some .cpp files for my .hpp stuff, and get rid of todo's. There's also some errors when I compile which can't be good, so those need to be gotten rid of.

I also want to implement multiplication and subtraction. This shouldn't be that bad but it seems really tedious as I'll need the corrsponding SIR nodes and what not.
