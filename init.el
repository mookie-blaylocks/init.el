(load-library "url-handlers")
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "C:\\Users\\chath\\Dropbox\\Org\\Home.org")
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("c:/Users/chath/Dropbox/Org/Home.org")))
 '(package-selected-packages
   (quote
    (toml-mode sml-mode scribble-mode scheme-complete rust-mode racket-mode quack pollen-mode paredit haskell-mode cider better-defaults)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Triplicate T4c" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(define-key global-map (kbd "RET") 'newline-and-indent)
(load-theme 'misterioso t)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-ct" 'org-set-tags)
(setq org-log-done t)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "gold" :weight bold)
              ("NEXT" :foreground "gold" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "orange" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-directory "C:/Users/chath/Dropbox/Org/")
(setq org-default-notes-file (concat org-directory "notes.org"))

(defun org-capture-class ()
  "Capture a class template for org-capture"
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((course   (read-string "Course: " nil nil '(nil)))
          (week     (read-string "Week: " nil nil '(nil)))
          (lecture  (read-string "Lecture No.: " nil nil '(nil)))
          (date     (org-read-date nil t))
          (location (read-string "Location: " nil nil '(nil))))
      (when (and course week lecture date location)
        (concat (format "* TODO %s: Week %s Lecture %s\n"
                        course week lecture)
                (format "  SCHEDULED: %s\n" (update date 0))
                (format "  Location: %s %%?\n" location)
                (format "** TODO %s: review lecture %s from week %s\n"
                        course lecture week)
                (format "    DEADLINE: %s SCHEDULED: %s\n"
                        (update date 2) (update date 1)))))))

(defun org-capture-event ()
  "Capture an event template for org-capture"
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((title   (read-string "Title: " nil nil '(nil)))
          (speaker (read-string "Speaker: " nil nil '(nil)))
          (date    (org-read-date nil t))
          (location (read-string "Location: " nil nil '(nil))))
      (when (and title speaker date location)
        (concat (format "* TODO %s with %s\n"
                        title speaker)
                (format "  SCHEDULED: %s\n" (update date 0))
                (format "  Location: %s %%?\n" location))))))

(defun org-capture-note ()
  "Capture a note template for org-capture"
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((note (read-string "Note: " nil nil '(nil)))
          (date (org-read-date nil t)))
      (when note
        (concat (format "* TODO %s\n")
                (format "  Noted: %s" date))))))
        
        
(setq org-capture-templates
      '(("c" "Class" entry
         (file (concat org-directory "refile.org"))
         #'org-capture-class)
        ("e" "Event" entry
         (file (concat org-directory "refile.org"))
         #'org-capture-event)
        ("n" "Note" entry
         (file (concat org-directory "refile.org"))
         #'org-capture-note)
        ("e" "Exercise" entry
         (file (concat org-directory "refile.org")))))
              

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

(setq apropos-sort-by-scores t)

(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))
