;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's flycheck configuration
;;; Code:
(use-package flycheck
  :init
  (setq-default flycheck-temp-prefix ".")
  :config
  (setq flycheck-idle-change-delay 2.0)
  (setq flycheck-checker-error-threshold 9999)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (with-eval-after-load 'flycheck (flycheck-pos-tip-mode))
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (add-to-list 'display-buffer-alist
    `(,(rx bos "*Flycheck errors*" eos)
       (display-buffer-reuse-window
         display-buffer-in-side-window)
       (side            . bottom)
       (reusable-frames . visible)
       (window-height   . 0.33)))
  (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
