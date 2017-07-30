;;; package --- init emacs' package
;;; Commentary:
;;; Code:
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'load-path "~/.emacs.d/lisp/"))

(defvar faaaar/packages '(
                           solarized-theme
                           xwidgete
                           company
                           web-beautify
                           use-package
                           smartparens
                           exec-path-from-shell
                           editorconfig
                           flycheck
                           flycheck-pos-tip
                           swiper
                           flx
                           counsel
                           counsel-projectile
                           web-mode
                           emmet-mode
                           js2-mode
                           multiple-cursors
                           ) "Default Packages.")

(setq package-selected-packages faaaar/packages)
(defun faaaar/packages-installed-p ()
  (loop for pkg in faaaar/packages
    when (not (package-installed-p pkg)) do (return nil)
    finally (return t)))

(unless (faaaar/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg faaaar/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; company
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 2)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;; smartparens-config
(require 'smartparens-config)
(smartparens-global-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(show-smartparens-global-mode 1)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; editorconfig
(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; flycheck
;; (use-package flycheck
;;  :init
;;  :init
;;  (setq flycheck-idle-change-delay 2.0)
;;   (setq flycheck-idle-change-delay 2.0)
;;   (setq-default flycheck-temp-prefix ".")
;;   (setq flycheck-eslintrc "~/.eslintrc")
;;   :config
;;   (with-eval-after-load 'flycheck
;;     (flycheck-pos-tip-mode))
;;   (add-hook 'after-init-hook #'global-flycheck-mode)
;;   (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
;;   (flycheck-add-mode 'javascript-eslint 'js2-mode))

;; ivy
(ivy-mode 1)
(counsel-projectile-on)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)
(global-set-key (kbd "C-x C-p") 'counsel-projectile)

;; web-mode
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (setq web-mode-engines-alist
    '(("php" . "\\.phtml\\'")
       ("php" . "\\.tpl\\'"))))

;; emmet-mode
(use-package emmet-mode
  :init
  (setq emmet-move-cursor-between-quotes t)
  (setq emmet-self-closing-tag-style " /")
  :config
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'js2-mode 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert t)))
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

;; multiple-cursor
(use-package multiple-cursors
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;; web-beautify
(use-package web-beautify
  :config
  (eval-after-load 'js2-mode '(define-key js2-mode-map (kbd "C-M-l") 'web-beautify-js))
  (eval-after-load 'web-mode '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))
  (eval-after-load 'css-mode '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css)))
  ; (eval-after-load 'js2-mode '(add-hook 'js2-mode-hook (lambda () (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
  ; (eval-after-load 'web-mode '(add-hook 'web-mode-hook (lambda () (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
  ; (eval-after-load 'css-mode '(add-hook 'css-mode-hook (lambda () (add-hook 'before-save-hook 'web-beautify-css-buffer t t)))))

(provide 'init-package)
;;; init-package.el ends here
