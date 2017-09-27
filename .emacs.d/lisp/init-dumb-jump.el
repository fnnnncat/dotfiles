(use-package dumb-jump
             :ensure t
             :config
             (setq dumb-jump-selector 'ivy)
             (global-set-key (kbd "M-g o") 'dumb-jump-go-other-window)
             (global-set-key (kbd "M-g j") 'dumb-jump-go)
             (global-set-key (kbd "M-g x") 'dumb-jump-go-prefer-external)
             (global-set-key (kbd "M-g z") 'dumb-jump-go-prefer-external-other-window))

(provide 'init-dumb-jump)
