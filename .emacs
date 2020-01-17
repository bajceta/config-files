(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

(package-initialize)

;; Auto-install use-package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; hide menu bar in gui
(menu-bar-mode -1)

(setq-default frame-title-format "%b %& emacs")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq use-dialog-box nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-inhibited t)
(setq auto-save-default nil)

(setq-default indicate-empty-lines t)
(setq inhibit-startup-screen t)
(setq sentence-end-double-space nil)
(setq mouse-yank-at-point t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package dracula-theme
             :demand t
             :config
             (load-theme 'dracula t))

(use-package evil-leader
             :demand t
             :config
             (global-evil-leader-mode)
             (evil-leader/set-leader "<SPC>")
             ;; EXAMPLE:
             ;; Interactive file name search.
             (evil-leader/set-key "pp" 'projectile-find-file)
             (evil-leader/set-key "ps" 'projectile-switch-project)
             (evil-leader/set-key "g" 'magit-status)
             (evil-leader/set-key "pf" 'counsel-ag)
             (evil-leader/set-key "/" 'comment-line)
             (evil-leader/set-key "jc" 'org-jira-get-issues-from-custom-jql)
             (evil-leader/set-key "js" 'org-jira-get-issues)
             (evil-leader/set-key "js" 'org-jira-get-issues)
             (evil-leader/set-key "aa" 'org-agenda)

             ;;(evil-leader/set-key "," 'lsp-ui-peek-find-definitions)
             ;;(evil-leader/set-key "." 'lsp-ui-peek-find-references)
             ;; (evil-leader/set-key "k" 'find-file-in-project)
             ;; Interactive file content search (git).
             ; (evil-leader/set-key "f" 'counsel-git-grep)
             ;; Interactive current-file search.
             ; (evil-leader/set-key "s" 'swiper)
             ;; Interactive open-buffer switch.
             ; (evil-leader/set-key "b" 'counsel-switch-buffer)

             )


(use-package evil
             :demand t
             :config
             ;; Initialize.

             (evil-mode 1)

             (define-key evil-motion-state-map (kbd "TAB") nil)
             ;; For some reasons evils own search isn't default.
             (setq evil-search-module 'evil-search)
             (setq evil-ex-search-case 'sensitive))

(use-package which-key
             :demand t
             :config
             ;; Initialize.
             (which-key-mode))

(use-package counsel
  :ensure t
  :config
  (use-package smex
    :ensure t)
  (use-package flx
    :ensure t)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  ;; intentional space before end of string
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
	'((t . ivy--regex-fuzzy))))

(use-package ivy-hydra
      :ensure t)

(setq projectile-completion-system 'ivy)

; handle windows unsafe directory bug
(setq server-auth-dir "~/.emacs.d/server/")
(require 'server)
(when (and (>= emacs-major-version 23)
           (string-equal system-type "cygwin"))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
; ~/.emacs.d/server is unsafe"
(server-start)

(setq org-agenda-files (list "~/docs/yale.org"
                             "~/docs/home.org"
                             "~/docs/innercore.org"
                             "~/docs/aws-infrastructure.org"
                             ))



(define-key evil-normal-state-map (kbd "C-S-j") 'next-buffer)
(define-key evil-normal-state-map (kbd "C-S-k") 'previous-buffer)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)

(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'todo '("DONE" "TODO" "DEFERRED") ))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda "" ((org-agenda-span 15)))
          (alltodo ""))
         )))


(add-hook 'org-agenda-mode-hook
	  (lambda ()
	    (define-key org-agenda-mode-map "j" 'evil-next-line)
	    (define-key org-agenda-mode-map "k" 'evil-previous-line)
	    (local-set-key (kbd "d") 'my/org-agenda-todo-done)))


(define-key global-map "\C-ca" 'org-agenda)

(define-key evil-normal-state-map (kbd "C-p") 'helm-mini)
(define-key evil-normal-state-map (kbd "C-x C-f") 'helm-find-files)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(org-agenda-files
   (quote
    ("~/docs/home.org" "~/docs/yale.org" "~/docs/innercore.org" "~/docs/aws-infrastructure.org")))
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme smart-mode-line helm-mu key-chord evil-escape ivy magit lsp-treemacs evil-leader dracula-theme dap-mode lsp-java lsp-ui company-lsp hydra lsp-mode yasnippet org-link-minor-mode org-jira yaml-mode helm projectile which-key evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  )


(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  )




(defun load-directory (dir)
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))              ))
    (mapc load-it (directory-files dir nil "\\.el$"))))


(load-directory "~/.emacs.d/conf.d")
(load-file "~/.emacs.d/jira-cookie.el")

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(use-package key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
  )
