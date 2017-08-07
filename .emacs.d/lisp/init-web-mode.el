;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's web-mode configuration
;;; Code:
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("HiPOS_Android\\/.*\\.js\\'" . web-mode))
  (setq web-mode-engines-alist
    '(("php" . "\\.phtml\\'")
       ("php" . "\\.tpl\\'")))
  (setq web-mode-content-types-alist
    '(("jsx" . "HiPOS_Android\\.*\\.js\\'"))
    ))

(provide 'init-web-mode)
;;; init-web-mode.el ends here
