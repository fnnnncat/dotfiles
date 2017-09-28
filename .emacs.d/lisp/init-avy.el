(use-package avy
             :ensure t
             :config
             (avy-setup-default)
             :bind
             ("M-s" . avy-goto-char))

(provide 'init-avy)
