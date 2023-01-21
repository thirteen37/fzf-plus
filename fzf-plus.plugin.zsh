#!/usr/bin/env zsh

if (( $+commands[fd] )); then
    local fd_opts="--hidden --exclude .git"
    ## default command
    export FZF_DEFAULT_COMMAND="fd --type f $fd_opts"
    ## ctrl-t: file and directory search
    export FZF_CTRL_T_COMMAND="fd $fd_opts"
    ## alt-c: change directory search
    export FZF_ALT_C_COMMAND="fd --type d $fd_opts"
elif (( $+commands[rg] )); then
    local rg_opts="--hidden --follow --glob '!{.git,node_modules}/**'"
    ## default command
    export FZF_DEFAULT_COMMAND="rg --files $rd_opts"
fi
## ** completions
if [[ -n "$FZF_ALT_C_COMMAND" ]]; then
    _fzf_compgen_dir() {
        eval "$FZF_ALT_C_COMMAND . \"$1\""
    }
fi
if [[ -n "$FZF_DEFAULT_COMMAND" ]]; then
    _fzf_compgen_path() {
        eval "$FZF_DEFAULT_COMMAND . \"$1\""
    }
fi
## ctrl-r: history search
if [[ -z "$FZF_CTRL_R_OPTS" ]]; then
    fzf_ctrl_r_opts+=(
        "--preview='echo {}'"
        "--preview-window='up:3:hidden:wrap'"
        "--color='header:italic'"
        "--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
        "--header 'Press CTRL-Y to copy command into clipboard'"
    )
    export FZF_CTRL_R_OPTS=$(printf '%s\n' "${fzf_ctrl_r_opts[@]}")
fi
## previews
export FZF_PREVIEW=${FZF_PREVIEW:-"fzf-preview {}"}
export FZF_PREVIEW_WINDOW=${FZF_PREVIEW_WINDOW:-":hidden"}
## default options
if [[ -z "$FZF_DEFAULT_OPTS" ]]; then
    fzf_default_opts+=(
        "--layout=reverse"
        "--info=inline"
        "--height=80%"
        "--multi"
        "--preview='${FZF_PREVIEW}'"
        "--preview-window='${FZF_PREVIEW_WINDOW}'"
        "--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'"
        "--prompt='∼ '"
        "--pointer='▶'"
        "--marker='✓'"
        "--bind '?:toggle-preview'"
        "--bind 'ctrl-a:select-all'"
        "--bind 'ctrl-e:execute($EDITOR {+} >/dev/tty)'"
    )
    if (( $+commands[pbcopy] )); then
        # On macOS, make ^Y yank the selection to the system clipboard. On Linux you can alias pbcopy to `xclip -selection clipboard` or corresponding tool.
        fzf_default_opts+=("--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'")
    fi
    export FZF_DEFAULT_OPTS=$(printf '%s\n' "${fzf_default_opts[@]}")
fi
