(defproject decoder "0.1.0-SNAPSHOT"
  :description "Video decoder for an audio visual art project"
  :url "http://example.com/FIXME"
  :license {:name "Mozilla Public License, version 2.0"
            :url "https://www.mozilla.org/MPL/2.0/"}
  :dependencies [[org.clojure/clojure "1.5.1"]]
  :main ^:skip-aot decoder.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}
             :dev {:plugins [[com.jakemccrary/lein-test-refresh "0.5.2"]]}})
