BEGIN {
  FS = ","

  map[1]   = "eggs"
  map[2]   = "peanuts"
  map[4]   = "shellfish"
  map[8]   = "strawberries"
  map[16]  = "tomatoes"
  map[32]  = "chocolate"
  map[64]  = "pollen"
  map[128] = "cats"
}

$2 == "list"        { print get_items_list($1) }
$2 == "allergic_to" { print match(get_items_list($1), $3) ? "true" : "false" }

function get_highest_allergen(score) {
  if (score <= 2) return score

  highest_allergen = 1

  while (1) {
    if(highest_allergen * 2 > score) break
    
    highest_allergen *= 2
  }

  return highest_allergen
}

function get_items_list(score) {
    if (score <= 0) return ""

    highest_allergen = get_highest_allergen(score)
    result = ""

    for(i = highest_allergen; i >= 1; i /= 2) {
      if(score - i < 0) continue

      score -= i

      if(!map[i]) continue

      result = map[i] (result ? "," result : "")
    }

    return result
}
