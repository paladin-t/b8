## Why BASIC8?

There are several fantasy computers/consoles coming up these days, it is possible to program, play and share games and other programs in a retro fashion again. And BASIC8 embraces modern standard to be a simple yet efficient tool.

BASIC8 is different from existing fantasy computers. It's designed by thinking of three aspects: how it looks and sounds, how it works, and how it speaks to a human. I'm not willing to make everything strictly retro, instead I prefer to make it retro at appearance, simple to work with, and fun to play with. I hope BASIC8 brings the fun back, as straightforward coding and playing after a home computer bootup.

### BASIC rather than Lua

Lua is nice, it fits well in particular fields, so do other programming languages. BASIC8 offers both retro BASIC syntax, and modern concepts. You would find BASIC8 easy to learn regardless you are experienced with programming or not. Overall it's great to introduce BASIC to the fantasy computer genre!

### No RAM, VRAM or ROM mapping

Most of the other fantasy computers manage memory in static layouts, where you can access its content by "PEEK" and "POKE"; or even directly map from ROM to runtime space. It makes simple for loading, but brings an extra abstraction layer of particular (virtual) hardware. I'd prefer to be able to do everything in a generic way, not go so far as programming with puzzle-like address.

### 160x128 display

It's a reasonable resolution because:

* Neither too small to represent sufficient visuals
* Nor too big, or requires more work of contents to fill it
* Can make exact divisions by 8, 16, 32 at both dimensions, good for arranging graphics
* Is approximate to 4:3
* Is a common to see resolution of electronic display components

### GUI

PalmOS is a good model of stylus based GUI. It is my favourite mobile OS. I make the GUI of BASIC8 with an ideal combination of PalmOS, AmigaOS, and a part of my own idea. The goal is to make it possible to do most of the operations (except for coding) by mouse/touch; moreover to make it friendly to modern touch screens.

### BASIC8 vs. open source engines

The major difference is, open source graphics libraries and engines come with none or few limitation or toolchain, for deep customization. BASIC8 and other fantasy computers have limitations and a number of built-in editors, that makes it possible focusing on what we want to express, other than thinking about how to build fundamental facilities from zero. Besides, you'll find it easier to communicate and share with others with the same specifications.

### BASIC8 vs. Unity3D

I've used Unity3D and Unreal for work. Quite differently BASIC8 was not intending and would never be giant. It's just something meaningful that I can keep iterating and polishing for long.
