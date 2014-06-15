#!/usr/bin/env sh

emacs -batch -l ert -l clock-face.el -l clock-face-test.el -f ert-run-tests-batch-and-exit
