(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

;; counsel
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

;; swiper
(use-package swiper
  :after (ivy)
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recentf t
		swiper-include-line-number-in-search t))
;; company
(use-package company
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config (setq company-minimum-prefix-length 1
                company-selection-wrap-around t
		company-backends '(company-capf company-files company-keywords)
		company-idle-delay 0.2))

;; flycheck
(use-package flycheck
  :hook (prog-mode . flycheck-mode))

;; which key
(use-package which-key
  :defer nil
  :config (which-key-mode))

(use-package restart-emacs)

;; ace-window
(use-package ace-window
  :bind (("M-o" . 'ace-window)))

;; exec-path-from-shell
(use-package exec-path-from-shell
  :defer nil
  :if (memq window-system '(mac ns x))
  :init (exec-path-from-shell-initialize))

;; org-modern
(use-package org-modern)

(use-package keycast
  :init (keycast-mode-line-mode t))

(provide 'init-package)

