(package-initialize)

(org-babel-load-file (concat user-emacs-directory "myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "bce3ae31774e626dce97ed6d7781b4c147c990e48a35baedf67e185ebc544a56" "dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "5b6b9c2f0121417faa3f69924b2643656cd429044f956bfa5328000b21d78dc9" default)))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (concat org-directory "Home.org"))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (solarized-theme twilight-bright-theme anti-zenburn-theme company-coq material-theme org-beautify-theme pomidor org-bullets challenger-deep-theme dracula-theme adaptive-wrap markdown-mode markdown-mode+ markdown-preview-eww markdown-preview-mode auto-complete-auctex slime psgml ensime sbt-mode auctex flyspell-popup lua-mode scala-mode which-key s-buffer zerodark-theme org-plus-contrib org better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; Only un-comment one:
 ;;'(default ((t (:family "Anonymous Pro" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
 ;;'(default ((t (:family "Inconsolata" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
 '(default ((t (:family "Triplicate T4c" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
