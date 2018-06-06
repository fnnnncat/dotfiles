(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :hook
  (php-mode . (lambda() (setq flycheck-phpcs-standard "PSR2"))))

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (with-eval-after-load 'flycheck (flycheck-pos-tip-mode)))

(provide 'plugin-flycheck)
