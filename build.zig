const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const lib_mod = b.createModule(
        .{
            .root_source_file = b.path("src/root.zig"),
            .target = target,
            .optimize = optimize,
        }
    );
    const lib = b.addLibrary(
        .{
            .linkage = .static,
            .name = "zhangshield",
            .root_module = lib_mod,
        }
    );
    b.installArtifact(lib);
    const lib_test = b.addTest(
        .{
            .root_source_file = b.path("./src/tests.zig"),
            .target = target,
            .optimize = optimize,
        }
    );
    const test_step = b.step("test", "Run library tests.");
    test_step.dependOn(&lib_test.step);
    
}
