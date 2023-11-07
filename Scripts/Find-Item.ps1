param (
	[string]$Pattern
)

Get-ChildItem -Recurse -Filter $Pattern
