;;; init-font.el -- font configs
;;; Commentary:
;;; Code:

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
                 (set-font "Sarasa Mono CL" "Sarasa Mono CL" 13 13))))

(when (display-graphic-p)
    (set-font "Sarasa Mono CL" "Sarasa Mono CL" 13 13))

(provide 'init-font)
;;; init-font.el ends here
