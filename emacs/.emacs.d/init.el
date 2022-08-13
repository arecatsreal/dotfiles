;;; Startup
(setq user-emacs-directory "~/.cache/emacs")
;;; PACKAGE LIST
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;;; UNDO
;; Vim style undo not needed for emacs 28
(use-package undo-fu)

;;; User emacs dir
;(add-to-list 'load-path (concat user-emacs-directory "lisp"))
;;; Vim Bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  ;(setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))


;; Clean Folders
(use-package no-littering)

;;; Resurrection
;(setq desktop-path '("~/sync/emacs-desktop"))
;(desktop-save-mode 1)
;(use-package perspective
;  :bind (("C-x b" . persp-switch-to-buffer*)
;         ("C-x k" . persp-kill-buffer*))
;  :init 
;  (setq persp-initial-frame-name "ground")
;  (persp-mode))

;; hemeing
;(use-package dracula-theme
;  :config
;  (load-theme 'dracula t))
;(use-package doom-themes
  ;:ensure t
  ;:config
  ;;; Global settings (defaults)
  ;(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        ;doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;(load-theme 'doom-dracula t)
(use-package catppuccin-theme
 :config
 (setq catppuccin-height-title1 1.5)

  ;; Enable flashing mode-line on errors
  ;(doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;(doom-themes-neotree-config)
  ;; or for treemacs users
  ;(setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;(doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  ;(doom-themes-org-config))

(scroll-bar-mode 0) ; Disable Scrollbars
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
;; Font
;(set-frame-font "UbuntuMono Nerd Font Mono" nil t)
;(set-face-attribute 'default nil :height 200)
(add-to-list 'default-frame-alist '(font . "UbuntuMono Nerd Font Mono-20"))
; Icons
(use-package all-the-icons
  :if (display-graphic-p))
(use-package all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; Simplify Ui
(tool-bar-mode 0)
(menu-bar-mode 0)
(tooltip-mode 0)
(set-fringe-mode 0)
;; Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 5))
(use-package nyan-mode
  :config
  (nyan-mode 1))
;(setq-default mode-line-format
;      (list
;       "| %b | " mode-line-modified " | " vc-mode " | "
;       '(:eval (list (nyan-create)))
;       mode-line-misc-info " | %p | %l:%c |"
;       ))
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; Add line number only in progaming mode.

;;; Mics Gubbens
(use-package vertico
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)) 
  :init
  (vertico-mode))
(use-package savehist
  :init
  (savehist-mode))
(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))
(use-package swiper
  :bind ("C-s" . swiper))
(use-package which-key
  :config
  (which-key-mode))
(use-package paredit
  :hook (prog-mode . enable-paredit-mode))
(use-package popper
  :bind (("C-,"   . popper-toggle-latest)
         ("C-m"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (popper-mode 1)
  (popper-echo-mode 1))


;;; Terminal Stuffs
(use-package vterm
  :commands vterm)
; Disable Modeline in shell
(add-hook 'eshell-mode-hook (setq mode-line-format nil))
(add-hook 'vterm-mode-hook (setq mode-line-format nil))
;; Eshell
(defun efs/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  (evil-normalize-keymaps)

  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))

(use-package eshell
  :hook (eshell-first-time-mode . efs/configure-eshell)
  :config

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim" "btop" "ssh" "gomuks" "apt" "aptitude"))))

(use-package eshell-vterm
  :after eshell
  :config
  (eshell-vterm-mode))
(use-package fish-completion)
(when (and (executable-find "fish")
           (require 'fish-completion nil t))
  (global-fish-completion-mode))
(use-package eshell-syntax-highlighting
  :after eshell-mode
  :init
  (eshell-syntax-highlighting-mode))

; Eshell Alias
(defalias 'eshell/v 'eshell-exec-visual)
(defalias 'speed 'speedtest-cli)
(defalias 'cls 'clear)
(defalias 'gr '(go run *.go))
; Eshell Fuctions
(defun o (object)
  (if (object == *.sh)
      (progn
	(message "sh")
	(message "not sh")))
  )
(defun f ()
  (setq f-buffer-kill (current-buffer))
  (dired ".")
  (kill-buffer "#<buffer *eshell*>"))

;;; Dired
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :hook (dired-mode . hl-line-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "e" 'shell-instead-dired)
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file)
(defun shell-instead-dired ()
  (interactive)
  (let ((dired-buffer (current-buffer)))
    (eshell (concat default-directory "-eshell"))
    (kill-buffer dired-buffer) ;; remove this line if you don't want to kill the dired buffer
    (delete-other-windows)))

(use-package dired-open
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("mkv" . "mpv --fs")
				("mp4" . "mpv --fs")
				("webm" . "mpv --fs")
				("avi" . "mpv --fs")
				("mov" . "mpv --fs")
				("m4b" . "mpv")
				("m4a" . "mpv")
				("mp3" . "mpv")
				("ogg" . "mpv")
				("flac" . "mpv")
				("pdf" . "zathura")
				("ps" . "zathura")
				("cbz" . "zathura")
				("cbr" . "zathura")
				("epub" . "zathura")
				)))
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))
(use-package dired-subtree
  :after dired
  :bind (
	 :map dired-mode-map
	      ("<tab>" . dired-subtree-toggle)
	      ("<backtab>" . dired-subtree-cycle)))


;;; Lang Functions
;; LSP
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))
; Perlang LSP
(use-package go-mode;)
  :hook (go-mode . lsp-deferred))


(use-package lsp-ui)
(lsp-ui-mode 1)

;; Company
(use-package company
:after lsp-mode)
;:config (company-idle-begin 0.0))
(add-hook 'after-init-hook 'global-company-mode)
(use-package company-box
  :hook (company-mode . company-box-mode))

;;; Keybindings

;;; Org-mode

(use-package org
  :hook (org-mode . org-bullets-mode)
  :config   (setq org-ellipsis " ▾"
		  org-hide-emphasis-markers t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package visual-fill-column
  :hook (org-mode . visual-fill-column-mode)
  :config (setq visual-fill-column-width 100
        visual-fill-column-center-text t))
(use-package focus)

;;; Elfeed
(use-package elfeed
  :config
  (setq elfeed-db-directory "~/sync/elfeed/elfeed-db")
  :bind (
	 :map elfeed-search-mode-map
	      ("C-x f" . elfeed-search-set-filter)
	      ("C-x w" . elfeed-search-yank)))
(use-package elfeed-goodies)
(use-package elfeed-feeds
  :load-path "~/sync/elfeed-feeds"
  :after elfeed
  :disabled t
  :config)
;(load-file "~/sync/elfeed-feeds")

(defun elfeed-mark-all-as-read ()
      (interactive)
      (mark-whole-buffer)
      (elfeed-search-untag-all-unread))


;; don't show these
;(add-to-list 'ibuffer-never-show-predicates "zowie")
;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "22f080367d0b7da6012d01a8cd672289b1debfb55a76ecdb08491181dcb29626" default))
 '(doom-modeline-mode t)
 '(helm-minibuffer-history-key "M-p")
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(popper no-littering marginalia vertico verrtico perspective eyebrowse focus writeroom-mode elfeed-org elfeed-goodies elfeed org-bullets eshell-syntax-highlighting paredit fish-completion eshell-vterm rainbow-delimiters swiper ivy doom-modeline all-the-icons-dired all-the-icons smart-mode-line go-mode which-key lsp-go helm emacs-helm lsp-ui dashboard nyan-mode dracula-theme evil-collection evil undo-fu use-package cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
