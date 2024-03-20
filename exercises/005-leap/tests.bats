#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/leap.awk

setup() {
  common_setup
}

@test 'year not divisible by 4: common year' {
  run gawk -f $AWK_FILE <<< "2015"

  assert_success
  assert_output "false"
}

@test 'year divisible by 2, not divisible by 4 is common year' {
  run gawk -f $AWK_FILE <<< "1970"

  assert_success
  assert_output "false"
}

@test 'year divisible by 4, not divisible by 100: leap year' {
  run gawk -f $AWK_FILE <<< "1996"

  assert_success
  assert_output "true"
}

@test 'year divisible by 4 and 5 is still a leap year' {
  run gawk -f $AWK_FILE <<< "1960"

  assert_success
  assert_output "true"
}

@test 'year divisible by 100, not divisible by 400: common year' {
  run gawk -f $AWK_FILE <<< "2100"

  assert_success
  assert_output "false"
}

@test 'year divisible by 100 but not by 3 is still not a leap year' {
  run gawk -f $AWK_FILE <<< "1900"

  assert_success
  assert_output "false"
}

@test 'year divisible by 400: leap year' {
  run gawk -f $AWK_FILE <<< "2000"

  assert_success
  assert_output "true"
}

@test 'year divisible by 400 but not by 125 is still a leap year' {
  run gawk -f $AWK_FILE <<< "2400"

  assert_success
  assert_output "true"
}

@test 'year divisible by 200, not divisible by 400 is common year' {
  run gawk -f $AWK_FILE <<< "1800"

  assert_success
  assert_output "false"
}
