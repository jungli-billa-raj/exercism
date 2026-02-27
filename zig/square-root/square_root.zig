pub fn squareRoot(radicand: usize) usize {
    // Newton's formula
    // var x:f32 = 0;
    //
    // while (true) {
    //     if (@as(usize,@floor(x*x)) == radicand){
    //         break;
    //     }
    //     x = 1/2*(x + @as(f32,@floatFromInt(radicand))/x);
    // }
    //
    // return @as(usize, @intFromFloat(x)); 
    const x:usize = 1;
    for (0..radicand) |i| {
        if (i*i == radicand) return i;
    }
    return x;
}
