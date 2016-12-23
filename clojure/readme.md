### Running Clojure with Bazel
One way to run Clojure is via a standard `java_binary` rule with a java wrapper invoked by a Bazel macro.

#### Documentation
Bash script creating Java wrapper is [wrapper.sh](wrapper.sh)

Clojure rules are defined in [clojure.bzl](clojure.bzl) file.

##### Mandatory arguments
* `name` (of your target). All Clojure source files beneath this directory with the same name are included

##### Default arguments
* `namespace` equals `name.core` by default (must be in a `name/core.clj` file)
* `method` equals `-main` by default

##### Additional arguments
* `deps` Dependencies (Clojure core is already included)

##### Available Bazel targets
* `name_library` Library jar with Clojure classes
* `name_library-src.jar` Library jar with Clojure source files
* `name_deploy-src.jar` Library jar with a Java wrapper source file
* `name` Runnable task
* `name_deploy.jar` Runnable jar (as in Leinigen _uberjar_)

#### How-to
Put in your `WORKSPACE` file
```
maven_server(name = "maven",url = "http://repo1.maven.org/maven2/")
maven_jar(server = "maven", name = "clojure", artifact = "org.clojure:clojure:jar:1.8.0")
```

See usage examples in [tests](tests/BUILD)

#### TODO
* make `resource_strip_prefix` in macro get path from the context. I am consulting on this in [Bazel forum](https://groups.google.com/forum/#!topic/bazel-discuss/rPGX8XVzhsA)
