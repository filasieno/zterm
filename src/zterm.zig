const std     = @import("std");
const zts     = @import("zt_state.zig");

pub fn init(allocator: std.mem.Allocator, options: zts.ZTermInitOptions) zts.ZTermInitError!void{
    return zts.init(allocator, options);
}

pub fn deinit() void {

}

// ------------------------------------------------------------------------
// Testing
// ------------------------------------------------------------------------

const testing = std.testing;

test "basic add functionality" {
    try init(std.testing.allocator, .{});
    defer deinit();
}
