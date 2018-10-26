BEGIN {
  ln = 0;
# REPOSITORY; TAG; IMAGE ID; CREATED; SIZE
} {
  ln = ln + 1;
  if (ln == 1) {
    ri = index($0, "REPOSITORY");
    if (ri == 0) {
      print "Can't find REPOSITORY in 1st line" > "/dev/stderr"
      exit(1);
    }
    ti = index($0, "TAG");
    if (ti == 0) {
      print "Can't find TAG in 1st line" > "/dev/stderr"
      exit(1);
    }
    ii = index($0, "IMAGE ID");
    if (ii == 0) {
      print "Can't find IMAGE ID in 1st line" > "/dev/stderr"
      exit(1);
    }
    ci = index($0, "CREATED");
    if (ci == 0) {
      print "Can't find CREATED in 1st line" > "/dev/stderr"
      exit(1);
    }
    si = index($0, "SIZE");
    if (si == 0) {
      print "Can't find SIZE in 1st line" > "/dev/stderr"
      exit(1);
    }
    next;
  }
  else {
    repo = $1;
    tag = substr($0, ti, ii-ti); sub("[[:space:]]*$", "", tag);
    id = substr($0, ii, ci-ii); sub("[[:space:]]*$", "", id);
    created = substr($0, ci, si-ci); sub("[[:space:]]*$", "", created);
    size = substr($0, si);
    printf("%s\003%s\003%s\003%s\003%s\n", repo, tag, id, created, size);
  }
}
