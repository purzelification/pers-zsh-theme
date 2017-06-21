function ret_status {
    return "%(?.%{$fg[green]%}%?%{$reset_color%}.%{$fg[red]%}%?%{$reset_color%})"
}

PROMPT="[$(ret_status)]"
