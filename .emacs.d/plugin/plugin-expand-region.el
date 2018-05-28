(use-package expand-region
  :ensure t
  :bind
  ("C-c e r e" . er/expand-region)
  ("C-c e r w" . er/mark-word)
  ("C-c e r d" . er/mark-defun)
  ("C-c e r c" . er/mark-comment)
  ("C-c e r q" . er/mark-outside-quotes)
  ("C-c e r p" . er/mark-outside-pairs)
  ("C-c e r s" . er/mark-symbol)
  ("C-c e r S" . er/mark-symbol-with-prefix)
  ("C-c e r n" . er/mark-next-accessor)
  ("C-c e r h" . er/mark-html-attribute))

(provide 'plugin-expand-region)
