# FS = Field Separator

BEGIN { FS = "," }

/square_of_sum/  { print square_of_sum($2) }
/sum_of_squares/ { print sum_of_squares($2) }
/difference/     { print square_of_sum($2) - sum_of_squares($2) }

function square_of_sum(n) {
  return (n * (n + 1) / 2) ** 2
}

function sum_of_squares(n) {
  return n * (n + 1) * (2 * n + 1) / 6
}
