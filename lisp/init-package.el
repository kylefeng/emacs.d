;;; init-package.el -- package dependencies
;;; commentary:
;;; code:

;; hydra
(use-package hydra
  :demand t)

(use-package use-package-hydra
  :demand t
  :after hydra)

;; ivy
(use-package ivy
  :defer 1
  :demand t
  :hook (after-init . ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  (setq search-default-mode #'char-fold-to-regexp)
  :bind
  (("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c v" . 'ivy-pop-view))
  )

;; counsel
(use-package counsel
  :after (ivy)
  :bind (("C-x C-SPC" . counsel-mark-ring)
   ("C-x C-f" . counsel-find-file)
   ("C-c f" . counsel-recentf)
   ("C-c g" . counsel-git)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)
   ))

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
  :ensure t
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

(use-package keycast
  :config (keycast-mode-line-mode t))


;; amx
(use-package amx
  :ensure t
  :init (amx-mode))

(use-package mwim
  :ensure t
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
   ("C-e" . mwim-end-of-code-or-line)))

(use-package undo-tree
 :ensure t
 :init (global-undo-tree-mode)
 :after hydra
 :bind ("C-x C-h u" . hydra-undo-tree/body)
 :custom
 (undo-tree-auto-save-history nil)
 :hydra (hydra-undo-tree (:hint nil)
 "
 _p_: undo _n_: redo _s_: save _l_: load  "
 ("p"  undo-tree-undo)
 ("n"  undo-tree-redo)
 ("s"  undo-tree-save-history)
 ("l"  undo-tree-load-history)
 ("u"  undo-tree-visualize "visualize" :color blue)
 ("q"  nil "quit" :color blue)))


;; marginalia
(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
              ("M-a" . marginalia-cycle)))



(provide 'init-package)
;;; init-package.el ends here
