### Various build tools for monorepo and [Bazel](http://www.bazel.io/)

#### Running Clojure with Bazel
* One (primitive) way to run Clojure is using a standard `java_binary` rule with static java wrapper
(works when starting point is `-main` method in a fixed namespace `core`). Run with `bazel run //build_tools/test:clojure-test1`
