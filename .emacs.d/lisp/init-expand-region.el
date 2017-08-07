;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's expand-region configuration
;;; Code:

(use-package expand-region
  :bind(("C-c C-m C-e" . er/expand-region)
         ("C-c C-m C-w" . er/mark-word)
         ("C-c C-m C-f" . er/mark-defun)
         ("C-c C-m C-c" . er/mark-comment)
         ("C-c C-m C-i C-q" . er/mark-inside-quotes)
         ("C-c C-m C-i C-p" . er/mark-inside-pairs)
         ("C-c C-m C-o C-q" . er/mark-outside-quotes)
         ("C-c C-m C-o C-p" . er/mark-outside-pairs)))

(provide 'init-expand-region)
;;; init-expand-region.el ends here
