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
                           nlinum-relative
                           powerline
                           wgrep
                           s
                           magit
                           git-gutter
                           region-bindings-mode
                           expand-region
                           company
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
                           smart-hungry-delete
                           multiple-cursors
                           indent-guide
                           ace-jump-mode
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

(defmacro m-map-key (obj key)
  `(let ((keystr (cadr ',key)) mapkey)
     (define-key key-translation-map ,key
       (if (not (symbolp ,obj)) ,obj
         (setq mapkey (kbd (concat "M-g " keystr)))
         (global-set-key mapkey ,obj) mapkey))))

(m-map-key 'save-buffer (kbd "C-x C-s"))

;; company
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
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
(use-package flycheck
  :init
  (setq flycheck-idle-change-delay 2.0)
  (setq-default flycheck-temp-prefix ".")
  (setq flycheck-checker-error-threshold 9999)
  :config
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode))
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

';; web-mode
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (setq web-mode-engines-alist
    '(("php" . "\\.phtml\\'")
       ("php" . "\\.tpl\\'"))))

;; ivy
(ivy-mode 1)
(counsel-projectile-on)
(m-map-key 'counsel-projectile-ag (kbd "C-c C-s"))
(m-map-key 'counsel-projectile (kbd "C-x C-p"))
(m-map-key 'counsel-recentf (kbd "C-x C-r"))
(m-map-key 'counsel-find-file (kbd "C-x C-f"))
(m-map-key 'counsel-M-x (kbd "M-x"))
(m-map-key 'swiper (kbd "C-s"))

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

;; region-bindings-mode
(use-package region-bindings-mode
  :config
  (region-bindings-mode-enable))

;; multiple-cursor
(use-package multiple-cursors
  :config
  (define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
  (define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
  (define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
  (define-key region-bindings-mode-map "k" 'mc/skip-to-preview-like-this)
  (define-key region-bindings-mode-map "j" 'mc/skip-to-next-like-this))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;; git-gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))
;; powerline
(use-package powerline
  :config
  (powerline-center-theme))

;; nlinum-relative
(use-package nlinum-relative
  :config
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))
(provide 'init-package)

;; wgrep
(use-package wgrep)

;; smart-hungry-delete
(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
          ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks)
  )

(use-package expand-region
  :bind(("C-c C-m C-e" . er/expand-region)
         ("C-c C-m C-w" . er/mark-word)
         ("C-c C-m C-f" . er/mark-defun)
         ("C-c C-m C-c" . er/mark-comment)
         ("C-c C-m C-i C-q" . er/mark-inside-quotes)
         ("C-c C-m C-i C-p" . er/mark-inside-pairs)
         ("C-c C-m C-o C-q" . er/mark-outside-quotes)
         ("C-c C-m C-o C-p" . er/mark-outside-pairs)))

(use-package ace-jump-mode
  :bind (("C-c C-j" . ace-jump-char-mode)))

;; indent-guide
(use-package indent-guide
  :config
  (indent-guide-global-mode)
  (setq indent-guide-delay 0.1))

;;; init-package.el ends here
