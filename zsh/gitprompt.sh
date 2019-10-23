#!/bin/bash

func gitprompt() {

	# Get the name of the current git branch
	# Redirect errors to /dev/null, resulting in an empty string
	BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

	# If the branch name wasn't empty (no error)
	if [ ! -z "$BRANCH" ]; then
		case "$BRANCH" in
			"master") COLOR="yellow";;

			# An initialized repository without any branches returns "HEAD"
			"HEAD") COLOR="magenta";;
			*) COLOR="cyan";;
		esac

		# Start building the prompt
		# start bold, set foreground color as above, and print the branch name
		echo -n "%B%F{$COLOR}( $BRANCH"

		# Check the status of the repository
		# Add 'flags' if line matches certain patterns
		# This could probably be refactored to be more efficient/cleaner
		git status 2>/dev/null | (
			unset dirty deleted untracked newfile ahead renamed
			while read line ; do
				case "$line" in
					*modified:*)                      dirty='!';;
					*deleted:*)                       deleted='x';;
					*'Untracked files:')              untracked='?';;
					*'new file:'*)                    newfile='+';;
					*'Your branch is ahead of '*)     ahead='*';;
					*renamed:*)                       renamed='>';;
				esac
			done
			bits="$dirty$deleted$untracked$newfile$ahead$renamed"
			[ -n "$bits" ] && echo -n " $bits"
		)

		# Check how many commits ahead and behind we are of master
		# TODO - Fix this to check ahead and behind of the *current* branch?
		BEHINDAHEAD=$(git rev-list --left-right --count origin/master..HEAD 2>/dev/null)
		if [ ! -z "$BEHINDAHEAD" ]; then
			B=$(echo "$BEHINDAHEAD" | cut -f 1)
			A=$(echo "$BEHINDAHEAD" | cut -f 2)

			# Add arrows signifying the ahead/behind count
			if [[ $A -gt 0 ]]; then
				echo -n " %F{green}↑ %f$A%F{$COLOR}"	
			fi
			if [[ $B -gt 0 ]]; then
				echo -n " %F{red}↓ %f$B%F{$COLOR}"
			fi
		fi

		# Finish off the prompt
		echo " )%f%b "
	fi
}
