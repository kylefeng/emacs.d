;;; init-python.el -- python language config
;;; Commentary:
;;; Code:

(use-package python
  :defer t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode)
  :config
  ;; for debug
  ;; (require 'dap-python)
  )

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t))

;; poetry integration
(use-package poetry
  :ensure t)

;; lsp-backend by pyright
(use-package lsp-pyright
  :ensure t
  :config
  :hook
  (python-mode . (lambda ()
   (require 'lsp-pyright)
   (lsp-deferred))))

(provide 'init-python)

;;; init-python.el ends here
