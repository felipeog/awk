# NF = Number of Fields in current record
# https://www.gnu.org/software/gawk/manual/html_node/Auto_002dset.html#index-NF-variable-1

# NR = Number of the current Record
# https://www.gnu.org/software/gawk/manual/html_node/Auto_002dset.html#index-NR-variable-1

{ print "One for " (NF ? $0 : "you") ", one for me." }

END { if (!NR) print "One for you, one for me." }
