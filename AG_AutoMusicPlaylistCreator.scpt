on adding folder items to this_folder after receiving added_items
	-- Get the current date and time
	set currentDate to current date
	set formattedDate to do shell script "date '+%Y-%m-%d %H:%M:%S'"
	
	-- Create a playlist with the formatted date and time as the title
	tell application "Music"
		activate
		set newPlaylist to make new playlist with properties {name:formattedDate}
	end tell
	
	-- Loop through the added items and process them
	repeat with anItem in added_items
		set itemPath to POSIX path of anItem
		process_item(itemPath, newPlaylist)
	end repeat
	
	-- Confirm the playlist creation
	display dialog "Playlist '" & formattedDate & "' created successfully with the audio files added!"
end adding folder items to

-- Define a recursive handler to process folders and files
on process_item(itemPath, newPlaylist)
	set isDir to do shell script "test -d " & quoted form of itemPath & " && echo 'yes' || echo 'no'"
	
	-- If the item is a folder, process its contents recursively
	if isDir is "yes" then
		set folderContents to list folder itemPath without invisibles
		repeat with subItem in folderContents
			-- Construct the full path of the subItem
			set subItemPath to (itemPath & "/" & subItem)
			process_item(subItemPath, newPlaylist) -- Recursively process folder contents
		end repeat
	else
		-- Process the file if it’s an audio file
		set fileExtension to do shell script "echo " & quoted form of itemPath & " | sed 's/.*\\.//' | tr '[:upper:]' '[:lower:]'"
		
		if (fileExtension is in {"mp3", "m4a", "flac", "wav", "aiff"}) then
			tell application "Music"
				try
					-- Convert the POSIX path to an alias
					set itemAlias to POSIX file itemPath as alias
					
					-- Add the audio file to the Music library
					set newTrack to add itemAlias
					
					-- Add the new track to the newly created playlist
					duplicate newTrack to newPlaylist
				end try
			end tell
		end if
	end if
end process_item
