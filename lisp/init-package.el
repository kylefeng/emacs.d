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
  :ensure t
  :init (global-company-mode)
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (setq company-show-quick-access t)
  (setq company-backends '(company-capf company-files company-keywords))
  (setq company-idle-delay 0.2)
  (setq company-transformers '(company-sort-by-occurrence)))

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

;; flycheck
(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil)
  :hook
  (prog-mode . flycheck-mode))

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



;; mulit-cursors
(use-package multiple-cursors
  :ensure t
  :after hydra
  :bind
  (("C-x C-h m" . hydra-multiple-cursors/body)
   ("C-S-<mouse-1>" . mc/toggle-cursor-on-click))
  :hydra
  (hydra-multiple-cursors
  (:hint nil)
  "
Up^^       Down^^      Miscellaneous      % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]  Prev   [_n_]  Next   [_l_] Edit lines [_0_] Insert numbers
 [_P_]  Skip   [_N_]  Skip   [_a_] Mark all  [_A_] Insert letters
 [_M-p_] Unmark  [_M-n_] Unmark  [_s_] Search   [_q_] Quit
 [_|_] Align with input CHAR    [Click] Cursor at point"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("|" mc/vertical-align)
  ("s" mc/mark-all-in-region-regexp :exit t)
  ("0" mc/insert-numbers :exit t)
  ("A" mc/insert-letters :exit t)
  ("<mouse-1>" mc/add-cursor-on-click)
  ;; Help with click recognition in this hydra
  ("<down-mouse-1>" ignore)
  ("<drag-mouse-1>" ignore)
  ("q" nil)))

;; tiny
(use-package tiny
  :ensure t)

;; highlight-symbol
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol))


;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package yasnippet
 :ensure t
 :hook
 (prog-mode . yas-minor-mode)
 :config
 (yas-reload-all)
 ;; add company-yasnippet to company-backends
 (defun company-mode/backend-with-yas (backend)
  (if (and (listp backend) (member 'company-yasnippet backend))
   backend
   (append (if (consp backend) backend (list backend))
        '(:with company-yasnippet))))
 (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
 ;; unbind <TAB> completion
 (define-key yas-minor-mode-map [(tab)]    nil)
 (define-key yas-minor-mode-map (kbd "TAB")  nil)
 (define-key yas-minor-mode-map (kbd "<tab>") nil)
 :bind
 (:map yas-minor-mode-map ("S-<tab>" . yas-expand)))
  
(use-package yasnippet-snippets
 :ensure t
 :after yasnippet)

(provide 'init-package)
;;; init-package.el ends here
