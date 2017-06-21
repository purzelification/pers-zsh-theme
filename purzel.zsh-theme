# Code taken from github.com/Parth/dotfiles. His config is awesome, so check it out!

autoload -U colors && colors
setopt PROMPT_SUBST

set_prompt() {
    # ERROR CODES
    PS1="[%(?.%{$fg[green]%}%?%{$reset_color%}.%{$fg[red]%}%?%{$reset_color%})"
    # shorten paths like /home/user/Documents to user/Documents
    PS1+=" %{$fg[cyan]%}$(pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_)%{$reset_color%}"
    # get current git branch and number of changed files
    if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
		PS1+=" %{$fg[blue]%}$(git rev-parse --abbrev-ref HEAD)%{$reset_color%}"
		if [ $(git status --short | wc -l) -gt 0 ]; then
			PS1+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
		fi
	fi

    PS1+="]"
}

precmd_functions+=set_prompt
