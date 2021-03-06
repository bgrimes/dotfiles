#!/usr/bin/env osascript

tell application "System Events"
	set process_list to (name of every process)
end tell

set output to {}

if process_list contains "Adium" then
	tell application "Adium"
		repeat with aChat in chats
			if unread message count of aChat is not equal to 0 then
				set contactName to display name of first contacts where id is id of aChat
				set contactName to word 1 of contactName
				set messageCount to unread message count of aChat
				set output to output & { contactName & ": " &  messageCount }
			end if
		end repeat
	end tell
end if

to joinList(aList, delimiter)
	set retVal to ""
	set prevDelimiter to AppleScript's text item delimiters
	set AppleScript's text item delimiters to delimiter
	set retVal to aList as string
	set AppleScript's text item delimiters to prevDelimiter
	return retVal
end joinList

joinList(output, " ")
