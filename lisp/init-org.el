;;; org.el -- org-mod configs
;;; Commentary:
;;; Code:


(require 'org)

(with-eval-after-load 'org
  (defvar org-agenda-dir "gtd org files location")
  (setq-default org-agenda-dir "/Users/kylefeng/development/org")
  
  (setq
    ;; Edit settings
    org-tags-column -128 
    org-catch-invisible-edits 'show-and-error
    org-starup-indented t
    org-auto-align-tags nil
    org-special-ctrl-a/e t
    org-insert-heading-respect-content t
  
    ;; Org styling, hide markup etc.
    org-hide-emphasis-markers t
    org-pretty-entities t
    org-ellipsis "…"
  
    ;; Agenda styling
    org-agenda-tags-column 0
    org-agenda-block-separator ?─
    org-agenda-time-grid
    '((daily today require-timed)
      (800 1000 1200 1400 1600 1800 2000)
      " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
    org-agenda-current-time-string
    "<- now ─────────────────────────────────────────────────"
  
    org-todo-keywords '((sequence "TODO(t!)" "ACTING(a!)" "|" "DONE(d!)" "CANCELED(c @/!)"))
  
    ;; agenda files
    org-agenda-files '(org-agenda-dir)
    )
  
  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-task (expand-file-name "task.org" org-agenda-dir))
  (setq org-agenda-file-calendar (expand-file-name "calendar.org" org-agenda-dir))
  (setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
  (setq org-agenda-file-canceled (expand-file-name "canceled.org" org-agenda-dir))
  
  (setq org-capture-templates
    '(
       ("t" "Todo" entry (file+headline org-agenda-file-task "Work")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("l" "Tolearn" entry (file+headline org-agenda-file-task "Learning")
          "* TODO [#B] %?\n  %i\n"
          :empty-lines 1)
        ("h" "Toplay" entry (file+headline org-agenda-file-task "Hobbies")
          "* TODO [#C] %?\n  %i\n"
          :empty-lines 1)
        ("I" "Inbox" entry (file+headline org-agenda-file-task "Inbox")
          "* TODO [#C] %?\n  %i\n"
          :empty-lines 1)
        ("o" "Todo_others" entry (file+headline org-agenda-file-task "Others")
          "* TODO [#C] %?\n  %i\n"
          :empty-lines 1)
        ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
          "* %?\n  %i\n %U"
          :empty-lines 1)
        ("i" "ideas" entry (file+headline org-agenda-file-note "Quick ideas")
          "* %?\n  %i\n %U"
          :empty-lines 1)
        ))
  
  (setq org-agenda-custom-commands
    '(
      ("w" . "任务安排")
      ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
      ("wb" "重要且不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
      ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
      ("W" "Weekly Review"
       ((stuck "") ;; review stuck projects as designated by org-stuck-projects
        (tags-todo "daily")
        (tags-todo "weekly")
        (tags-todo "work")
        (tags-todo "blog")
        (tags-todo "book")
        ))
      ))
  
  (setq org-refile-targets  '((org-agenda-file-finished :maxlevel . 1)
                              (org-agenda-file-note :maxlevel . 1)
                              (org-agenda-file-canceled :maxlevel . 1)
                               (org-agenda-file-task :maxlevel . 1)
                               ))
  )

(provide 'init-org)
;;; init-org.el ends here
