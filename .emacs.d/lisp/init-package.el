(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'load-path "~/.emacs.d/lisp/"))

(defvar faaaar/packages '(
                           helm
                           helm-ag
                           helm-projectile
                           helm-company
                           js2-mode
                           web-mode
                           helm-themes
                           solarized-theme
                           monokai-theme
                           exec-path-from-shell
                           swiper
                           smartparens
                           company
                           hungry-delete
                           multiple-cursors
                           expand-region
                           emmet-mode
                           smartparens
                           editorconfig
                           use-package
                           flycheck
                           magit
                           async
                           markdown-mode
                           neotree
                           undo-tree
                           powerline
                           bongo
                           prettier-js
                           ) "Default Packages")

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

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-c") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; org-mode
(use-package org
  :ensure t
  :config
  (setq org-src-fontify-natively t)
  (global-set-key "\C-ca" 'org-agenda))
;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; smartparens-config
(require 'smartparens-config)
(smartparens-global-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

;; company-mode
(global-company-mode)
(setq company-minimum-prefix-length 1)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(setq hippie-expand-try-function-list '(try-expand-debbrev
                                         try-expand-debbrev-all-buffers
                                         try-expand-debbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-c C-s") 'er/mark-symbol)
(global-set-key (kbd "C-c C-i") 'er/mark-inside-quotes)
(global-set-key (kbd "C-c C-o") 'er/mark-outside-quotes)

;; helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; helm-projectile
(global-set-key (kbd "C-x C-p") 'helm-projectile)

;; helm-company
(autoload 'helm-company "helm-company") ;; Not necessary if using ELPA package
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))

;; js2-mode
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;; emmet-mode
(use-package emmet-mode
  :config
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'js2-mode 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
  (setq emmet-move-cursor-between-quotes t)
  (setq emmet-expand-jsx-className? t)
  (setq emmet-self-closing-tag-style " /"))

;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; web-mode
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (setq web-mode-engines-alist
    '(("php" . "\\.phtml\\'")
       ("php" . "\\.tpl\\'"))))

;; flycheck
(use-package flycheck
  :ensure t
  :config
  (setq flycheck-disabled-checkers '(javascript-jshint))
  (setq flycheck-checkers '(javascript-eslint))
  (global-flycheck-mode))

;; markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
          ("\\.md\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; visual-regexp(-steroids)
(use-package visual-regexp
  :ensure t
  :config
  (define-key global-map (kbd "C-c r") 'vr/replace)
  (define-key global-map (kbd "C-c q") 'vr/query-replace)
  ;; if you use multiple-cursors, this is for you:
  (define-key global-map (kbd "C-c m") 'vr/mc-mark)
  )

;; neotree
(use-package neotree
  :config
  (global-set-key [f5] 'neotree-toggle))

;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode))

;; powerline
(use-package powerline
  :config
  (powerline-default-theme))

;; prettier-js
(use-package prettier-js
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '("--no-semi" "--single-quote" "--trailing-comma" "all")))
(defun enable-minor-mode (my-pair)
  "Enable minor mode"
  (if (buffer-file-name)
    (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))
(add-hook 'web-mode-hook #'(lambda () (enable-minor-mode '("\\.jsx?\\'" . prettier-js-mode))))
(eval-after-load 'js2-mode
  '(define-key js-mode-map (kbd "C-M-\\") 'prettier-js))

;; export config
(provide 'init-package)
