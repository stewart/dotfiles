# handsomely stolen from Zach Holman's dotfiles - https://github.com/holman/dotfiles/blob/master/zsh/prompt.zsh#L69-52
todo(){
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos"
    else
      echo ""
    fi
  else
    echo ""
  fi
}
