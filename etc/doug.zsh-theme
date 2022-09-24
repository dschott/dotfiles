PROMPT=$'
%(?, ,❗)%{$fg[red]%}[%{$fg[cyan]%}%n@%m%{$fg[red]%}] %T %~ $(git_prompt_info)$(bzr_prompt_info)
%{$fg_bold[black]%}>%{$reset_color%} '

PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"

ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=")%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=")%{$reset_color%}"
