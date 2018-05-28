(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind
  ([f1] . 'neotree-toggle))

(use-package all-the-icons
  :ensure t
  :defer neotree)

(provide 'plugin-neotree)
