;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's git-gutter configuration
;;; Code:

(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

(provide 'init-git-gutter)
;;; init-git-gutter.el ends here
