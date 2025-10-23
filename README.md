# ShuLang
This langauge is in part being made to garner skills that I currently don't have (e.g. LLVM and C++), and in part for fun. I intend for this langauge to be as close to English as possible, while also taking heavy inspiration from the STLC. The "as close to english" should be appearant when you see variable like:

```
bind x to 5
```

Programmers are all to familiar with the common `x = 5` syntax, and instead of reinventing the wheel I intend to shatter and create it from the ground up. You'll also notice that there are s-expressions, which will probably be a pain to compile, however they are here because I am functional programming pilled.

I intend for this compiler to have at the minimum 5 Acts, which will be loosely based on the [book we used in the IU compiler class](https://github.com/IUCompilerCourse/Essentials-of-Compilation). Between each Act I'll maybe have an intermission where I'll either do something cool or talk about how I need to refactor things. Of course the compiler is in C++ and not Python/Racket which will provide many differences, and a lot of the features aren't translatable one to one into ShuLang, but I still think this approach will be better than doing everything at once.

This language is using a recursive descent parser and tokenization is pretty much just a linear scan of a file.

If you want to mess around with writing some ShuLang programs then clone the repository and run `make build` in `/src`. After that, you'll be given a `shuC` executable that you can use to compile programs!

If you want a timeline of what I've done and what's next, one can be find in [timeline.md](timeline.md). Here's what I'm currently working on:

## INTERMISSION: Waiting to be free from university...
Okay so basically university is starting and I gotta lock in (and also apply for jobs); meaning that I will not be focusing on ShuLang. Hence updates will slow down. What's next will be constant folding, constant propagation, dead code elmination, and compiling user input. 

I noticed that I wasn't testing the actual driver file itself, so I've changed the tester to do that when the `--regression` flag is passed. For regression tests all previous programs are run, and the tester will do a diff to make sure that nothing changed when it shouldn't.

I also found a bug corresponding with pseudo phi promotion that made loops not compile (kid named dataflow analysis), so I fixed that! I think theres only one thing left before I move on to optimizations, namely concerning the currently unoptimal promotion of pseudo phi nodes. I shall fix this by:
1. [Making all "defines" have a list that has their corresponding "uses"](https://en.wikipedia.org/wiki/Use-define_chain)
2. Use the result of these new "chains" to determine where phi nodes are live
3. Minimally place phi nodes where needed
