BEGIN {
  map["black"]  = 0
  map["brown"]  = 1
  map["red"]    = 2
  map["orange"] = 3
  map["yellow"] = 4
  map["green"]  = 5
  map["blue"]   = 6
  map["violet"] = 7
  map["grey"]   = 8
  map["white"]  = 9
}

!($1 in map) || !($2 in map) {
  print "invalid color"
  exit 1
}

{
  printf("%d", map[$1] map[$2])
}
