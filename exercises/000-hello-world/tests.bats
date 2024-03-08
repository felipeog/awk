#!/usr/bin/env bats

load '../../node_modules/bats-support/load'
load '../../node_modules/bats-assert/load'

@test "should print \"Hello, World!\"" {
  run awk -f ./exercises/000-hello-world/hello-world.awk

  assert_success

  assert_output "Hello, World!"
}
