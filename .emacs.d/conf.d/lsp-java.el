(require 'cc-mode)
(condition-case nil
    (require 'use-package)
  (file-error    (require 'package)
		 (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
		 (package-initialize)
		 (package-refresh-contents)
		 (package-install 'use-package)
		 (require 'use-package)))
(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-treemacs :ensure t)
(use-package lsp-java :ensure t :after lsp   :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-mode   :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  )
(use-package dap-java :after (lsp-java))

(evil-leader/set-key-for-mode 'java-mode
  "," 'lsp-ui-peek-find-definitions
  "." 'lsp-ui-peek-find-references
  "m" 'lsp-ui-sideline-apply-code-actions
  "o" 'lsp-organize-imports
  "f" 'google-java-format-buffer
  "/" 'comment-line
  )


(evil-leader/set-key-for-mode 'treemacs-mode
  "o" 'lsp-treemacs-open-error
  "m" 'lsp-treemacs-quick-fix
  )

(add-hook 'java-mode-hook (lambda ()
			    (add-hook 'before-save-hook 'google-java-format-buffer 'local)
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode nil)))
