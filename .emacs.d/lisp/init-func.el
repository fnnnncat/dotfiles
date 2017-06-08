;; function to open file quickly

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun open-my-org-file()
  (interactive)
  (find-file "~/MiCloud/drive/document/emacs/life.org"))
(defun open-my-list-file()
  (interactive)
  (find-file "~/MiCloud/drive/document/emacs/wunderlist/todo.org"))

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; reindent buffer
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

(provide 'init-func)
