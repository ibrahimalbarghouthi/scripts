(def k-factor 32)

(def logistic-base 400)

(defn q-score [rating]
  (Math/pow 10 (/ rating logistic-base)))

(defn expected-score [t1 t2]
  (/ (apply + (map q-score t1))
     (apply + (map q-score (concat t1 t2)))))
