(defun switch-to-scratch-and-insert-text ()
  (interactive)
  (save-excursion
    (set-buffer "*scratch*")
    (insert "Hello, World")))

(global-set-key (kbd "C-c i") #'switch-to-scratch-and-insert-text)

(defun mp-elisp-mode-eval-buffer ()
  (interactive)
  (message "Evaluated buffer")
  (eval-buffer))

(define-key emacs-lisp-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)
(define-key lisp-interaction-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)

(provide 'init-utils)
