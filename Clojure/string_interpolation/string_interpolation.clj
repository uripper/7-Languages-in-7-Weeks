(ns string_interpolation.)
(defn repeat-string [s n]
  (apply str (repeat n s)))

(defn reverse-string [s]
  (apply str (reverse (seq s))))

(defn find-entropies [s]
  (map (fn [c] (count (filter #(= c %) s))) (seq s)))

(defn sort-by-entropy [s]
  (sort-by (fn [c] (count (filter #(= c %) s))) (seq s)))

(defn hash-string [s]
  (apply str
    (map (fn [c]
           (repeat-string (str c) (count (filter #(= c %) s))))
         (sort-by-entropy s))))

(defn bag-of-words [s]
  (map (fn [c] (count (filter #(= c %) s))) (seq s)))


(defn grouped-bag-of-words [s]
  (group-by (fn [c] (count (filter #(= c %) s))) (seq s)))

(defn wave-function-collapser [s]
  (apply str
    (map (fn [c]
           (repeat-string (str c) (count (filter #(= c %) s))))
         (sort-by-entropy s))))

; Examples
(repeat-string "Hello, " 3)
(repeat-string "MONKEY" 5)
(reverse-string "Hello, World!")
(find-entropies "Hello, World!")
(sort-by-entropy "Hello, World!")
(hash-string "Hello, World!")
(bag-of-words "Hello, World!")
(grouped-bag-of-words "Hello, World!")
(wave-function-collapser "Hello, World!")
