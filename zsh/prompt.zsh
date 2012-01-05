git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "%{\e[0m%}on %{\e[1;32m%}$(git_prompt_info)"
    else
      echo "%{\e[0m%}on %{\e[1;31m%}$(git_prompt_info)"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  /usr/bin/git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " %{\e[31m%}unpushed"
  fi
}

project_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER/~/" -e "s/~\/Dropbox\/Personal\/!!Code\/\([^\/]*\)/\\1/"
}

ruby_version() {
  echo " $(ruby -v | awk '{print $2}')"
}

export PROMPT=$'%{\e[0;90m%}%n@%m%{\e[0m%}
%{\e[0;%(?.32.31)m%}>%{\e[0m%} '

export RPROMPT=$'$(project_pwd)$($ZSH/bin/git_cwd_info)$(need_push)%{\e[0m%}'