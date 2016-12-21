### Running Clojure with Bazel
One way to run Clojure is via a standard `java_binary` rule with a java wrapper invoked by a Bazel macro.

#### Documentation
Bash script creating Java wrapper is [wrapper.sh](wrapper.sh)

Clojure rules are defined in [clojure.bzl](clojure.bzl) file. The default namespace is `core` and default method is `-main` (like in Leinigen).

Mandatory parameters in a `BUILD` file are:

* `name` (of your target)
* `srcs` (that is, Clojure files)

See usage examples in [tests](tests/BUILD)

Run tests with `bazel run //build_tools/clojure/tests:{name_of_test}` for example `bazel run //build_tools/clojure/tests:one_namespace`

#### TODO
Namespaces
