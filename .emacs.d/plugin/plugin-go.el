(use-package go-mode
  :ensure t
  :init
  (setenv "GO15VENDOREXPERIMENT" "1")
  (setenv "GOROOT" (exec-path-from-shell-getenv "GOROOT"))
  (setenv "GOPATH" (exec-path-from-shell-getenv "GOPATH"))
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save))
  :config
  (setq tab-width 2)
  (setq indent-tabs-mode 1))

(use-package go-eldoc
  :ensure t
  :after go-mode
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package flymake-go
  :ensure t
  :after go-mode
  :config
  (add-hook 'flymake-mode-hook
            (lambda()
              (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
  (add-hook 'flymake-mode-hook
            (lambda()
              (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
  (add-hook 'flymake-mode-hook
            (lambda()
              (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu))))

(use-package go-add-tags
  :ensure t
  :after go-mode)

(use-package go-direx
  :ensure t)


(provide 'plugin-go)
