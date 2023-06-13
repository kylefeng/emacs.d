;; 设置加载目标目录到 load-path 变量
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-const)
(require 'init-kbd)
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-evil)
(require 'init-ui)
(require 'init-lang)
(require 'init-org)

(when (file-exists-p custom-file)
  (load-file custom-file))

