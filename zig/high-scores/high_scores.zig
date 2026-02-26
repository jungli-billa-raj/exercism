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
       // var topThree:[]const i32 = undefined; 

       var first:i32 = 0;
       var second:i32 = 0;
       var third:i32 = 0;
       for (self.scores, 0..) |v, index|{
           if (index == 0) {
               first = v;
           }
           if (index == 1){
               if (v>first){
                   second = first;
                   first = v;
               } else {
                   second = v;
               }
               continue;
           }
           if (index>1) {
            if (v>first){
                third = second;
                second = first;
                first = v;
            } else if (v>second) {
                third = second;
                second = v;
            } else if (v>third){
                third = v;
            }
           }
       }
       return &[_]i32{first,second,third};
    }
};
