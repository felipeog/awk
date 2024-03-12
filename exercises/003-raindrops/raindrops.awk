# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
  if (is_divisible(num, 3))
    printf "%s", "Pling"

  if (is_divisible(num, 5))
    printf "%s", "Plang"

  if (is_divisible(num, 7))
    printf "%s", "Plong"

  if (!is_divisible(num, 3) && !is_divisible(num, 5) && !is_divisible(num, 7))
    printf "%s", num
}

function is_divisible(dividend, divisor) {
  return dividend % divisor == 0
}
