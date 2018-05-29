(use-package popwin
  :ensure t
  ;;:init
  ;;(setq display-buffer-alist 'popwin:display-buffer)
  :config
  (push '("^\*go-direx:" :regexp t :position right :width 0.4 :dedicated t :stick t)
        popwin:special-display-config))

(provide 'plugin-popwin)
