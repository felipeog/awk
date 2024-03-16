# NF = Number of Fields in current record
# NR = Number of the current Record

{ print "One for " (NF ? $0 : "you") ", one for me." }

END { if (!NR) print "One for you, one for me." }
