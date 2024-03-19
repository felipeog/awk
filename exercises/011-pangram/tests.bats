#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/pangram.awk

setup() {
  common_setup
}

@test "empty sentence" {
  run awk -f $AWK_FILE <<< ""

  assert_success
  assert_output "false"
}

@test "perfect lower case" {
  run awk -f $AWK_FILE <<< "abcdefghijklmnopqrstuvwxyz"

  assert_success
  assert_output "true"
}

@test "only lower case" {
  run awk -f $AWK_FILE <<< "the quick brown fox jumps over the lazy dog"

  assert_success
  assert_output "true"
}

@test "missing the letter 'x'" {
  run awk -f $AWK_FILE <<< "a quick movement of the enemy will jeopardize five gunboats"

  assert_success
  assert_output "false"
}

@test "missing the letter 'h'" {
  run awk -f $AWK_FILE <<< "five boxing wizards jump quickly at it"

  assert_success
  assert_output "false"
}

@test "with underscores" {
  run awk -f $AWK_FILE <<< "the_quick_brown_fox_jumps_over_the_lazy_dog"

  assert_success
  assert_output "true"
}

@test "with numbers" {
  run awk -f $AWK_FILE <<< "the 1 quick brown fox jumps over the 2 lazy dogs"

  assert_success
  assert_output "true"
}

@test "missing letters replaced by numbers" {
  run awk -f $AWK_FILE <<< "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"

  assert_success
  assert_output "false"
}

@test "mixed case and punctuation" {
  run awk -f $AWK_FILE <<< "\"Five quacking Zephyrs jolt my wax bed.\""

  assert_success
  assert_output "true"
}

@test "a-m and A-M are 26 different characters but not a pangram" {
  run awk -f $AWK_FILE <<< "abcdefghijklm ABCDEFGHIJKLM"

  assert_success
  assert_output "false"
}
