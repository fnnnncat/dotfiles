;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's smart-hungry-delete configuration
;;; Code:

(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
          ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks))

(provide 'init-smart-hungry-delete)
;;; init-smart-hungry-delete.el ends here
