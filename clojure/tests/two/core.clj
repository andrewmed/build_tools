(ns two.core
    (:require  one.other))

(defn -main [& args]
      (println "\nParameters are" args)
      (println "Root namespace is" (str *ns*))
      (println "Dependencies:"  one.other/namespace)
      )


