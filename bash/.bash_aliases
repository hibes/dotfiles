alias la="ls -AFl"
alias lt="ls -AFltr"
alias ll='ls -lF'
alias vv="cd --"
alias sudo="sudo env PATH=PATH:$PATH" #otherwise has limited path

alias cdev="sudo ~/vm-prog/dockerfiles/developer/docker-run.sh 1 10122; ssh admin@localhost -X -p10122"
