package(default_visibility = ["//visibility:public"])

sh_binary(
    name = "haskell",
    srcs = ["haskell.sh"],
)

java_library(
    name = "ClojureCoreRunner",
    srcs = ["ClojureCoreRunner.java"],
    deps = [
        "@clojure//jar",
    ],
)
