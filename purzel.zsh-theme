local ret_status="%(?:%{$fg_bold[green]%?%} :%{$fg_bold[red]%?%} )"
function collapse_pwd {
    echo $(pwd |rev| awk -F / '{print $1,$2}' | rev | sed s_\ _/_)
}
function git_info {
    if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true'; then
        STR="%{$fg[blue]%}$(git rev-parse --abbrev-ref HEAD)%{$reset_color%}"
        if [ $(git status --short | wc -l) -gt 0 ]; then
            STR+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
        fi
    fi
    echo $STR
}
PROMPT='[${ret_status} %{$fg[cyan]%}$(collapse_pwd) %{$reset_color%}$(git_info)] '
