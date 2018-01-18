(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                            ("melpa" . "http://elpa.emacs-china.org/melpa/")))
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
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" default)))
 '(package-selected-packages
   (quote
    (helm-flyspell helm-css-scss helm-swoop ace-jump-helm-line swiper-helm helm-projectile helm-projectil helm-company helm-ag dracula-theme dracula elpy ssh magit evil-nerd-commenter rjsx-mode go-flymake dash-at-point emojify markdown-preview-eww markdown-mode company-go counsel-gtags go-eldoc smartparens-config shell-toggle shell-toggle-plus eshell-toggle-plus eshell-toggle tide flycheck typescript typescript-mode neotree better-shell org-trello which-key solarized-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
