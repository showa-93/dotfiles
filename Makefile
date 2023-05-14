.PHONY: extensions

extensions:
	@code --list-extensions | tail -n +2 > vscode/extensions.txt
	@PowerShell.exe -Command "code --list-extensions"  > vscode/extensions.local.txt
