<!-- Changes are categorized in community, language, driver, libraries, editor, player. -->

### v1.4.8

Language:

* Fixed a crash bug when using an iterator in a conditional expression
* Fixed a crash bug when `MOD` by zero
* Fixed a memory leak with wrong iterator usage

Libraries:

* Added file and directory selection dialogs to the GUI library
* Fixed a crash bug with invalid database value
* Fixed a crash bug with closed archive
* Fixed a memory leak with non-closed archive

### v1.4.7

Language:

* Fixed a multiple disposing bug with lambda
* Fixed a crash bug with incomplete structures
* Fixed a crash bug with unused coroutine

Libraries:

* Added a `FONT` function to customize font face with quantized image for the `TEXT` function
* Added a `POLL` function to poll network events manually
* Fixed a return value overwriting bug with network callback
* Fixed a real number formatting bug with different locales
* Fixed a potential crash bug with network callback
* Fixed a random seeding issue

Editor:

* Added an assets navigation tab, by pressing Ctrl+Tab
* Added shortcut GUI elements to create new disks
* Fixed a number clamp issue with the ranged slider controls
* Fixed a wrong context menu appearance bug by right mouse click

Player:

* Added an option to disable pause on focus lost

### v1.4.6

Driver:

* Fixed a sharp/flat accidental issue with music playing

Libraries:

* Fixed a loop bug with the `PLAY` function
* Fixed a deadlock issue with the `PLAY` function

Editor:

* Added an option to disable invoking the `GET_CLIPBOARD_TEXT()` function
* Added an option to disable invoking the `SYS()` function
* Fixed a real number input bug with different locales

Player:

* Added an option to disable invoking the `GET_CLIPBOARD_TEXT()` function
* Added an option to disable invoking the `SYS()` function

### v1.4.5

Driver:

* Fixed a crash bug with the `LOAD_BLANK` function
* Fixed an audio sampling issue

Libraries:

* Added rotation center specifier to the `SPR`, `SSPR`, `MAP`, `IMG`, `SIMG` functions
* Fixed a crash bug with invalid file accessor
* Fixed potential memory leaks when passing unexpected referenced values to some functions

Editor:

* Fixed a crash of wrong error raised with scriptable plugin
* Fixed a target selection bug with scriptable plugin

Player:

* Added HTML player for web browsers, as experimental

### v1.4.4

Language:

* Added call stack checking to prevent stack overflow

Libraries:

* Fixed a directory path splitting bug
* Fixed an unzipping bug with sub directories

Editor:

* Fixed a crash bug with invalid font setting

Player:

* Fixed a crash bug if error occurs at parsing time

### v1.4.3

Language:

* Fixed a crash bug in invalid conditional expression with class member
* Fixed a wrong error with the `VAL` statement

Libraries:

* Added a `TRITEX` function to draw textured triangles
* Fixed a pointing issue on touch screen with the `TOUCH` function
* Fixed a matching issue with regex

Editor:

* Added an onscreen gamepad
* Fixed a pointing issue on touch screen
* Fixed a quitting bug when paused a running disk

### v1.4.2

Editor:

* Changed cursor drawing to always use system's way
* Fixed a crash bug with plugin missing

Player:

* Fixed a termination issue with the `END` statement
* Fixed a termination issue with errors

### v1.4.1

Libraries:

* Added a rotate parameter to the `MAP` function
* Added JPG support to the image library

Editor:

* Added a scriptable plugin mechanism to paintable editors
* Added JPG support to the quantized editor
* Fixed a range selection bug with paintable assets
* Fixed an Enter key handling issue on numeric pad in the code editor

### v1.4 Apr. 2018

Driver:

* Added a switch of automatic frame buffer clearing
* Fixed a state checking bug with right mouse click
* Fixed an accuracy issue with the `TOUCH` function

Libraries:

* Added a `CLS` function to clear frame buffer manually
* Added a `SET_CLEARER` function to set the switch of automatic frame buffer clearing
* Fixed a termination issue with music

### v1.3.4

Language:

* Fixed a boolean evaluating bug with library object

Libraries:

* Added an ID type to sound effect
* Added a `WAVE` type to prefab sound effect
* Added functionality to play prefab sound effect with wave object to the `SFX` function
* Added a `STOP` function to stop any audio

Editor:

* Added an option to surf Steam pages using internal browser
* Added a welcome page
* Added a frame cache to the sprite editor
* Fixed a tag setting bug with undo operation in the sprite editor
* Fixed a preview issue with inactive map layers
* Fixed an unsaved state issue with new created assets

### v1.3.3

Driver:

* Added an initialization procedure of the `TICKS` base to the boot program

Libraries:

* Added error prompt to the `PERSIST` function
* Added return value to the `OPEN`, and `CLOSE` functions of the archive library
* Added return value to the `OPEN`, and `CLOSE` functions of the database library
* Added return value to the `OPEN`, and `CLOSE` functions of the file library
* Added return value to the `OPEN`, and `CLOSE` functions of the network library

### v1.3.2

Editor:

* Added an outline view to the code editor
* Fixed a text finding issue with whitespace

### v1.3.1

Libraries:

* Fixed a blank content issue with the `INPUT` statement

Editor:

* Added a disk filter
* Added a sprite to GIF exporter
* Fixed a GIF exporting issue with few color count at the beginning frame
* Fixed an icon arranging issue

### v1.3 Mar. 2018

Libraries:

* Added a network library
* Fixed popping issues with the bytes library

Editor:

* Fixed a key retrieving bug with input config
* Fixed a program locating issue with long path

Player:

* Added native player for desktop systems, as experimental

### v1.2.3

Added Linux version.

Language:

* Fixed a GC bug with the ranged `FOR` statement
* Fixed a string assignment issue with class member
* Fixed a termination issue with the `END` statement

Driver:

* Added fixed function pipeline

Libraries:

* Added a `COPY_TO` to the file information library
* Fixed a path resolving bug of file and directory with UTF-8 character
* Fixed a crash bug with path concatenating
* Fixed a packing issue for existing package with the archive library

Editor:

* Added automatic arranging feature to editor windows
* Added a modification indicator to the code editor
* Changed large quantized image to readonly, with configurable threshold
* Fixed a crash bug with undo operation in the code editor
* Fixed an execution issue with large entry code

### v1.2.2

Added MacOS version.

Editor:

* Changed the scale item into the expendable bar
* Fixed an error marking bug when importing another source code
* Fixed some text finding issues in the code editor
* Fixed a rendering issue with blank source code

### v1.2.1

Driver:

* Fixed a frame buffer filling issue

Libraries:

* Added a `RESIZE` function to the image library
* Fixed an accessing bug with the `PGET` function

Editor:

* Fixed a string literal issue with uppercase
* Fixed some coloring issues with syntax highlighting

### v1.2 Feb. 2018

Libraries:

* Fixed a vector calculation bug

Editor:

* Added syntax highlighting feature to the code editor
* Added navigation methods in the code editor
* Added default license to prebuilt source code
* Fixed a crash bug when switching to layer 0 of a map, with invalid tool selected

### v1.1.2

Language:

* Fixed a crash bug with invalid collection index
* Fixed a memory leak with invalid invoking

Libraries:

* Added a loading option to the `LOAD_BLANK` for quantized image
* Added `TRI`, `TRIFILL` functions to draw triangles
* Added `QUAD`, `QUADFILL` functions to draw quadrangles
* Added `IGET`, `ISET` functions to access quantized image
* Added a new constructor to `VEC2`
* Fixed a palette color setting issue
* Fixed a color interpolation bug

Editor:

* Added an editor for quantized image

### v1.1.1

Libraries:

* Changed IO functions to return uniformed separator
* Fixed an out of bound bug with the pathfinding algorithm
* Fixed a wrong loading bug of map assets if tiles missing

Editor:

* Changed disk overwriting to put files and directories into recycle bin

### v1.1 Jan. 2018

Community:

* Added tools for Steam Workshop

Language:

* Fixed a parsing bug with the unary negative operator
* Fixed a real number parsing bug with different locales

Libraries:

* Added non-referenced vector and matrix data types, with operators and functions
* Added a pathfinding algorithm

Editor:

* Added indicator of unsaved file
* Added a dedicated file type for customized data
* Fixed a running issue under offline mode with Steam

### v1.0 Jan. 2018

Added Windows version. First release with features including:

* Added a BASIC programming language
* Added programming interfaces
* Added GUI based shell
* Added graphics primitives
* Added input functions
* Added audio functions
