;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's indent-guide configuration
;;; Code:

(use-package indent-guide
  :config
  (indent-guide-global-mode)
  (setq indent-guide-delay 0.1)
  (setq indent-guide-recursive t))

(provide 'init-indent-guide)
;;; init-indent-guide.el ends here
