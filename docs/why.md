## Why BASIC8?

There are several fantasy computers/consoles coming up these days, which make it possible to program, play and share games and other programs in a retro way again. It seems that vintage is new fashion.

I developed BASIC8 mainly for my personal purposes, yet BASIC8 is different from existing fantasy computers. It's designed from thinking about three aspects: how it looks and sounds, how it works, and how it speaks to a human. I'm not willing to make everything strictly retro, instead, I prefer to make it retro at appearance, simple to work with, and fun to play. If anything was not straightforward enough for a user, I'd replace it.

### BASIC rather than Lua

Lua is nice, it fits well in particular fields, so do other programming languages. BASIC8 offers both retro BASIC syntax, and modern concepts which Lua has but not all other BASIC dialects do. Anyway it's important to me to introduce BASIC.

"But why using a language only make sense within one application?" You would find BASIC8 easy to learn whether you are experienced with programming; and you would get familar with new ones when moving on to new languages. Anyhow, exploring to solve problems itself is interesting.

### No uniformed RAM, VRAM or ROM

Most of the other fantasy computers manage memory in static layout, on which you can "peek" and "poke" to access its content, or even directly map from resource to runtime space. That makes it simple to manage and load, but that's a superfluous abstraction of particular virtual hardware. I personally prefer to be able to do everything in a generic way, not go so far as to code in a tricky dialect.

### 160x128

It's a reasonable resolution because:

* Not too small to represent sufficient visuals
* Not too big, or requires more contents to fill it
* Can make exact divisions by 8, 16, 32
* Is approximate to 4:3
* It's a common to see resolution of electronic display components

### GUI

PalmOS is a good model of stylus based GUI. And it's my favourite mobile OS. I make BASIC8's GUI with an ideal combination of PalmOS, AmigaOS, and a part of my own idea. The goal is to make it possible to do most of the operations (except for coding) by mouse/touch; moreover to make it friendly to modern mobile devices.

### Editors

Users can edit and save assets in uniformed formats, with built-in editors, that's a good start point to share works and ideas.

## What's next?

There are plans for new features. But the most important thing while maintaining a developer tool is, I cannot absolutely change existing behaviours after it's available for users. So, it's a cautious progress.

Besides, I already got an idea of porting BASIC8 to other platforms, and making standalone players; yet details to be determined.
