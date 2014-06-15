;;; clock-face.el --- Interact with Unicode CLOCK FACE symbols.

;;; Commentary:

;; The most "helpful" function here inserts at point the Unicode clock
;; face character corresponding to the current hour.

;;; Code:

(provide 'clock-face)

(defvar clock-face-number-to-str
  '((0 . "🕛")
    (1 . "🕐")
    (2 . "🕑")
    (3 . "🕒")
    (4 . "🕓")
    (5 . "🕔")
    (6 . "🕕")
    (7 . "🕖")
    (8 . "🕗")
    (9 . "🕘")
    (10 . "🕙")
    (11 . "🕚"))
  "Mapping of numeric hour index to Unicode character string.")

(defun clock-face--hour->index (hour)
  "Convert HOUR to an index."
  (if (> hour 11) (- hour 12) hour))

(defun clock-face--index (time-string)
  "Get a numeric hour index from TIME-STRING.
The index can be used to lookup a clock face string in
`clock-face-number-to-str'."
  (clock-face--hour->index
   (string-to-number
    (car (split-string (nth 3 (split-string time-string)) ":")))))

(defun clock-face--str (hour)
  "Get a clock face Unicode character string for HOUR."
  (cdr (assoc (clock-face--hour->index hour) clock-face-number-to-str)))

(defun clock-face-current ()
  "Get the current clock face character string."
  (clock-face--str (clock-face--index (current-time-string))))

(defun clock-face-insert-current ()
  "Insert the current clock face character string."
  (interactive)
  (insert (clock-face-current)))

(provide 'clock-face)

;;; clock-face.el ends here
