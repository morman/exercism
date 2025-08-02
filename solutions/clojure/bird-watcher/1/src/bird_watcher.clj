(ns bird-watcher)

;; return a vector of bird counts
(def last-week
  [0 2 5 3 7 8 4]
  )

;; get the last element from the vector
(defn today [birds]
  (last birds)
  )

;; increment today's count
(defn inc-bird [birds]
  (assoc birds 6 (+ 1 (today birds))))

;; was there a day with no visiting birds?
(defn day-without-birds? [birds]
  (not-every? pos? birds)
  )

;; calculate the number of visiting birds for the first number of days
(defn n-days-count [birds n]
  (reduce + (take n birds))
  )

;; calculate the number of busy days, where busy days are 5 or more birds
(defn busy-days [birds]
  (count (filter #(> % 4) birds))
  )

;; do the counts alternate between one and zero birds visiting?
;; test both alternating patterns
(defn odd-week? [birds]
  (or
    (= birds [1,0, 1, 0, 1, 0, 1])
    (= birds [0, 1, 0, 1, 0, 1, 0]))
  )