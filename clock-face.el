;;; clock-face.el --- Interact with Unicode CLOCK FACE symbols.

;;; Commentary:

;;; Code:

(provide 'clock-face)

(defvar clock-face--hour->english
  '(("01" . "ONE")
    ("02" . "TWO")
    ("03" . "THREE")
    ("04" . "FOUR")
    ("05" . "FIVE")
    ("06" . "SIX")
    ("07" . "SEVEN")
    ("08" . "EIGHT")
    ("09" . "NINE")
    ("10" . "TEN")
    ("11" . "ELEVEN")
    ("12" . "TWELVE"))
  "Mapping of zero-padded hour to English.")

(defun clock-face--oclock-or-thirty (minute)
  "Get the most accurate Unicode character suffix for `MINUTE'."
  (if (< minute 30) " OCLOCK" "-THIRTY"))

(defun clock-face--get-char-name (hour minute)
  "The Unicode name for clock face character nearest to `HOUR' and `MINUTE'."
  (let ((h (cdr (assoc hour clock-face--hour->english)))
        (m (clock-face--oclock-or-thirty (string-to-number minute))))
    (concat "CLOCK FACE " h m)))

(defun clock-face--get-char (hour minute)
  "The Unicode clock face character nearest to `HOUR' and `MINUTE'."
  (cdr (assoc (clock-face--get-char-name hour minute) (ucs-names))))

(defun clock-face--current ()
  "Get the Unicode clock face character for the current time."
  (clock-face--get-char (format-time-string "%I")
                        (format-time-string "%M")))

(defun clock-face-insert-current ()
  "Insert the Unicode clock face representing the current time."
  (interactive)
  (insert-char (clock-face--current)))

(provide 'clock-face)

;;; clock-face.el ends here
