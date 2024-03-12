END {
  split($0, letters, "")
  cursor = length($0)

  while(cursor > 0) {
    printf "%s", letters[cursor]
    cursor--
  }
}
