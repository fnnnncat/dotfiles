;; 修改光标类型
(setq-default cursor-type 'bar)
;; 设置默认字体
(set-face-attribute 'default nil
  :family "Source Code Pro"
  :height 180
  :weight 'normal
  :width 'normal)

;; 主题monokai
;; (load-theme 'monokai t)

;; 主题solarized
(use-package solarized
  :config
  ;; make the fringe stand out from the background
  (setq solarized-distinct-fringe-background t)

  ;; Don't change the font for some headings and titles
  (setq solarized-use-variable-pitch nil)

  ;; make the modeline high contrast
  (setq solarized-high-contrast-mode-line t)

  ;; Use less bolding
  (setq solarized-use-less-bold t)

  ;; Use more italics
  (setq solarized-use-more-italic t)

  ;; Use less colors for indicators such as git:gutter, flycheck and similar
  (setq solarized-emphasize-indicators nil)

  ;; Don't change size of org-mode headlines (but keep other size-changes)
  (setq solarized-scale-org-headlines nil)

  ;; Avoid all font-size changes
  (setq solarized-height-minus-1 1.0)
  (setq solarized-height-plus-1 1.0)
  (setq solarized-height-plus-2 1.0)
  (setq solarized-height-plus-3 1.0)
  (setq solarized-height-plus-4 1.0)

  (setq x-underline-at-descent-line t)

  (deftheme solarized-light "Wow Light Theme")
  (create-solarized-theme 'light 'solarized-light))

(provide 'init-ui)
