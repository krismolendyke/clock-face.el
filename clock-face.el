;;; clock-face.el --- Interact with Unicode CLOCK FACE symbols.

;;; Commentary:

;;; Code:

(provide 'clock-face)

(defvar clock-face--hour->face
  '(("01" . "🕐")
    ("02" . "🕑")
    ("03" . "🕒")
    ("04" . "🕓")
    ("05" . "🕔")
    ("06" . "🕕")
    ("07" . "🕖")
    ("08" . "🕗")
    ("09" . "🕘")
    ("10" . "🕙")
    ("11" . "🕚")
    ("12" . "🕛"))
  "Mapping of zero-padded hour to Unicode character string.")

(defun clock-face--get (hour)
  "Get the clock face for the given hour."
  (cdr (assoc hour clock-face--hour->face)))

(defun clock-face-current ()
  "Get the current clock face character string."
  (clock-face--get (format-time-string "%I")))

(defun clock-face-insert-current ()
  "Insert the current clock face character string."
  (interactive)
  (insert (clock-face-current)))

(provide 'clock-face)

;;; clock-face.el ends here
