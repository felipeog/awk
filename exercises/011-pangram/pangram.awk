BEGIN { alphabet = "abcdefghijklmnopqrstuvwxyz" }

{
  lowercase_input = tolower($0)
  result =          "true"

  for (i = 1; i <= length(alphabet); i++) {
    letter = substr(alphabet, i, 1)

    if(!match(lowercase_input, letter)) {
      result = "false"

      break
    }
  }

  print result
}
