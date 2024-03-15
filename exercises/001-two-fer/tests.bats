#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/two-fer.awk

setup() {
  common_setup
}

@test "no file given" {
  run awk -f $AWK_FILE < /dev/null

  assert_success
  assert_output "One for you, one for me."
}

@test "empty file given" {
  run awk -f $AWK_FILE $TEST_FOLDER/empty-file.txt

  assert_success
  assert_output "One for you, one for me."
}

@test "a name given" {
  run awk -f $AWK_FILE $TEST_FOLDER/one-name.txt

  assert_success
  assert_output "One for Alice, one for me."
}

@test "name with a space" {
  run awk -f $AWK_FILE <<< "Mary Ann"

  assert_success
  assert_output "One for Mary Ann, one for me."
}

@test "empty lines" {
  run awk -f $AWK_FILE $TEST_FOLDER/empty-lines.txt

  assert_success
  assert_line --index 0 "One for you, one for me."
  assert_line --index 1 "One for you, one for me."
}

@test "name with empty lines" {
  run awk -f $AWK_FILE $TEST_FOLDER/one-name-and-empty-lines.txt

  assert_success
  assert_line --index 0 "One for you, one for me."
  assert_line --index 1 "One for Pierre, one for me."
  assert_line --index 2 "One for you, one for me."
}

@test "two names" {
  run awk -f $AWK_FILE $TEST_FOLDER/two-names.txt

  assert_success
  assert_line --index 0 "One for Alice, one for me."
  assert_line --index 1 "One for Mary Ann, one for me."
}

@test "two names and empty lines" {
  run awk -f $AWK_FILE $TEST_FOLDER/two-names-and-empty-lines.txt

  assert_success
  assert_line --index 0 "One for you, one for me."
  assert_line --index 1 "One for Alice, one for me."
  assert_line --index 2 "One for you, one for me."
  assert_line --index 3 "One for Mary Ann, one for me."
}
