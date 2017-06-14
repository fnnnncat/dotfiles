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

;; 在上／下创建新行
(defun insert-new-line-top()
  (interactive)
  (move-beginning-of-line 1)
  (open-line 1))

(defun insert-new-line-bottom()
  (interactive)
  (move-end-of-line 1)
  (newline))

(global-set-key (kbd "C-o") 'insert-new-line-bottom)
(global-set-key (kbd "C-S-o") 'insert-new-line-top)

;; 移动当前行
(defun move-text-internal (arg)
  (cond
    ((and mark-active transient-mark-mode)
      (if (> (point) (mark))
        (exchange-point-and-mark))
      (let ((column (current-column))
             (text (delete-and-extract-region (point) (mark))))
        (forward-line arg)
        (move-to-column column t)
        (set-mark (point))
        (insert text)
        (exchange-point-and-mark)
        (setq deactivate-mark nil)))
    (t
      (let ((column (current-column)))
        (beginning-of-line)
        (when (or (> arg 0) (not (bobp)))
          (forward-line)
          (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
          (forward-line -1))
        (move-to-column column t)))))
(defun move-text-down (arg)
  (interactive "*p")
  (move-text-internal arg))
(defun move-text-up (arg)
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "C-S-p") 'move-text-up)
(global-set-key (kbd "C-S-n") 'move-text-down)

(provide 'init-func)
