def _implementation(ctx):

  ctx.action(
          inputs = [ctx.file.src],
          outputs = [ctx.outputs.executable],
          arguments = ["-o " + ctx.outputs.executable.path + " " + ctx.file.src.path],
          executable = ctx.executable.haskell,
          use_default_shell_env = True,
          )

haskell_binary = rule(
    implementation = _implementation,
    attrs = {
                "src": attr.label(allow_single_file= FileType([".hs"])),
                "haskell": attr.label(executable=True, allow_files=True, default=Label("//build_tools:haskell"), cfg="host"),
            },
    executable = True,
)
