(setq jiralib-url "https://jira.assaabloy.net")



(setq org-jira-custom-jqls
      '(
        (:jql " project IN (ALARMP) and sprint in(openSprints()) and sprint not in(futureSprints()) "
              :limit 300
              :filename "current-sprint")
        ))


(setq org-jira-jira-status-to-org-keyword-alist
      '(("In Progress" . "STARTED")
        ("To Do" . "TODO")
        ("Impeded" . "IMPEDED")
        ("Code Review" . "PR")))


(defun org-jira-create-subtask (project type summary description)
  "Create a subtask issue for PROJECT, of TYPE, with SUMMARY and DESCRIPTION."
  (interactive (ensure-on-issue (list (read-string "Summary: ")
                                      (read-string "Description: "))))
  (let* ((parent-id (org-jira-parse-issue-id))
         (project (org-jira--get-proj-key parent-id))
         (type "Sub-task")
         (description "")
         (ticket-struct (org-jira-get-issue-struct project type summary description parent-id)))
    (org-jira-get-issues (list (jiralib-create-subtask ticket-struct)))))

(defun test-subtask ()
  (let* ((parent-id (org-jira-parse-issue-id))
         (summary (read-string "Summary: "))

         (project (org-jira--get-proj-key parent-id))
         (type "Sub-task")
         (description "")
         (ticket-struct (org-jira-get-issue-struct project type summary description parent-id))
         )
    (jiralib-create-subtask ticket-struct)
    ))

;; (evil-leader/set-key-for-mode 'java-mode
;;                               "," 'lsp-ui-peek-find-definitions
;;                               "." 'lsp-ui-peek-find-references
;;                               "m" 'lsp-ui-sideline-apply-code-actions
;;                               "o" 'lsp-organize-imports
;;                               "f" 'lsp-format-buffer
;;                               "/" 'comment-line
;;                               )


;; (evil-leader/set-key-for-mode 'treemacs-mode
;;                               "o" 'lsp-treemacs-open-error
;;                               "m" 'lsp-treemacs-quick-fix
;;                               )
