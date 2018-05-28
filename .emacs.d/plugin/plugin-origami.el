(use-package origami
  :ensure t
  :bind (("C-c l" . origami-toggle-node)
         ("C-c C-l" . origami-toggle-all-nodes))
  :config
  (global-origami-mode))

(provide 'plugin-origami)
