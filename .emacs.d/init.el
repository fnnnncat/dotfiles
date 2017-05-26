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
			  exec-path-from-shell
			  nodejs-repl
			  js2-mode
			  smartparens
			  company
			  monokai-theme
			  hungry-delete
			  swiper
			  counsel
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
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-c") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

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

;; swiper config
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; smartparens config
(require 'smartparens-config)
(smartparens-global-mode t)

;; exec-path-from-shell config
(require 'exec-path-from-shell) ;; if not using the ELPA package
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; js2-mode config
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; nodejs-repl
(require 'nodejs-repl)

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
 '(exec-path-from-shell-check-startup-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
