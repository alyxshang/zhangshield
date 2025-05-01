// Zhangshield by Alyx Shang.
// Licensed under the FSL v1.

// Importing the standard
// library to use the 
// "expect" function.
const std = @import("std");

// Making an alias for the
// "expect" function.
const expect = std.testing.expect;

// Importing the "root" module
// to test it.
const shield = @import("root.zig");

// Testing the "is_letter"
// function for a "true"
// and "false" case,
// respectively.
test "Is a letter." {
    try expect(
        shield.is_letter('a')
    );
    try expect(
        shield.is_letter('8') == false
    );
}

// Testing the "is_digit"
// function for a "true"
// and "false" case, 
// respectively.
test "Is a digit."{
    try expect(
        shield.is_digit('8')
    );
    try expect(
        shield.is_digit('a') == false
    );
}

// Testing the "is_upper"
// function for a "true"
// and "false" case, 
// respectively.
test "Is uppercase."{
    try expect(
        shield.is_upper('A')
    );
    try expect(
        shield.is_upper('a') == false
    );
}

// Testing the "is_lower"
// function for a "true"
// and "false" case, 
// respectively.
test "Is lowercase."{
    try expect(
        shield.is_lower('a')
    );
    try expect(
        shield.is_lower('A') == false
    );
}

// Testing the "digit_distance"
// function.
test "Distance between integers."{
    try expect (
        shield.digit_distance(8,3) == 5
    );
}

// Testing the "security_score"
// function.
test "Security score of a password."{
    try expect (
        shield.security_score("1978TechnoSupremacy", 8,9) != 0
    );
}

// Testing the "reduce_char_to_num"
// function.
test "Reducing a character to an number."{
    try expect (
        shield.reduce_char_to_num('H', 8,9) == 8
    );
}

// Testing the "char_type"
// function.
test "Determining the character type."{
    try expect (
        shield.char_type('H') == shield.StringType.Letter
    );
}

// Testing the "str_len" function.
test "Determining string length."{
    try expect(
        shield.str_len("hello") == 5 
    );
}
