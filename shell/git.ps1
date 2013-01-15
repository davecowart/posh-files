function gs {
	git status -s
}

function gst {
	git status
}

function ga {
	git add . -u
}

function gp {
	git push
}

function gpo {
	git push origin
}

function gb {
	git branch
}

function glog {
	git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s %Cgreen(%cr)%Creset' --graph --date=relative
}

function dqa {
	git fetch origin
	git checkout master
	git pull origin master
	git checkout qa
	git pull origin qa
	git merge master
	git push origin qa
	git checkout master
}

function duat {
	git fetch origin
	git checkout master
	git pull origin master
	git checkout uat
	git pull origin uat
	git merge master
	git push origin uat
	git checkout master
}

function gdeploy {
	gpo
	dqa
	duat
}

function github {
	$origin = git config --get remote.origin.url
	if ($origin -match "git@github.com:(.+)/(.+)") {
		$url = $origin -replace "git@github.com:(.+)/(.+).git", 'http://github.com/$1/$2'
	} else {
		$url = $origin
	}
	start $url
}

function Git-CompareBranchesMerged {
  if ($args.Count -ne 2) {
    "Usage: Git-CompareBranchesMerged branch1 branch2"
    "This will list branches merged into branch1 which are not in branch2"
    return
  }
  "Listing branches in $($args[0]) which are not in $($args[1])"
  $merged1 = git branch -a --merged $args[0] | foreach { $_ -replace "remotes/origin/" -replace " " } | sort | unique
  $merged2 = git branch -a --merged $args[1] | foreach { $_ -replace "remotes/origin/" -replace " " } | sort | unique
  $currentColor = $Host.UI.RawUI.ForegroundColor
  $Host.UI.RawUI.ForegroundColor = [System.ConsoleColor]"Red"
  $branch1 = $args[0]
  $merged1 | foreach {
    $line1 = $_
    $found = [Boolean]($merged2 | where { $_ -eq $line1 })
    if (-not $found -and $line1 -replace " " -ne $branch1) {
      $line1 = $line1 -replace "remotes/origin/"
      "->  $line1"
    }
  }
  $Host.UI.RawUI.ForegroundColor = $currentColor
}
Set-Alias gcbm Git-CompareBranchesMerged