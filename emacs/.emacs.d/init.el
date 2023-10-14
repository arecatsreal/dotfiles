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

;; (defvar rag--file-name-handler-alist file-name-handler-alist)
;; (setq file-name-handler-alist nil)
;; (add-to-list 'load-path "~/.emacs.d/config/")
;; (require 'evil)
;; (require 'ui)
;; (require 'packages)
;; (require 'prog-mode)

(use-package modular-config
  :custom
  (modular-config-list '(
                         (none ())
                         (main (evil ui packages prog vars lsp exwm shell))
                         ))
  (modular-config-default 'main)
  (modular-config-path "~/.emacs.d/config")
  :config
  (modular-config-command-line-args-process))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(tree-sitter-langs tree-sitter exwm avy company-box company lsp-ui go-mode lsp-mode rainbow-delimiters which-key vertico undo-fu swiper popper paredit nyan-mode no-littering modular-config marginalia initsplit evil-collection evil-colemak-basics doom-themes doom-modeline catppuccin-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
