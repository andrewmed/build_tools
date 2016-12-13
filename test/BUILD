package(default_visibility = ["//visibility:public"])

filegroup(
    name = "clojure_test1",
    srcs = glob([
        "clojure-test1/**/*.clj",
    ]),
)

java_binary(
    name = "clojure-test1",
    classpath_resources = ["clojure_test1"],
    main_class = "ClojureCoreRunner",
    runtime_deps = [
        "//build_tools:ClojureCoreRunner",
    ],
)
