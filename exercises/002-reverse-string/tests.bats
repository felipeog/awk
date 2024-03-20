#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/reverse-string.awk

setup() {
  common_setup
}

@test "an empty string" {
  run gawk -f $AWK_FILE <<< ""

  assert_success
  assert_output ""
}

@test "a word" {
  run gawk -f $AWK_FILE <<< "robot"

  assert_success
  assert_output "tobor"
}

@test "a capitalised word" {
  run gawk -f $AWK_FILE <<< "Ramen"

  assert_success
  assert_output "nemaR"
}

@test "a sentence with punctuation" {
  run gawk -f $AWK_FILE <<< "I'm hungry!"

  assert_success
  assert_output "!yrgnuh m'I"
}

@test "a palindrome" {
  run gawk -f $AWK_FILE <<< "racecar"

  assert_success
  assert_output "racecar"
}

@test "an even-sized word" {
  run gawk -f $AWK_FILE <<< "drawer"

  assert_success
  assert_output "reward"
}
