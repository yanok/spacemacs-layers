(evil-global-set-key 'normal (kbd "[s")  'evil/previous-spelling-error)
(evil-global-set-key 'normal (kbd "]s")  'evil/next-spelling-error)
(evil-global-set-key 'normal (kbd "z g") 'evil/mark-word-as-good)
(evil-global-set-key 'normal (kbd "z G") 'evil/mark-word-as-locally-good)
(evil-global-set-key 'normal (kbd "z =") 'evil/correct-word)
(evil-global-set-key 'normal (kbd "z u") 'flyspell-auto-correct-word)
