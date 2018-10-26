dka() {
  id=`dkap $1`
  if [ -z "$id" ]; then
    echo "No docker containers found" 1>&2
    return 1
  fi
  docker start $id
  [ $? -ne 0 ] && return 1
  docker attach $id
}
