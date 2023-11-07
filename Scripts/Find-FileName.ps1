param (
	[string]$Pattern
)

Find-Item $Pattern | Resolve-Path -Relative
