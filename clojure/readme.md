### Running Clojure with Bazel
One way to run Clojure is via a standard `java_binary` rule with a java wrapper invoked by a bazel macro.

#### Documentation
Clojure rules are defined in [clojure.bzl](clojure.bzl) file.

The default namespace is `core` and default method is `-main` (like in Leinigen)

See usage examples in [tests](tests/BUILD)

#### TODO
Namespaces
