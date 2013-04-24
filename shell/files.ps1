function killex {
	param([string]$extension)
	Get-ChildItem -Rec | Where {$_.Extension -match "$extension"} | Remove-Item
}

function touch {
	set-content -Path ($args[0]) -Value ($null)
}