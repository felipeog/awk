#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/acronym.awk

setup() {
  common_setup
}

@test 'basic' {
  run awk -f $AWK_FILE <<< 'Portable Network Graphics'
  
  assert_success
  assert_output 'PNG'
}

@test 'lowercase words' {
  run awk -f $AWK_FILE <<< 'Ruby on Rails'
  
  assert_success
  assert_output 'ROR'
}

@test 'punctuation' {
  run awk -f $AWK_FILE <<< 'First In, First Out'
  
  assert_success
  assert_output 'FIFO'
}

@test 'all caps word' {
  run awk -f $AWK_FILE <<< 'GNU Image Manipulation Program'
  
  assert_success
  assert_output 'GIMP'
}

@test 'punctuation without whitespace' {
  run awk -f $AWK_FILE <<< 'Complementary metal-oxide semiconductor'
  
  assert_success
  assert_output 'CMOS'
}

@test 'very long abbreviation' {
  run awk -f $AWK_FILE <<< 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'
  
  assert_success
  assert_output 'ROTFLSHTMDCOALM'
}

@test "consecutive delimiters" {
  run awk -f $AWK_FILE <<< "Something - I made up from thin air"
  
  assert_success
  assert_output "SIMUFTA"
}

@test "apostrophes" {
  run awk -f $AWK_FILE <<< "Halley's Comet"
  
  assert_success
  assert_output "HC"
}

@test "underscore emphasis" {
  run awk -f $AWK_FILE <<< "The Road __Not__ Taken"
  
  assert_success
  assert_output "TRNT"
}
