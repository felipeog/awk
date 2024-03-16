END {
  cursor = length($0)
  
  split($0, letters, "")

  while(cursor > 0) {
    printf "%s", letters[cursor]
    cursor--
  }
}
