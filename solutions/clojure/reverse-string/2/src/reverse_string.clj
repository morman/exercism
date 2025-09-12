(ns reverse-string)

;; Given a string, reverse-string returns the reverse of the string
(defn reverse-string [s]
      ;; TODO: eschew the inner function and instead use "into" for the collation of reversed characters as suggested by amirci
      ;; https://clojuredocs.org/clojure.core/into
      ;; "into" returns a new coll consisting of to-coll with all of the items of from-coll conjoined. A transducer may be supplied.
      ;; So we need to join the reversed characters we pull off the tail of "s" somehow. What is our transducer? Do we need one?
      ;; From StackOverflow: "From the documentation, into appears to be syntactic sugar for (reduce conj to-coll from-coll). "
      ;; https://stackoverflow.com/questions/14928217/reversing-sequences-without-standard-libraries-in-clojure
      ;; But how to I get a string instead of a collection of characters? (\t\o\b\o\r) versus "tobor" as output?
      ;; Oops, I accidentally found someones reverse solution using "into" as requested: do I understand it? Maybe?
      ;; "Apply the string function to the reduction of the conjunction of the collections of empty and provided s, tail-recursively?
      (apply str (into () s)))
;; Yes, the tests pass. Interesting. The "into" functionality is powerful collection magic!

