set projectPath to "/path/to/project/folder"
set projectURL to "http://localhost:3000"

# Launch iTerm
tell application "iTerm"
	activate
	
	set myterm to (make new terminal)
	tell myterm
		
		## Open tab for Nodemon to monitor current project
		launch session "Nodemon"
		tell the last session to write text "cd " & projectPath
		tell the last session to write text "nodemon"
		
		## Open tab to start Jekyll server
		set jekyllSource to "/source"
		launch session "Jekyll"
		tell the last session to write text "cd " & projectPath & jekyllSource
		tell the last session to write text "jekyll --server"
		
		## Open tab for Compass to monitor SASS directory
		set sassSource to "/source/_sass"
		launch session "SASS"
		tell the last session to write text "cd " & projectPath & sassSource
		tell the last session to write text "compass watch --poll"
		
		## Open tab for project directory
		launch session "Project"
		tell the last session to write text "cd " & projectPath
		
	end tell
end tell

## Open the project directory in Finder
tell application "Finder" to open (projectPath as POSIX file)

## Open the project directory in Sublime Text 2
set sublimeSubfolder to ""
tell application "Sublime Text 2" to open projectPath & sublimeSubfolder

## Launch project in Google Chrome
tell application "Google Chrome"
	activate
	
	## Open project URL in a new window
	make new window
	tell window 1 to set active tab's URL to projectURL
	
	## Open project URL in a new tab in current window
	tell window 1 to make new tab with properties {URL:projectURL}
	
end tell