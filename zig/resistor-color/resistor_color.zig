pub const ColorBand = enum(usize) { 
black,
brown,
red,
orange,
yellow,
green,
blue,
violet,
grey,
white,
};

// const ColorBand = struct {
//     black:usize = 0,
//     brown:usize = 1,
//     red:usize= 2,
//     orange:usize= 3,
//     yellow:usize= 4,
//     green:usize= 5,
//     blue:usize= 6,
//     violet:usize= 7,
//     grey:usize= 8,
//     white:usize= 9,
// };

pub fn colorCode(x:ColorBand) usize {
    // const cb = ColorBand{
    //     .black = 0,
    //     .brown = 1,
    //     .red = 2,
    //     .orange = 3,
    //     .yellow = 4,
    //     .green = 5,
    //     .blue = 6,
    //     .violet = 7,
    //     .grey = 8,
    //     .white = 9,
    // };
    //
    return @intFromEnum(x);
}
const all_codes = [_]ColorBand{
    ColorBand.black,
    ColorBand.brown,
    ColorBand.red,
    ColorBand.orange,
    ColorBand.yellow,
    ColorBand.green,
    ColorBand.blue,
    ColorBand.violet,
    ColorBand.grey,
    ColorBand.white,
};

pub fn colors() []const ColorBand {
    return &all_codes;
}
