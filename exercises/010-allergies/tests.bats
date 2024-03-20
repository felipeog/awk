#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/allergies.awk

setup() {
  common_setup
}

@test 'eggs: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,eggs'

  assert_success
  assert_output "false"
}

@test 'eggs: allergic only to eggs' {
  run gawk -f $AWK_FILE <<< '1,allergic_to,eggs'

  assert_success
  assert_output "true"
}

@test 'eggs: allergic to eggs and something else' {
  run gawk -f $AWK_FILE <<< '3,allergic_to,eggs'

  assert_success
  assert_output "true"
}

@test 'eggs: allergic to something, but not eggs' {
  run gawk -f $AWK_FILE <<< '2,allergic_to,eggs'

  assert_success
  assert_output "false"
}

@test 'eggs: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,eggs'

  assert_success
  assert_output "true"
}

@test 'peanuts: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,peanuts'

  assert_success
  assert_output "false"
}

@test 'peanuts: allergic only to peanuts' {
  run gawk -f $AWK_FILE <<< '2,allergic_to,peanuts'

  assert_success
  assert_output "true"
}

@test 'peanuts: allergic to peanuts and something else' {
  run gawk -f $AWK_FILE <<< '7,allergic_to,peanuts'

  assert_success
  assert_output "true"
}

@test 'peanuts: allergic to something, but not peanuts' {
  run gawk -f $AWK_FILE <<< '5,allergic_to,peanuts'

  assert_success
  assert_output "false"
}

@test 'peanuts: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,peanuts'

  assert_success
  assert_output "true"
}

@test 'shellfish: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,shellfish'

  assert_success
  assert_output "false"
}

@test 'shellfish: allergic only to shellfish' {
  run gawk -f $AWK_FILE <<< '4,allergic_to,shellfish'

  assert_success
  assert_output "true"
}

@test 'shellfish: allergic to shellfish and something else' {
  run gawk -f $AWK_FILE <<< '14,allergic_to,shellfish'

  assert_success
  assert_output "true"
}

@test 'shellfish: allergic to something, but not shellfish' {
  run gawk -f $AWK_FILE <<< '10,allergic_to,shellfish'

  assert_success
  assert_output "false"
}

@test 'shellfish: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,shellfish'

  assert_success
  assert_output "true"
}

@test 'strawberries: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,strawberries'

  assert_success
  assert_output "false"
}

@test 'strawberries: allergic only to strawberries' {
  run gawk -f $AWK_FILE <<< '8,allergic_to,strawberries'

  assert_success
  assert_output "true"
}

@test 'strawberries: allergic to strawberries and something else' {
  run gawk -f $AWK_FILE <<< '28,allergic_to,strawberries'

  assert_success
  assert_output "true"
}

@test 'strawberries: allergic to something, but not strawberries' {
  run gawk -f $AWK_FILE <<< '20,allergic_to,strawberries'

  assert_success
  assert_output "false"
}

@test 'strawberries: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,strawberries'

  assert_success
  assert_output "true"
}

@test 'tomatoes: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,tomatoes'

  assert_success
  assert_output "false"
}

@test 'tomatoes: allergic only to tomatoes' {
  run gawk -f $AWK_FILE <<< '16,allergic_to,tomatoes'

  assert_success
  assert_output "true"
}

@test 'tomatoes: allergic to tomatoes and something else' {
  run gawk -f $AWK_FILE <<< '56,allergic_to,tomatoes'

  assert_success
  assert_output "true"
}

@test 'tomatoes: allergic to something, but not tomatoes' {
  run gawk -f $AWK_FILE <<< '40,allergic_to,tomatoes'

  assert_success
  assert_output "false"
}

@test 'tomatoes: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,tomatoes'

  assert_success
  assert_output "true"
}

@test 'chocolate: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,chocolate'

  assert_success
  assert_output "false"
}

@test 'chocolate: allergic only to chocolate' {
  run gawk -f $AWK_FILE <<< '32,allergic_to,chocolate'

  assert_success
  assert_output "true"
}

@test 'chocolate: allergic to chocolate and something else' {
  run gawk -f $AWK_FILE <<< '112,allergic_to,chocolate'

  assert_success
  assert_output "true"
}

@test 'chocolate: allergic to something, but not chocolate' {
  run gawk -f $AWK_FILE <<< '80,allergic_to,chocolate'

  assert_success
  assert_output "false"
}

@test 'chocolate: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,chocolate'

  assert_success
  assert_output "true"
}

@test 'pollen: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,pollen'

  assert_success
  assert_output "false"
}

@test 'pollen: allergic only to pollen' {
  run gawk -f $AWK_FILE <<< '64,allergic_to,pollen'

  assert_success
  assert_output "true"
}

@test 'pollen: allergic to pollen and something else' {
  run gawk -f $AWK_FILE <<< '224,allergic_to,pollen'

  assert_success
  assert_output "true"
}

@test 'pollen: allergic to something, but not pollen' {
  run gawk -f $AWK_FILE <<< '160,allergic_to,pollen'

  assert_success
  assert_output "false"
}

@test 'pollen: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,pollen'

  assert_success
  assert_output "true"
}

@test 'cats: not allergic to anything' {
  run gawk -f $AWK_FILE <<< '0,allergic_to,cats'

  assert_success
  assert_output "false"
}

@test 'cats: allergic only to cats' {
  run gawk -f $AWK_FILE <<< '128,allergic_to,cats'

  assert_success
  assert_output "true"
}

@test 'cats: allergic to cats and something else' {
  run gawk -f $AWK_FILE <<< '192,allergic_to,cats'

  assert_success
  assert_output "true"
}

@test 'cats: allergic to something, but not cats' {
  run gawk -f $AWK_FILE <<< '64,allergic_to,cats'

  assert_success
  assert_output "false"
}

@test 'cats: allergic to everything' {
  run gawk -f $AWK_FILE <<< '255,allergic_to,cats'

  assert_success
  assert_output "true"
}

@test 'no_allergies_at_all' {
  run gawk -f $AWK_FILE <<< '0,list'

  assert_success
  assert_output ""
}

@test 'allergic_to_just_eggs' {
  run gawk -f $AWK_FILE <<< '1,list'

  assert_success
  assert_output "eggs"
}

@test 'allergic_to_just_peanuts' {
  run gawk -f $AWK_FILE <<< '2,list'

  assert_success
  assert_output "peanuts"
}

@test 'allergic_to_just_strawberries' {
  run gawk -f $AWK_FILE <<< '8,list'

  assert_success
  assert_output "strawberries"
}

@test 'allergic_to_eggs_and_peanuts' {
  run gawk -f $AWK_FILE <<< '3,list'

  assert_success
  assert_output "eggs,peanuts"
}

@test 'allergic_to_more_than_eggs_but_not_peanuts' {
  run gawk -f $AWK_FILE <<< '5,list'

  assert_success
  assert_output "eggs,shellfish"
}

@test 'allergic_to_lots_of_stuff' {
  run gawk -f $AWK_FILE <<< '248,list'

  assert_success
  assert_output "strawberries,tomatoes,chocolate,pollen,cats"
}

@test 'allergic_to_everything' {
  run gawk -f $AWK_FILE <<< '255,list'

  assert_success
  assert_output "eggs,peanuts,shellfish,strawberries,tomatoes,chocolate,pollen,cats"
}

@test 'ignore_non_allergen_score_parts' {
  run gawk -f $AWK_FILE <<< '509,list'

  assert_success
  assert_output "eggs,shellfish,strawberries,tomatoes,chocolate,pollen,cats"
}

@test 'no allergen score parts without highest valid score' {
  run gawk -f $AWK_FILE <<< '257,list'

  assert_success
  assert_output "eggs"
}
