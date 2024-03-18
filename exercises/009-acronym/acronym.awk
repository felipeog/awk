{
  split($0, words, /[ _-]/)

  for (i = 1; i <= length(words); i++) {
    letter = substr(words[i], 1, 1)
    uppercase_letter = toupper(letter)

    printf("%s", uppercase_letter)
  }
}
