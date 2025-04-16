const StringType = enum { Number, Letter, SpecialChar };
pub export fn digit_distance(a: i32, b: i32) i32 {
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
pub export fn letter_pos(subject: u8) i32 {
    var result: i32 = 0;
    const alphabet = "abcdefghijklmnopqrstuvwxyz";
    for (0..26) |i| {
        const curr = alphabet[i];
        if (curr == subject) {
            result = i;
        } else {}
    }
    return result;
}
pub export fn is_letter(subject: u8) i32 {
    var result: i32 = 0;
    const alphabet_lower = "abcdefghijklmnopqrstuvwxyz";
    const alphabet_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for (0..26) |i| {
        if (subject == alphabet_lower[i]) {} else if (subject == alphabet_upper[i]) {} else {
            result = 1;
        }
    }
    return result;
}
pub export fn is_digit(subject: u8) i32 {
    var result: i32 = 0;
    const digits = "1234567890";
    for (0..10) |i| {
        if (subject == digits[i]) {} else {
            result = 1;
        }
    }
    return result;
}
pub export fn char_type(subject: u8) StringType {
    var str_type: StringType = .SpecialChar;
    if (is_letter(subject) == 0) {
        str_type = .Letter;
    } else if (is_digit(subject) == 0) {
        str_type = .Number;
    } else {}
    return str_type;
}
pub export fn reduce_char_to_num(subject: u8, letterWeight: i32, specialWeight: i32) i32 {
    const str_type: StringType = char_type(subject);
    const result: i32 = switch (str_type) {
        .Letter => letterWeight,
        .Number => subject - '0',
        .SpecialChar => specialWeight,
    };
    return result;
}
pub export fn security_score(password: []const u8, letterWeight: i32, specialWeight: i32) i32 {
    var score: i32 = 0;
    const str_len: i32 = password.len;
    for (0..str_len) |i| {
        const curr: u8 = password[i];
        var next: u8 = undefined;
        if (i == str_len) {
            next = password[i - 1];
        } else {
            next = password[i + 1];
        }
        const curr_score = reduce_char_to_num(curr, letterWeight, specialWeight);
        const next_score = reduce_char_to_num(next, letterWeight, specialWeight);
        const distance: i32 = digit_distance(curr_score, next_score);
        score += distance;
    }
    return score;
}
