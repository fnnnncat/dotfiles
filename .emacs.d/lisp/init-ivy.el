;; it looks like counsel is a requirement for swiper
(use-package counsel
             :ensure t)

(use-package swiper
             :ensure try
             :config
             (progn
               (ivy-mode 1)
               (setq ivy-use-virtual-buffers t)
               (global-set-key (kbd "\C-s") 'swiper)))

(provide 'init-ivy)
