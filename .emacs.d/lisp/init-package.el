;; install && manage package
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'load-path "~/.emacs.d/lisp/"))

(require 'cl)
(defvar faaaar/packages '(
			  exec-path-from-shell
			  js2-mode
			  smartparens
			  company
			  monokai-theme
			  hungry-delete
			  swiper
			  counsel
			  multiple-cursors
			  org-wunderlist
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

;; org-mode
(require 'org)
(setq org-src-fontify-natively t)

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

;; js2-mode config
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; company-mode
(global-company-mode)

;; export config
(provide 'init-package)
