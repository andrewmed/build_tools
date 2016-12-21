### Running Clojure with Bazel
One way to run Clojure is via a standard `java_binary` rule with a java wrapper invoked by a Bazel macro.

#### Documentation
Bash script creating Java wrapper is [wrapper.sh](wrapper.sh)

Clojure rules are defined in [clojure.bzl](clojure.bzl) file.

##### Mandatory arguments
* `name` (of your target)
* `srcs` (that is, Clojure files)

##### Default arguments
* `namespace` is `core` as in Leinigen
* `method` is `-main` as in Leinigen

See usage examples in [tests](tests/BUILD)

Run tests with `bazel run //build_tools/clojure/tests:{name_of_test}`

For example `bazel run //build_tools/clojure/tests:one_namespace`

#### TODO
Namespaces
