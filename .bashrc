if [ -t 1 ]; then
	exec zsh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
