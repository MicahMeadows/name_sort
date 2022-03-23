# CSC 499 - Alex Assignments

## Assignment
Write a command-line based program to sort the contents of a file.

#### __Options:__
1. Normal (Sort by largest length, the alphabetical)
2. Reversed (Sort by smallest length, then reversed alphabetical)

---

## Goals
- Implement a command line application.
- It must run on linux.
- It must take input of a list of names from files or stdin
- It must sort these names, first by size ascending, second in alphabetical order
- It must output a sorted list of names to std out or a file

---

## What I Learned
 - Learned how to dual boot Linux(Ubuntu) along side Windows
 - Learned how to navigate a linux environment
 - First experience with raw dart
 - Learned how to read and write to files in dart
 - First experience using Markdown

 ---

## Instructions for running program:

 __Required:__
  - Linux environment
  - Flutter depends on these cli tools to operate if there is an issue
     with the install ensure these are available.
     (bash, curl, file, git, mkdir, rm, unzip, which, xz-utils, zip)

---

### __PART 1:__ _Dart sdk install (linux):_
 option1: install flutter sdk. this includes dart sdk and is less steps
  - run command `$ sudo snap install flutter --classic` in terminal 
  - run command `$ flutter sdk-path` to view path where flutter was installed

 option2: install only dart sdk.
  - follow steps at 'https://dart.dev/get-dart'

---

### __PART 2:__ _Navigate to directory_
 - navigate to /name_sort directory

---

### __PART 3:__ _Execute program_ 
1. __option1:__ _Run in dart VM_
  * by running in dart vm the code will only compile new and changed files
    they will be run using jit compilation in order to ensure fast compile 
    times during development.)
    - run command `$ dart run`
    - this will jit run the .dart file that is in the bin folder.

2. __option2:__ _compile and run_
  * by compiling to exe we will convert the dart code into machine code with
    aot compilation. this is better for production code as it is faster while
    running.
    - run command `$ dart compile exe bin/name_sort.dart` to aot compile to executable
    - run command `$ bin/name_sort.exe` to execute executable program 

---

### ___PART 4:__ Using the program_
After running the program you will face a few menus.
1. __Select the type of input.__
   * _Standard input_ (this will allow you to write your own list to sort)
   * _Data from file_ (this will take data from the file defined in the repository, defaults to 'Sort Me.txt' in assets folder)
2. __Select sort type.__
   * _Normal_ (This will first sort by shortest word, then alphabetically)
   * _Reversed_ (This will first sort by longest word, then reverse alphabetically)
3. __Select the type of output.__
   * _Standard output_ (This will output to the command line)
   * _Generated file_ (This will output to the results file. If there is no results file, one will be made. There will be an id appended to the end of the file. The command line will tell you which file was generated.)

---

### __PART 5__ ___(Optional):__ Changing names list_
 - change list of names by either changing contents of 'asset/Sort Me.txt'
   or replacing file and make sure to update the FileRepository path in 'name_sort.dart' 
   if the name of the new file is different. then recompile or re run in dart vm

