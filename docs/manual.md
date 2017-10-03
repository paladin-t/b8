![](imgs/logo.png)

**Copyright (C) 2017 Wang Renxin**

## Welcome to BASIC8

BASIC8 is an integrated virtual computer for game and other program development. Users can create, share and play cartridges in a BASIC dialect, with retro 8-bit style flavour, and some built-in tools for editing sprites, maps, sounds and etc.

It's encouraged to share your creativity. All cartridges are shared under the [CC-BY](https://creativecommons.org/licenses/by/4.0/) license, if the author hasn't explicitly chosen other licenses. Every code, sprite, map and other data are viewable and editable to other users, it is recommended to learn and communicate with each other, also allowed to derive from other users' work or even cooperate together. The only community guidelines are just to be polite and respectful to other people and their work and, don't do anything bad.

For the moment, BASIC8 is released for PC only, however, there are plans for porting to other systems.

You may read this manual in any order according to your interest, and open this to lookup for explanations at any time.

## Table of content

* Part I. Fundamental
	* [Getting started](#getting-started)
		* [Operations](#operations)
		* [Specs](#specs)
		* [Cartridge library](#cartridge-library)
		* [Configuration](#configuration)
		* [Sharing](#sharing)
			* [Exporter and importer](#exporter-and-importer)
			* [Cartridges](#cartridges)
			* [Recording GIF](#recording-gif)

* Part II. Syntax
	* [Basic principles](#basic-principles)
		* [Variable and data types](#variable-and-data-types)
			* [Number](#number)
			* [String](#string)
		* [Comment](#comment)
		* [Arithmetic and relational operations](#arithmetic-and-relational-operations)
		* [Bitwise operations](#bitwise-operations)
		* [String operations](#string-operations)
		* [Array](#array)
	* [Control structures](#control-structures)
		* [Conditional](#conditional)
		* [Looping](#looping)
		* [Jumping](#jumping)
	* [Advanced syntax](#advanced-syntax)
		* [Collections](#collections)
			* [Iterators](#iterators)
		* [Sub routine](#sub-routine)
		* [Lambda](#lambda)
		* [Class](#class)
		* [Typing](#typing)
		* [Importing another file](#importing-another-file)
		* [Coroutine](#coroutine)
		* [Structured exception handling](#structured-exception-handling)
		* [Automatic memory management](#automatic-memory-management)
	* [Generic functions](#generic-functions)

* Part III. Game driver
	* [Graphics](#graphics)
		* [Primitives](#primitives)
		* [Sprite](#sprite)
		* [Map](#map)
		* [Quantized](#quantized)
	* [Input](#input)
		* [Mouse and touch](#mouse-and-touch)
		* [Gamepad](#gamepad)
		* [Keyboard](#keyboard)
	* [Audio](#audio)
		* [Music](#music)
		* [Sound effects](#sound-effects)

* Part IV. Editors
	* [Editors](#editors)
		* [Code](#code)
		* [Sprite asset](#sprite-asset)
		* [Map asset](#map-asset)
			* [Tiles asset](#tiles-asset)
		* [Quantized asset](#quantized-asset)

* Part V. Functions
	* [Basic functions](#basic-functions)
		* [Math functions](#math-functions)
		* [String functions](#string-functions)
		* [Data transfer and persistence](#data-transfer-and-persistence)
	* [Libraries](#libraries)
		* [Asynchronization](#asynchronization)
		* [Archive](#archive)
		* [Bytes](#bytes)
		* [Database](#database)
		* [Date time](#date-time)
		* [File](#file)
		* [GUI](#gui)
		* [Image](#image)
		* [IO](#io)
		* [JSON](#json)
		* [Math](#math)
		* [OS](#os)
		* [Text](#text)
		* [Web](#web)
	* [Reserved words](#reserved-words)

[HOME](#welcome-to-basic8)

## Getting started

It's been a while since people used to enjoy straightforward coding and playing after a computer bootup. BASIC8 is aimed to bring a sense of joy back from retro/vintage computing and gaming. And it's trying to stay at a balance point of simplicity, fun, creativity and usability.

### Operations

Most home computers from 1970-80s use keyboards as the only developer input method, but mice and touching are everywhere nowadays. It's supported to use keyboard, mouse/touching and gamepad to play cartridges. But BASIC8 uses mouse as the main operation method on editors' GUI; keyboard is mainly used to write code, and do some shortcuts:

* F1: show this manual
* F7: take a screenshot when playing
* F8: record frames when playing, or stop recording
* Ctrl+R: run a cartridge
* Ctrl+.: stop running a cartridge
* Ctrl+S: save all data
* Ctrl+U/Ctrl+Y: undo/redo

* Ctrl+C: copy data
* Ctrl+X: cut data
* Ctrl+V: paste data
* W/S/A/D: select painting sources
* Z/X: select painting tools

See tips in editors for other details.

When speaking of clicking `[Head]`, it means the first icon item on the main menu bar:

![](imgs/head.png)

### Specs

The limitations of BASIC8 are carefully chosen to make it easy and enjoyable during making programs:

* Canvas: 160x120 pixels
* Gamepad: 6 buttons each, up to 8 players
* Audio: 2 music channels, 3 sound effect channels
* Driver: up to 65535 drawing commands per cycle
* Palette: 16 colors
* Sprite: up to 32x32 pixels per frame, up to 512 frames per sprite
* Tiles: 240 cels
* Map: up to 128x64 tiles per layer, up to 4 layers (including a layer of logic marks) per page

### Cartridge library

All cartridges are stored in a library directory on disk, each cartridge has its own sub directory for all code and data. The default library root path on Windows is "C:\Users\YourName\Documents\BASIC8\".

### Configuration

There are some configurable options available:

* Maximizing the canvas on play: `Option`, `Graphics`, checking `Maximize canvas`
* Fixing the ratio of canvas on play: `Option`, `Graphics`, checking `Fix canvas ratio`
* Hiding the menu bar when playing: `Option`, `Graphics`, checking `Hide menu bar when playing`
* Entering full screen: `Option`, `Graphics`, `Full screen`
* Customizing input: `Option`, `Input`, then custom for each virtual gamepad on the dialog box
* Changing the root library directory: `Option`, `Directory`, `Browse`, `Apply`, this will move all existing cartridges to the new path
* Showing stat. information: `Option`, check `Show stat.`
* Making it running when double click on a cartridge, instead of opening it: `Option`, check `Run on click`
* Allowing multiple editor windows: `Option`, check `Multiple windows`

### Sharing

A big part of retro computing which makes it fun to work with is sharing and discussing user generated contents through magazines and any sorts of communities. That is convenient to do so in BASIC8.

#### Exporter and importer

To export a cartridge, select it on the main library screen, click `[Head]`, `Export`, then choose either `Save "*.b8" file`, or `Copy text based to clipboard`; or right click on a cartridge, then click `Export`.

To import a cartridge, click `[Head]`, `Import`, then choose either `From a "*.b8" file`, or `From text on clipboard`.

#### Cartridges

Standalone "*.b8" files are standard "zip" packages, you may use them for archiving and attaching purposes. Text based cartridges are formed with ASCII characters, which are friendlier when posting to places with text allowed only.

#### Recording GIF

Click `Cartridge`, `Record frames`, or just press `F8` while playing to record a sequence of frames for further GIF exporting, click `Cartridge`, `Stop recording`, or press `F8` again to stop recording.

[HOME](#welcome-to-basic8)

## Basic principles

BASIC, it was almost the only thing a user could get with vintage home computers. That's deeply impressive to see how challenging it was when limited functionalities put stress on hobbyists, and how intelligent peoples could be. BASIC8 implements a BASIC dialect, with both retro simplicity and some modern concepts. You will get how to program in BASIC8 in this part. In this document, BASIC8 stands for either the virtual computer or the language it offers, according to where it appears.

Identifiers and keywords are case-insensitive, but it stores what exactly you typed within strings. All keywords and functions in this document are in upper case, to distinguish from other descriptions.

### Variable and data types

BASIC8 is a dynamic programming language, therefore variables don't have types, but values do. The basic types are nil, numbers, string, array, collections, iterators, lambda, class, coroutine; besides, BASIC8 offers some data structures as libraries, which will be explained later.

Nil is a special type, the only valid value is `NIL`, a.k.a. `NULL`, `NONE` or `NOTHING`.

A variable identifier is formed with letters, underline and numbers, but it must begin with a letter or an underline. It's not accepted to use type specifier for variable, and you don't need to declare it before accessing it neither. Assignment statements begin with optional `LET` keywords, eg. `LET pie = 22 / 7`, `s = pie * r * r`, etc.

Only `NIL`, `0` and constant `false` result "false" within boolean expressions; non-zero numbers, `true` and all other values, including an empty string `""` result "true" in BASIC8.

#### Number

There are two types of number in BASIC8, integer and real (float point). Integer is implemented as 32-bit signed, with range of values from -2,147,483,648 to 2,147,483,647. Real is implemented as standard [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754) float point. An arithmetic expression with real number may result an integer, if the result value doesn't have a fractional part, eg. `1.5 / 0.5` results in `3` rather than `3.0`.

An octal integer begins with `0`, a hexadecimal one begins with `0x`, eg. `010` (oct) equals to `8` (dec), `0x10` (hex) equals to `16` (dec).

#### String

A string begins and ends with a pair of double quotation marks `""`, it stores what exactly you typed as a sequence of characters. Strings can be used to represent sentences, descriptions, or any text based data.

### Comment

A comment is a user readable explanation or annotation in source code. They are added with the purpose of making source code easier for humans to understand, and are ignored by compilers and interpreters. BASIC8 supports traditional single line comments begin with `REM` statements, which stands for "REMark", and single quotation marks `'` as shortcut. All text from a comment mark till the end of the line are ignored. Besides, BASIC8 supports a form of multiline comments, begin with `'[` and ends with `']`, all text between them are ignored.

### Arithmetic and relational operations

These operators are used for arithmetic calculations:

* `x + y`: plus
* `x - y`: binary minus
* `x * y`: multiply
* `x / y`: divide
* `x MOD y`: modulus
* `x ^ y`: exponential
* `-y`: unary negative
* `(expr)`: explicit priority indicator

These operators are used for relational comparisons and calculations:

* `x = y`: equals to comparison; the same symbol as assignment
* `x < y`: less than
* `x > y`: greater than
* `x <= y`: less than or equals to
* `x >= y`: greater than or equals to
* `x <> y`: not equals to

* `x AND y`: logical "and"
* `x OR y`: logical "or"
* `NOT y`: logical "not"

Logical truth table:

| P | Q | P AND Q | P OR Q | NOT Q |
|---|---|---|---|---|
| T | T | T | T | F |
| T | F | F | T | T |
| F | T | F | T | - |
| F | F | F | F | - |

An expression is evaluated from left to right, with top down priorities:

| Level | Operation |
|---|---|
| 1 | ( ) |
| 2 | - (negative), NOT |
| 3 | ^ |
| 4 | *, /, MOD |
| 5 | +, - (minus) |
| 6 | <, >, <=, >=, <>, = (equal comparison) |
| 7 | AND, OR |
| 8 | = (assignment) |

Other numeric functions will be mentioned at "[Math functions](#math-functions)".

### Bitwise operations

* `BAND(x, y)`: bitwise "and"
* `BOR(x, y)`: bitwise "or"
* `BNOT(y)`: bitwise "not"
* `BXOR(x, y)`: bitwise "xor"
* `SHL(m, n)`: bitwise left shift
* `SHR(m, n)`: bitwise right shift

### String operations

* `x + y`: concatenates two strings

It generates new string objects, with memory allocation, when concatenating strings.

Comparison operators can also be applied to strings. It starts comparing the first characters of both strings, if they equal to each other, it continues checking the following ones until a difference occurs or reaching the end of any string.

Other string functions will be mentioned at "[String functions](#string-functions)".

### Array

BASIC8 supports array up to 4 dimensions. An array can store a set of data that each element can be accessed by an array name and indices. Arrays can hold either real or string data. An array must be declared with a `DIM` statement before using it:

~~~~~~~~~~bas
DIM nums(10)
DIM strs$(2, 5)
~~~~~~~~~~

The naming rule for array identifiers is the same as naming variables, actually all user identifiers in BASIC8 do the same. A `DIM` keyword followed with an array identifier, begins with an open bracket and ends with a close bracket. Dimensions are separated by commas. Array indices begin from zero in BASIC8, therefore `nums(0)` is the first element of array `nums`, it's a little different from other BASIC dialects, but more common in most modern programming languages. An array index can be a non-negative integer value formed as a constant, a variable with integer or an expression which results in an integer; invalid indices cause errors.

## Control structures

Normal statements execute line by line. However, you can do more than that with some workflow control structures.

### Conditional

It's used to execute particular code block depending on conditions, with conditional structures, with `IF`/`THEN`/`ELSEIF`/`ELSE`/`ENDIF` statements.

It's supported to write conditional `IF` statements in two ways. One is single line which the whole conditional block is written in a compact line:

~~~~~~~~~~bas
IF n MOD 2 THEN PRINT "Even" ELSE PRINT "Odd"
~~~~~~~~~~

The other way is multiline:

~~~~~~~~~~bas
INPUT n
IF n = 1 THEN
	PRINT "One";
ELSEIF n = 2 THEN
	PRINT "Two";
ELSEIF n = 3 THEN
	PRINT "Three";
ELSE
	PRINT "More than three";
ENDIF
~~~~~~~~~~

### Looping

The `FOR`/`TO`/`STEP`/`NEXT` statements are used to loop through certain steps:

~~~~~~~~~~bas
FOR i = 1 TO 10 STEP 1
	PRINT i;
NEXT i
~~~~~~~~~~

The `STEP 1` part is optional if the increment step is 1. The loop variable after `NEXT` is also optional if it is associated with a nearest `FOR`.

A variant form of `FOR`/`IN`/`NEXT` is used to iterate collections, which will be mentioned later.

The `WHILE`/`WEND`, `DO`/`UNTIL` statements are used when the number of loop steps is uncertain.

`WHILE`/`WEND` checks a loop condition, before executing a loop body, while `DO`/`UNTIL` executes a body block before checking a condition. `WHILE`/`WEND` keeps looping when a condition is true:

~~~~~~~~~~bas
a = 1
WHILE a <= 10
	PRINT a;
WEND
~~~~~~~~~~

`DO`/`UNTIL` keeps looping until a condition is true:

~~~~~~~~~~bas
b = 1
DO
	PRINT b;
UNTIL a > 10
~~~~~~~~~~

### Jumping

The `EXIT` statement is used to discontinue a loop.

BASIC8 offers a `GOTO` statement which performs unconditional control transfer. You can call it as `GOTO label`, it executes from `label:` in next step, rather than the following line of a `GOTO` statement. A labeled target constructs of a label name and a following colon as `label:`.

`GOSUB` is similar to `GOTO`, but it can be returned with a `RETURN` statement.

### Collections

BASIC8 supplies a set of list and dictionary manipulation function libraries which do creation, accessing, iteration, etc. as following:

* `LIST(...)`: creates a list, with optional initialization elements
* `DICT(...)`: creates a dictionary, with optional initialization key-value pairs
* `PUSH(lst, val)`: pushes a value to the tail of a list
* `POP(lst)`: pops a value from the tail of a list
* `BACK(lst)`: peeks the value of the tail of a list
* `INSERT(lst, where, val)`: inserts a value at a specific position of a list
* `SORT(lst)`: sorts a list increasingly
* `EXIST(coll, what)`: tells whether a list contains a specific **value**, or whether a dictionary contains a specific **key**
* `INDEX_OF(lst)`: gets the index of a specific value in a list
* `GET(coll, where)`: returns the value of a specific index in a list, or the value of a specific key in a dictionary
* `SET(coll, where, val)`: sets the value of a specific index in a list, or the value of a specific key in a dictionary
* `REMOVE(coll, where)`: removes the element of a specific index in a list, or the element of a specific key in a dictionary
* `CLEAR(coll)`: clears a list or a dictionary
* `CLONE(coll)`: clones a collection, each element will be duplicated, except for non-copyable ones
* `TO_ARRAY(lst)`: copies all elements from a list to a new array
* `ITERATOR(coll)`: gets an iterator of a list or a dictionary
* `MOVE_NEXT(iter)`: moves an iterator to next position on a list or a dictionary

Besides, it's also able to apply some other generic function to collections:

* `VAL(iter)`: returns the value of a dictionary iterator
* `LEN(coll)`: gets the element count of a collection

Eg:

~~~~~~~~~~bas
l = LIST(1, 2, 3, 4)
SET(l, 1, "B")
PRINT EXIST(l, 2); POP(l); BACK(l); LEN(l);

d = DICT(1, "One", 2, "Two")
SET(d, 3, "Three")
PRINT LEN(d);
~~~~~~~~~~

BASIC8 supports directly accessing to elements in a list or dictionary using brackets:

~~~~~~~~~~bas
l = LIST(1, 2, 3, 4)
d = DICT()
d(1) = l(2)
PRINT d(1);
~~~~~~~~~~

List indices begin from zero too, as how an array does in BASIC8.

#### Iterators

List iterator and dictionary iterator are used to walk through all elements in collections.

Iterate a list with an explicit pattern:

~~~~~~~~~~bas
l = LIST(1, 1, 2, 3, 5, 8)
i = ITERATOR(l)
WHILE MOVE_NEXT(i)
	PRINT GET(i);
WEND
~~~~~~~~~~

A ranged iteration, increasing by 1, with a `FOR` loop:

~~~~~~~~~~bas
FOR i IN LIST(1 TO 5)
	PRINT i;
NEXT
~~~~~~~~~~

A ranged iteration, decreasing by 1, with a `FOR` loop:

~~~~~~~~~~bas
FOR i IN LIST(5 TO 1)
	PRINT i;
NEXT
~~~~~~~~~~

Use the `GET` statement to get the key of a dictionary iterator, and `VAL` to get the value:

~~~~~~~~~~bas
d = DICT("One", 1, "Two", 2, "Three", 3)
i = ITERATOR(d)
WHILE MOVE_NEXT(i)
	PRINT GET(i), ", ", VAL(i);
WEND
~~~~~~~~~~

Iterate the previous dictionary `d` with a `FOR` loop, while the iteration variable represents for keys:

~~~~~~~~~~bas
FOR i IN d
	PRINT i, ", ", d(i);
NEXT
~~~~~~~~~~

## Advanced syntax

### Sub routine

A sub routine, a.k.a. "sub", "function", "routine" or "procedure", is often supposed to be a good abstraction of common and reusable code blocks. A sub routine in BASIC8 begins with `DEF` and ends with `ENDDEF`, it will be mentioned uniformly as "routine" for short in this document. A routine name follows after `DEF`, then with a list of parameters clamped with a pair of brackets. Use the name of a routine directly to call it, with a list of arguments clamped with a pair of brackets. But it requires an extra `CALL` command when calling a routine which is declared in following code. The `RETURN` statement is also used to exit a routine, with an optional result value.

Each routine has its own scope, in which statements in that routine body would lookup for variables, before looking into outer scopes.

Eg:

~~~~~~~~~~bas
DEF foo(a, b)
	c = CALL bar(a, b)

	RETURN c
ENDDEF

DEF bar(a, b)
	RETURN a + b
ENDDEF

PRINT foo(1, 2);
~~~~~~~~~~

It's also possible to use the `CALL` statement with extra brackets to gets an invokable objects, instead of calling it immediately, as:

~~~~~~~~~~bas
c = CALL(bar)
c(a, b)
~~~~~~~~~~

But, there's a limitation that it's not accepted to use mixed routines by `DEF` and jumps by `GOTO`/`GOSUB` together in one program.

### Lambda

A [lambda](https://en.wikipedia.org/wiki/Anonymous_function) abstraction, a.k.a. "anonymous function" or "function literal", is a function definition that is not bound to an identifier. Lambda functions are often:

* Arguments being passed to higher order functions, or
* Used for constructing the result of a higher-order function that needs to return a function

A Lambda becomes a closure after it captured some values in an outer scope.

BASIC8 offers a full support for lambda, including invokable as a value, higher order function, closure and currying, etc.

It begins with a `LAMBDA` keyword, and follows with a parameter list, with none or multiple parameter identifiers. Then a lambda body, which is also clamped with a pair of brackets. It's able to write multiple line statements in a lambda body, use the `RETURN` statement to return a value and exit from a lambda execution as well. The tilde character `~` is short for `LAMBDA`.

Eg:

~~~~~~~~~~bas
DEF counter()
	c = 0

	RETURN LAMBDA (n)
	(
		c = c + n
		PRINT c;
	)
ENDDEF

acc = counter()

acc(1)
acc(2)
~~~~~~~~~~

### Class

BASIC8 supports [prototype-based](https://en.wikipedia.org/wiki/Prototype-based_programming) programming paradigm which is a kind of OOP (Object-Oriented Programming). When speaking of "class instance" or "prototype" in BASIC8, it all means the same thing. This programming paradigm can also be known as "prototypal", "prototype-oriented", "classless", or "instance-based" programming. Use a pair of `CLASS`/`ENDCLASS` statements to define a class (a prototype object). Use `VAR` to declare a member variable of a class. It's able to define member function, a.k.a. "method" of a class with the `DEF`/`ENDDEF` statements as well. Write another prototype surrounding with a pair of brackets after a declaration statement to inherit from it (use it as a meta class). Use `NEW` to clone a new instance of a prototype.

See the following example of class:

~~~~~~~~~~bas
CLASS foo
	VAR a = 1
	DEF fun(b)
		RETURN a + b
	ENDDEF
ENDCLASS

CLASS bar(foo)
	VAR a = 2
ENDCLASS

inst = NEW(bar)
PRINT inst.fun(3);
~~~~~~~~~~

The `GET` statement can be also applied to a class instance to get a member of it. It results in the value of a variable field or the invokable object of a routine:

~~~~~~~~~~bas
PRINT GET(foo, "A");   ' Results in the value of "A".
PRINT GET(foo, "FUN"); ' Results in the invokable object.
~~~~~~~~~~

The `SET` statement can be applied to a class instance to set the value of a variable field:

~~~~~~~~~~bas
SET(foo, "A", 42)
PRINT GET(foo, "A");
~~~~~~~~~~

### Typing

The `TYPE` statement is used to tell the type of any value.

The `IS` operator is used to check whether a value is an instance of a certain type, or if an object is an instance of a class, eg. `1 IS TYPE("NUMBER")`, `"Hello" IS TYPE("STRING")`, `inst IS foo`, etc.

Besides, there is also a `TYPEOF` function, which gets the type of a non-referenced value.

### Importing another file

The `IMPORT` statement is used to import another source file, as if its content was just written at where the `IMPORT` statement is:

~~~~~~~~~~bas
IMPORT "directory/file_name.bas"
~~~~~~~~~~

### Coroutine

A coroutine is a special data type in BASIC8, which encapsulates an invokable routine or lambda. It's a programming component that generalizes subroutines for non-preemptive multitasking, by allowing multiple entry points for suspending and resuming execution at certain locations. It obtains the execution flow when iterating on it, then keeps executing until all invokable statements finished or it hands over the flow by itself.

* `COROUTINE(invokable, ...)`: creates a coroutine, with optional initialization arguments
* `YIELD val`: yields from a coroutine, hands over the execution flow
* `RETURN val`: returns from a coroutine
* `START(co)`: starts a coroutine, which will be automatically scheduled by a dispatcher
* `ABORT(co)`: aborts an automatically dispatched coroutine
* `MOVE_NEXT(co)`: iterates a coroutine for one step
* `GET(co)`: gets current iterated value of a coroutine
* `GET_ERROR(co)`: gets the execution error of a coroutine
* `WAIT_FOR_MS(ms)`: waits for certain milliseconds to dispatch next coroutine cycle

Eg:

~~~~~~~~~~bas
co = COROUTINE
(
	LAMBDA (x, y)
	(
		PRINT x / y;
		FOR i IN LIST(1 TO 3)
			YIELD i
		NEXT
		YIELD LAMBDA () (PRINT "I = " + STR(i);)
		YIELD LIST()
		YIELD COROUTINE(LAMBDA () (PRINT "Nested";))

		RETURN "CO"
	),
	22, 7
)

FOR t IN co
	IF t IS TYPE("NUMBER") THEN
		PRINT t;
	ELSEIF t IS TYPE("STRING") THEN
		PRINT t;
	ELSEIF t IS TYPE("LIST") THEN
		PRINT "List";
	ELSEIF t IS TYPE("ROUTINE") THEN
		t()
	ELSE
		WHILE MOVE_NEXT(t)
		WEND
	ENDIF
NEXT
~~~~~~~~~~

### Structured exception handling

The `TRY` statement accepts three arguments. And works as following:

* It invokes the first "try" invokable argument
* Invokes the second "catch" routine by passing the error text, if any error occurred during the "try" routine
* The third "finally" routine is always invoked no matter error occurred or not
* It raises an occurred error outer if it's not caught yet by current `TRY`
* A `TRY` statement returns the value of the returned result from a "try" routine

Eg:

~~~~~~~~~~bas
ret = TRY
(
	LAMBDA ()
	(
		PRINT "Try.";

		RETURN 42
	),
	LAMBDA (_)
	(
		PRINT "Catch: ", _, ".";
	),
	LAMBDA ()
	(
		PRINT "Finally.";
	)
)
PRINT ret;
~~~~~~~~~~

### Automatic memory management

BASIC8 automatically manages the memory with GC (Garbage Collection). Thus you don't need to explicitly release unused memory. However, you are still in charge of setting unused referenced variables to `NIL`, closing finished files, etc.

## Generic functions

* `PRINT expr, ...`: for debug purpose, writes some value to the output window (click `Window`, `Output` to open it), comma `,` is used to separate arguments, semicolon `;` is used to make a new line
* `INPUT [prompt,] x`: this function suspends current execution and opens a dialog box for inputting data to `x`, with an optional input prompt

* `ASSERT(cond, text)`: prompts an assertion text if `cond` results in false
* `SWAP(x, y)`: swaps the values between `x` and `y`
* `IIF(cond, val0, val1)`: returns `val0` if `cond` results in true, otherwise returns `val1`

* `TRACE()`: prints stack trace
* `RAISE([n])`: raises an error, with an optional abort code
* `GC()`: tries to trigger garbage collection, and returns how much bytes have been collected
* `MEM`: gets the allocated memory size in bytes
* `BEEP`: beeps once with the (PC) speaker, not available for all platforms
* `TYPEOF(val)`: gets the type of a non-referenced value

[HOME](#welcome-to-basic8)

## Graphics

Program execution and rendering are running at different FPS in BASIC8. Some properties, such as positions, rotations, of graphics commands can be interpolated between rendering frames, see `SET_INTERPOLATOR` for details. Render queue can be ordered by rules:

* "nil": not ordered, all graphics commands execute in a same queue
* "map": graphics commands are separated into 5 sub queues, later rendering covers earlier ones
	* 0, ground: for layer 1 in a map asset
	* 1, building: for layer 2 in a map asset
	* 2, active: for sprites
	* 3, sky: for layer 3 in a map asset
	* 4, overlay: for primitives
* "spr": sprites are ordered by their y position
* "all": with both "map" and "spr" enabled

These functions are used to communicate with a driver:

* `DRIVER()`: gets the driver, there's only one driver instance for a running cartridge
* `VALID(drv)`: checks whether a driver is valid
* `SET_FPS(drv, rfps, sfps = 30)`: sets FPS of a driver
	* `rfps`: rendering FPS
	* `sfps`: scripting FPS, cannot be greater than `rfps`
* `SET_INTERPOLATOR(drv, rule)`: sets graphics interpolator of a driver
	* `rule`: can be "nil", "linear", respectively are no interpolation, linear interpolation
* `SET_ORDERBY(drv, rule ...)`: sets ordering rules of graphics commands
	* `rule ...`: can be one or more in "nil", "map", "spr", "all"; "all" equals to "map" and "spr"
* `UPDATE_WITH(drv [, r])`: sets a driver to the automatic updating mode, with an invokable update argument
	* `r`: can be an invokable routine or lambda, or its name in string, or "update" as default
* `LOCK(drv)`: locks a driver, suspends its resource loading procedures
* `UNLOCK(drv)`: unlocks a driver, resumes its resource loading procedures

These functions are used to load or create graphics objects and values:

* `LOAD_RESOURCE(path, ref = 0)`: loads a resource from disk
	* `path`: path of a resource, can be "*.sprite", "*.map", "*.quantized" files; uses the content directory of a cartridge as lookup root
	* `ref`: reference source of a resource, palette index for sprites and quantized images, tiles for maps
* `LOAD_BLANK(y, n, w, h, ref = 0)`: loads a blank resource
	* `y`: type of a resource, can be "sprite" or "map"
	* `n`: count of sprite frames, or map layers
	* `w`: width of a frame/layer
	* `h`: height of a frame/layer

* `RGBA(r, g, b, a = 255)`: returns a color value with RGBA components, each component is an integer ranged from 0 to 255

These functions are used to manipulate a sprite:

* `PLAY(spr, b = -1, e = -1, loop = true, init = false)`: plays a range of frames of a sprite
	* `spr`: a sprite
	* `b`: begin frame index, starts from 1; or frame tag string
	* `e`: end frame index, starts from 1, setting `b` and `e` both to -1 means play through every frame; or frame tag string
* `STOP(spr)`: stops animating a sprite
* `FLIP_X(spr, f = false)`: sets whether flips a sprite horizontally
* `FLIP_Y(spr, f = false)`: sets whether flips a sprite vertically
* `SET_FLIP_CONDITION(spr, fx, fy)`: sets the flipping condition of a sprite
	* `fx`: in horizontal directions, 1 for flipping when sprite's x is increasing, -1 for flipping when sprite's x is decreasing, 0 for none
	* `fy`: in vertical directions, 1 for flipping when sprite's y is increasing, -1 for flipping when sprite's y is decreasing, 0 for none

### Primitives

* `SYNC`: synchronizes primitive commands to driver, only used in the manual updating mode (without calling `UPDATE_WITH`)
	* returns elapsed time since last synchronizing
* `COL col`: sets the default color value of future commands
* `CLIP [x, y, w, h, ss = true]`: sets a clip area, resets to none clip areas if no argument passed
	* `ss`: true for screen space clipping, otherwise with world space
* `CAMERA [x, y, ip = false]`: moves the camera to a specific position, resets its position if no argument passed
	* `ip`: true for position interpolation

* `TEXT x, y, txt [, col]`: draws a text
* `LINE x0, y0, x1, y1, w = 1 [, col]`: draws a line
	* `w`: width (thickness)
* `CIRC x, y, r [, col]`: draws a circle
* `CIRCFILL x, y, r [, col]`: draws a filled circle
* `ELLIPSE x, y, rx, ry [, col]`: draws an ellipse
* `ELLIPSEFILL x, y, rx, ry [, col]`: draws a filled ellipse
* `RECT x0, y0, x1, y1 [, col]`: draws a rectangle
* `RECTFILL x0, y0, x1, y1 [, col]`: draws a filled rectangle

* `PGET i`: gets the color of a palette, at a specific index
* `PSET i, col, ip = false`: sets the color of a palette
	* `ip`: true for interpolation

### Sprite

The beginning index of sprite frames is 1.

* `STEP_ON(y)`: creates a "step on" value, which represents for aligning a sprite's bottom to `y`
* `SPR spr, x, y, r = 0`: draws a sprite
	* `x`: horizontal position of the top-left corner
	* `y`: vertical position of the top-left corner, or a "step on" value
	* `r`: rotation
* `SSPR spr, sx, sy, sw, sh, x, y, w, h, r = 0`: stretches rectangle from sprite sheet (sx, sy, sw, sh), and draws in rectangle (dx, dy, dw, dh)

* `SGET spr, i, x, y`: gets the color index of a sprite at a specific position
	* `i`: frame index, starts from 1
* `SGET spr, i, what`: gets the data of a sprite
	* `i`: frame index, starts from 1
	* `what`: can be "tag", "interval"
* `SSET spr, i, x, y, val`: sets the color index of a sprite at a specific position
	* `i`: frame index, starts from 1
* `SSET spr, i, what, val`: sets the data of a sprite
	* `i`: frame index, starts from 1
	* `what`: can be "tag", "interval"

### Map

The beginning index of map layers is 0. Furthermore, layer 0 is for logic mark purpose, with range of values from 0 to 15; layer 1, 2, and 3 are for rendering, with range of values from 0 to 240.

* `MAP m, x, y`: draws one or more map layers at a specific position
	* `m`: single layer of a map, or list of layers

* `MGET m, i, x, y`: gets the tile index or logic mark of a map layer at a specific position
	* `m`: list of layers
	* `i`: index to access in `m`, starts from 0
* `MSET m, i, x, y, val`: sets the tile index or logic mark of a map layer
	* `m`: list of layers
	* `i`: index to access in `m`, starts from 0

### Quantized

* `IMG img, x, y, r = 0, q = 0, fx = false, fy = false`: draws a quantized image at a specific position
	* `r`: rotation
	* `q`: index of a target rendering queue
	* `fx`: true for flipping horizontally
	* `fy`: true for flipping vertically
* `SIMG img, sx, sy, sw, sh, x, y, w, h, r = 0, q = 0, fx = false, fy = false`: stretches rectangle from a quantized image (sx, sy, sw, sh), and draws in rectangle (dx, dy, dw, dh)

## Input

### Mouse and touch

The `TOUCH` statement takes a pointer index, and assigns all result values to following variables.

* `TOUCH i, x, y [, b0 [, b1 [, b2]]]`: gets mouse/touching states
	* `i`: for input, pointer index
	* `x`: for output, the x position of a pointer
	* `t`: for output, the t position of a pointer
	* `b0`: for output, true if the first button is pressed
	* `b1`: for output, true if the second button is pressed
	* `b2`: for output, true if the third button is pressed

### Gamepad

A virtual gamepad has 6 buttons, each button may be binded with a key on keyboard, or a button/trigger on a game controller.

* `BTN b, p = 0`: checks whether a virtual button is pressed
	* `b`: index of a virtual button to check, 0/1/2/3/4/5 for left/right/up/down/a/b
	* `p`: player index, starts from 0
	* returns true for pressed
* `BTNP b, p = 0`: checks whether a virtual button is just released from pressing
	* `b`: index of a virtual button to check, 0/1/2/3/4/5 for left/right/up/down/a/b
	* `p`: player index, starts from 0
	* returns true for released from pressing

### Keyboard

* `KEY k`: checks whether a key is pressed
	* `k`: the key value to check
	* returns true for pressed
* `KEYP k`: checks whether a key is just released from pressing
	* `k`: the key value to check
	* returns true for released from pressing

## Audio

* `SET_VOLUME(sv, mv)`: sets volume values
	* `sv`: volume of sound effect
	* `sm`: volume of music

### Music

* `USE_SOUND_FONT(path)`: uses a sound font bank for music
	* `path`: uses the content directory of a cartridge as lookup root

* `PLAY seq, ch = 0, preset = 0, loop = false`: plays an [MML](https://en.wikipedia.org/wiki/Music_Macro_Language) (Music Macro Language) string
	* `seq`: an MML format string
	* `ch`: channel to play within
	* `preset`: preset index of sound font bank

The tones are indicated by letters `A` through `G`. Accidentals are indicated with a `+` or `#` (for sharp) or `-` (for flat) immediately after the note letter. See this example:

~~~~~~~~~~bas
PLAY "C C# C C#"
~~~~~~~~~~

Whitespaces are ignored inside the string expression. There are also codes that set the duration, octave and tempo. They are all case-insensitive. PLAY executes the commands or notes the order in which they appear in the string. Any indicators that change the properties are effective for the notes following that indicator.

~~~~~~~~~~
Ln     Sets the duration (length) of the notes. The variable n does not indicate an actual duration
       amount but rather a note type; L1 - whole note, L2 - half note, L4 - quarter note, etc.
       (L8, L16, L32, L64, ...). By default, n = 4.
       For triplets and quintets, use L3, L6, L12, ... and L5, L10, L20, ... series respectively.
       The shorthand notation of length is also provided for a note. For example, "L4 CDE L8 FG L4 AB"
       can be shortened to "L4 CDE F8G8 AB". F and G play as eighth notes while others play as quarter notes.
On     Sets the current octave. Valid values for n are 0 through 6. An octave begins with C and ends with B.
       Remember that C- is equivalent to B. 
< >    Changes the current octave respectively down or up one level.
Nn     Plays a specified note in the seven-octave range. Valid values are from 0 to 84. (0 is a pause.)
       Cannot use with sharp and flat. Cannot use with the shorthand notation neither.
MN     Stand for Music Normal. Note duration is 7/8ths of the length indicated by Ln. It is the default mode.
ML     Stand for Music Legato. Note duration is full length of that indicated by Ln.
MS     Stand for Music Staccato. Note duration is 3/4ths of the length indicated by Ln.
Pn     Causes a silence (pause) for the length of note indicated (same as Ln). 
Tn     Sets the number of "L4"s per minute (tempo). Valid values are from 32 to 255. The default value is T120. 
.      When placed after a note, it causes the duration of the note to be 3/2 of the set duration.
       This is how to get "dotted" notes. "L4 C#." would play C sharp as a dotted quarter note.
       It can be used for a pause as well.
~~~~~~~~~~

### Sound effects

Redundant sound effect callings will be abandoned if the queue is already full.

* `SFX y, hz, tm, ...`: plays a sound effect sequence, can be used with one or more sets of instructions as `SFX y0, hz0, tm0, y1, hz1, tm1, ... yn, hzn, tmn`
	* `y`: waveform type, 1/2/3/4/5 for sine/square/triangle/sawtooth/noise
	* `hz`: frequency
	* `tm`: duration in seconds

Plus 4096 to `y` for interpolating `hz` from current set to the following one's `hz`.

[HOME](#welcome-to-basic8)

## Editors

To edit the properties of a cartridge, right click on it, then click `Properties`.

To cleanup all persistence data of a cartridge, select it, then click `[Head]`, `Cleanup`.

All paletted assets (sprites, tiles, quantized images) in a cartridge share the same palette.

It automatically saves modifications when closing an asset, or closing a cartridge; to close without saving, click `Cartridge`, `Close without saving` with `Shift` pressed.

### Code

Each cartridge has an entry source file "main.bas", it starts execution from there.

To create a new source code file, click `Cartridge`, `New asset`, `Source code`.

To open an existing source code file, click `Cartridge`, `Open asset`, then select a "*.bas" file.

To rename a source code file, click `Cartridge`, `Rename asset`, then select a "*.bas" file.

To delete a source code file, click `Cartridge`, `Delete asset`, then select a "*.bas" file.

### Sprite asset

You can edit colors of palette by right clicking on it.

To create a new sprite asset, click `Cartridge`, `New asset`, `Sprite`.

To open an existing sprite asset, click `Cartridge`, `Open asset`, then select a "*.sprite" asset.

To rename a sprite asset, click `Cartridge`, `Rename asset`, then select a "*.sprite" asset.

To delete a sprite asset, click `Cartridge`, `Delete asset`, then select a "*.sprite" asset.

### Map asset

To create a new map asset, click `Cartridge`, `New asset`, `Map`.

To open an existing map asset, click `Cartridge`, `Open asset`, then select a "*.map" asset.

To rename a map asset, click `Cartridge`, `Rename asset`, then select a "*.map" asset.

To delete a map asset, click `Cartridge`, `Delete asset`, then select a "*.map" asset.

#### Tiles asset

You can edit colors of palette by right clicking on it.

Map assets use a shared tiles asset as reference.

To open and edit a tiles asset, open an existing map asset first, then click `Edit` button on the top-left corner of a map editor.

### Quantized asset

A quantized image is a readonly paletted image. The only way in BASIC8 to create a quantized image is importing from an existing image file, it supports "*.png", "*.bmp" and "*.tga" files.

To create a new quantized image asset, click `Cartridge`, `New asset`, `Quantized image`, then browse and import from a source file.

To open an existing quantized image asset, click `Cartridge`, `Open asset`, then select a "*.quantized" asset.

To rename a quantized image asset, click `Cartridge`, `Rename asset`, then select a "*.quantized" asset.

To delete a quantized image asset, click `Cartridge`, `Delete asset`, then select a "*.quantized" asset.

[HOME](#welcome-to-basic8)

## Basic functions

### Math functions

* `ABS(n)`: gets the absolute value of a number
* `SGN(n)`: gets the sign of a number
* `SQR(n)`: gets the square root of a number
* `FLOOR(n)`: gets the greatest integer not greater than a number
* `CEIL(n)`: gets the least integer not less than a number
* `FIX(n)`: gets the integer format of a number
* `ROUND(n)`: gets the rounded integer of a number
* `SRND(n)`: plants a random seed
* `RND`: gets a random value between [0, 1]
* `RND([lo = 0,] hi)`: gets a random value between [`lo`, `hi`]
* `SIN(n)`: gets the sin value of a number
* `COS(n)`: gets the cos value of a number
* `TAN(n)`: gets the tan value of a number
* `ASIN(n)`: gets the asin value of a number
* `ACOS(n)`: gets the acos value of a number
* `ATAN(n)`: gets the atan value of a number
* `EXP(n)`: gets the exp value of a number
* `LOG(n)`: gets the log(e) value of a number

All trigonometric functions calculate in radians.

### String functions

* `ASC(ch)`: gets the ASCII code of a character
* `CHR(n)`: gets the character of an ASCII code
* `LEFT(txt, n)`: gets a number of characters from the left of a string
* `MID(txt, off, n)`: gets a number of characters from a specific position of a string
* `RIGHT(txt, n)`: gets a number of characters from the right of a string
* `STR(n)`: converts a number to string
* `VAL(txt)`: converts a string to number
* `LEN(txt)`: gets the length of a string

### Data transfer and persistence

Retro BASIC dialects collect data before running a program with the `DATA` transfer statements, and only accepts simple data; BASIC8 really executes a `DATA` statement at runtime and it must appear before calling `READ`, it can also collect advanced data types in BASIC8.

* `DATA ...`: declares some inline data sequence
	* returns total collected count until the last data argument
* `READ ...`: retrieves some inline data to a list of variables
	* returns latest reading position
* `RESTORE [p]`: accepts an indicated target position, or zero as default to go back to the very beginning

Eg:

~~~~~~~~~~bas
DATA 22, 7, 355, 113, "Hello", LIST(1 TO 42)

pos = READ a, b
READ c, d
PRINT a / b; c / d;

RESTORE pos
READ w, x, y, z
PRINT w; x; y; LEN(z);
~~~~~~~~~~

The `PERSIST` statement automatically saves and loads data with variables, all data are persisted on disk. It's helpful to do data saving and loading, such as game progress etc. in a very simple way. It can process with a couple of data types: numbers, strings, collections. It saves the values of variables at program termination, and loads persisted values at running to the same `PERSIST` statements next time.

* `PERSIST ...`: marks some variables as persistence variables, this statement can be only called in the global scope

Eg:

~~~~~~~~~~bas
PERSIST x, y, z
x = x + 1
y = y + 2
z = z + 3
PRINT x, ", ", y, ", ", z;
PERSIST w
PRINT w;
w = LIST(-1, -2, -3)
~~~~~~~~~~

## Libraries

### Asynchronization

Most functions in BASIC8 are executed synchronously, however, some of the functions can be executed asynchronously. Each asynchronous calling returns a task object.

* `ASYNC(task [, callback])`: begins an asynchronous context
	* `task`: an execution invocation
	* `callback(r)`: optional, will be called when the `task` finishing
		* `r`: execution result
	* returns a task object
* `AWAIT(task ...)`: waits for finishing of one or more tasks, only returns after all task(s) are finished

* `COST(task)`: gets the execution time of a task

For task objects:

* `Task.GET()`: gets the execution result, if there was

It supports asynchronously execution, if a function is marked with "**asynchronizable**". For example, `SLEEP(0.5)` can be called asynchronously as:

~~~~~~~~~~bas
task = ASYNC(SLEEP(0.5), LAMBDA (_) (PRINT "Done.";))
AWAIT(task)
PRINT GET(task);
PRINT task;
~~~~~~~~~~

### Archive

* `ZIP()`: creates an archive object with "zip" algorithms
* `Archive.OPEN(path, z)`: opens an archive file
	* `path`: uses the container directory (parent of "content") of a cartridge as lookup root
	* `z`: true for packing, otherwise unpacking
* `Archive.CLOSE()`: closes an archive file

* `Archive.PACK(dst, src)`: **asynchronizable**, packs from a file or byte array
	* `dst`: name in archive
	* `src`: path of a file, or byte array
* `Archive.UNPACK(src, dst)`: **asynchronizable**, unpacks to a file or byte array
	* `src`: name in archive
	* `dst`: path of a file, or byte array
* `Archive.UNPACK_ALL(dir)`: **asynchronizable**, unpacks everything to a directory

* `COMPRESS(bytes)`: **asynchronizable**, compresses a byte array
	* returns a compressed byte array
* `DECOMPRESS(bytes)`: **asynchronizable**, decompresses a byte array
	* returns a decompressed byte array

### Bytes

* `BYTES()`: creates a byte buffer object

* `Bytes.PUSH(val)`: pushes a byte
* `Bytes.POP()`: pops a byte

* `Bytes.PUSH_U8(val)`: pushes a number as 8-bit unsigned integer; all pushing functions increase the size of the buffer
* `Bytes.PUSH_S8(val)`: pushes a number as 8-bit signed integer
* `Bytes.PUSH_U16(val)`: pushes a number as 16-bit unsigned integer
* `Bytes.PUSH_S16(val)`: pushes a number as 16-bit signed integer
* `Bytes.PUSH_INT(val)`: pushes a number as 32-bit signed integer
* `Bytes.PUSH_REAL(val)`: pushes a number as float point
* `Bytes.POP_U8()`: pops a number as 8-bit unsigned integer; all popping functions retrieve data from buffer tail, and decrease the size of the buffer
* `Bytes.POP_S8()`: pops a number as 8-bit signed integer
* `Bytes.POP_U16()`: pops a number as 16-bit unsigned integer
* `Bytes.POP_S16()`: pops a number as 16-bit signed integer
* `Bytes.POP_INT()`: pops a number as 32-bit signed integer
* `Bytes.POP_REAL()`: pops a number as float point
* `Bytes.READ_U8()`: reads a number as 8-bit unsigned integer; all reading functions retrieve data with an automatically increasing cursor from head to tail
* `Bytes.READ_S8()`: reads a number as 8-bit signed integer
* `Bytes.READ_U16()`: reads a number as 16-bit unsigned integer
* `Bytes.READ_S16()`: reads a number as 16-bit signed integer
* `Bytes.READ_INT()`: reads a number as 32-bit signed integer
* `Bytes.READ_REAL()`: reads a number as float point
* `Bytes.END_READ()`: checks whether has read to the end of the buffer

* `Bytes.LEN()`: gets the size in bytes
* `Bytes.GET(i)`: gets the byte at a specific index
* `Bytes.SET(i, val)`: sets the byte at a specific index with a value

### Database

* `DATABASE()`: creates a database object
* `Db.OPEN(path)`: opens a database file
	* `path`: uses the container directory (parent of "content") of a cartridge as lookup root
* `Db.CLOSE()`: closes an opened database

* `Db.HAS_TABLE(tbl)`: checks whether a table exists
	* `tbl`: table name
* `Db.QUERY(sql)`: **asynchronizable**, executes a SQL query
	* `sql`: SQL statement
	* returns queried result
* `Db.EXEC(sql)`: **asynchronizable**, executes a SQL statement
	* `sql`: SQL statement
	* returns execution result

### Date time

* `SLEEP(s)`: **asynchronizable**, sleeps for certain seconds
	* `s`: can be integer or real numbers

* `TICKS()`: gets wall clock independent ticks in milliseconds, relevant to specific hardware cycles or platform ticks

* `NOW([fmt])`: gets the current time in string
	* `fmt`: see following for details

Parameter format of `NOW`:

| Specifier | Replaced by | Example |
|---|---|---|
None | Represent Www Mmm dd hh:mm:ss yyyy | Sat Jun 20 09:29:00 1980
%D | Short MM/DD/YY date | 06/20/80
%F | Short YYYY-MM-DD date | 1980-06-20
%T | ISO 8601 time format (HH:MM:SS) | 14:55:02
%R | 24-hour HH:MM time | 14:55
More... | Refer to [strftime](http://www.cplusplus.com/reference/ctime/strftime/) |

### File

* `FILE()`: creates a file object
* `File.OPEN(path, acc)`: opens a file on disk
	* `path`: uses the container directory (parent of "content") of a cartridge as lookup root
	* `acc`: accessing mark, true for writable, otherwise readonly
* `File.CLOSE()`: closes an opened file

* `File.PEEK_POS()`: gets the accessing position of a file
* `File.POKE_POS(i)`: sets the accessing position of a file
* `File.READ([n])`: reads a byte, or some bytes as text
* `File.READ_LINE()`: reads a line of text
* `File.WRITE(val ...)`: writes one or more values to file
* `File.WRITE_LINE(val)`: writes one value and a newline character `\n` to file

* `File.LEN()`: gets the size of a file in bytes

### GUI

* `MSGBOX(msg)`: shows a message box with some text

### Image

* `IMAGE()`: creates an image object
* `Image.LOAD(val)`: loads an image from a file, or byte array
	* `val`: file path, or byte array
* `Image.SAVE(val, y)`: saves an image to a file, or byte array
	* `val`: file path, or byte array
	* `y`: target type, can be "png", "bmp" or "tga"

* `Image.GET(x, y)`: gets the color of a pixel
* `Image.SET(x, y, col)`: sets the color of a pixel
* `Image.LEN([r])`: gets the count of total pixels, or width, or height of an image
	* `r`: returns total pixels if no argument passed, 0 for width, or 1 for height

### IO

* `GET_DOCUMENT_PATH()`: gets the document path, with writable accessing rights, it is often "C:\Users\YourName\Documents\" on Windows

* `FILE_INFO(path)`: creates a file information object
	* `path`: uses the container directory (parent of "content") of a cartridge as lookup root
* `Fi.READ_ALL()`: reads all content of a file as text
* `Fi.CREATE()`: tries to create a file
* `Fi.PARENT()`: gets the directory information of a file's parent

* `Fi.GET_FULL_PATH()`: returns the full path of a file
* `Fi.GET_PARENT_PATH()`: gets the parent directory path of a file
* `Fi.GET_FILE_NAME()`: gets the file name of a file
* `Fi.GET_EXT_NAME()`: gets the extension name of a file
* `Fi.IS_BLANK()`: checks whether a file is blank

* `Fi.EXIST()`: checks whether a file exists
* `Fi.REMOVE()`: removes a file

* `DIRECTORY_INFO(path)`: creates a directory information object
	* `path`: uses the container directory (parent of "content") of a cartridge as lookup root
* `Dir.CREATE()`: tries to create a directory
* `Dir.PARENT()`: gets the directory information of a directory's parent

* `Dir.GET_FILES([p [, r]])`: gets files in a directory
	* `p`: matching pattern
	* `r`: true for recursive matching
* `Dir.GET_DIRECTORIES([r])`: gets sub directories in a directory
	* `r`: true for recursive matching
* `Dir.GET_FULL_PATH()`: returns the full path of a directory
* `Dir.GET_PARENT_PATH()`: gets the parent directory path of a directory
* `Dir.GET_DIR_NAME()`: gets the directory name of a directory
* `Dir.IS_BLANK()`: checks whether a directory if blank

### JSON

* `JSON()`: creates a JSON object
* `Json.PARSE(txt)`: parses from a JSON string
* `Json.SERIALIZE()`: serializes to a JSON string
	* returns JSON string

* `Json.GET()`: gets BASIC8 objects and values from a JSON object
* `Json.SET()`: sets BASIC8 objects and values to a JSON object

Conversions from JSON values to BASIC8 values, or vice versa:

| JSON | BASIC8 |
|---|---|
Null | NIL
Bool | JSON_BOOL
Number | NUMBER
String | STRING
Array | LIST
Object | DICT (unsorted)

* `FROM_JSON_BOOL(b)`: converts a JSON bool to BASIC8 integer
	* `b`: JSON bool
	* returns "true" or "false"
* `TO_JSON_BOOL(b)`: converts a BASIC8 integer to JSON bool
	* `b`: BASIC8 integer
	* returns JSON bool

### Math

* `PI`: gets the constant PI number

* `MIN(...)`: gets the minimum one among some numbers
* `MAX(...)`: gets the maximum one among some numbers

### OS

It's **not** recommended to use functions marked with "**platform dependent**", to get best compatibility crossing platforms.

* `CPU_CORE_COUNT`: gets the core count of current CPU

* `SHOW_OUTPUT()`: shows the output window
* `GET_APP_DIRECTORY()`: **platform dependent**, gets the directory path of the BASIC8 virtual computer
* `GET_CURRENT_DIRECTORY()`: **platform dependent**, gets current working directory path
* `SET_CURRENT_DIRECTORY(dir)`: **platform dependent**, sets current working directory path
* `SET_CLIPBOARD_TEXT(txt)`: sets the text content of clipboard
* `GET_CLIPBOARD_TEXT()`: gets the text content of clipboard
* `HAS_CLIPBOARD_TEXT()`: checks whether the clipboard is filled with text content
* `OS()`: **platform dependent**, gets the name of current OS
* `SYS(cmd)`: **platform dependent**, executes a system command

### Text

* `LCASE(txt)`: transforms a string to lower case
* `UCASE(txt)`: transforms a string to upper case

* `STARTS_WITH(txt, what, ci = true)`: checks whether a string starts with a sub string
	* `ci`: true for case-insensitive
* `ENDS_WITH(txt, what, ci = true)`: checks whether a string ends with a sub string
	* `ci`: true for case-insensitive

* `FIND(txt, what, off = 0)`: gets the start position of a sub string
	* returns start position, or -1 for not found
* `WILDCARD_FIND(txt, what)`: gets the start position of a sub string with wildcard matching

* `REGEX(text, re)`: performs a regex matching

### Web

* `WEB_REQUEST(url, met = "get" [, f])`: performs an http request
	* `url`: URL to request
	* `met`: request method, can be "get" or "post"
	* `f`: fields for post
	* returns response

## Reserved words

Some words are not implemented for actual functions, yet they are reserved for future. It's suggested to not to use them as identifiers:

* `KILL`
* `CTOR`, `DTOR`
* `LIKE`, `FORMAT`
* `PEEK`, `POKE`
* `GUI`, `BUTTON`, `TEXT`, `MENU`, `MENU_ITEM`
* `NET`, `SOCKET`, `SEND`, `RECV`, `RECEIVE`

[HOME](#welcome-to-basic8)
