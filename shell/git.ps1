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

function glog {
	git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s %Cgreen(%cr)%Creset' --graph --date=relative
}

function gdeploy {
	param([string]$TargetBranch)
	$CurrentBranch = git symbolic-ref HEAD
	$CurrentBranch = $CurrentBranch.split('/')[-1]
	git checkout $TargetBranch
	git merge $CurrentBranch
	git push origin $TargetBranch
	git checkout $CurrentBranch
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

function github {
	$origin = git config --get remote.origin.url
	if ($origin -match "git@github.com:(.+)/(.+)") {
		$url = $origin -replace "git@github.com:(.+)/(.+).git", 'http://github.com/$1/$2'
	} else {
		$url = $origin
	}
	start $url
}