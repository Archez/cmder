alias ccode="cd /c/code"
alias cmderr="cd /c/cmder"

alias mkphnx="docker run -it --name=lv --mount type=bind,source=/c/code,target=/code -d -p 2023:22 -p 8080:80 -p 8081:443 185477066674.dkr.ecr.us-west-1.amazonaws.com/adc-nodejs:1.1 ; sleep 1 ; docker exec lv /code/setup-phnx.sh"
alias phnxexec="docker exec -it --user dev lv bash"
alias phnxssh="ssh dev@localhost -p2023 -o NoHostAuthenticationForLocalhost=yes"

alias githide="git update-index --assume-unchanged $*"
alias gitf="git fetch $*"
alias gitl="git log --oneline --all --graph --decorate $*"
alias gitmf="git merge --ff-only $*"
alias gits="git status $*"
alias gitunhide="git update-index --no-assume-unchanged $*"
