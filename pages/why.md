## Why BASIC8?

There are several fantasy computers/consoles coming up these days, which make it possible to program, play and share games and other programs in a retro way again. It appears that retro is new fashion.

I developed BASIC8 mainly from my personal purposes, therefore BASIC8 is different from existing fantasy computers. It's designed from thinking about three aspects: how it looks and sounds, how it works, and how it speaks to a human. I'm not willing to make everything strictly retro, instead, I prefer to make it retro at appearance, simple to work with, and fun to play with. I hope BASIC8 brings the fun back, with straightforward coding and playing after a home computer bootup.

### BASIC rather than Lua

Lua is nice, it fits well in particular fields, so do other programming languages. BASIC8 offers both retro BASIC syntax, and modern concepts which Lua has too, but not all other BASIC dialects do. "But why using a language only make sense within one application?" You would find BASIC8 easy to learn whether you are experienced with programming; and you would get familar with new ones when moving on to new languages. Anyhow, exploring to solve problems itself is interesting. It's important to me to introduce BASIC to the fantasy computer genre in brief.

### No RAM, VRAM or ROM mapping

Most of the other fantasy computers manage memory in static layouts, at which you can access its content by "PEEK" and "POKE"; or even directly map from resource to runtime space. That makes it simple for managing and loading, but that's an extra abstraction layer of particular (virtual) hardware. I prefer to be able to do everything in a generic way, not go so far as to program with esoteric code.

### 160x128 display

It's a reasonable resolution because:

* Not too small to represent sufficient visuals
* Nor too big, or requires more contents to fill it
* Can make exact divisions by 8, 16, 32 at both dimensions, which is good for arranging graphics
* Is approximate to 4:3
* Is a common to see resolution of electronic display components

### GUI

PalmOS is a good model of stylus based GUI. It is my favourite mobile OS. I make the GUI of BASIC8 with an ideal combination of PalmOS, AmigaOS, and a part of my own idea. The goal is to make it possible to do most of the operations (except for coding) by mouse/touch; moreover to make it friendly to modern mobile devices.

### Editors

Users can edit and save assets in uniformed formats, with built-in editors, that's a good start point to share and communicate.

### BASIC8 vs. open source engines

The major difference between them is, open source graphics libraries and engines come with no or few limitation and toolchain, which makes it deeply customizable. BASIC8 and other fantasy computers have limitations and offer built-in editors, that makes a user focusing on what he/she wants to express, other than thinking about how to build fundamental facilities from zero or one. Besides, you'll find it easier to communicate and share with others with the same specifications.

### BASIC8 vs. Unity3D

I've used Unity3D and Unreal for work. No, BASIC8 is not intending and will never be giant.

## What's next?

There are plans for new features. But it's a little different from other softwares when making a development tool, with new programming language and API. The most important thing while making it is, I cannot absolutely change existing behaviours after it's available to you. So it's a cautious progress.

Besides, I already got an idea of porting BASIC8 to other platforms, and making standalone players; yet details to be determined.
