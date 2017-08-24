;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's avy configuration
;;; Code:

(use-package avy
  :config
  (global-set-key (kbd "C-c C-j C-c") 'avy-goto-char)
  (global-set-key (kbd "C-c C-j C-l") 'avy-goto-line))

(provide 'init-avy)
;;; init-avy.el ends here
