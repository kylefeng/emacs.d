;;; init-const.el -- define constants
;;; Commentary:
;;; Code:

(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos)
			   (eq system-type 'windows-nt)))

(defconst *spell-check-support-enabled* nil)

(provide 'init-const)
;;; init-const.el ends here
