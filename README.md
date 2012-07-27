# Workspace Setup

A base AppleScript file which can be modified to open relevant programs and folders for individual projects.

## Current Features

Once a path to a project folder has been set, the script can:

* Open iTerm to project directory
* Run nodemon using iTerm
* Start a Jekyll server using iTerm
* Start Compass to watch and complie SASS files
* Open the project directory in Finder
* Open the project directory in Sublime Text 2
* Open the project URL in Chrome in a new tab or window

Many more things are available for automation – feel free to request features or submit your own.

## Usage

To use, make a copy of the file, set the project's base directory and optional URL, then delete any features which aren't required.

There are multiple ways to run this AppleScript:

* Set up individual projects as extensions in [Alfred.app](http://www.alfredapp.com/), which can then be triggered with a keyword.

* Set up individual projects as stand-alone Mac apps using Automater (choose 'Application', then 'Run Applescript', add the modified script, then save).

* Using Apple's default AppleScript Editor.