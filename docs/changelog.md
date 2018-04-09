<!-- Changes are categorized in community, language, driver, libraries, editor. -->

### v1.4 Apr. 2018

Driver:

* Add a switch of automatic frame buffer clearing
* Fix a state checking bug with right mouse click
* Fix an accuracy issue with the `TOUCH` function

Libraries:

* Add a `CLS` function to clear frame buffer manually
* Add a `SET_CLEARER` function to set the switch of automatic frame buffer clearing
* Fix a termination issue with music

### v1.3.4

Language:

* Fix a boolean evaluating bug with library object

Libraries:

* Add an ID type to sound effect
* Add a `WAVE` type to prefab sound effect
* Add functionality to play prefab sound effect with wave object to the `SFX` function
* Add a `STOP` function to stop any audio

Editor:

* Add an option to surf Steam pages using internal browser
* Add a welcome page
* Add a frame cache to the sprite editor
* Fix a tag setting bug with undo operation in the sprite editor
* Fix a preview issue with inactive map layers
* Fix an unsaved state issue with new created assets

### v1.3.3

Driver:

* Add an initialization procedure of `TICKS` base to the boot program

Libraries:

* Add error prompt to the `PERSIST` function
* Add return value to the `OPEN`, and `CLOSE` functions of the archive library
* Add return value to the `OPEN`, and `CLOSE` functions of the database library
* Add return value to the `OPEN`, and `CLOSE` functions of the file library
* Add return value to the `OPEN`, and `CLOSE` functions of the network library

### v1.3.2

Editor:

* Add an outline view to the code editor
* Fix a text finding issue with whitespace

### v1.3.1

Libraries:

* Fix a blank content issue with the `INPUT` statement

Editor:

* Add a disk filter
* Add a sprite to GIF exporter
* Fix a GIF exporting issue with few color count at the beginning frame
* Fix an icon arranging issue

### v1.3 Mar. 2018

Libraries:

* Add a network library
* Fix popping issues with the bytes library

Editor:

* Fix a key retrieving bug with input config
* Fix a program locating issue with long path

### v1.2.3

Add Linux version.

Language:

* Fix a GC bug with ranged `FOR` statement
* Fix a string assignment issue with class member
* Fix a termination issue with the `END` statement

Driver:

* Add fixed function pipeline

Libraries:

* Add a `COPY_TO` to the file information library
* Fix a path resolving bug of file and directory with UTF-8 character
* Fix a crash bug with path concatenating
* Fix a packing issue for existing package with the archive library

Editor:

* Add automatic arranging feature to editor windows
* Add a modification indicator to the code editor
* Change large quantized image to readonly, with configurable threshold
* Fix a crash bug with undo operation in the code editor
* Fix an execution issue with large entry code

### v1.2.2

Add MacOS version.

Editor:

* Change the scale item into the expendable bar
* Fix an error marking bug when importing another source code
* Fix some text finding issues in the code editor
* Fix a rendering issue with blank source code

### v1.2.1

Driver:

* Fix a frame buffer filling issue

Libraries:

* Add a `RESIZE` function to the image library
* Fix an accessing bug with the `PGET` function

Editor:

* Fix a string literal issue with uppercase
* Fix some coloring issues with syntax highlighting

### v1.2 Feb. 2018

Libraries:

* Fix a vector calculation bug

Editor:

* Add syntax highlighting feature to the code editor
* Add navigation methods in the code editor
* Add default license to prebuilt source code
* Fix a crash bug when switching to layer 0 of a map, with invalid tool selected

### v1.1.2

Language:

* Fix a crash bug with invalid collection index
* Fix a memory leak with invalid invoking

Libraries:

* Add a loading option to `LOAD_BLANK` for quantized image
* Add `TRI`, `TRIFILL` functions to draw triangles
* Add `QUAD`, `QUADFILL` functions to draw quadrangles
* Add `IGET`, `ISET` functions to access quantized image
* Add a new constructor to `VEC2`
* Fix a palette color setting issue
* Fix a color interpolation bug

Editor:

* Add an editor for quantized image

### v1.1.1

Libraries:

* Change IO functions to return uniformed separator
* Fix an out of bound bug with the pathfinding algorithm
* Fix a wrong loading bug of map assets if tiles missing

Editor:

* Change disk overwriting to put files and directories into recycle bin

### v1.1 Jan. 2018

Community:

* Add tools for Steam Workshop

Language:

* Fix a parsing bug with the unary negative operator
* Fix a real number parsing bug with different locales

Libraries:

* Add non-referenced vector and matrix data types, with operators and functions
* Add a pathfinding algorithm

Editor:

* Add indicator of unsaved file
* Add a dedicated file type for customized data
* Fix a running issue under offline mode with Steam

### v1.0 Jan. 2018

Add Windows version. First release with features including:

* Add a BASIC programming language
* Add programming interfaces
* Add GUI based shell
* Add graphics primitives
* Add input functions
* Add audio functions
