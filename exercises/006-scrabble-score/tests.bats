#!/usr/bin/env bats

load "../../test/common-setup"
load "../../test/get-test-folder"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
AWK_FILE=$TEST_FOLDER/scrabble-score.awk

setup() {
  common_setup
}

@test 'lowercase letter' {
    run awk -f $AWK_FILE <<< 'a'
    
    assert_success
    assert_output 'A,1'
}

@test 'uppercase letter' {
    run awk -f $AWK_FILE <<< 'A'
    
    assert_success
    assert_output 'A,1'
}

@test 'valuable letter' {
    run awk -f $AWK_FILE <<< 'f'
    
    assert_success
    assert_output 'F,4'
}

@test 'short word' {
    run awk -f $AWK_FILE <<< 'at'
    
    assert_success
    assert_output 'AT,2'
}

@test 'short, valuable word' {
    run awk -f $AWK_FILE <<< 'zoo'
    
    assert_success
    assert_output 'ZOO,12'
}

@test 'medium word' {
    run awk -f $AWK_FILE <<< 'street'
    
    assert_success
    assert_output 'STREET,6'
}

@test 'medium, valuable word' {
    run awk -f $AWK_FILE <<< 'quirky'
    
    assert_success
    assert_output 'QUIRKY,22'
}

@test 'long, mixed-case word' {
    run awk -f $AWK_FILE <<< 'OxyphenButazone'
    
    assert_success
    assert_output 'OXYPHENBUTAZONE,41'
}

@test 'english-like word' {
    run awk -f $AWK_FILE <<< 'pinata'
    
    assert_success
    assert_output 'PINATA,8'
}

@test 'empty input' {
    run awk -f $AWK_FILE <<< ''
    
    assert_success
    assert_output ',0'
}

@test 'entire alphabet available' {
    run awk -f $AWK_FILE <<< 'abcdefghijklmnopqrstuvwxyz'
    
    assert_success
    assert_output 'ABCDEFGHIJKLMNOPQRSTUVWXYZ,87'
}

@test 'bonus: blank tile counts as zero' {
    run awk -f $AWK_FILE <<< 'abcdefghijklmnop rstuvwxyz'
    
    assert_success
    assert_output 'ABCDEFGHIJKLMNOP RSTUVWXYZ,77'
}
