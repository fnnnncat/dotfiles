(use-package region-bindings-mode
  :ensure t
  :config
  (region-bindings-mode-enable))

(use-package multiple-cursors
  :ensure t
  :config
  (define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
  (define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
  (define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
  (define-key region-bindings-mode-map "k" 'mc/skip-to-preview-like-this)
  (define-key region-bindings-mode-map "j" 'mc/skip-to-next-like-this)
  (global-set-key (kbd "C-c m c t") 'mc/mark-sgml-tag-pair)
  (global-set-key (kbd "C-c m c n") 'mc/mark-next-lines)
  (global-set-key (kbd "C-c m c r") 'mc/repeat-command))

(provide 'plugin-multiple-cursors)
