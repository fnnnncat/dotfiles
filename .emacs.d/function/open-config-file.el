(defun open-config-file()
    (interactive)
    (find-file "~/.emacs.d/init.el")
    (neotree-refresh))

(provide 'open-config-file)
