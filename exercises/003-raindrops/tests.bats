#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/raindrops.awk

setup() {
  common_setup
}

@test "the sound for 1 is 1" {
  run gawk -v num=1 -f $AWK_FILE

  assert_success
  assert_output "1"
}

@test "the sound for 3 is Pling" {
  run gawk -v num=3 -f $AWK_FILE

  assert_success
  assert_output "Pling"
}

@test "the sound for 5 is Plang" {
  run gawk -v num=5 -f $AWK_FILE

  assert_success
  assert_output "Plang"
}

@test "the sound for 7 is Plong" {
  run gawk -v num=7 -f $AWK_FILE

  assert_success
  assert_output "Plong"
}

@test "the sound for 6 is Pling as it has a factor 3" {
  run gawk -v num=6 -f $AWK_FILE

  assert_success
  assert_output "Pling"
}

@test "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base" {
  run gawk -v num=8 -f $AWK_FILE

  assert_success
  assert_output "8"
}

@test "the sound fot 30 is PlingPlang" {
  run gawk -v num=30 -f $AWK_FILE

  assert_success
  assert_output "PlingPlang"
}
