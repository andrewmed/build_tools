#### Running Clojure with Bazel
One way to run Clojure is using a standard `java_binary` rule with a java wrapper invoked by a bazel macro.

Run with ` bazel run //build_tools/clojure/tests:one_namespace`

*TODO: Namespaces*
