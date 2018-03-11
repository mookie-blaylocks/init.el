(load-library "url-handlers")
;; Added by .el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold 100000000) ;; 100mb, default: 800kb

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

(load-file (concat user-emacs-directory "home-directory.el"))
(load-file (concat user-emacs-directory "org-settings.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5b6b9c2f0121417faa3f69924b2643656cd429044f956bfa5328000b21d78dc9" default)))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (concat org-directory "Home.org"))
 '(menu-bar-mode nil)
 '(org-agenda-files
   (quote
    ("c:/Users/chath/Dropbox/Org/Winchester.org" "c:/Users/chath/Dropbox/Org/Wedding/Wedding.org" "c:/Users/chath/Dropbox/Org/Wedding/wedding-audio.org" "c:/Users/chath/Dropbox/Org/Someday.org" "c:/Users/chath/Dropbox/Org/Research/Research.org" "c:/Users/chath/Dropbox/Org/NLP/Notes.org" "c:/Users/chath/Dropbox/Org/MA-PhD.org" "c:/Users/chath/Dropbox/Org/Leisure.org" "c:/Users/chath/Dropbox/Org/latex.org" "c:/Users/chath/Dropbox/Org/Home.org" "c:/Users/chath/Dropbox/Org/Food.org" "c:/Users/chath/Dropbox/Org/Fitness.org" "c:/Users/chath/Dropbox/Org/Ethics/Notes.org" "c:/Users/chath/Dropbox/Org/Discrete Mathematics/TA.org" "c:/Users/chath/Dropbox/Org/Computation Theory/Notes.org" "c:/Users/chath/Dropbox/Org/Calendar.org")))
 '(package-selected-packages
   (quote
    (slime psgml ensime sbt-mode auctex flyspell-popup lua-mode scala-mode which-key s-buffer zerodark-theme org-plus-contrib org better-defaults)))
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

(setq apropos-sort-by-scores t)

(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))

(global-set-key (kbd "M-o") 'other-window)

(add-hook 'latex-mode-hook #'(lambda ()
			       (visual-line-mode)))

(load-theme 'zerodark t)
(zerodark-setup-modeline-format)
(scroll-bar-mode -1)
(global-set-key (kbd "C-x g") 'magit-status)
