BEGIN {
  ln = 0;
} {
  ln = ln + 1;
  if (ln == 1) {
    ri = index($0, "REPOSITORY");
    if (ri == 0) {
      print "Can't find REPOSITORY in 1st line" > "/dev/stderr"
      exit(1);
    }
    next;
  }
  else {
    id = $3;
    name = $1;
    printf("%s\003%s\n", id, name);
  }
}
