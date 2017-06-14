;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 设置缩进
(setq tab-width 2)

;; 关闭自己生产的保存的文件
(setq auto-save-default nil)

;; 隐藏工具栏
(tool-bar-mode -1)

;; 隐藏滚动条
(scroll-bar-mode -1)

;; 智能缩进
(electric-indent-mode t)

;; 显示行号
(global-linum-mode t)

;; 禁用开启时的不可描述
(setq inhibit-splash-screen t)

;; 禁止备份文件
(setq make-backup-files nil)

;; 直接替换所选区块的文本，而不是在后面追加
(delete-selection-mode t)

;; 开启自动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 当前行高亮
(global-hl-line-mode t)

;; 禁止bibibibibibi
(setq ring-bell-function 'ignore)

;; 读写文件编码设置
(prefer-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

;; 使用y或者n 而不是 yes或者no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示光标所在区域的两边的括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
    (t (save-excursion
         (ignore-errors (backward-up-list))
         (funcall fn)))))


;; JSX设置
(define-derived-mode react-mode web-mode "React-IDE" "jsx-mode设置.")
(add-hook 'react-mode-hook
  '(lambda
     ()
     (web-mode-set-content-type "jsx")
     (message "set web-mode-content-type %s" web-mode-content-type)))
(add-to-list 'auto-mode-alist '("\\.js$" . react-mode))

(provide 'init-base)
;;; init-base.el ends here
