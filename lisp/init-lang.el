;;; init-lang.el -- programming languages configs
;;; Commentary:
;;; Code:
(setq-default tab-width 4
              indent-tabs-mode nil)

;; 高亮括号
(add-hook 'prog-mode-hook #'show-paren-mode)

;; 折叠代码
(add-hook 'prog-mode-hook #'hs-minor-mode)

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
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
  :init (setq lsp-prefer-flymake nil
	      lsp-keep-workspace-alive nil
	      lsp-enable-indentation nil
	      lsp-enable-on-type-formatting nil
	      lsp-auto-guess-root nil
	      lsp-enable-snippet t)
  )

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))


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
