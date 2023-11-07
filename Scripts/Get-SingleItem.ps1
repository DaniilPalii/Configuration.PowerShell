param (
	$Collection,
	[string]$ItemName = 'item'
)

$collectionLength = Get-ItemNumber $Collection

if ($collectionLength -gt 1) {
	throw "There are more than 1 ($collectionLength) ${ItemName}: $Collection"
}

if ($collectionLength -lt 1) {
	throw "There is no $ItemName"
}

return $Collection
