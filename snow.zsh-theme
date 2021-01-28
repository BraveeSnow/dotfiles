local print_error="%(?.=>> .%{$fg_bold[red]%}E%? <!--%{$reset_color%} )"
local user_at_host="%{$fg_bold[cyan]%}%n%{$reset_color%}@%{$fg_bold[magenta]%}%M%{$reset_color%}"
local cwd="%{$fg_bold[blue]%}<%//>%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" (changes made)"
ZSH_THEME_GIT_PROMPT_CLEAN=" ( up-to-date )"

function git_status() {
    if [[ ! -z $(git_prompt_info) ]]; then
        if [[ -z "$(git status --porcelain)" ]]; then
            ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}["
        else
            ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}["
        fi
        echo "$(git_prompt_info)"
    fi
}

PROMPT='$print_error$user_at_host::$cwd
%{$fg[yellow]%}%(#.#.$>)%{$reset_color%} '
RPROMPT='$(git_status)'
