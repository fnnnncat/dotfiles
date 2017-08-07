;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's exec-path-from-shel configuration
;;; Code:
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path-from-shell)
;;; init-exec-path-from-shell.el ends here
