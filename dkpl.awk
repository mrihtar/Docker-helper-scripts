BEGIN {
  ln = 0;
# CONTAINER ID; IMAGE; COMMAND; CREATED; STATUS; PORTS; NAMES
} {
  ln = ln + 1;
  if (ln == 1) {
    # CONTAINER ID
    ii = index($0, "IMAGE");
    if (ii == 0) {
      print "Can't find IMAGE in 1st line" > "/dev/stderr"
      exit(1);
    }
    ci = index($0, "COMMAND");
    if (ci == 0) {
      print "Can't find COMMAND in 1st line" > "/dev/stderr"
      exit(1);
    }
    si = index($0, "STATUS");
    if (si == 0) {
      print "Can't find STATUS in 1st line" > "/dev/stderr"
      exit(1);
    }
    pi = index($0, "PORTS");
    if (pi == 0) {
      print "Can't find PORTS in 1st line" > "/dev/stderr"
      exit(1);
    }
    ni = index($0, "NAMES");
    if (ni == 0) {
      print "Can't find NAMES in 1st line" > "/dev/stderr"
      exit(1);
    }
    next;
  }
  else {
    id = $1;
    image = substr($0, ii, ci-ii); sub("[[:space:]]*$", "", image);
    status = substr($0, si, pi-si); sub("[[:space:]]*$", "", status);
    ports = substr($0, pi, ni-pi); sub("[[:space:]]*$", "", ports);
    name = substr($0, ni);
    printf("%s\003%s\003%s\003%s\003%s\n", id, name, image, status, ports);
  }
}
