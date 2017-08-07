;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's multiple-cursors configuration
;;; Code:

(use-package multiple-cursors
  :config
  (define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
  (define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
  (define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
  (define-key region-bindings-mode-map "k" 'mc/skip-to-preview-like-this)
  (define-key region-bindings-mode-map "j" 'mc/skip-to-next-like-this))

(provide 'init-multiple-cursors)
;;; init-multiple-cursors.el ends here
