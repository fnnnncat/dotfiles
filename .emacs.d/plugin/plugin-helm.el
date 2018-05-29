(use-package helm
  :ensure t
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-r" . helm-recentf)
  ("C-x C-f" . helm-find-files)
  ("C-x C-b" . helm-buffers-list))

(use-package helm-rg
  :ensure t
  :after helm)

(use-package helm-projectile
  :ensure t
  :after helm
  :init
  (projectile-mode)
  (helm-projectile-on)
  :bind
  ("C-c p h" . helm-projectile)
  ("C-c p p" . helm-projectile-switch-projectconfig)
  ("C-c p f" . helm-projectile-find-file)
  ("C-c p F" . helm-projectile-find-file-in-known-projects)
  ("C-c p g" . helm-projectile-find-file-dwim)
  ("C-c p d" . helm-projectile-find-dir)
  ("C-c p e" . helm-projectile-recentf)
  ("C-c p a" . helm-projectile-find-other-file)
  ("C-c p i" . helm-projectile-invalidate-cache)
  ("C-c p z" . helm-projectile-cache-current-file)
  ("C-c p b" . helm-projectile-switch-to-buffer)
  ("C-c p s g" . helm-projectile-grep)
  ("C-c p s a" . helm-projectile-ack)
  ("C-c p s r" . helm-projectile-rg))

(use-package helm-themes
  :ensure t)

(provide 'plugin-helm)
