<!-- Changes are categorized in community, language, driver, libraries, editor. -->

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
* Fix an out of bound bug with pathfinding algorithm
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
* Add a path finding algorithm

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
