# Create file
$logDirectoryPath = 'D:\Code\Logs'
$fileNameDateTime = Get-Date -Format 'yyyy-MM-dd hh-mm'
$fileName = "$logDirectoryPath\Record $fileNameDateTime.txt"
New-Item $fileName | Out-Null

# Open editor
Start-Process -FilePath notepad -ArgumentList $fileName -Wait

$content = Get-Content $fileName

if ($content) {
	# Add date title to file
	$titleDateTime = Get-Date -Format 'h:mm, dddd, dd MMMM yyyy'
	Set-Content -Path $fileName -Value $titleDateTime, '', $content

	# Add file to archive
	7z a "$logDirectoryPath\Logs.7z" $fileName -mhe

	Write-Output 'Record logged'
}

Remove-Item $fileName
