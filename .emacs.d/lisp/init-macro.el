;;; package -- Summary
;;; Commentary:
;;;   Li Yunfan's macro configuration
;;; Code:
(defmacro m-map-key (obj key)
  "OBJ is func name.  KEY is shortcut name."

  `(let ((keystr (cadr ',key)) mapkey)
     (define-key key-translation-map ,key
       (if (not (symbolp ,obj)) ,obj
         (setq mapkey (kbd (concat "M-g " keystr)))
         (global-set-key mapkey ,obj) mapkey))))

(provide 'init-macro)

;;; init-macro.el ends here
