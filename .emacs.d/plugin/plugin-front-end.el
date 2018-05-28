;; WEB
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-commet-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-enable-css-colorization t))

(use-package emmet-mode
  :ensure t
  :config
  (setq emmet-move-cursor-between-quotes t)
  (setq emmet-self-closing-tag-style " /")
  (add-hook 'rjsx-mode 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'js2-mode 'emmet-mode)
  (add-hook 'js2-jsx-mode 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert t)))
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

;; JS
(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq forward-sexp-function nil))

;; JSX
(use-package rjsx-mode
  :ensure t
  :init
  (setq js-switch-indent-offset 2)
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode)
               (with-eval-after-load 'rjsx-mode
                 (define-key rjsx-mode-map "<" nil)
                 (define-key rjsx-mode-map (kbd "C-d") nil)
                 (define-key rjsx-mode-map ">" nil))))

;; TYPESCRIPT
(use-package typescript-mode
  :ensure t
  :config
  (setq js-switch-indent-offset 2))


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

(use-package tide
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  :hook
  (before-save . tide-format-before-save)
  (typescript-mode . setup-tide-mode)
  (web-mode . (lambda()
                (when (string-equal "tsx" (file-name-extension buffer-file-name))
                  (setup-tide-mode)
                  (setq emmet-expand-jsx-className? t)))))


(provide 'plugin-front-end)
