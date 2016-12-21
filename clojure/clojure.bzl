def _clojure_wrapper(ctx):
  out = ctx.new_file("Wrapper.java")
  ctx.action(
        inputs = [],
        outputs = [ctx.outputs.wrapper],
        executable = ctx.executable.wrapper,
        arguments = [ctx.outputs.wrapper.path, ctx.attr.namespace, ctx.attr.method],
#        use_default_shell_env = True,
    )

clojure_wrapper = rule(
    implementation = _clojure_wrapper,
    attrs = {
                "wrapper": attr.label(executable=True, allow_files=True, default=Label("//build_tools/clojure:wrapper"), cfg="host"),
                "namespace": attr.string(mandatory=True),
                "method": attr.string(mandatory=True),
            },
    outputs = {
        "wrapper": "Wrapper.java",
    },)

def clojure(name, srcs, namespace="core",  method="-main", visibility=["//visibility:public"] ):
  clojure_wrapper(
      name = "%s_wrapper" % name,
      namespace = namespace,
      method = method,
  )
  native.java_binary(
      name = name,
      srcs = [ ":%s_wrapper" % name ],
      classpath_resources = srcs,
      main_class = "Wrapper",
      deps = [
          "@clojure//jar",
      ]
  )
