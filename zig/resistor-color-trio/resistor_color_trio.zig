const std = @import("std");
const mem = std.mem;

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


pub fn label(allocator: mem.Allocator, colors: []const ColorBand) mem.Allocator.Error![]u8 {
    var first_value:usize = 0;
    var second_value:usize = 0;
    var third_value:usize = 0;
    // var total_result:usize = 0;
    // only kilo, mega and giga
    if (colors.len==3){
        first_value = @intFromEnum(colors[0]);
        second_value = @intFromEnum(colors[1]);
        third_value = @intFromEnum(colors[2]);

        const number = (first_value*10 + second_value) * std.math.pow(usize, 10, third_value);
        const r: []u8 = try std.fmt.allocPrint(allocator, "{d}", .{number});

        const return_value = try switch (r.len) {
            4 => std.fmt.allocPrint(allocator, "{c}.{c} kiloohms", .{r[0], r[1]}),
            // ahh, I'm not considering cases like
            // 3300 ohm and 3000 ohms. The latter shouldn't be 3.0 kiloohms. 
            5 => std.fmt.allocPrint(allocator, "{c}{c} kiloohms", .{r[0], r[1]}),
            6 => std.fmt.allocPrint(allocator, "{c}{c}0 kiloohms", .{r[0], r[1]}),
            7 => std.fmt.allocPrint(allocator, "{c}.{c} megaohms", .{r[0], r[1]}),
            8 => std.fmt.allocPrint(allocator, "{c}{c} megaohms", .{r[0], r[1]}),
            9 => std.fmt.allocPrint(allocator, "{c}{c}0 megaohms", .{r[0], r[1]}),
            10 => std.fmt.allocPrint(allocator, "{c}.{c} gigaohms", .{r[0], r[1]}),
            11 => std.fmt.allocPrint(allocator, "{c}{c} gigaohms", .{r[0], r[1]}),
            12 => std.fmt.allocPrint(allocator, "{c}{c}0 gigaohms", .{r[0], r[1]}),
            else => std.fmt.allocPrint(allocator, "{s} ohms", .{r})
        };
        return return_value;

    } 

    if (colors.len==2) {
        // first_value = @intFromEnum(colors[0]);
        // second_value = @intFromEnum(colors[1]);
        return try std.fmt.allocPrint(allocator, "asdf{s}", .{"wolrd"});
    }

    if (colors.len==1) {
        // first_value = @intFromEnum(colors[0]);
        return try std.fmt.allocPrint(allocator, "asdf{s}", .{"wolrd"});
    } 

        return try std.fmt.allocPrint(allocator, "asdf{s}", .{"wolrd"});
}
