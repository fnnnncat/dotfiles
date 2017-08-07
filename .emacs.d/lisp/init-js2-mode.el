;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's js2-mode configuration
;;; Code:
(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil))

(provide 'init-js2-mode)
;;; init-js2-mode.el ends here
