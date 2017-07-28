(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'load-path "~/.emacs.d/lisp/"))

(defvar faaaar/packages '(
			  solarized-theme
			  company
			  xwidgete
			  use-package
			  helm
			  helm-ag
			  helm-projectile			  
			  helm-themes
			  helm-mode-manager
			  helm-projectile
			  helm-swoop
			  helm-descbinds
			  helm-flx
			  helm-css-scss
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

;; company
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)
(setq company-minimum-prefix-length 1)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; smartparens-config
(use-package smartparents-config
  :config
  (smartparents-global-mode t)
  (add-hook 'emacs-list-mode-hook 'show-paren-mode))

;; helm
(helm-mode 1)

(helm-flx-mode 1)
(setq helm-flx-for-helm-find-files t
      helm-flx-for-helm-locate t)

(use-package helm-descbinds
  :config
  (helm-descbinds-mode))

(use-package helm-project
  :config
  (helm-projectile-on))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-p") 'helm-projectile)
(global-set-key (kbd "C-x C-g") 'helm-ag)

(provide 'init-package)
