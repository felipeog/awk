END {
  if (!is_divisible($0, 4)) {
    print "false"
    exit 0
  }

  if (!is_divisible($0, 100)) {
    print "true"
    exit 0
  }

  if (!is_divisible($0, 400)) {
    print "false"
    exit 0
  }

  print "true"
}

function is_divisible(dividend, divisor) {
  return dividend % divisor == 0
}
