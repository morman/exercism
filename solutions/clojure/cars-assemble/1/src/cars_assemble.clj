(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  ;; 0: 0% success rate.
  ;1 to 4: 100% success rate.
  ;5 to 8: 90% success rate.
  ;9: 80% success rate.
  ;10: 77% success rate.
  [speed]
  (cond (= speed 0) (double 0)
        (< speed 5) (double (* 221 speed))
        (< speed 9) (double (* (* 221 speed) 0.9))
        (< speed 10) (double (* (* 221 speed) 0.8))
        (= speed 10) (double (* (* 221 speed) 0.77))
        :else   "Expression to evaluate in all other cases")
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60))
  )
