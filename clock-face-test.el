;;; clock-face-test.el --- Unit tests for clock-face.el.

;;; Commentary:
;;

(require 'clock-face)
(require 'ert)

(ert-deftest clock-face--index ()
  "Current hour should be a string representing the current hour
in 24HR format."
  (should (numberp (clock-face--index (current-time-string))))
  (should (equal 0 (clock-face--index "Fri Jun 13 00:00:00 2014")))
  (should (equal 0 (clock-face--index "Fri Jun 13 12:00:00 2014")))
  (should (equal 1 (clock-face--index "Fri Jun 13 01:00:00 2014")))
  (should (equal 1 (clock-face--index "Fri Jun 13 13:00:00 2014")))
  (should (equal 2 (clock-face--index "Fri Jun 13 02:00:00 2014")))
  (should (equal 2 (clock-face--index "Fri Jun 13 14:00:00 2014")))
  (should (equal 3 (clock-face--index "Fri Jun 13 03:00:00 2014")))
  (should (equal 3 (clock-face--index "Fri Jun 13 15:00:00 2014")))
  (should (equal 4 (clock-face--index "Fri Jun 13 04:00:00 2014")))
  (should (equal 4 (clock-face--index "Fri Jun 13 16:00:00 2014")))
  (should (equal 5 (clock-face--index "Fri Jun 13 05:00:00 2014")))
  (should (equal 5 (clock-face--index "Fri Jun 13 17:00:00 2014")))
  (should (equal 6 (clock-face--index "Fri Jun 13 06:00:00 2014")))
  (should (equal 6 (clock-face--index "Fri Jun 13 18:00:00 2014")))
  (should (equal 7 (clock-face--index "Fri Jun 13 07:00:00 2014")))
  (should (equal 7 (clock-face--index "Fri Jun 13 19:00:00 2014")))
  (should (equal 8 (clock-face--index "Fri Jun 13 08:00:00 2014")))
  (should (equal 8 (clock-face--index "Fri Jun 13 20:00:00 2014")))
  (should (equal 9 (clock-face--index "Fri Jun 13 09:00:00 2014")))
  (should (equal 9 (clock-face--index "Fri Jun 13 21:00:00 2014")))
  (should (equal 10 (clock-face--index "Fri Jun 13 10:00:00 2014")))
  (should (equal 10 (clock-face--index "Fri Jun 13 22:00:00 2014")))
  (should (equal 11 (clock-face--index "Fri Jun 13 11:00:00 2014")))
  (should (equal 11 (clock-face--index "Fri Jun 13 23:00:00 2014"))))

(ert-deftest clock-face--str ()
  "The Unicode characters returned should be the correct clock
faces for the given hour number."
  (should (stringp (clock-face--str 0)))
  (should (equal "🕛" (clock-face--str 0)))
  (should (equal "🕛" (clock-face--str 12)))
  (should (equal "🕐" (clock-face--str 1)))
  (should (equal "🕐" (clock-face--str 13)))
  (should (equal "🕑" (clock-face--str 2)))
  (should (equal "🕑" (clock-face--str 14)))
  (should (equal "🕒" (clock-face--str 3)))
  (should (equal "🕒" (clock-face--str 15)))
  (should (equal "🕓" (clock-face--str 4)))
  (should (equal "🕓" (clock-face--str 16)))
  (should (equal "🕔" (clock-face--str 5)))
  (should (equal "🕔" (clock-face--str 17)))
  (should (equal "🕕" (clock-face--str 6)))
  (should (equal "🕕" (clock-face--str 18)))
  (should (equal "🕖" (clock-face--str 7)))
  (should (equal "🕖" (clock-face--str 19)))
  (should (equal "🕗" (clock-face--str 8)))
  (should (equal "🕗" (clock-face--str 20)))
  (should (equal "🕘" (clock-face--str 9)))
  (should (equal "🕘" (clock-face--str 21)))
  (should (equal "🕙" (clock-face--str 10)))
  (should (equal "🕙" (clock-face--str 22)))
  (should (equal "🕚" (clock-face--str 11)))
  (should (equal "🕚" (clock-face--str 23))))

(provide 'clock-face-test)

;;; clock-face-test.el ends here
