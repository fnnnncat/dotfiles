(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                            ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (package-initialize))

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(windmove-default-keybindings)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (emojify markdown-preview-eww markdown-mode company-go counsel-gtags go-eldoc smartparens-config shell-toggle shell-toggle-plus eshell-toggle-plus eshell-toggle tide flycheck typescript typescript-mode neotree better-shell org-trello which-key solarized-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
