(use-package dumb-jump
  :ensure t
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window)
         ("M-g b" . dumb-jump-back)
         ("M-g q" . dumb-jump-quick-look))
  :config
  (setq dumb-jump-selector 'helm)
  (setq dumb-jump-prefer-searcher 'rg))

(provide 'plugin-dumb-jump)
