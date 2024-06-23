;;; init.el -- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Produce backtraces whe errors occur: can be helpful to diagnose startup issues
(setq debug-on-error t)

(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config required v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; 设置加载目标目录到 load-path 变量
(add-to-list 'load-path
	         (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;; Adjust garbage collection thresholds during startup, and thereafter
(setq gc-cons-threshold (* 128 1024 1024))

;; Process performance tuning
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;; Measure startup time
(require 'init-benchmarking)

(require 'init-const)
(require 'init-utils)
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-kbd)
(require 'init-evil)
(require 'init-ui)
(require 'init-lang)
(require 'init-org)

(when (file-exists-p custom-file)
  (load-file custom-file))
;;; init.el ends here
