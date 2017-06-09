;; function to open file quickly

;; 重新缩进当前buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; 缩进选中的区域或者当前整个buffer
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(provide 'init-func)
