;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's ivy configuration
;;; Code:

(ivy-mode 1)
(counsel-projectile-on)
(m-map-key 'counsel-projectile-ag (kbd "C-c C-s"))
(m-map-key 'counsel-projectile (kbd "C-x C-p"))
(m-map-key 'counsel-recentf (kbd "C-x C-r"))
(m-map-key 'counsel-find-file (kbd "C-x C-f"))
(m-map-key 'counsel-M-x (kbd "M-x"))
(m-map-key 'swiper (kbd "C-s"))

(provide 'init-ivy)
;;; init-ivy.el ends here
