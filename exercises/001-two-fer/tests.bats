#!/usr/bin/env bats

load '../../node_modules/bats-support/load'
load '../../node_modules/bats-assert/load'

@test "no file given" {
  run awk -f ./exercises/001-two-fer/two-fer.awk < /dev/null

  assert_success

  assert_output "One for you, one for me."
}

@test "empty file given" {
  run awk -f ./exercises/001-two-fer/two-fer.awk ./exercises/001-two-fer/empty.txt

  assert_success

  assert_output "One for you, one for me."
}

@test "a name given" {
  run awk -f ./exercises/001-two-fer/two-fer.awk ./exercises/001-two-fer/one.txt

  assert_success

  assert_output "One for Alice, one for me."
}

@test "name with a space" {
  run awk -f ./exercises/001-two-fer/two-fer.awk <<< "Mary Ann"

  assert_success

  assert_output "One for Mary Ann, one for me."
}
