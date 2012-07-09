function gs {
	git status
}

function ga {
	git add . -u
}

function gp {
	git push
}

function gpo {
	git push origin master
}

function glog {
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
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