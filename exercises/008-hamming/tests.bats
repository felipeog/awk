#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/hamming.awk

setup() {
  common_setup
}

teardown() {
  rm -f input.txt
}

populate_test_file() {
  echo "$1" > input.txt
  echo "$2" >> input.txt
}

@test 'empty strands' {
  populate_test_file '' ''

  run gawk -f $AWK_FILE input.txt

  assert_success
  assert_output "0"
}

@test 'single letter identical strands' {
  populate_test_file 'A' 'A'

  run gawk -f $AWK_FILE input.txt

  assert_success
  assert_output "0"
}

@test 'single letter different strands' {
  populate_test_file 'G' 'T'

  run gawk -f $AWK_FILE input.txt

  assert_success
  assert_output "1"
}

@test 'long identical strands' {
  populate_test_file 'GGACTGAAATCTG' 'GGACTGAAATCTG'

  run gawk -f $AWK_FILE input.txt

  assert_success
  assert_output "0"
}

@test 'long different strands' {
  populate_test_file 'GGACGGATTCTG' 'AGGACGGATTCT'

  run gawk -f $AWK_FILE input.txt

  assert_success
  assert_output "9"
}

@test 'disallow first strand longer' {
  populate_test_file 'AATG' 'AAA'

  run gawk -f $AWK_FILE input.txt

  assert_failure
  assert_output --partial "strands must be of equal length"
}

@test 'disallow second strand longer' {
  populate_test_file 'ATA' 'AGTG'

  run gawk -f $AWK_FILE input.txt

  assert_failure
  assert_output --partial "strands must be of equal length"
}

@test 'disallow empty first strand' {
  populate_test_file '' 'G'

  run gawk -f $AWK_FILE input.txt

  assert_failure
  assert_output --partial "strands must be of equal length"
}

@test 'disallow empty second strand' {
  populate_test_file 'G' ''

  run gawk -f $AWK_FILE input.txt

  assert_failure
  assert_output --partial "strands must be of equal length"
}
