#
# Sparkn Theme for Oh my ZSH!
#
# https://github.com/alewi/sparkn-oh-my-zsh-theme
#
# You can set some options in your .zshrc file to control this theme.
#
# ZSH_THEME_SPARKN_COMPACT  true | false (default)
# ZSH_THEME_SPARKN_WITH_BG  true (default) | false
# ZSH_THEME_SPARKN_WITH_TIME  true | false (default)
# ZSH_THEME_SPARKN_WITH_NEWLINE  true (default) | false

# Setings
WITH_BG=true
WITH_TIME=false
WITH_NEWLINE=true
IS_COMPACT=false

if [[ $ZSH_THEME_SPARKN_COMPACT == true ]]; then
	IS_COMPACT=true
fi

if [[ $ZSH_THEME_SPARKN_WITH_BG == false ]]; then
	WITH_BG=false
fi

if [[ $ZSH_THEME_SPARKN_WITH_TIME == true ]]; then
	WITH_TIME=true
fi

if [[ $ZSH_THEME_SPARKN_WITH_NEWLINE == false ]]; then
	WITH_NEWLINE=false
fi

# Colors
BGC=""
SPACE_FOR_BG=""
if [[ $WITH_BG == true ]]; then
	BGC="%{$BG[234]%}"
	SPACE_FOR_BG="$BGC $RC"
fi

C1="%{$FG[058]%}" # time
C2="%{$FG[023]%}" # user
C3="%{$FG[240]%}" # @
C4="%{$FG[240]%}" # place
C5="%{$FG[025]%}" # path
C6="%{$FG[023]%}" # prompt
C7="%{$FG[240]%}" # git
C8="%{$FG[052]%}" # git dirty
C9="%{$FG[028]%}" # git clean
C10="%{$FG[058]%}" # other git icons

RC="%{$reset_color%}"

# Colored git status icons
ZSH_THEME_GIT_PROMPT_PREFIX="$RC $BGC $C7"
ZSH_THEME_GIT_PROMPT_SUFFIX="$BGC $RC"
ZSH_THEME_GIT_PROMPT_DIRTY=" $C8●"
ZSH_THEME_GIT_PROMPT_CLEAN=" $C9●"
ZSH_THEME_GIT_PROMPT_ADDED="$C10+ "
ZSH_THEME_GIT_PROMPT_MODIFIED="$C10\u2691 "
ZSH_THEME_GIT_PROMPT_DELETED="$C10\u2715 "
ZSH_THEME_GIT_PROMPT_RENAMED="$C10\u270e "
ZSH_THEME_GIT_PROMPT_UNMERGED="$C10\u21c6 "
ZSH_THEME_GIT_PROMPT_UNTRACKED="$C10\u25cb "
ZSH_THEME_GIT_PROMPT_DIVERGED="$C10\u09bc "
ZSH_THEME_GIT_PROMPT_BEHIND="$C10\u2af0 "
ZSH_THEME_GIT_PROMPT_AHEAD="$C10\u2aef "
ZSH_THEME_GIT_PROMPT_STASHED="$C10\u2637 "

# Functions

gap () {
	echo -n "$RC "
}

space () {
	echo -n "$BGC $RC"
}

space_bg () {
	echo -n "$SPACE_FOR_BG"
}

now () {
	echo -n "$BGC$C1%*$RC"
}

user () {
	echo -n "$BGC$C2%n$RC"
	echo -n "$BGC$C3@$RC"
	echo -n "$BGC$C4%m$RC"
}

path () {
	echo -n "$BGC$C5%~$RC"
}

newline () {
	echo ""
}

input () {
	echo -n "$BGC$C6%(!.#.$)$RC"
}

git_status () {
	echo -n '$BGC$(git_prompt_info)'
	echo -n '$BGC$(git_prompt_status)$RC'
}


create_prompt () {
	if [[ $WITH_NEWLINE == true ]]; then
		newline
	fi
	
	if [[ $WITH_TIME == true ]]; then
		space_bg;now
		if [[ $WITH_BG != true ]]; then
			gap
		fi
	fi
	
	if [[ $IS_COMPACT != true ]]; then
		space_bg;user
	fi
	
	space;path

	if [[ $IS_COMPACT != true ]]; then
		space_bg;git_status;
		newline
	fi
	
	if [[ $IS_COMPACT != true ]]; then
		space_bg
	else
		space	
	fi
	
	input;space_bg
}

create_right_prompt () {
	git_status;
}

PROMPT="$(create_prompt)$RC "

if [[ $IS_COMPACT == true ]]; then
	RPROMPT="$(create_right_prompt)"
fi
