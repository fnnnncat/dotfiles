(defun smart-hungry-delete-region-code(&optional arg)
  "根据不同情况删除后面一个字符或者选区"
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end))
          (smart-hungry-delete-forward-char arg)
        (kill-region (region-beginning) (region-end)))
    (smart-hungry-delete-forward-char arg)))

(use-package smart-hungry-delete
  :ensure t
  :bind
  ("<backspace>" . smart-hungry-delete-backward-char)
  ("C-d" . smart-hungry-delete-region-code)
  :config
  (smart-hungry-delete-add-default-hooks))

(provide 'plugin-smart-hungry-delete)
