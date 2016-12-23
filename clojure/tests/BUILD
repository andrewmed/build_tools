load("//build_tools/clojure:clojure.bzl", "clojure")

clojure(
    name = "one",
)

# automatically available are: "one_library", "one_deploy.jar"

clojure(
    name = "two",
    deps = [
        ":one_library",
    ],
)
