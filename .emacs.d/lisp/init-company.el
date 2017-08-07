;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's company configuration
;;; Code:
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
;; (setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(provide 'init-company)
;;; init-company.el ends here
