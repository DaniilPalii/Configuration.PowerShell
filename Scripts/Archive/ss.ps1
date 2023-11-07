param (
	[Parameter(ValueFromPipeline)][PSObject[]]$InputObject,
	[Parameter(Position = 0)][string]$ExpandProperty
)

proces {
	$InputObject | Select-String -ExpandProperty $ExpandProperty
}
