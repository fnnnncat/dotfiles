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

(provide 'init-func)
