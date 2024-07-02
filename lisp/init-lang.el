;;; init-lang.el -- programming languages configs
;;; Commentary:
;;; Code:
(setq-default tab-width 4
              indent-tabs-mode nil)

;; 高亮括号
(add-hook 'prog-mode-hook #'show-paren-mode)

;; 折叠代码
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; ivy
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-file-watch-threshold 500)
  (setq lsp-prefer-flymake nil
	    lsp-keep-workspace-alive nil
	    lsp-enable-indentation nil
	    lsp-enable-on-type-formatting nil
	    lsp-auto-guess-root nil
	    lsp-enable-snippet t)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (html-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-completion-provider :none)
  (setq lsp-headerline-breadcrumb-enable t)
  :bind
  ("C-c l s" . lsp-ivy-workspace-symbol)
  )

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)



;; projectile
(use-package projectile
  :ensure t
  :bind (("C-c p". projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))

;; magit
(use-package magit
  :ensure t)

;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-tag-follow-mode)
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("C-x t 1" . treemacs-delete-other-window)
        ("C-x t t" . treemacs)
        ("C-x t B" . treemacs-bookmark)
        ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
        ("/" . treemacs-advanced-helpful-hydra)))

(use-package lsp-treemacs
  :ensure t
  :after (treemacs lsp)
  )

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; golang
(use-package go-mode)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; haskell
(use-package haskell-mode)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;; scheme
(use-package geiser-guile)


(provide 'init-lang)
;;; init-lang.el ends here
