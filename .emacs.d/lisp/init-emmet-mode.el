;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's emmet-mode configuration
;;; Code:

(use-package emmet-mode
  :config
  (setq emmet-move-cursor-between-quotes t)
  (setq emmet-self-closing-tag-style " /")
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'js2-mode 'emmet-mode)
  (add-hook 'js2-jsx-mode 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert t)))
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

(provide 'init-emmet-mode)
;;; init-emmet-mode.el ends here
