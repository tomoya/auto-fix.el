;;; auto-fix.el --- minor mode to fix current buffer using linter and etc -*- lexical-binding: t -*-

;; Copyright (C) 2019 tomoya.

;; Author: Tomoya Otake <tomoya.ton@gmail.com>
;; Maintainer: Tomoya Otake <tomoya.ton@gmail.com>
;; Keywords: linter, languages, tools
;; Version: 1.0.0
;; X-URL: https://github.com/tomoya/auto-fix/
;; Package-Requires: ((emacs "26.1"))

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Introduction
;; ------------
;;
;; This package is a minor mode to fix current buffer using linter
;; and etc.
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; code:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; User Variables:

(defgroup auto-fix nil
  "Fix current buffer using linter and etc."
  :prefix "auto-fix-"
  :group 'tools)

(defcustom auto-fix-show-errors 'buffer
  "Where to display auto fix error output.
It can either be displayed in its own buffer, in the echo area, or not at all.
Please note that Emacs outputs to the echo area when writing
files and will overwrite auto fix's echo output if used from inside
a `before-save-hook'."
  :type '(choice
          (const :tag "Own buffer" buffer)
          (const :tag "Echo area" echo)
          (const :tag "None" nil))
  :group 'auto-fix)

(defvar-local auto-fix-command nil
  "Set auto-fix command.")

(defvar-local auto-fix-option "--fix"
  "Set fix option string.
Default is `--fix`")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'auto-fix)

;;; auto-fix.el ends here
