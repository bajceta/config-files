(progn
  (require 'filenotify)
  (require 'cl-lib)
  (require 'subr-x)
  
  (defun read-lines (filePath)
    "Return a list of lines of a file at filePath."
    (with-temp-buffer
      (insert-file-contents filePath)
      (split-string (buffer-string) "\n" t))
    )
  
  (defun split-cookies (list)
    (let ((result ()))
      (dolist (line list (nreverse result))
	(let ((split (split-string line)))
	  (when (equal (nth 2 split) "/") (push (split-string line) result))
	  ))))

  (defun map-cookies (list)
    (let ((result ()))
      (dolist (line list (nreverse result))
	(let* ((split (split-string line))
	       (mapped (cl-pairlis '(domain key value) (list (nth 0 split) (nth 5 split) (nth 6 split)))))
					;  (print (alist-get 'domain mapped))
	  (when (equal (alist-get 'domain mapped) "jira.assaabloy.net" ) (push mapped result)))
	)))
  
  (defun get-jira-cookie (file)
    (message (concat "filename: " file))
    (let* ((lines  (read-lines file))
	   (cookies (map-cookies lines))
	   )
      (let ((result ()))
	(dolist (cookie cookies)
	  (let* ((cookie-text (concat (alist-get 'key cookie) "=" (alist-get 'value cookie))))
					;    (print cookie-text)
	    (push cookie-text result)
	    ))
	(string-join result "; ")    
	)
      ))

  (defun set-jira-cookie (event)
    (let* ((filename  (nth 2 event))
	   (cookie (get-jira-cookie filename)))
      (message "got notification")
      (message (nth 2 event))
      (defconst jiralib-token (cons "Cookie" cookie))
      (delete-file filename)
      )
    )


  (file-notify-add-watch "~/Downloads/cookies.txt" '(change) 'set-jira-cookie)
  )