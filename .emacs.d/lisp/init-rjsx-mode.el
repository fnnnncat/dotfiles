;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's rjsx-mode configuration
;;; Code:

(use-package rjsx-mode
  :init
  (with-eval-after-load 'rjsx
    (define-key rjsx-mode-map "<" nil)
    (define-key rjsx-mode-map (kbd "C-d") nil))
  :config
  (add-to-list 'auto-mode-alist '("HiPOS_Android\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("atom\\/.*\\.js\\'" . rjsx-mode)))

(provide 'init-rjsx-mode)
;;; init-rjsx-mode.el ends here
