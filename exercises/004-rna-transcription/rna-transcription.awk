END {
  if (is_dna_valid($0)) {
    print get_rna_from_dna($0)
  } else {
    print "Invalid nucleotide detected."
    exit 1
  }
}

function is_dna_valid(dna) {
  split(dna, caracters, "")
  cursor = 1

  while (cursor <= length(dna)) {
    if (caracters[cursor] !~ /[ACGT]/) return 0
    cursor++
  }

  return 1
}

function get_rna_from_dna(dna) {
  map["A"] = "U"
  map["C"] = "G"
  map["G"] = "C"
  map["T"] = "A"

  split(dna, caracters, "")
  cursor = 1

  while (cursor <= length(dna)) {
    result = result map[caracters[cursor]]
    cursor++
  }

  return result
}
