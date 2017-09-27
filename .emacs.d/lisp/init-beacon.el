; flashes the cursor's line when you scroll
(use-package beacon
             :ensure t
             :config
             (beacon-mode 1)
             (setq beacon-color "#ff6700")
             (global-set-key (kbd "C-c b b b") 'beacon-blink))

(provide 'init-beacon)
