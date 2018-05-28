;;; package --- org-insert-src-block
;;; Commentary:
;;; Insert a code block in org-mode
;;; Code:
(defun org-insert-src-block (src-code-type)
  "插入一个`SRC-CODE-TYPE'类型的代码块."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (forward-line 2)
    (org-edit-src-code)))

(provide 'org-insert-src-block)

;;; org-insert-src-block.el ends here
