# https://github.com/rehnarama/pwsh-git-completion/blob/main/pwsh-git-completion.psm1

Register-ArgumentCompleter -Native -CommandName git, g -ScriptBlock `
{
	param(
		$wordToComplete,
		$commandAst,
		$cursorPosition)

	$wholeCommand = $commandAst.ToString()
	$words = $wholeCommand -split '\s+'
	$command = $words | Select-Object -Index 1

	if ($wordToComplete -match '^-')
	{
		$flags = (git $command -h 2>&1 | Select-String -Pattern '(?<= {4})(-{1,2}(?:\w+)(?:(?:-\w+)+)?)(?:, )?(-{1,2}(?:\w+)(?:(?:-\w+)+)?)?').Matches | ForEach-Object { $_.Groups | Where-Object { $_.Success -and $_.Name -ne 0 } } | ForEach-Object { $_.Value }

		return $flags -like "$wordToComplete*"
	}
	elseif ($command -eq 'add')
	{
		$addableFiles = @(git ls-files --others --exclude-standard -m)
		$alreadyAddedFiles = @($words | Select-Object -Skip 2)
		$notAddedYetFiles = $addableFiles | Where-Object { $_ -notIn $alreadyAddedFiles }

		return $notAddedYetFiles -like "*$wordToComplete*"
	}
	elseif ($command -eq 'rm')
	{
		$removableFiles = git ls-files

		return $removableFiles -like "*$wordToComplete*"
	}
	elseif ($command -eq 'restore')
	{
		$restorableFiles = git ls-files -m

		return $restorableFiles -like "*$wordToComplete*"
	}
	elseif ($command -in 'checkout', 'rebase')
	{
		$switchableBranches = git branch -a --format '%(refname:lstrip=2)'

		return $switchableBranches -like "*$wordToComplete*"
	}
	elseif ($command -in 'switch', 'branch', 'b')
	{
		$switchableBranches = @(git branch --format '%(refname:lstrip=2)') + @(git branch -r --format '%(refname:lstrip=3)')

		return $switchableBranches -like "*$wordToComplete*"
	}
	else
	{
		$gitCommands = (git --list-cmds=main,others,alias,nohelpers) # list-cmds should not contain spaces

		return $gitCommands -like "$wordToComplete*"
	}
}