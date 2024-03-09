END {
  name = length($0) ? $0 : "you";
  print "One for " name ", one for me."
}
