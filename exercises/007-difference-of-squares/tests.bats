#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/difference-of-squares.awk

setup() {
  common_setup
}

@test "square of sum 1" {
  run awk -f $AWK_FILE <<< "square_of_sum,1"

  assert_success
  assert_output "1"
}

@test "square of sum 5" {
  run awk -f $AWK_FILE <<< "square_of_sum,5"

  assert_success
  assert_output "225"
}

@test "square of sum 100" {
  run awk -f $AWK_FILE <<< "square_of_sum,100"

  assert_success
  assert_output "25502500"
}

@test "sum of squares 1" {
  run awk -f $AWK_FILE <<< "sum_of_squares,1"

  assert_success
  assert_output "1"
}

@test "sum of squares 5" {
  run awk -f $AWK_FILE <<< "sum_of_squares,5"

  assert_success
  assert_output "55"
}

@test "sum of squares 100" {
  run awk -f $AWK_FILE <<< "sum_of_squares,100"

  assert_success
  assert_output "338350"
}

@test "difference of squares 1" {
  run awk -f $AWK_FILE <<< "difference,1"

  assert_success
  assert_output "0"
}

@test "difference of squares 5" {
  run awk -f $AWK_FILE <<< "difference,5"

  assert_success
  assert_output "170"
}

@test "difference of squares 100" {
  run awk -f $AWK_FILE <<< "difference,100"

  assert_success
  assert_output "25164150"
}
