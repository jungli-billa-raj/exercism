const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = std.ArrayListUnmanaged(u8){};
    try list.append(allocator, std.ascii.toUpper(words[0]));
    for (words, 0..)  |c, i| {
        if (c==' ' or c=='-'){
            const char = std.ascii.toUpper(words[i+1]);
            try list.append(allocator, char);
        }
        // const formatted_string = std.fmt.allocPrint(allocator, "{s}", .list.items);
        // defer allocator.free(formatted_string);
    }
    return list.items;
}
