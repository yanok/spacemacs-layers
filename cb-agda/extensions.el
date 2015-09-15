;;; extensions.el --- cb-agda Layer extensions File for Spacemacs
;;; Commentary:
;;; Code:

(defconst cb-agda-pre-extensions
  '(agda-mode)
  "List of all extensions to load before the packages.")

(defconst cb-agda-post-extensions
  '(smart-ops
    aggressive-indent)
  "List of all extensions to load after the packages.")

(eval-when-compile
  (require 'use-package nil t))

(defun cb-agda/init-smart-ops ()
  (use-package smart-ops
    :config
    (define-smart-ops-for-mode 'agda2-mode
      (smart-ops-default-ops)
      (smart-op "$"))))

(defun cb-agda/init-aggressive-indent ()
  (use-package aggressive-indent
    :config
    (add-to-list 'aggressive-indent-excluded-modes 'agda2-mode)))

(defun cb-agda/init-agda-mode ()
  (unless (executable-find "agda-mode")
    (spacemacs-buffer/warning
     (concat "Agda not detected, be sure that Agda binaries are "
             "available in your PATH or check the installation "
             "instructions in the README file.")))
  (use-package agda2-mode
    :if (executable-find "agda-mode")
    :defer t
    :init
    (progn
      (load-file (let ((coding-system-for-read 'utf-8))
                   (shell-command-to-string "agda-mode locate")))
      (defun cb-agda/configure-agda-mode-hooks ()
        (add-hook 'after-save-hook 'agda2-load nil t)
        (add-hook 'before-save-hook 'agda/rewrite-symbols-in-buffer nil t)
        (flycheck-mode -1))

      (add-hook 'agda2-mode-hook 'cb-agda/configure-agda-mode-hooks))
    :config
    (progn
      ;; Editing advice

      (defadvice agda2-next-goal (after show-context activate)
        (agda2-goal-and-context)
        (evil-insert-state))

      (defadvice agda2-previous-goal (after show-context activate)
        (agda2-goal-and-context)
        (evil-insert-state))

      ;; Remap faces

      (core/remap-face 'agda2-highlight-error-face 'flycheck-error)
      (core/remap-face 'agda2-highlight-keyword-face 'font-lock-keyword-face)
      (core/remap-face 'agda2-highlight-bound-variable-face 'font-lock-variable-name-face)
      (core/remap-face 'agda2-highlight-module-face 'font-lock-constant-face)
      (core/remap-face 'agda2-highlight-datatype-face 'font-lock-type-face)
      (core/remap-face 'agda2-highlight-record-face 'font-lock-type-face)
      (core/remap-face 'agda2-highlight-function-face 'default)
      (core/remap-face 'agda2-highlight-primitive-type-face 'font-lock-builtin-face)
      (core/remap-face 'agda2-highlight-symbol-face 'default)

      (custom-set-faces
       `(agda2-highlight-number-face
         ((t
           (:foreground ,solarized-hl-magenta))))

       `(agda2-highlight-field-face
         ((t
           (:foreground ,solarized-hl-cyan))))

       `(agda2-highlight-inductive-constructor-face
         ((t
           (:foreground ,solarized-hl-violet :italic t))))

       `(agda2-highlight-coinductive-constructor-face
         ((t
           (:foreground ,solarized-hl-magenta :italic t))))))))
