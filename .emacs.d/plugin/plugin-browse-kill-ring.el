(use-package browse-kill-ring
  :ensure t)

(use-package popup-kill-ring
  :ensure t
  :after browse-kill-ring
  :bind
  ("C-c b k" . popup-kill-ring))

(provide 'plugin-browse-kill-ring)
