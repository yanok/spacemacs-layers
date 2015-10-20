;;; packages.el --- antlr4 Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Ilya Yanok
;;
;; Author: Ilya Yanok <ilya.yanok@gmail.com>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv2

(eval-when-compile
  (require 'yasnippet nil t))

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq antlr4-packages
      '(
        antlr-mode
        ))

;; List of packages to exclude.
(setq antlr4-excluded-packages '())

(defvar antlr4--root (file-name-directory load-file-name))

;; For each package, define a function antlr4/init-<package-name>
;;
(defun antlr4/init-antlr-mode ()
  "Initialize antlr-mode"
  (use-package antlr-mode
    :mode "\\.g4\\'"
    :config (progn
              (flycheck-define-checker antlr4
                "Antlr4 checker"
                :command ("antlr4" "-o" "/tmp" source)
                :error-patterns
                ((error line-start "error(" (+ digit) "): "
                        (file-name) ":" line ":" column ": "
                        (message) line-end))
                :error-filter flycheck-increment-error-columns
                :modes antlr-mode)
              (add-to-list 'flycheck-checkers 'antlr4)
              (evil-define-key 'insert antlr-mode-map (kbd "RET")
                (lambda ()
                  (interactive)
                  (font-lock-fontify-block)
                  (evil-ret)))
              (yas-load-directory (concat antlr4--root "snippets") t)))
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
