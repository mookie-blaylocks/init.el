(setq org-directory (concat home-directory "/Dropbox/Org/"))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-ct" 'org-set-tags)
(setq org-log-done t)

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)
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

(setq org-default-notes-file (concat org-directory "notes.org"))

(load-file (concat user-emacs-directory "org-functions.el"))
(setq org-capture-templates
      '(("c" "Class" entry
         (file (concat org-directory "Home.org"))
         #'org-capture-class)
        ("e" "Event" entry
         (file (concat org-directory "Home.org"))
         #'org-capture-event)
        ("n" "Note" entry
         (file (concat org-directory "Home.org"))
         #'org-capture-note)
        ("e" "Exercise" entry
         (file (concat org-directory "Home.org")))
        ("p" "Phone Call" entry
         (file (concat org-directory "Home.org"))
         #'org-capture-phone)))

(defun org-mode-set-up-key-bindings ()
  (define-key org-mode-map (kbd "C-t") 'org-time-stamp)
  ;; If ncecessary, add more calls to 'define-key here ...
  )

(add-hook 'org-mode-hook 'org-mode-set-up-key-bindings)
(add-hook 'org-mode-hook #'(lambda ()
			     (visual-line-mode)
			     (org-indent-mode)))

(load-library "find-lisp")
(setq org-agenda-files
      (find-lisp-find-files org-directory "\.org$"))
