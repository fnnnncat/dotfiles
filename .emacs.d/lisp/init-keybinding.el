;; bind some hotkeies

;; org-func
(global-set-key "\C-ca" 'org-agenda)

;; help you to resolve some simple problem
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-c") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; swiper config
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-r") 'counsel-recentf)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; custom-function
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "<f3>") 'open-my-list-file)
(global-set-key (kbd "<f10>") 'open-my-org-file)

(provide 'init-keybinding)
