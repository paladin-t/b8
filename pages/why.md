## Why BASIC8?

There are several fantasy computers/consoles coming up these days, which make it possible to program, play and share games and other programs way retro again. Retro is new fashion! And BASIC8 embraces modern standard as a simple yet efficient tool.

BASIC8 is different from existing fantasy computers. It's designed from thinking about three aspects: how it looks and sounds, how it works, and how it speaks to a human. I'm not willing to make everything strictly retro, instead I prefer to make it retro at appearance, simple to work with, and fun to play with. I hope BASIC8 brings the fun back, with straightforward coding and playing after a home computer bootup.

### BASIC rather than Lua

Lua is nice, it fits well in particular fields, so do other programming languages. BASIC8 offers both retro BASIC syntax, and modern concepts. "But why using a language only make sense within one application?" You would find BASIC8 easy to learn whether you are experienced with programming; and you would get familar with new ones when moving on to new languages. Anyhow, exploring to solve problems itself is interesting. It's important to me to introduce BASIC to the fantasy computer genre.

### No RAM, VRAM or ROM mapping

Most of the other fantasy computers manage memory in static layouts, at which you can access its content by "PEEK" and "POKE"; or even directly map from resource to runtime space. That makes it simple for loading, but that's an extra abstraction layer of particular (virtual) hardware. I prefer to be able to do everything in a generic way, not go so far as programming with esoteric code.

### 160x128 display

It's a reasonable resolution because:

* Neither too small to represent sufficient visuals
* Nor too big, or requires more contents work to fill it
* Can make exact divisions by 8, 16, 32 at both dimensions, which is good for arranging graphics
* Is approximate to 4:3
* Is a common to see resolution of electronic display components

### GUI

PalmOS is a good model of stylus based GUI. It is my favourite mobile OS. I make the GUI of BASIC8 with an ideal combination of PalmOS, AmigaOS, and a part of my own idea. The goal is to make it possible to do most of the operations (except for coding) by mouse/touch; moreover to make it friendly to modern touch screens.

### Editors

Users can edit and save assets in uniformed formats, with built-in editors, that's a good start point to share and communicate.

### BASIC8 vs. open source engines

The major difference between is, open source graphics libraries and engines come with no or few limitation and toolchain, that makes it deeply customizable. BASIC8 and other fantasy computers have limitations and a number of built-in editors, that makes we focusing on what we want to express, other than thinking about how to build fundamental facilities from zero or one. Besides, you'll find it easier to communicate and share with others with the same specifications.

### BASIC8 vs. Unity3D

I've used Unity3D and Unreal for work. BASIC8 is quite different, not intending and will never be giant. It's just something meaningful which I can keep developing and polishing for long, to make it neat.
