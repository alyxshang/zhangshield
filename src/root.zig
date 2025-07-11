// Zhangshield by Alyx Shang.
// Licensed under the FSL v1.

/// An enum to describe all possible
/// character types.
pub const StringType = enum(u8) {
    Number, 
    Letter, 
    SpecialChar 
};

/// Returns the distance between two
/// digits. This function does not
/// account for one argument being
/// larger than the other or the
/// other way around. The distance
/// is returned as a signed integer.
pub fn digit_distance(a: i32, b: i32) i32 {
    var result: i32 = 0;
    if (a > b) {
        result = a - b;
    } else if (a < b) {
        result = b - a;
    } else {
        result = 0;
    }
    return result;
}

/// This function checks whether the
/// supplied character is an uppercase
/// letter or not. A boolean to reflect
/// this is returned.
pub fn is_upper(subject: u8) bool {
    const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var result: bool = false;
    for (0..26) |i| {
        if (subject == alphabet[i]){
            result = true;
        }
        else {}
    }
    return result;
}

/// This function checks whether the
/// supplied character is a lowercase
/// letter or not. A boolean to reflect
/// this is returned.
pub fn is_lower(subject: u8) bool {
    const alphabet = "abcdefghijklmnopqrstuvwxyz";
    var result: bool = false;
    for (0..26) |i| {
        if (subject == alphabet[i]){
            result = true;
        }
        else {}
    }
    return result;
}

/// This function checks whether the supplied
/// character is a letter in the alphabet.
/// The function accounts for both uppercase
/// or lowercase letters. A boolean to reflect
/// this is returned.
pub fn is_letter(subject: u8) bool {
    return is_lower(subject) or is_upper(subject);
}

/// This function checks whether the
/// supplied character is a digit or not.
/// A boolean to reflect
/// this is returned.
pub fn is_digit(subject: u8) bool {
    var result: bool = false;
    const digits = "1234567890";
    for (0..10) |i| {
        if (subject == digits[i]) {
            result = true;
        } 
        else {}
    }
    return result;
}

/// This function determines
/// the type of character
/// supplied. One variant of the 
/// `StringType` enum is returned.
pub fn char_type(
    subject: u8
) StringType {
    var str_type: StringType = .SpecialChar;
    if (is_letter(subject)) {
        str_type = .Letter;
    } 
    else if (is_digit(subject)) {
        str_type = .Number;
    } 
    else {}
    return str_type;
}

/// This function returns the
/// reduction of a character to
/// a number. 
pub fn reduce_char_to_num(
    subject: u8, 
    letterWeight: i32, 
    specialWeight: i32
) i32 {
    const str_type: StringType = char_type(subject);
    const result: i32 = switch (str_type) {
        .Letter => letterWeight,
        .Number => subject - '0',
        .SpecialChar => specialWeight,
    };
    return result;
}

/// This function returns
/// the length of a string
/// with a null-terminator
/// as an unsigned integer.
pub fn str_len(
    subject: [*:0]const u8
) usize {
    var len: usize = 0;
    var copy = subject;
    while (copy[0] != 0) {
        len += 1;
        copy += 1;
    }
    return len;
}

/// This function determines
/// a security score
/// for the given password. This
/// score is returned as a 
/// signed integer.
pub fn security_score(
    password: [*:0]const u8, 
    letterWeight: i32, 
    specialWeight: i32
) i32 {
    var score: i32 = 0;
    const start: usize = 0;
    const len: usize = str_len(password);
    for (start..len) |i| {
        const curr: u8 = password[i];
        var next: u8 = undefined;
        if (i == len) {
            next = password[i - 1];
        } else {
            next = password[i + 1];
        }
        const curr_score = reduce_char_to_num(
            curr, 
            letterWeight, 
            specialWeight
        );
        const next_score = reduce_char_to_num(
            next, 
            letterWeight, 
            specialWeight
        );
        const distance: i32 = digit_distance(
            curr_score, 
            next_score
        );
        score += distance;
    }
    return score;
}
