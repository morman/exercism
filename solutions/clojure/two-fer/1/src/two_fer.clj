(ns two-fer)

;; The function two-fer replies with a sharing phrase, with name if provided, otherwise second-person-pronoun you.
(defn two-fer
      ([] ;; zero arity case, recur with second-person-pronoun
        (two-fer "you"))
      ([name] ;; single arity case, format with name provided
        (format "One for %s, one for me." name)))
