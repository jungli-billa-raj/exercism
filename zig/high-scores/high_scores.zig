const std = @import("std");

pub const HighScores = struct {
    // This struct, as well as its fields and methods, needs to be implemented.

    scores: []const i32,
    top3: []const i32,

    pub fn init(scores: []const i32) HighScores {
        // sort
        // var t:[3]i32 = .{-1} ** 3;
        var t:[3]i32 = .{-1, -1, -1};
        // var t = &[_]i32{-1, -1, -1};

        t[0] = -1;
        t[1] = -1;
        t[2] = -1;

        for (scores) |v| {
            if (v>t[0]){
                t[2] = t[1];
                t[1] = t[0];
                t[0] =v;
            } else if (v>t[1]){
                t[2] = t[1];
                t[1] = v;
            } else if (v>t[2]){
                t[2] =v;
            }
        }

        const n = @min(3, scores.len);

        std.debug.print("{any}\n\n", .{t[0..n]});
        const hs = HighScores{
            .scores = scores,
            // .top3 = &(.{0} ** 3),
            .top3 = t[0..n],
        };


        return hs;
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
      // var first:i32 = -1;
      // var second:i32 = -1;
      // var third:i32 = -1;
      //
      // for (self.scores) |v|{
      //   if (v>first){
      //       third = second;
      //       second = first;
      //       first = v;
      //   } else if (v>second) {
      //       third = second;
      //       second = v;
      //   } else if (v>third){
      //       third = v;
      //   }
      // }
      // self.top3 =  .{ first, second, third };
      //
      // return self.top3[0..];

        return self.top3[0..];
    }
};

//  [ 11, 22, 12, 33, 56, 99, 68, 60 , 32]
pub fn main() !void {
    const scores = &[_]i32{ 40, 100, 70 };
    const my_high_score =  HighScores.init(scores);
    std.debug.print("{any} \n\n", .{my_high_score.latest()});
    std.debug.print("{any} \n\n", .{my_high_score.personalBest()});
    std.debug.print("{any} \n\n", .{my_high_score.personalTopThree()});
    std.debug.print("{any} \n\n", .{my_high_score.scores});
}
