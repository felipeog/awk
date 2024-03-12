#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
TEST_FILE=$TEST_FOLDER/reverse-string.awk

setup() {
  common_setup
}

@test "an empty string" {
  run awk -f $TEST_FILE <<< ""

  assert_success
  assert_output ""
}

@test "a word" {
  run awk -f $TEST_FILE <<< "robot"

  assert_success
  assert_output "tobor"
}

@test "a capitalised word" {
  run awk -f $TEST_FILE <<< "Ramen"

  assert_success
  assert_output "nemaR"
}

@test "a sentence with punctuation" {
  run awk -f $TEST_FILE <<< "I'm hungry!"

  assert_success
  assert_output "!yrgnuh m'I"
}

@test "a palindrome" {
  run awk -f $TEST_FILE <<< "racecar"

  assert_success
  assert_output "racecar"
}

@test "an even-sized word" {
  run awk -f $TEST_FILE <<< "drawer"

  assert_success
  assert_output "reward"
}
