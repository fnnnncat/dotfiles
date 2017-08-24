;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's nlinum-relative configuration
;;; Code:

(use-package nlinum-relative
  :config
  (global-linum-mode t)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))

(provide 'init-nlinum-relative)
;;; init-nlinum-relative.el ends here
