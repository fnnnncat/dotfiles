(defun kill-line-or-region(&optional arg)
  "根据不同情况删除一行或者选区"
  (interactive "P")
  (if mark-active
      (if (= (region-beginning) (region-end))
          (kill-line arg)
        (kill-region (region-beginning) (region-end))))
  (kill-line arg))

(global-set-key (kbd "C-k") 'kill-line-or-region)

(provide 'kill-line-or-region)
