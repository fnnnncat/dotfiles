;;; package --- init emacs' package
;;; Commentary:
;;; Code:

(require 'cl)
(require 'init-macro)

(defvar faaaar/packages '(
                           solarized-theme
                           nlinum-relative
                           powerline
                           wgrep
                           s
                           magit
                           git-gutter
                           region-bindings-mode
                           expand-region
                           company
                           use-package
                           smartparens
                           exec-path-from-shell
                           editorconfig
                           flycheck
                           flycheck-pos-tip
                           swiper
                           flx
                           counsel
                           counsel-projectile
                           web-mode
                           emmet-mode
                           js2-mode
                           smart-hungry-delete
                           multiple-cursors
                           indent-guide
                           ace-jump-mode
                           ) "Default Packages.")

(setq package-selected-packages faaaar/packages)
(defun faaaar/packages-installed-p ()
  "Find all package uninstalled and install it."
  (loop for pkg in faaaar/packages
    when (not (package-installed-p pkg)) do (return nil)
    finally (return t)))

(unless (faaaar/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg faaaar/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(m-map-key 'save-buffer (kbd "C-x C-s"))

(provide 'init-package)
;;; init-package.el ends here
