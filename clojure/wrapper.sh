#!/usr/bin/env bash
envsubst > $1 <<EOF

import clojure.lang.RT;
import clojure.lang.Var;
import clojure.lang.Symbol;

public class `basename $1 .java` {
    public static void main(String[] args) throws Exception {
        String main = "$2";
        RT.var("clojure.core", "require").invoke(Symbol.intern(main));
        Var.pushThreadBindings(RT.map(RT.var("clojure.core", "*ns*"), main));
        RT.var(main, "$3").applyTo(RT.seq(args));
    }
}
EOF
