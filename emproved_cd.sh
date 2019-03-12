gotodir() {
  local  dirname="dir: $2"
  local  line=""
  local  i="0"
  while [ $i -lt ${#dirname} ]
  do
    line="=$line"
    i=$[$i+1]
  done

  echo "$1$dirname"
  echo "$1$line"
  if [[ $3 == "1" ]]
  then
    ll | sed "s/^/$1/"
  else
    ls -l | sed "s/^/$1/"
  fi
  echo "$1"
}

cx() {
  echo ""
  local  ol="0"
  local  hf="0"
  local  path="~"
  local  exit="0"
  for var in "$@"
  do
    if [[ $var == "-ol" ]]
    then
      ol="1"
    elif [[ $var == "-hf" ]]
    then
      hf="1"
    elif [[ $var == "-help" ]]
    then
      echo "cx - change and show directory contents."
      echo ""
      echo "  cx [PATH] ... [OPTION]"
      echo ""
      echo "The function will show all the content of each directory it encounters in the specified $
      echo ""
      echo "  -ol    - only show the contents of the last directory of the given PATH."
      echo "  -hf    - show hidden Files in directories."
      echo "  -help  - show this help page"
      echo ""
      exit="1"
    else
      path="$var"
    fi
  done
  
  if [[ $exit == "0" ]]
  then
    if [[ $ol == "1" ]]
    then
      if [[ $path == "~" ]]
      then
        cd ~
      else
        cd "$path"
      fi
      gotodir "" "$path" "$hf"
    else
      indent=""
      if [[ $path == /* ]]
      then
        cd /
        gotodir "$indent" / "$hf"
        indent="  $indent"
      fi

      IFS='/' read -r -a array <<< "$path"
      for element in "${array[@]}"
      do
        if [[ $element != "" ]]
        then
          if [[ $element == "~" ]]
          then
            cd ~
          else
            cd "$element"
          fi
          gotodir "$indent" "$element" "$hf"
          indent="  $indent"
        fi
      done
    fi
  fi
}
