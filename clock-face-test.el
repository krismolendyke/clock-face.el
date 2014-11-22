;;; clock-face-test.el --- Unit tests for clock-face.el.

;;; Commentary:
;;

(require 'clock-face)
(require 'ert)

(ert-deftest clock-face--get ()
  "Current hour should be a string representing the current hour
in 24HR format."
  (should (stringp (clock-face--get (format-time-string "%I"))))
  (should (equal "🕐" (clock-face--get "01")))
  (should (equal "🕑" (clock-face--get "02")))
  (should (equal "🕒" (clock-face--get "03")))
  (should (equal "🕓" (clock-face--get "04")))
  (should (equal "🕔" (clock-face--get "05")))
  (should (equal "🕕" (clock-face--get "06")))
  (should (equal "🕖" (clock-face--get "07")))
  (should (equal "🕗" (clock-face--get "08")))
  (should (equal "🕘" (clock-face--get "09")))
  (should (equal "🕙" (clock-face--get "10")))
  (should (equal "🕚" (clock-face--get "11")))
  (should (equal "🕛" (clock-face--get "12"))))

(provide 'clock-face-test)

;;; clock-face-test.el ends here
