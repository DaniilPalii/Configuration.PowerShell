param (
	[string]$Path
)

$item = Get-Item $Path
$itemChildren = Get-ChildItem $item -Force

return $itemChildren.Count -eq 0
