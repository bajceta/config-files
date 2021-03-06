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
(use-package lsp-mode :ensure t
  :custom
  (lsp-prefer-flymake nil)
  :config
  (setq lsp-prefer-flymake nil)
  )

(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-treemacs :ensure t)
(use-package lsp-java :ensure t :after lsp   :config (add-hook 'java-mode-hook 'lsp))

(evil-leader/set-key-for-mode 'java-mode
  "," 'lsp-ui-peek-find-definitions
  "." 'lsp-ui-peek-find-references
  "m" 'lsp-ui-sideline-apply-code-actions
  "o" 'lsp-organize-imports
  "f" 'google-java-format-buffer
  "/" 'comment-line
  "tt" 'dap-java-run-test-class
  "tr" 'dap-java-run-test-method
  "te" 'dap-java-debug-test-class
  "tw" 'dap-java-debug-test-method
  )


(evil-leader/set-key-for-mode 'treemacs-mode
  "o" 'lsp-treemacs-open-error
  "m" 'lsp-treemacs-quick-fix
  )

(add-hook 'java-mode-hook (lambda ()
			    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
			    (add-hook 'java-mode-hook 'flycheck-mode)
			    (add-hook 'before-save-hook 'google-java-format-buffer 'local)
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode nil)))

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
