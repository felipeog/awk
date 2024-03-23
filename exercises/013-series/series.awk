# These variables are initialized on the command line (using '-v'):
# - len

!length() {
  print "series cannot be empty"
  exit 1
}

len <= 0 || len > length() {
  print "invalid length"
  exit 1
}

{
  for(i=1; i <= length($0) - len + 1; i++)
    result = (result ? result " " : "") substr($0, i, len)

  print result
}
