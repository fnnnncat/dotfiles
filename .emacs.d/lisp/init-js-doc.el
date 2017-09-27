(use-package js-doc
             :ensure t
             :config
             (setq js-doc-mail-address "liyunfan1@xiaomi.com"
                   js-doc-author (format "liyunfan1 <%s>" js-doc-mail-address)
                   js-doc-url "url of your website"
                   js-doc-license "license name")

             (add-hook 'js2-mode-hook
                       #'(lambda ()
                           (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
                           (define-key js2-mode-map "@" 'js-doc-insert-tag))))
(provide 'init-js-doc)
