CSC 499 Homework 1

Instructions for running program:

prerequisit:
  - tutorial is for linux devices
  - flutter depends on these cli tools to operate if there is an issue
     with the install ensure these are available.
     (bash, curl, file, git, mkdir, rm, unzip, which, xz-utils, zip)

#########################################################################################

part 1: dart sdk install (linux):
 option1: install flutter sdk. this includes dart sdk and is less steps
  - run command '$ sudo snap install flutter --classic' in terminal 
  - run command '$ flutter sdk-path' to view path where flutter was installed

 option2: install only dart sdk.
  - follow steps at 'https://dart.dev/get-dart'

##########################################################################################

part 2: Navigate to directory
 - navigate to /name_sort directory

##########################################################################################

part 3: Execute program 
   option1: Run in dart VM
     * by running in dart vm the code will only compile new and changed files
       they will be run using jit compilation in order to ensure fast compile 
       times during development.)
       - run command '$ dart run'
       - this will jit run the .dart file that is in the bin folder.

 - options2: compile and run 
     * by compiling to exe we will convert the dart code into machine code with
       aot compilation. this is better for production code as it is faster while
       running.
       - run command '$ dart compile exe bin/name_sort.dart' to aot compile to executable
       - run command '$ bin/name_sort.exe' to execute executable program 

##########################################################################################

part 4 (optional): changing list of names
 - change list of names by either changing contents of 'asset/Sort Me.txt'
   or replacing file and make sure to update the FileRepository path in 'name_sort.dart' 
   if the name of the new file is different. then recompile or re run in dart vm

##########################################################################################

Finish
