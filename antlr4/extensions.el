;;; extensions.el --- antlr4 Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq antlr4-pre-extensions
      '(
        ;; pre extension names go here
        ))

(setq antlr4-post-extensions
      '(
        ;; post extension names go here
        ))

(defvar antlr4--root (file-name-directory load-file-name))
;; For each extension, define a function antlr4/init-<extension-name>
;;
;; (defun antlr4/init-antlr4-mode ()
;;   "Initialize antlr4-mode"
;;   (use-package antlr4-mode
;;     :mode "\\.g4\\'"
;;     :config (yas-load-directory (concat antlr4--root "snippets") t))
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
