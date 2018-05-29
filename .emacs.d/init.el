;;; package --- Emacs Init File
;;; Commentary:
;;; Some base config
;;; Code:
(require 'package)
(require 'cl)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq gc-cons-threshold (* 128 1024 1024 ))

(show-paren-mode 1)
;; (setq show-paren-style 'expression)
(unless window-system
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))
(setq-default indent-tabs-mode nil)
(setq-default cursor-type 'bar)
(setq select-enable-clipboard t)
(setq tab-width 2)
(setq auto-save-default nil)
(setq kill-ring-max 1000)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq buffer-file-coding-system 'utf-8)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq frame-title-format "emacs@%b")
(global-auto-revert-mode 1)
(xterm-mouse-mode 1)
(prefer-coding-system 'utf-8)
(electric-indent-mode t)
(global-linum-mode t)
(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(auto-image-file-mode)
(set-face-attribute 'default nil
                    :family "Source Code Pro for Powerline"
                    :height 180
                    :weight 'normal
                    :width 'normal)
(global-hl-line-mode t)
(if window-system
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

(add-to-list 'load-path "~/.emacs.d/function/")
(require 'org-insert-src-block)
(require 'indent-region-or-buffer)
(require 'kill-line-or-region)
(require 'open-config-file)

(add-to-list 'load-path "~/.emacs.d/plugin/")
(require 'plugin-smart-parens)
(require 'plugin-neotree)
(require 'plugin-ace-window)
(require 'plugin-exec-path-from-shell)
(require 'plugin-smart-hungry-delete)
(require 'plugin-swiper)
(require 'plugin-try)
(require 'plugin-which-key)
(require 'plugin-company)
(require 'plugin-multiple-cursors)
(require 'plugin-expand-region)
(require 'plugin-editorconfig)
(require 'plugin-magit)
(require 'plugin-flycheck)
(require 'plugin-evil-nerd-commenter)
(require 'plugin-osx-clipboard)
(require 'plugin-origami)
(require 'plugin-browse-kill-ring)
(require 'plugin-go)
(require 'plugin-protobuf)
(require 'plugin-json)
(require 'plugin-front-end)
(require 'plugin-php)
(require 'plugin-markdown)
(require 'plugin-helm)
(require 'plugin-popwin)
(require 'plugin-yasnippet)

(add-to-list 'load-path "~/.emacs.d/theme/")
(require 'theme-dracula)
(require 'style-rainbow-delimiters)
(require 'style-powerline)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet powerline rainbow-delimiters dracula-theme popwin helm-themes helm-projectile helm-rg helm markdown-mode php-mode tide typescript-mode rjsx-mode js2-mode emmet-mode web-mode json-mode protobuf-mode go-direx go-add-tags flymake-go go-eldoc popup-kill-ring browse-kill-ring origami osx-clipboard evil-nerd-commenter flycheck-pos-tip flycheck magit editorconfig expand-region multiple-cursors region-bindings-mode company-go company which-key try swiper smart-hungry-delete exec-path-from-shell ace-window neotree smartparens use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))
