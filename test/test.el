;;; test.el --- test for evil-textobj-line

;; Copyright (C) 2015 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'ert)
(require 'evil)
(require 'evil-textobj-line-tests)

(require 'evil-textobj-line)

(ert-deftest evil-line-i ()
  "Test `evil-inner-line'"
  (ert-info ("Simple case")
    (evil-test-buffer
     "[T]his is line"
     ("vil")
     "<This is lin[e]>")

    (evil-test-buffer
     "This is first line\nThis is [s]econd line\n"
     ("vil")
     "<This is second lin[e]>"))

  (ert-info ("Has leading spaces")
    (evil-test-buffer
     "This is first line\n     This is [s]econd line\n"
     ("vil")
     "<This is second lin[e]>"))

  (ert-info ("Has trailing spaces")
    (evil-test-buffer
     "This is first line\nThis is [s]econd line    \nThis is third line"
     ("vil")
     "<This is second lin[e]>"))

  (ert-info ("Both leading and trailing spaces")
    (evil-test-buffer
     "This is first line\n    This is [s]econd line    \nThis is third line"
     ("vil")
     "<This is second lin[e]>")))

(ert-deftest evil-line-a ()
  "Test `evil-a-line'"
  (ert-info ("Simple case")
    (evil-test-buffer
     "[T]his is line"
     ("val")
     "<This is lin[e]>")

    (evil-test-buffer
     "This is first line\nThis is [s]econd line\n"
     ("val")
     "<This is second lin[e]>"))

  (ert-info ("Has leading space")
    (evil-test-buffer
     "This is first line\n     This is [s]econd line\n"
     ("val")
     "<     This is second lin[e]>"))

  (ert-info ("Has trailing space")
    (evil-test-buffer
     "This is first line\nThis is [s]econd line    \nThis is third line"
     ("val")
     "<This is second line   [ ]>"))

  (ert-info ("Both leading and trailing spaces")
    (evil-test-buffer
     "This is first line\n    This is [s]econd line    \nThis is third line"
     ("val")
     "<    This is second line   [ ]>")))

;;; test.el ends here
