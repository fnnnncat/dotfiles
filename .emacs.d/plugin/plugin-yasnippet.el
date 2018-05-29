(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"))
  :bind
  ("C-c s i" . yas-insert-snippet)
  ("C-c s n" . yas-new-snippet)
  ("C-c s v" . yas-visit-snippet-file))

(provide 'plugin-yasnippet)
