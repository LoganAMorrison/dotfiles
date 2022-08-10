set -U fish_greeting
set TERM alacritty

fish_add_path -m ~/.local/bin
fish_add_path -m ~/.npm-global/bin
fish_add_path -m ~/.local/share/gem/ruby/3.0.0/bin
fish_add_path -m ~/go/bin
fish_add_path -m ~/.emacs.d/bin/
#fish_add_path ~/.ghcup/bin


# ========================
# ----- Env Variables ----
# ========================

# set -Ux LIBRARY_PATH /usr/lib /usr/local/lib
# set includepath /usr/include /usr/local/include /usr/include/c++/11.1.0
# set -Ux C_INCLUDE_PATH $includepath 
# xset -Ux CPLUS_INCLUDE_PATH $includepath 
# set -Ux CPATH $includepath  /usr/include/python3.9

# set -Ux SECDEC_CONTRIB /home/logan/heptools/pySecDec-1.4.5/
# set -Ux PYTHONPATH /home/logan/heptools/pySecDec-1.4.5/pySecDec-1.4.5:$PYTHONPATH
set -Ux JULIA_NUM_THREADS 24
set -Ux MYPYPATH /home/logan/.local/stubs/
set -Ux PYTHONPATH /home/logan/heptools/pythia8306/lib $PYTHONPATH
# set -Ux XLA_PYTHON_CLIENT_MEM_FRACTION 0.6
set -Ux XLA_FLAGS --xla_gpu_strict_conv_algorithm_picker=false

# ===================
# ----- Manpager ----
# ===================

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"


# ====================
# ----- Functions ----
# ====================

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

function lvim_update --description 'Update LunarVim'
    echo Updating LunarVim...
    set lvimdir ~/.local/share/lunarvim/lvim/
    set dir (pwd)
    builtin cd $lvimdir
    command git pull .
    builtin cd $dir
end


function extract --description "Extract contents of compressed file"
    if test (count $argv) -lt 1
        return
    end

    if contains -- -h $argv; or contains -- --help $argv
        echo "Usage: extract <file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <file_name_1.ext> [file_name_2.ext] [file_name_3.ext]"
        return
    end

    for f in $argv
        switch $f
            case (string match -r ".*\.(cbt|tar.bz2|tar.gz|tar.xz|tbz2|tgz|txz|tar)\b" $f)
                tar xvf $f
            case (string match -r ".*\.(cbz|epub|zip)\b" $f)
                unzip $f
            case (string match -r ".*\.gz\b" $f)
                gunzip $f
            case "*"
                echo "extract: '$f' - unknown archive method"
                return 1
        end
    end
end


# ==================
# ----- Aliases ----
# ==================

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias vim='nvim'
# alias nvim='lvim'
alias neovim='nvim'
alias em='/usr/bin/emacs -nw'
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first' # all files and dirs
alias ll='exa -l --color=always --group-directories-first' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# pacman and yay
alias pacsyu='sudo pacman -Syyu' # update only standard pkgs
alias yaysua='yay -Sua --noconfirm' # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm' # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm' # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm' # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck' # remove pacman lock
alias cleanup='sudo pacman -Rns (pacman -Qtdq)' # remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 364A82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment



# PyEnv
# set -Ux PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
eval "$(pyenv init -)"


### SETTING THE STARSHIP PROMPT ###
starship init fish | source
