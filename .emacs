(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)



; handle windows unsafe directory bug
(setq server-auth-dir "~/.emacs.d/server/")
(require 'server)
(when (and (>= emacs-major-version 23)
	   (string-equal system-type "cygwin"))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                                 ; ~/.emacs.d/server is unsafe"
(server-start)

(setq evil-want-C-i-jump nil)

(require 'evil)
(evil-mode 1)



(setq org-agenda-files (list "~/docs/yale.org"
                             "~/docs/home.org"
                             "~/docs/innercore.org"
                             "~/docs/aws-infrastructure.org"
                              )) 

(setq jiralib-url "https://jira.assaabloy.net")

(load-file "~/.emacs.d/jira-cookie.el")


(setq org-jira-custom-jqls
      '(
	(:jql " project IN (ALARMP) and sprint in(openSprints()) and sprint not in(futureSprints()) "
	      :limit 300
	      :filename "current-sprint")
	        ))


(setq org-jira-jira-status-to-org-keyword-alist
      '(("In Progress" . "INPROGRESS")
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



(define-key evil-normal-state-map (kbd "C-j") 'next-buffer)
(define-key evil-normal-state-map (kbd "C-k") 'previous-buffer)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'todo '("DONE" "TODO" "DEFERRED") ))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (tags "PRIORITY=\"B\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'todo '("DONE" "TODO" "DEFERRED") ))
                 (org-agenda-overriding-header "Normal-priority unfinished tasks:")))
          (agenda "" ((org-agenda-span 15)))
          (alltodo ""))
	 )))

(define-key global-map "\C-ca" 'org-agenda)
(define-key evil-normal-state-map (kbd "C-p") 'helm-mini) 
(define-key evil-normal-state-map (kbd "C-x C-f") 'helm-find-files) 
(define-key evil-normal-state-map (kbd "C-x f") 'projectile-find-files) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/docs/home.org" "~/docs/yale.org" "~/docs/innercore.org" "~/docs/aws-infrastructure.org")))
 '(package-selected-packages
   (quote
    (org-link-minor-mode org-jira yaml-mode helm projectile which-key evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(require 'projectile)

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))


(add-hook 'yaml-mode-hook
  '(lambda ()
    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
