;;; init-base --- 一些基础配置
;;; Commentary:
;; 只是一些基础配置
;; 和插件什么的都没关系

;;; Code:

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

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

;; 在emacs-lisp-mode下，添加'时不成对添加
;; (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; 显示光标所在区域的两边的括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(provide 'init-base)
;;; init-base.el ends here
