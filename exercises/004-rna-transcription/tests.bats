#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/rna-transcription.awk

setup() {
  common_setup
}

@test "Empty RNA sequence" {
  run gawk -f $AWK_FILE <<< ""

  assert_success
  [[ -z $output ]]
}

@test "RNA complement of cytosine is guanine" {
  run gawk -f $AWK_FILE <<< "C"

  assert_success
  assert_output "G"
}

@test "RNA complement of guanine is cytosine" {
  run gawk -f $AWK_FILE <<< "G"

  assert_success
  assert_output "C"
}

@test "RNA complement of thymine is adenine" {
  run gawk -f $AWK_FILE <<< "T"

  assert_success
  assert_output "A"
}

@test "RNA complement of adenine is uracil" {
  run gawk -f $AWK_FILE <<< "A"

  assert_success
  assert_output "U"
}

@test "RNA complement" {
  run gawk -f $AWK_FILE <<< "ACGTGGTCTTAA"

  assert_success
  assert_output "UGCACCAGAAUU"
}

@test "Handles invalid character" {
  run gawk -f $AWK_FILE <<< "ACGTXCTTA"

  assert_failure
  assert_output "Invalid nucleotide detected."
}

@test "Handles completely invalid string" {
  run gawk -f $AWK_FILE <<< "XXXX"

  assert_failure
  assert_output "Invalid nucleotide detected."
}

@test "Handles partially invalid string" {
  run gawk -f $AWK_FILE <<< "ACGTXCTTAA"

  assert_failure
  assert_output "Invalid nucleotide detected."
}
