(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (package-initialize))
;;; -------------------------------------
;;; 基础配置
;;; -------------------------------------
(require 'init-base)
(require 'init-exec-path-from-shell)

;;; `use-package`
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(windmove-default-keybindings)

;;; -------------------------------------
;;; 插件配置
;;; -------------------------------------
(require 'init-theme)
(require 'init-org)
(require 'init-which-key)
(require 'init-ace-window)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-avy)
(require 'init-company)
(require 'init-undo-tree)
(require 'init-hungry-delete)
(require 'init-beacon)
(require 'init-expand-region)
(require 'init-iedit)
(require 'init-multiple-cursors)
(require 'init-emmet-mode)
(require 'init-web-mode)
(require 'init-dumb-jump)
(require 'init-editorconfig)
(require 'init-git-gutter)
; (require 'init-js-doc)
(require 'init-js2-mode)
(require 'init-powerline)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (which-key solarized-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
