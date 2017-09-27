(use-package projectile
             :ensure t
             :config
             (projectile-global-mode)
             (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
             :ensure t
             :config
             (counsel-projectile-on)
             (global-set-key (kbd "C-x C-r") 'counsel-recentf))

(provide 'init-projectile)
