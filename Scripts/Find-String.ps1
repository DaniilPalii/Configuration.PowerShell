param (
	[string]$Pattern
)

Get-ChildItem -Recurse | Select-String $Pattern
