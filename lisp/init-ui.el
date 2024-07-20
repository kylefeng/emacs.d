;;; init-ui.el -- ui configs
;;; Commentary:
;;; Code:

(set-frame-width (selected-frame) 180)
(set-frame-height (selected-frame) 60)

(use-package good-scroll
  :ensure t
  :if window-system
  :init (good-scroll-mode))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package modus-themes
  :init
  (load-theme 'modus-operandi t t)
  (load-theme 'modus-vivendi t t)
  (load-theme 'modus-operandi-tritanopia t t)
  (load-theme 'modus-operandi-tinted t t)
  (enable-theme 'modus-operandi)
  )

(global-display-line-numbers-mode t)

(setq display-line-numbers-type 'relative)


(provide 'init-ui)
;;; init-ui.el ends here
