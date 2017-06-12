;; cursor's type
;; 修改光标类型
(setq-default cursor-type 'bar)
;; 设置默认字体
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 180
                    :weight 'normal
                    :width 'normal)

;; 主题monokai
(load-theme 'monokai t)

;; 主题solarized
;; (require 'solarized)
;; (setq solarized-distinct-fringe-background t)
;; (setq solarized-use-variable-pitch nil)
;; (setq solarized-high-contrast-mode-line t)
;; (setq solarized-use-less-bold nil)
;; (setq solarized-use-more-italic t)
;; (setq solarized-emphasize-indicators nil)
;; (setq solarized-scale-org-headlines nil)
;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;; (setq solarized-height-plus-4 1.0)

;; (setq x-underline-at-descent-line t)

;; (deftheme solarized-dark "Wow Dark Theme")
;; (create-solarized-theme 'dark 'solarized-dark)

(provide 'init-ui)
