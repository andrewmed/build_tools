### Running Clojure with Bazel
One way to run Clojure is via a standard `java_binary` rule with a java wrapper invoked by a bazel macro.

#### Documentation
The default namespace is `core` and the main method is `-main` (like in Leinigen)

See usage examples in [tests](tests/BUILD)

#### TODO
Namespaces
