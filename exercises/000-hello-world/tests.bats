#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/hello-world.awk

setup() {
  common_setup
}

@test "should print \"Hello, World!\"" {
  run gawk -f $AWK_FILE

  assert_success
  assert_output "Hello, World!"
}
