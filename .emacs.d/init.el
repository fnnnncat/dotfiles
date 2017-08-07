;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's entry configuration
;;; Code:

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'load-path "~/.emacs.d/lisp/"))

(require 'cl)
(require 'init-macro)
(require 'init-package)
(require 'init-company)
(require 'init-smartparens-config)
(require 'init-exec-path-from-shell)
(require 'init-editorconfig)
(require 'init-flycheck)
(require 'init-web-mode)
(require 'init-ivy)
(require 'init-emmet-mode)
(require 'init-region-bindings-mode)
(require 'init-multiple-cursors)
(require 'init-js2-mode)
(require 'init-expand-region)
(require 'init-git-gutter)
(require 'init-nlinum-relative)
(require 'init-powerline)
(require 'init-wgrep)
(require 'init-smart-hungry-delete)
(require 'init-ace-jump-mode)
(require 'init-indent-guide)
(require 'init-neotree)
(require 'init-base)
(require 'init-func)
(require 'init-ui)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(exec-path-from-shell-check-startup-files nil)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(web-mode-code-indent-offset 2)
 '(web-mode-commet-style 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-css-colorization t)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
