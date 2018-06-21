(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
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
                              )) 


(define-key evil-normal-state-map (kbd "C-j") 'next-buffer)
(define-key evil-normal-state-map (kbd "C-k") 'previous-buffer)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "")
          (alltodo "")))))

(define-key global-map "\C-ca" 'org-agenda)
