(set-frame-position (selected-frame) 0 0)
(set-frame-width (selected-frame) 180)
(set-frame-height (selected-frame) 60)


;; 终端更纱黑体-简 Nerd
(defun set-font (english chinese english-size chinese-size)
  "set chinese, english font and size"
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(add-to-list 'after-make-frame-functions
             (lambda (new-frame)
               (select-frame new-frame)
               (when (display-graphic-p)
                 (set-font "PragramtaPro Mono" "终端更纱黑体-简 Nerd" 13 13))))

(when (display-graphic-p)
    (set-font "PragmataPro Mono" "终端更纱黑体-简 Nerd" 13 13))

(use-package modus-themes
  :init
  (load-theme 'modus-operandi t t)
  (load-theme 'modus-vivendi t t)
  (load-theme 'modus-operandi-tritanopia t t)
  (enable-theme 'modus-operandi-tritanopia)
  )
  
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(provide 'init-ui)
