(use-package expand-region
             :ensure t
             :config
             (global-set-key (kbd "C-c e r e") 'er/expand-region)
             (global-set-key (kbd "C-c e r w") 'er/mark-word)
             (global-set-key (kbd "C-c e r d") 'er/mark-defun)
             (global-set-key (kbd "C-c e r c") 'er/mark-comment)
             (global-set-key (kbd "C-c e r q") 'er/mark-outside-quotes)
             (global-set-key (kbd "C-c e r p") 'er/mark-outside-pairs))

(provide 'init-expand-region)
