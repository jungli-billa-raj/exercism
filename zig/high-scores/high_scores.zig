const std = @import("std");

pub const HighScores = struct {
    // This struct, as well as its fields and methods, needs to be implemented.

    scores: []const i32,

    pub fn init(scores: []const i32) HighScores {
        return .{.scores = scores};
    }

    pub fn latest(self: *const HighScores) ?i32 {
        return self.scores[self.scores.len-1];
    }

    pub fn personalBest(self: *const HighScores) ?i32 {
        var best:i32 = 0;
        for (self.scores) |v|{
            if (v>best) best =v;
        }
        return best;
    }

    pub fn personalTopThree(self: *const HighScores) []const i32 {
        var gpa = std.heap.GeneralPurposeAllocator(.{}){};
        const allocator = gpa.allocator();
        defer _ = gpa.deinit();
        var sorted_scores = allocator.alloc(i32, self.scores.len) catch [0]i32{};
        std.mem.copyForwards(i32, sorted_scores, self.scores);
        std.sort.block(i32, &sorted_scores, {}, std.sort.asc(i32));
        return [_]i32{sorted_scores[0],sorted_scores[1],sorted_scores[2]} ;
    }
};
