# Autocompletions
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Filesystem
alias ls='ls -G'
alias ll='ls -la'
alias l.='ls -d .*' # show hidden files
alias ls.='l.'
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias home='cd ~'
alias mkdir='mkdir -pv' # make parent dirs on demand
alias md='mkdir'
alias mv='mv -vi'
alias rm='rm -vi'
alias rmrf='rm -rf'
alias cp='cp -v'

# Misc.
alias cl='clear'
alias grep='grep --color=auto'
alias wget='wget -c'
alias bashrc='vim ~/.bashrc'
alias brc='bashrc'

# Networking
alias ping='ping -c 5'
alias myip='curl http://ipecho.net/plain; echo'

# Brew
alias bc='brew cleanup'
alias bi='brew install'
alias bif='brew info'
alias bl='brew link'
alias bu='brew upgrade'
alias bc='brew cask'
alias bci='brew cask install'

# Android
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
alias adi='adb install -r'
alias adu='adb uninstall'
alias adl='adb logcat'
alias adev='adb devices -l'
alias ads='adb shell'
alias ascreenc='ads screencap -p "~/Desktop/screencap.png"'
alias ascreenr='ads screenrecord "~/Desktop/screenrecord.mp4"'
alias adslp='ads list packages'
alias aam='ads am'
alias aams='ads am start -n'
alias aamsa='ads am start -n'
alias aamss='ads am startservice -n'
alias aamb='ads am broadcast -a'
alias apm='ads pm'
alias adp='ads dumpsys'
alias adpp='adp package'

# Python
alias py='python'
alias py2='python2'
alias py3='python3'
alias pyi='pip install'
alias pyir='pip install -r'
alias pyir!='pip install -r requirements.txt'
alias pyu='pip uninstall'
alias pyl='pip list'
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Node/NPM
alias js='node'
alias ncc='npm cache clean -f'
alias ni='npm install'
alias nig='ni -g'
alias nui='npm uninstall'
alias nuig='nui -g'
alias nl='npm ls'
alias nr='npm run'
alias ns='npm start'
alias nu='npm update'
alias yr='yarn'
export NVM_DIR=/Users/$USER/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # loads nvm
alias nvmu='nvm use'

# Git
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gch='git checkout'
alias gcl='git clone'
alias gi='git init'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push -u origin HEAD'
alias gs='git status'

# Docker
alias dk='docker'
alias dc='docker-compose'
alias dup='docker-compose up -d'
alias dcp='dk cp'
alias di='dk images'
alias dpl='dk pull'
alias dpu='dk push'
alias dps='dk ps'
alias dsall='dk stop $(docker ps -a -q)'
alias drmall='dk rm $(docker ps -a -q)'

# Kubernetes
source <(kubectl completion bash)
alias kb='kubectl'
complete -F __start_kubectl kb
alias ka='kubectl apply -f'
alias kc='kubectl create'
alias kcd='kc deployment'
alias kcs='kc service'
alias kd='kubectl delete'
alias kg='kubectl get'
alias kgd='kg deployment'
alias kgn='kg nodes'
alias kgp='kg pods'
alias kgs='kg services'
alias kr='kubectl run'

# Terraform
alias tf='terraform'
complete -C /usr/local/bin/terraform tf
alias tfa='tf apply'
alias tff='tf fmt'
alias tfg='tf get'
alias tfgr='tf graph'
alias tfi='tf init'

# SSH auto-completion based on entries in known_hosts
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
fi

# Macros
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz) tar xzf $1    ;;
      *.gz)   gunzip $1   ;;
      *.tar)    tar xf $1   ;;
      *.tbz2)   tar xjf $1    ;;
      *.tgz)    tar xzf $1    ;;
      *.zip)    unzip $1    ;;
      *.Z)    uncompress $1 ;;
      *)      echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
