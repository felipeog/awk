#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/series.awk

setup() {
  common_setup
}

@test "slices of one from one" {
  run gawk -f $AWK_FILE -v len=1 <<< 1

  assert_success
  assert_output "1"
}

@test "slices of one from two" {
  run gawk -f $AWK_FILE -v len=1 <<< 12

  assert_success
  assert_output "1 2"
}

@test "slices of two" {
  run gawk -f $AWK_FILE -v len=2 <<< 35

  assert_success
  assert_output "35"
}

@test "slices of two overlap" {
  run gawk -f $AWK_FILE -v len=2 <<< 9142

  assert_success
  assert_output "91 14 42"
}

@test "slices can include duplicates" {
  run gawk -f $AWK_FILE -v len=3 <<< 777777

  assert_success
  assert_output "777 777 777 777"
}

@test "slices of a long series" {
  run gawk -f $AWK_FILE -v len=5 <<< 918493904243

  assert_success
  assert_output "91849 18493 84939 49390 93904 39042 90424 04243"
}

@test "slice length is too large" {
  run gawk -f $AWK_FILE -v len=6 <<< 12345

  assert_failure
  assert_output --partial "invalid length"
}

@test "slice length is way too large" {
  run gawk -f $AWK_FILE -v len=42 <<< 12345

  assert_failure
  assert_output --partial "invalid length"
}

@test "slice length cannot be zero" {
  run gawk -f $AWK_FILE -v len=0 <<< 12345

  assert_failure
  assert_output --partial "invalid length"
}

@test "slice length cannot be negative" {
  run gawk -f $AWK_FILE -v len=-1 <<< 123

  assert_failure
  assert_output --partial "invalid length"
}

@test "empty series is invalid" {
  run gawk -f $AWK_FILE -v len=1 <<< ""

  assert_failure
  assert_output --partial "series cannot be empty"
}
