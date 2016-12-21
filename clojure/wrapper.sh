ls -la *

touch $1

envsubst > $1 <<EOF

import clojure.lang.RT;
import clojure.lang.IFn;
import clojure.lang.Symbol;
import clojure.java.api.Clojure;


public class Wrapper {
    public static void main(String[] args) throws Exception {
        RT.var("clojure.core", "require").invoke(Symbol.intern("$2"));
        RT.var("$2", "$3").applyTo(RT.seq(args));
//        IFn require = Clojure.var("clojure.core", "require");
//       require.invoke(Clojure.read("start"));
//        IFn start = Clojure.var("start", "-main");
//        start.invoke(args);
    }
}

EOF
