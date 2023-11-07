# Create file
$logDirectoryPath = 'D:\Code\Logs'
$fileName = "$logDirectoryPath\Logs.7z"

# Unzip all
$extractedLogName = "$logDirectoryPath\Logs"
Invoke-Expression "7z x '$fileName' -o'$extractedLogName'"

# Open editor
code $extractedLogName --new-window --wait

Remove-Item $extractedLogName -Force -Recurse
