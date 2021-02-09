local print_error="%(?.=>> .%{$fg[red]%}E%? <!--%{$reset_color%} )"
local user_at_host="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[magenta]%}%M%{$reset_color%}"
local cwd="%{$fg[blue]%}<%//>%{$reset_color%}"

function git_status() {
    if [[ ! -z "$(git rev-parse --git-dir 2> /dev/null)" ]]; then
        local prefix
        local changes
        local suffix="]%{$reset_color%}"
        local branch="$(git branch --show-current)"

        if [[ -z "$(git status --porcelain)" ]]; then
            prefix="%{$fg[green]%}["
            changes="(*＾-＾*)"
        else
            prefix="%{$fg[red]%}["
            changes="╰（‵□′）╯"
        fi
        echo "$prefix$branch $changes$suffix"
    fi
}

PROMPT='$print_error$user_at_host::$cwd
%{$fg[yellow]%}%(#.#.$>)%{$reset_color%} '
RPROMPT='$(git_status)'
