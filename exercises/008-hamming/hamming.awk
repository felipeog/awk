# NF = Number of Fields in current record
# NR = Number of the current Record
# RS = Record Separator

BEGIN { RS = "" }

{
  if (NF != 2 || length($1) != length($2)) {
    print "strands must be of equal length"
    exit 1
  }

  differences = 0

  for (i = 1; i <= length($1); i++) {
    from = substr($1, i, 1)
    to   = substr($2, i, 1)

    if (from != to )
      differences++
  }

  print differences
}

END { if (!NR) print "0" }
