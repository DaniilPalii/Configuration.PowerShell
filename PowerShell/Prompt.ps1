# require posh-git module
# dot-source this file in powershell profile file to modify the propmpt

$GitPromptSettings.ShowStatusWhenZero = false

function prompt {
	Write-Host "$(Get-Date -Format H:mm:ss)" -ForegroundColor DarkGray

	$location = (Get-Location).ToString()

	$Host.UI.RawUI.WindowTitle = $location.Length -gt 25 `
		? ($location.Split('\')[-2, -1]) -join '\' `
		: $location

	$gitStatus = Get-GitStatus
	Write-Host "`n$location" -ForegroundColor Blue -NoNewline
	Write-Host "$(Write-GitStatus $gitStatus)"

	if (Test-Admin) {
		Write-Host '❯' -ForegroundColor Yellow -NoNewline
	}

	Write-Host '❯' -ForegroundColor Blue -NoNewline

	return ' '
}
