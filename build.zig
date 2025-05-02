const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimze = b.standardOptimizeOption(.{});

    const libfzf = b.addSharedLibrary(.{
        .name = "libfzf",
        .target = target,
        .optimize = optimze,
    });

    libfzf.addIncludePath(b.path("src/"));
    libfzf.addCSourceFile(.{
        .file = b.path("src/fzf.c"),
        .flags = &.{
            "-Wall",
            "-Wextra",
            "-O3",
        },
    });
    libfzf.linkLibC();

    b.installArtifact(libfzf);
}
