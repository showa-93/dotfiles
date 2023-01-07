.PHONY: extensions

extensions:
	@code --list-extensions | tail -n +2 > vscode/extentions.txt
