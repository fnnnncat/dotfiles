;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's smartparens configuration
;;; Code:
(require 'smartparens-config)
(smartparens-global-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(show-smartparens-global-mode 1)

(provide 'init-smartparens-config)
;;; init-smartparens-config.el ends here
