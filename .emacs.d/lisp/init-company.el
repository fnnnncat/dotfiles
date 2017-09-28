(use-package company
             :ensure t
             :defer t
             :init
             (global-company-mode)
             (setq
               company-minimum-prefix-length 1
               company-show-numbers t
               company-dabbrev-downcase nil
               company-idle-delay 1)
             :config
             (define-key company-active-map (kbd "M-n") nil)
             (define-key company-active-map (kbd "M-p") nil)
             (define-key company-active-map (kbd "C-n") 'company-select-next)
             (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package company-quickhelp
             :ensure t
             :defer t
             :init
             (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

(provide 'init-company)
