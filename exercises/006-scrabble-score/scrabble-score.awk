{
  score = 0
  word = toupper($0)
  split(word, characters, "")

  for (i = 1; i <= length(characters); i++) {
    character = characters[i]

    if (character ~ /[AEIOULNRST]/) score += 1
    if (character ~ /[DG]/) score += 2
    if (character ~ /[BCMP]/) score += 3
    if (character ~ /[FHVWY]/) score += 4
    if (character ~ /[K]/) score += 5
    if (character ~ /[JX]/) score += 8
    if (character ~ /[QZ]/) score += 10
  }

  print word "," score
}
