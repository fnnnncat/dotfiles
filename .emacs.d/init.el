;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t))

;; install && manage package
(require 'cl)
(defvar faaaar/packages '(
			  company
			  monokai-theme
			  hungry-delete
			  ) "Default Packages")

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

;; base config
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode t)
(global-linum-mode t)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 180
                    :weight 'normal
                    :width 'normal)
(setq make-backup-files nil)
(delete-selection-mode t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(global-hl-line-mode t)
(load-theme 'monokai t)

;; add some hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; show recent file config
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; org config
(require 'org)
(setq org-src-fontify-natively t)

;; function to open file quickly
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun open-my-org-file()
  (interactive)
  (find-file "~/MiCloud/drive/document/emacs/life.org"))

;; exec some plugin or func
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "<f10>") 'open-my-org-file)
(global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
