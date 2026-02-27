const std = @import("std");

pub const HighScores = struct {
    // This struct, as well as its fields and methods, needs to be implemented.

    scores: []const i32,
    sorted: [100]i32,

    pub fn init(scores: []const i32) HighScores {
        // sort 
        var hs = HighScores{
            .scores = scores,
            .sorted = .{0} ** 100,
        };

        //copy of scores in sorted[]
        for (scores, 0..) |v,i| {
            hs.sorted[i] = v;
        }

        std.sort.block(i32, &hs.sorted, {}, comptime std.sort.desc(i32));

        return .{.scores = scores, .sorted = hs.sorted };
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

    const n = @min(3, self.scores.len);
    return self.sorted[0..n];
    }
};

//  [ 11, 22, 12, 33, 56, 99, 68, 60 , 32]
