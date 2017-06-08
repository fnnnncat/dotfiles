;; org mode concfig
;; load todolist file
(require 'init-config)

(setq org-agenda-files (list faaaar/wunderlist-file))
;; wunderlist
(require 'org-wunderlist)
(setq org-wunderlist-client-id faaaar/wunderlist-client-id
      org-wunderlist-token faaaar/wunderlist-token
      org-wunderlist-file  faaaar/wunderlist-file
      org-wunderlist-dir faaaar/wunderlist-dir)

(provide 'init-org)
 
