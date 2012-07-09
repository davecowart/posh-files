function gt {
	param([string]$Name)
	$ProjectsDir = ""
	$term = "*$Name*.sln"
	if(test-path D:\Projects) {
		$ProjectsDir = "D:\Projects"
	} elseif(test-path C:\Projects) {
		$ProjectsDir = "C:\Projects"
	} else {
		Write-Host "Not found"
	}
	$solutionDirs = @(gci $ProjectsDir $term -recurse | Select-Object Directory)
	if($solutionDirs.length -eq 1) {
		# vso $ProjectsDir + $solutionDirs[0]
		# cd $ProjectsDir + $solutionDirs[0]
		Write-Host "$ProjectsDir\$solutionDirs"
	} else {
		$length = $solutionDirs.length
		Write-Host "Be more specific (found $length possibilities)"
	}
}