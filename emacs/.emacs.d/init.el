(setq inhibit-startup-screen t) ;; Fuck the Welcome Screen
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)(require 'use-package)
;;Tabs > Spaces
(setq tab-width 5)
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(setq backward-delete-char-untabify-method 'hungry)
(setq-default python-indent-offset 5) ;; Suport for Python
(setq-default js-indent-level 5)      ;; Suport for Javascript

;;Evil Mode
(use-package evil 
  :ensure t)
(require 'evil)
(evil-mode 1)
;;Org
(use-package org 
  :ensure t)
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (emacs-lisp .t)))
;;Org mode settings
;;(add-hook 'org-mode-hook 
;;      '(lambda() 
;;        (visual-line-mode))


(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook #'org-bullets-mode))
(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
(use-package tetris
  :ensure t)

;;Helm
(use-package helm
  :init
    (require 'helm-config)
    (setq helm-split-window-in-side-p t
	  helm-move-to-line-cycle-in-source t)
  :config 
    (helm-mode 1) ;; Most of Emacs prompts become helm-enabled
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way  )
    (define-key evil-ex-map "b" 'helm-buffers-list) ;; List buffers ( Vim way  )
    (global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
    (global-set-key (kbd "C-s") 'helm-occur)  ;; Replaces the default isearch keybinding
    (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
    (global-set-key (kbd "M-x") 'helm-M-x)  ;; Improved M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; Show kill ring, pick something to paste
    :ensure t)
;;Popup
(use-package popup
  :ensure t)

;;Magit
(use-package magit
  :ensure t)
;;Spell Check flyspell
(require 'flyspell-correct-popup)
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-at-point)
(define-key evil-ex-map "set spell" 'flyspell-mode)

;;Keybinds
;;(global-set-key (kbd "[Key Combo]") '[Command]) ;;Exsampl
(global-set-key (kbd "C-x k") 'kill-current-buffer) ;;Kills boath the buffer and window
(global-set-key (kbd "C-c g") 'magit) ;;Runs Magit a git client
(define-key evil-ex-map "omec" 'org-edit-src-code) ;;Open a second buffer in emacs to edit sc blocs in org-mode
(define-key evil-ex-map "sbuffer" 'switch-to-buffer) ;; Open helm screen to switch buffers
(define-key evil-ex-map "tangle" 'org-babel-tangle) ;; Tangle sc blocks with org-babel

;;Autocomplet (company)
(use-package company
  :ensure t
  :hook (after-init . global-company-mode))
;;Wich-key, Shows Key combos
(use-package which-key
  :ensure t
  :config (which-key-mode))

;;Dashbord (Startup screen)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
  (setq dashboard-startup-banner 1)

;;Settings
(electric-pair-mode 1) ;;Auto pair
(show-paren-mode 1) ;;Show pair sets
;; Line numbering
(global-display-line-numbers-mode)
;;(setq display-line-numbers-type 'relative)
;;Change prompt ot y & n
(fset 'yes-or-no-p 'y-or-n-p)
;;Current Line Highlight
(global-hl-line-mode)
;;Font
(set-face-attribute 'default nil :height 125)
;;The value is in 1/10pt, so 100 will give you 10pt, etc. 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (gruvbox)))
 '(custom-safe-themes
   (quote
    ("b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "aee423e8bec6a7d6b32b314c79e18a91c8d3d8ccc3de39ae5b58d70b6fd71770" "dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" default)))
 '(flymake-error-bitmap
   (quote
    (flymake-double-exclamation-mark modus-theme-fringe-red)))
 '(flymake-note-bitmap (quote (exclamation-mark modus-theme-fringe-cyan)))
 '(flymake-warning-bitmap (quote (exclamation-mark modus-theme-fringe-yellow)))
 '(highlight-tail-colors (quote (("#2f4a00" . 0) ("#00415e" . 20))))
 '(hl-todo-keyword-faces
   (quote
    (("HOLD" . "#cfdf30")
     ("TODO" . "#feacd0")
     ("NEXT" . "#b6a0ff")
     ("THEM" . "#f78fe7")
     ("PROG" . "#00d3d0")
     ("OKAY" . "#4ae8fc")
     ("DONT" . "#80d200")
     ("FAIL" . "#ff8059")
     ("BUG" . "#ff8059")
     ("DONE" . "#44bc44")
     ("NOTE" . "#f0ce43")
     ("KLUDGE" . "#eecc00")
     ("HACK" . "#eecc00")
     ("TEMP" . "#ffcccc")
     ("FIXME" . "#ff9977")
     ("XXX+" . "#f4923b")
     ("REVIEW" . "#6ae4b9")
     ("DEPRECATED" . "#bfd9ff"))))
 '(ibuffer-deletion-face (quote modus-theme-mark-del))
 '(ibuffer-filter-group-name-face (quote modus-theme-mark-symbol))
 '(ibuffer-marked-face (quote modus-theme-mark-sel))
 '(ibuffer-title-face (quote modus-theme-header))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (gruvbox-theme gruvbox-them modus-vivendi-theme flyspell-correct-popup flyspell-correct magit exwm-firefox-core exwm evil-org org-bullets helm use-package evil dracula-theme)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#282828")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff8059")
     (40 . "#feacd0")
     (60 . "#f78fe7")
     (80 . "#f4923b")
     (100 . "#eecc00")
     (120 . "#cfdf30")
     (140 . "#f8dec0")
     (160 . "#bfebe0")
     (180 . "#44bc44")
     (200 . "#80d200")
     (220 . "#6ae4b9")
     (240 . "#4ae8fc")
     (260 . "#00d3d0")
     (280 . "#c6eaff")
     (300 . "#29aeff")
     (320 . "#72a4ff")
     (340 . "#00bdfa")
     (360 . "#b6a0ff"))))
 '(vc-annotate-very-old-color nil)
 '(xterm-color-names
   ["#000000" "#ff8059" "#44bc44" "#eecc00" "#29aeff" "#feacd0" "#00d3d0" "#a8a8a8"])
 '(xterm-color-names-bright
   ["#181a20" "#f4923b" "#80d200" "#cfdf30" "#72a4ff" "#f78fe7" "#4ae8fc" "#ffffff"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
