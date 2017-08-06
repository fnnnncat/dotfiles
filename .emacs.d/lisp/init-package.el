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
                           nlinum-hl
                           json-mode
                           async
                           powerline
                           s
                           origami
                           magit
                           git-gutter
                           comment-dwim-2
                           region-bindings-mode
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

(defmacro m-map-key (obj key)
  `(let ((keystr (cadr ',key)) mapkey)
     (define-key key-translation-map ,key
       (if (not (symbolp ,obj)) ,obj
         (setq mapkey (kbd (concat "M-g " keystr)))
         (global-set-key mapkey ,obj) mapkey))))

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
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)
(global-set-key (kbd "C-x C-p") 'counsel-projectile)
(global-set-key (kbd "C-c C-s") 'counsel-projectile-ag)
(m-map-key 'counsel-projectile-ag (kbd "C-c C-s"))

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

;; comment-dwim-2
(global-set-key (kbd "M-;") 'comment-dwim-2)
(setq comment-dwim-2--inline-comment-behavior 'reindent-comment)

;; origami
(use-package origami
  :bind
  ("C-c TAB" . origami-recursively-toggle-node)
  ("C-\\" . origami-open-node-recursively)
  ("M-\\" . origami-show-only-node)
  :config
  (global-origami-mode))

;; git-gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

;; json-mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;; powerline
(use-package powerline
  :config
  (powerline-center-theme))

;; nlinum-hl
(use-package nlinum-hl
  :config
  (add-hook 'post-gc-hook #'nlinum-hl-flush-all-windows)
  (add-hook 'focus-in-hook  #'nlinum-hl-flush-all-windows)
  (add-hook 'focus-out-hook #'nlinum-hl-flush-all-windows)
  (advice-add #'select-window :before #'nlinum-hl-do-select-window-flush)
  (advice-add #'select-window :after  #'nlinum-hl-do-select-window-flush)
  (run-with-idle-timer 5 t #'nlinum-hl-flush-window)
  (run-with-idle-timer 30 t #'nlinum-hl-flush-all-windows))

;; nlinum-relative
(use-package nlinum-relative
  :config
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))
(provide 'init-package)

;;; init-package.el ends here
