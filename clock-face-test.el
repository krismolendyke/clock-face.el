;;; clock-face-test.el --- Unit tests for clock-face.el.

;;; Commentary:
;;

(require 'clock-face)
(require 'ert)

(ert-deftest clock-face--oclock-or-thirty ()
  "Minutes less than 30 should return the nearest hour.  Minutes
  greater than 30 should return the nearest half hour."
  (should (stringp (clock-face--oclock-or-thirty 0)))
  (should (equal " OCLOCK" (clock-face--oclock-or-thirty 0)))
  (should (equal " OCLOCK" (clock-face--oclock-or-thirty 29)))
  (should (equal "-THIRTY" (clock-face--oclock-or-thirty 30)))
  (should (equal "-THIRTY" (clock-face--oclock-or-thirty 59))))

(ert-deftest clock-face--get-char-name ()
  "Character name should be a valid `ucs-names' representation of
  a clock face character."
  (should (gethash (clock-face--get-char-name "01" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "01" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "02" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "02" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "03" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "03" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "04" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "04" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "05" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "05" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "06" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "06" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "07" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "07" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "08" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "08" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "09" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "09" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "10" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "10" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "11" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "11" "30") (ucs-names)))
  (should (gethash (clock-face--get-char-name "12" "00") (ucs-names)))
  (should (gethash (clock-face--get-char-name "12" "30") (ucs-names)))
  (should (equal "CLOCK FACE ONE OCLOCK" (clock-face--get-char-name "01" "00")))
  (should (equal "CLOCK FACE ONE OCLOCK" (clock-face--get-char-name "01" "29")))
  (should (equal "CLOCK FACE ONE-THIRTY" (clock-face--get-char-name "01" "30")))
  (should (equal "CLOCK FACE ONE-THIRTY" (clock-face--get-char-name "01" "59")))
  (should (equal "CLOCK FACE TWO OCLOCK" (clock-face--get-char-name "02" "00")))
  (should (equal "CLOCK FACE TWO OCLOCK" (clock-face--get-char-name "02" "29")))
  (should (equal "CLOCK FACE TWO-THIRTY" (clock-face--get-char-name "02" "30")))
  (should (equal "CLOCK FACE TWO-THIRTY" (clock-face--get-char-name "02" "59")))
  (should (equal "CLOCK FACE THREE OCLOCK" (clock-face--get-char-name "03" "00")))
  (should (equal "CLOCK FACE THREE OCLOCK" (clock-face--get-char-name "03" "29")))
  (should (equal "CLOCK FACE THREE-THIRTY" (clock-face--get-char-name "03" "30")))
  (should (equal "CLOCK FACE THREE-THIRTY" (clock-face--get-char-name "03" "59")))
  (should (equal "CLOCK FACE FOUR OCLOCK" (clock-face--get-char-name "04" "00")))
  (should (equal "CLOCK FACE FOUR OCLOCK" (clock-face--get-char-name "04" "29")))
  (should (equal "CLOCK FACE FOUR-THIRTY" (clock-face--get-char-name "04" "30")))
  (should (equal "CLOCK FACE FOUR-THIRTY" (clock-face--get-char-name "04" "59")))
  (should (equal "CLOCK FACE FIVE OCLOCK" (clock-face--get-char-name "05" "00")))
  (should (equal "CLOCK FACE FIVE OCLOCK" (clock-face--get-char-name "05" "29")))
  (should (equal "CLOCK FACE FIVE-THIRTY" (clock-face--get-char-name "05" "30")))
  (should (equal "CLOCK FACE FIVE-THIRTY" (clock-face--get-char-name "05" "59")))
  (should (equal "CLOCK FACE SIX OCLOCK" (clock-face--get-char-name "06" "00")))
  (should (equal "CLOCK FACE SIX OCLOCK" (clock-face--get-char-name "06" "29")))
  (should (equal "CLOCK FACE SIX-THIRTY" (clock-face--get-char-name "06" "30")))
  (should (equal "CLOCK FACE SIX-THIRTY" (clock-face--get-char-name "06" "59")))
  (should (equal "CLOCK FACE SEVEN OCLOCK" (clock-face--get-char-name "07" "00")))
  (should (equal "CLOCK FACE SEVEN OCLOCK" (clock-face--get-char-name "07" "29")))
  (should (equal "CLOCK FACE SEVEN-THIRTY" (clock-face--get-char-name "07" "30")))
  (should (equal "CLOCK FACE SEVEN-THIRTY" (clock-face--get-char-name "07" "59")))
  (should (equal "CLOCK FACE EIGHT OCLOCK" (clock-face--get-char-name "08" "00")))
  (should (equal "CLOCK FACE EIGHT OCLOCK" (clock-face--get-char-name "08" "29")))
  (should (equal "CLOCK FACE EIGHT-THIRTY" (clock-face--get-char-name "08" "30")))
  (should (equal "CLOCK FACE EIGHT-THIRTY" (clock-face--get-char-name "08" "59")))
  (should (equal "CLOCK FACE NINE OCLOCK" (clock-face--get-char-name "09" "00")))
  (should (equal "CLOCK FACE NINE OCLOCK" (clock-face--get-char-name "09" "29")))
  (should (equal "CLOCK FACE NINE-THIRTY" (clock-face--get-char-name "09" "30")))
  (should (equal "CLOCK FACE NINE-THIRTY" (clock-face--get-char-name "09" "59")))
  (should (equal "CLOCK FACE TEN OCLOCK" (clock-face--get-char-name "10" "00")))
  (should (equal "CLOCK FACE TEN OCLOCK" (clock-face--get-char-name "10" "29")))
  (should (equal "CLOCK FACE TEN-THIRTY" (clock-face--get-char-name "10" "30")))
  (should (equal "CLOCK FACE TEN-THIRTY" (clock-face--get-char-name "10" "59")))
  (should (equal "CLOCK FACE ELEVEN OCLOCK" (clock-face--get-char-name "11" "00")))
  (should (equal "CLOCK FACE ELEVEN OCLOCK" (clock-face--get-char-name "11" "29")))
  (should (equal "CLOCK FACE ELEVEN-THIRTY" (clock-face--get-char-name "11" "30")))
  (should (equal "CLOCK FACE ELEVEN-THIRTY" (clock-face--get-char-name "11" "59")))
  (should (equal "CLOCK FACE TWELVE OCLOCK" (clock-face--get-char-name "12" "00")))
  (should (equal "CLOCK FACE TWELVE OCLOCK" (clock-face--get-char-name "12" "29")))
  (should (equal "CLOCK FACE TWELVE-THIRTY" (clock-face--get-char-name "12" "30")))
  (should (equal "CLOCK FACE TWELVE-THIRTY" (clock-face--get-char-name "12" "59"))))

(provide 'clock-face-test)

;;; clock-face-test.el ends here
