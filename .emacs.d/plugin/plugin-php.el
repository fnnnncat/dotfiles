(use-package php-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
  (setq php-mode-coding-style 'psr2))

(use-package phpcbf
  :ensure t
  :after php-mode
  :hook
  (php-mode . phpcbf-enable-on-save)
  :config
  (custom-set-variables
   '(phpcbf-executable "/Users/_yunfan_/.composer/vendor/bin/phpcbf")
   '(phpcbf-standard "PSR2")))

(provide 'plugin-php)
