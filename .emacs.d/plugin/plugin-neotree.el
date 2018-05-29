(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  ;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )

;; (use-package all-the-icons
;;   :ensure t
;;   :defer neotree)

(provide 'plugin-neotree)
