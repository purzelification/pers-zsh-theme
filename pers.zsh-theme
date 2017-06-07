local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%?%} )"
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(collapse_pwd) $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
