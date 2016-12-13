import clojure.lang.RT;
import clojure.lang.Symbol;


public class ClojureCoreRunner {
    public static void main(String[] args) throws Exception {
        RT.var("clojure.core", "require").invoke(Symbol.intern("core"));
        RT.var("core", "-main").applyTo(RT.seq(args));
    }
}