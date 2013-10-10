PROMPT=$'%{$fg[blue]%}%n@%m%{$fg[white]%} [$(~/.rvm/bin/rvm-prompt)]: %{$fg[cyan]%}%~%{$reset_color%}$(git_prompt_info) \
%{$fg[cyan]%}%D{[%H:%M:%S]} %{$reset_color%}$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[gray]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""
