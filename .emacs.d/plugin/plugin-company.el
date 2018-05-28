(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq
   company-minimum-prefix-length 1
   company-show-numbers t
   company-dabbrev-downcase t
   company-idle-delay 0)
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setq-local company-idle-delay nil)
              (linum-mode 0)))
  :config
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package company-go
  :ensure t
  :after company
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))

(provide 'plugin-company)
