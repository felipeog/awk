# https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html#index-gsub_0028_0029-function-1

/[^CGTA]/ {
  print "Invalid nucleotide detected."
  exit 1
}

{
  gsub("C", "*") # mark `C` to handle `G` to `C`
  gsub("G", "C")
  gsub("*", "G") # marked `C` to `G`
  gsub("A", "U")
  gsub("T", "A")

  print
}
