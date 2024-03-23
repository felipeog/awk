#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/resistor-color-duo.awk

setup() {
  common_setup
}

@test "brown black" {
  run gawk -f $AWK_FILE <<< "brown black"
  
  assert_success
  assert_output "10"
}

@test "blue grey" {
  run gawk -f $AWK_FILE <<< "blue grey"
  
  assert_success
  assert_output "68"
}

@test "yellow violet" {
  run gawk -f $AWK_FILE <<< "yellow violet"
  
  assert_success
  assert_output "47"
}

@test "white red" {
  run gawk -f $AWK_FILE <<< "white red"
  
  assert_success
  assert_output "92"
}

@test "orange orange" {
  run gawk -f $AWK_FILE <<< "orange orange"
  
  assert_success
  assert_output "33"
}

@test "invalid color" {
  run gawk -f $AWK_FILE <<< "foo"
  
  assert_failure
  assert_output --partial "invalid color"
}

@test "ignore too many colors" {
  run gawk -f $AWK_FILE <<< "green brown orange"
  
  assert_success
  assert_output "51"
}

@test "black brown" {
  run gawk -f $AWK_FILE <<< "black brown"
  
  assert_success
  assert_output "1"
}

@test "black grey" {
  run gawk -f $AWK_FILE <<< "black grey"
  
  assert_success
  assert_output "8"
}
