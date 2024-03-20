# https://www.gnu.org/software/gawk/manual/html_node/String-Functions.html#index-substr_0028_0029-function

{
  for (i = 1; i <= length($0); i++)
    result = substr($0, i, 1) result

  print result
}
