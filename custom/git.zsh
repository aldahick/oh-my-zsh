# git recommit
alias grc='lastcommit=$(git log -1 --pretty=%B) && git reset HEAD^1 && gaa && gcmsg "$lastcommit"'

function galias() {
	cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh | grep $*
}
