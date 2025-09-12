(ns reverse-string)

;; Given a string, reverse-string returns the reverse of the string
(defn reverse-string [s]

      ;; create an inner function to remove the first character from the string and store it at the front of a new string
      (defn chopper [string reversed-string]

              (if (clojure.string/blank? string) ;; empty string case, return the completed reversed string
                reversed-string

              ;; string s remains, pull off first char and append to reversed string accumulator and recurse with remaining
              (recur
                (subs string 1 (count string)) ;; the tail of s
                (str
                  (subs string 0 1)
                  reversed-string
                  ) ;; the head of s appended to reversed string
                )
              )
            )

      ;; start chopping the string as a sequence
      (chopper s "")
      )