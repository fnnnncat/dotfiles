;;; package --- Emacs Init File
;;; Commentary:
;;; Some base config
;;; Code:
(require 'package)
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

(add-to-list 'load-path "~/.emacs.d/theme/")
(require 'theme-dracula)
(require 'style-rainbow-delimiters)
(require 'style-powerline)

(defun open-config-file()
    (interactive)
    (find-file "~/.emacs.d/init.el"))
(global-set-key(kbd "<F2>") 'open-config-file)

;; (org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ef1e992ef341e86397b39ee6b41c1368e1b33d45b0848feac6a8e8d5753daa67" "9d9fda57c476672acd8c6efeb9dc801abea906634575ad2c7688d055878e69d6" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" "b01b91ba9276deb39aa892c105a8644ef281b4d1804ab7c48de96e9c5d2aaa48" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" default)))
 '(global-flycheck-mode t)
 '(package-selected-packages
   (quote
    (powerline rainbow-delimiters browse-kill-ring origami osx-clipboard flycheck-pos-tip editorconfig expand-region multiple-cursors region-bindings-mode all-the-icons ## go-direx popwin go-add-tags protobuf-mode popup-kill-ring helm-flyspell helm-css-scss helm-swoop ace-jump-helm-line swiper-helm helm-projectile helm-projectil helm-company helm-ag dracula-theme dracula elpy ssh magit evil-nerd-commenter rjsx-mode go-flymake dash-at-point emojify markdown-preview-eww markdown-mode company-go counsel-gtags go-eldoc smartparens-config shell-toggle shell-toggle-plus eshell-toggle-plus eshell-toggle tide flycheck typescript typescript-mode neotree better-shell org-trello which-key solarized-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))
