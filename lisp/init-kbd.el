;;; init-kbd.el -- key bindings
;;; Commentary:
;;; Code:
(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

(defun next-ten-lines ()
  "Move cursor to next 10 lines."
  (interactive)
  (forward-line 10))

(defun previous-ten-lines ()
  "Move cursor to previous 10 lines."
  (interactive)
  (forward-line -10))


(global-set-key (kbd "M-w") 'kill-region)             ; 交换 M-w 和 C-w，M-w 为剪切
(global-set-key (kbd "C-w") 'kill-ring-save)          ; 交换 M-w 和 C-w，C-w 为复制
(global-set-key (kbd "M-n") 'next-ten-lines)
(global-set-key (kbd "M-p") 'previous-ten-lines)

(provide 'init-kbd)
;;; init-kbd.el ends here
