(def k-factor 32)

(def logistic-base 400)

(defn drop-nth [n coll]
  (keep-indexed #(if (not= %1 n) %2) coll))

(defn q-score [rating]
  (Math/pow 10 (/ rating logistic-base)))

(defn expected-score [players opponents]
  (/ (apply + (map q-score players))
     (apply + (map q-score (concat players opponents)))))

(defn rating [players opponents state]
  (+ (first players)
     (* k-factor
        (- state (expected-score players opponents))
        (- 1 (/ (q-score (second players))
                (apply + (map q-score players)))))))

(defn new-rating [players results]
  (map
    (fn [ith]
      (rating [(nth players ith)] (drop-nth ith players) (nth results ith)))
    (range (count players))))


(defn new-rating-partners [players results]
  (map
    (fn [ith]
      (rating [(nth players ith)
               (nth players (mod (+ 2 ith) (count players)))]
              (drop-nth
                (mod (+ 2 ith) (count players))
                (drop-nth ith players)) (nth results ith)))
    (range (count players))))

