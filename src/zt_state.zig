const std = @import("std");

const defs = @import("zt_defs.zig");
pub const ZTermInitOptions = defs.ZTermInitOptions;
pub const ZTermInitError   = defs.ZTermInitError;

/// The ZTerm Database State
///
///
pub const ZTermState = struct {
    allocator: std.mem.Allocator,
    extent_size: usize,
    id_gen: u32,         
};   

pub var state: ZTermState = undefined;

pub fn init(allocator: std.mem.Allocator, options: ZTermInitOptions) ZTermInitError!void{
    state.allocator = allocator;
    state.extent_size = options.extent_size;
}

pub fn deinit() void {

}
