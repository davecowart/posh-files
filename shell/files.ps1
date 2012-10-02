function killex {
	param([string]$extension)
	Get-ChildItem -Rec | Where {$_.Extension -match "$extension"} | Remove-Item
}