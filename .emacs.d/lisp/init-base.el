;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; ;; 行号
;; (global-nlinum-mode t)

;; 支持鼠标模式
(xterm-mouse-mode 1)

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
;; (global-linum-mode t)

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

;; 修改光标类型
(setq-default cursor-type 'bar)

;; 设置默认字体
(set-face-attribute 'default nil
                    :family "Source Code Pro for Powerline"
                    :height 180
                    :weight 'normal
                    :width 'normal)

;; ----------------------------
;; 函数
;; ----------------------------

;; 重新缩进当前buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; 缩进选中的区域或者当前整个buffer
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
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 在上／下创建新行
(defun insert-new-line-top()
  (interactive)
  (move-beginning-of-line 1)
  (open-line 1))

(defun insert-new-line-bottom()
  (interactive)
  (move-end-of-line 1)
  (newline))

(global-set-key (kbd "C-c n") 'insert-new-line-bottom)
(global-set-key (kbd "C-c p") 'insert-new-line-top)

(defun move-text-internal (arg)
  "ARG 移动当前行."
  (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
       (exchange-point-and-mark))
     (let ((column (current-column))
           (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
      (let ((column (current-column)))
        (beginning-of-line)
        (when (or (> arg 0) (not (bobp)))
          (forward-line)
          (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
          (forward-line -1))
        (move-to-column column t)))))

(defun move-text-down (arg)
  "ARG 移动当前行到到下一行."
  (interactive "*p")
  (move-text-internal arg))
(defun move-text-up (arg)
  "ARG 移动当前行到到上一行."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "C-c C-p") 'move-text-up)
(global-set-key (kbd "C-c C-n") 'move-text-down)

(global-set-key (kbd "C-c C-d") 'kill-whole-line)
(global-set-key (kbd "C-c C-r") 'repeat)

(defun eslint-fix-file ()
  "检验并修复文件."
  (interactive)
  (message "eslint --fixing the file")
  (shell-command (concat "eslint --fix " (buffer-file-name) " > /dev/null"))
  (revert-buffer t t))


(provide 'init-base)
