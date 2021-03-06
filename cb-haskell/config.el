;;; Font locking

(defun haskell/apply-font-locking ()
  (font-lock-add-keywords
   nil
   `((,(rx (or bol space "}" ")" "]")
           (group "$" (? "!"))
           (or eol space "{" "(" "["))
      1 'font-lock-comment-face)

     (,(rx (not (any "(")) (group ",") (not (any ")")))
      1 'font-lock-comment-face)

     ("∀" . font-lock-keyword-face)

     ,(core/font-lock-replace-match (rx (or (and space (group-n 1 ".") space)
                                            (and "(" (group-n 1 ".") ")")
                                            ))
                                    1 "·")

     ,(core/font-lock-replace-match (rx space (group "<-") (or space eol)) 1 "←")
     ,(core/font-lock-replace-match (rx space (group "->") (or space eol)) 1 "→")
     ,(core/font-lock-replace-match (rx space (group "=>") (or space eol)) 1 "⇒")
     ,(core/font-lock-replace-match (rx space (group "::") (or space eol)) 1 "∷")

     ;; Lambda forms
     ,(core/font-lock-replace-match
       (rx (group "\\") (and (* space)
                             (or word "_" (and "(" (* nonl) ")"))
                             (*? nonl))
           (* space) (or "->" "→"))
       1 "λ"))))

(add-hook 'haskell-mode-hook 'haskell/apply-font-locking)
(add-hook 'haskell-interactive-mode-hook 'haskell/apply-font-locking)

(custom-set-faces
 `(haskell-interactive-face-compile-error ((t (:foreground nil)))))

(defun haskell/interactive-apply-font-locking ()
  (font-lock-add-keywords
   nil
   `(("Compilation failed." . '(face nil :foreground compilation-error-face)))))

(add-hook 'haskell-interactive-mode-hook 'haskell/interactive-apply-font-locking)

(defadvice haskell-mode-stylish-buffer (around suppress-window-changes activate)
  "Suppress window-changes."
  (save-window-excursion ad-do-it))

(add-to-list 'core/indent-commands-alist '(haskell-mode . haskell/format-dwim))

(defalias 'ghci 'haskell-interactive-switch)
