BEGIN {
  ln = 0;
} {
  ln = ln + 1;
  if (ln == 1) {
    ni = index($0, "NAMES");
    if (ni == 0) {
      print "Can't find NAMES in 1st line" > "/dev/stderr"
      exit(1);
    }
    next;
  }
  else {
    id = $1;
    name = substr($0, ni);
    printf("%s\003%s\n", id, name);
  }
}
