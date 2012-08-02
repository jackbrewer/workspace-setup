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

		## Open tab for HTTP-Server to access compiled site on localhost:8080
		launch session "HTTP-Server"
		set httpServerSource to "/"
		tell the last session to write text "cd " & projectPath & httpServerSource
		tell the last session to write text "http-server"

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

## Launch Project URL in Google Chrome
## Refreshes tab if it already exists, otherwise it creates one
tell application "Google Chrome Canary"
	activate

	## If there are no windows, chances are the app is closed, so delay a couple of seconds
	## to give it chance to activate so we can count tabs.
	if (count every window) = 0 then
		delay 2
	end if

	## If there really were no windows, create one.
	if (count every window) = 0 then
		make new window
	end if

	## Search for any tab that already has the Project URL open
	set found to false
	set theTabIndex to -1
	repeat with theWindow in every window
		set theTabIndex to 0
		repeat with theTab in every tab of theWindow
			set theTabIndex to theTabIndex + 1
			if theTab's URL = projectURL then
				set found to true
				exit repeat
			end if
		end repeat

		if found then
			exit repeat
		end if
	end repeat

	if found then
		## If the Project URL tab is already open, refresh and bring it to the front
		tell theTab to reload
		set theWindow's active tab index to theTabIndex
		set index of theWindow to 1
	else
		## If the project URL tab isn't already open:

		## create a new tab for it
		tell window 1 to make new tab with properties {URL:projectURL}

	end if
	activate

end tell