function ep {
	subl "$Env:userprofile\Dropbox\Symlinked"
}

# Load editors profile
. "$Env:userprofile\Dropbox\Symlinked\shell\editors.ps1"

# Load git aliases
. "$Env:userprofile\Dropbox\Symlinked\shell\git.ps1"

# Load project finder
# . "$Env:userprofile\Dropbox\Symlinked\shell\project_finder.ps1"
