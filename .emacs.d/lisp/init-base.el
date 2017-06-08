;; base config

;; remove tool bar
(tool-bar-mode -1)
;; remove scroll bar
(scroll-bar-mode -1)
;; smart indent
(electric-indent-mode t)
;; show line number
(global-linum-mode t)
;; no splash screen
(setq inhibit-splash-screen t)
;; cursor's type
;; I hate block cursor
(setq-default cursor-type 'bar)
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 180
                    :weight 'normal
                    :width 'normal)
;; disable backup file
(setq make-backup-files nil)
;; replace the selection text with your input
(delete-selection-mode t)
;; start with full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; highlight current line
(global-hl-line-mode t)
;; I linke monokai theme
(load-theme 'monokai t)
;; disable bibibib
(setq ring-bell-function 'ignore)
;; read file encode
(prefer-coding-system 'utf-8)
;; write file encode
(setq default-buffer-file-coding-system 'utf-8)
;; use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)

;; export config
(provide 'init-base)
