(ns one.core
    (:require  one.other one.namespace1.core one.dashed-namespace.core))

(println "Root namespace is" (str *ns*))

(defn -main [& args]
      (println "\nParameters are" args)
      (println "Root namespace is" (str *ns*))
      (println "Other namespaces:"  one.other/namespace one.namespace1.core/namespace one.dashed-namespace.core/namespace)
      )


