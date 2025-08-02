(ns leap)

;; use the cond guard with mod function to determine if leap or not
(defn leap-year? "Determines if leap year or not" [year]
      (cond
        ;; divisible by 400, thus leap
        (zero? (mod year 400)) true
        ;; divisible by 100, but not 400, thus not leap
        (zero? (mod year 100)) false
        ;; divisible by 4, but not 100, thus leap
        (zero? (mod year 4)) true
        ;; not divisible by 4, thus not leap
        :else false))


