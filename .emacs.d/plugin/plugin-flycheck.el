(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (with-eval-after-load 'flycheck (flycheck-pos-tip-mode)))
 
(provide 'plugin-flycheck)
