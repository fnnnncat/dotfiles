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
  (setq flycheck-emacs-lisp-load-path '~/.emacs.d/lisp)
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode))
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
