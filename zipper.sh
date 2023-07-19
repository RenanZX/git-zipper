#!/bin/bash


git-zipper() {
  strindex() { 
    x="${1%%"$2"*}"
    [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
  }

  caminho_abs=$(pwd)

  if [[ $1 == 'commit' ]]; then
    files_str=$(git diff-tree --no-commit-id --name-only $2 -r)
    while read file 
    do 
      caminho="./${file}"
      var=$(basename $caminho)
      val=$(awk '{print substr($0, 2)}' <<< $caminho)
      mkdir -p "$caminho_abs/tozip${val%$var}"
      cp $caminho $caminho_abs/tozip${val%$var}
      echo "copy to $caminho_abs/tozip$val"
    done <<< "$files_str"

    cd $caminho_abs/tozip
    zip -r files *
    cd $caminho_abs
  else
    for var in "$@"
    do
      posicao=$((${#caminho_abs}+1))
      if [[ $var != *"/"* ]]; then
        caminho=$(find ~+ -type f -name "$var")
        val=$(awk -v FV=$posicao '{print substr($0, FV)}' <<< $caminho)
      else
        if [[ $var == .* ]]; then
          caminho=$var
        elif [[ $var == /* ]]; then
          caminho=".$var"
        else
          caminho="./$var"
        fi
        var=$(basename $var)
        val=$(awk '{print substr($0, 2)}' <<< $caminho)
      fi
      
      mkdir -p "$caminho_abs/tozip${val%$var}"
      cp $caminho $caminho_abs/tozip${val%$var}
      echo "copy to $caminho_abs/tozip$val"
    done

    cd $caminho_abs/tozip
    zip -r files *
    cd $caminho_abs
  fi
}