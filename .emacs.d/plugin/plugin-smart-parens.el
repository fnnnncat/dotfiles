(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode)
  (sp-local-pair '(emacs-lisp-mode) "'" "'" :actions nil)
  (sp-local-pair '(lisp-mode) "'" "'" :actions nil))

(provide 'plugin-smart-parens)
