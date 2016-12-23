def _clojure_wrapper(ctx):
  ctx.action(
        inputs = [],
        outputs = [ctx.outputs.wrapper],
        executable = ctx.executable.wrapper,
        arguments = [ctx.outputs.wrapper.path, ctx.attr.namespace, ctx.attr.method],
        use_default_shell_env = True,
    )

clojure_wrapper = rule(
    implementation = _clojure_wrapper,
    attrs = {
                "wrapper": attr.label(executable=True, allow_files=True, default=Label("//build_tools/clojure:wrapper"), cfg="host"),
                "namespace": attr.string(mandatory=True),
                "method": attr.string(mandatory=True),
            },
    outputs = {
        "wrapper": "%{name}.java",
    },)

def clojure(name, namespace="",  deps=[] , method="-main", visibility=["//visibility:public"] ):
  wrapper = "%sWrapper" % name
  library = "%s_library" % name
  if namespace == "":
    namespace = "%s.core" % name
  dependencies = deps + ["@clojure//jar", library]

  clojure_wrapper(
      name = wrapper,
      namespace = namespace,
      method = method,
  )

  native.java_library(
      name = library,
      resources = native.glob(
                          [name + "/**/*.clj"],
                      ),
      resource_strip_prefix = "build_tools/clojure/tests/",
  )

  native.java_binary(
      name = name,
      srcs = [ ":" + wrapper ],
      main_class = wrapper,
      deps = dependencies,
  )
