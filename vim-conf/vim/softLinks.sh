#! /bin/bash
# Script must be run from the DotFiles directory.

# Control Flow
showEvents="false"
actionDic=(
"s:makeLinks"
"c:removeLinks"
"m:both"
"show:show"
)

show () {
  showEvents="true"
  both $@
}

both () {
  removeLinks
  makeLinks
}

usage () {
  echo "usage: $0 action"
}

getAction () {
  action="usage"
  for item in ${actionDic[*]}
  do
    if [ "$1" == "$(key $item)" ]; then
      action="$(val $item)"
    fi
  done
  printf "%s" $action
}

sourceD=$(pwd)
destD=$HOME
sourceFiles=(
"vimrc:.vimrc"
"vim/after:.vim/after"
"vim/colors:.vim/colors"
"vim/ftplugin:.vim/ftplugin"
"vim/plugin:.vim/plugin"
"vim/spell:"
"vim/syntax:"
"ycm_extra_conf.py:"
)

val () {
  printf "%s" ${1##*:}
}

key () {
  printf "%s" ${1%%:*}
}

getDst () {
  local dst srcName dstName item
  item=$1
  srcName="$(key $item)"
  dstName="$(val $item)"
  if [[ "" == $dstName ]]; then
    dstName=.${srcName}
  fi
  dst="$destD/$dstName"
  printf "%s" $dst
}

getSrc () {
  local src
  src="$sourceD/$(key $1)"
  printf "%s" $src
}

showOrRun () {
  if [ "true" == $showEvents ]
  then echo $1
  else $1
  fi
}

makeLinks () {
  for item in ${sourceFiles[*]}
  do
    showOrRun "ln -s $(getSrc $item) $(getDst $item)"
  done
}

removeLinks () {
  for item in ${sourceFiles[*]}
  do
    showOrRun "rm $(getDst $item)"
  done
}

main () {
  action="$(getAction $1)"
  $action $@
}

main $@
