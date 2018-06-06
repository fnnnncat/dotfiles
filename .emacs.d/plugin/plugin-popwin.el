(use-package popwin
  :ensure t
  :init
  ;; (setq display-buffer-function 'popwin:display-buffer)
  :config
  (push '("^\*go-direx:" :regexp t :position right :width 0.2 :dedicated t :stick t)
        popwin:special-display-config))

(provide 'plugin-popwin)
