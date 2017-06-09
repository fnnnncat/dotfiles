(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'load-path "~/.emacs.d/lisp/"))

(defvar faaaar/packages '(
                           solarized-theme
                           exec-path-from-shell
                           smartparens
                           company
                           hungry-delete
                           swiper
                           counsel
                           multiple-cursors
                           expand-region
                           emmet-mode
                           js2-mode
                           editorconfig
                           web-mode
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
(require 'org)
(setq org-src-fontify-natively t)
(global-set-key "\C-ca" 'org-agenda)

;; recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ivy-mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; smartparens-config
(require 'smartparens-config)
(smartparens-global-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; exec-path-from-shell
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; company-mode
(global-company-mode)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; swiper config
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

;; emmet-mode
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'js2-jsx-mode 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
(setq emmet-move-cursor-between-quotes t)
(setq emmet-expand-jsx-className? t)
(setq emmet-self-closing-tag-style " /")

;; editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; export config
(provide 'init-package)
