(custom-set-variables
 '(sql-mysql-login-params (quote (user password server database port))))

(defun sql/list (func)
  "Connect to the input server using sql-server-list"
  (interactive
   (helm-comp-read "Select server: " sql-server-list))
  (funcall func))

(provide 'plugin-sql)
