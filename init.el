(load-library "url-handlers")
;; Added by Package.el.  This must come before configurations of
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
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (concat org-directory "Home.org"))
 '(menu-bar-mode nil)
 '(org-agenda-files
   (\`
    ((\,
      (concat org-directory "refile.org"))
     (\,
      (concat org-directory "Home.org")))))
 '(package-selected-packages
   (quote
    (s-buffer zerodark-theme org-plus-contrib org better-defaults)))
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
(load-theme 'zerodark t)
(zerodark-setup-modeline-format)


(setq apropos-sort-by-scores t)

(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))
