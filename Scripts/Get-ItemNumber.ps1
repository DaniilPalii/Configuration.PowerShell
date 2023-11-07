param (
	$Items
)

return (Measure-Object -InputObject $Items).Count
