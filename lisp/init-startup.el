;;; init-startup.el -- start up config
;;; Commentary:
;;; Code:

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; no file backup
(setq make-backup-files nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)

(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

; make ibuffer default
(defalias 'list-buffers 'ibuffer)

;; 自动补全括号
(electric-pair-mode t)

;; 自动刷新 buffer
(global-auto-revert-mode t)

;; 选中文本后输入会替换文本
(delete-selection-mode t)

(provide 'init-startup)
;;; init-startup.el ends here
