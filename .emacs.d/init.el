;; enable MELPA repository (https://melpa.org/#/getting-started)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "0b7e79de7c8d857d53c8df7449c61deb2035cb276372ea4ad65fe7e6f1b046ca" "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (projectile-rails ac-inf-ruby yari dumb-jump yaml-mode zzz-to-char dracula-theme nord-theme diff-hl which-key web-mode magit use-package google-this all-the-icons all-the-icons-dired dired-single smart-mode-line auto-complete yasnippet-snippets yasnippet rg adaptive-wrap crux expand-region helm-rg helm-projectile avy command-log-mode helm projectile-codesearch markdown-mode atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; stop emacs from creating backup and lock files
(setq create-lockfiles nil)
(setq make-backup-files nil)


;; Helm
(require 'helm-config)
(setq helm-splite-window-in-side-p t
      helm-move-to-line-cycle-in-source t)
(helm-mode 1)
;; helm keybindings
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
;; always show helm in bottom:
(add-to-list 'display-buffer-alist
		    `(,(rx bos "*helm" (* not-newline) "*" eos)
			 (display-buffer-in-side-window)
			 (inhibit-same-window . t)
			 (window-height . 0.4)))


;; set ruby mode for files
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . ruby-mode))


;; global set of keybindings
(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)
(global-set-key (kbd "C-c I") 'crux-find-user-init-file)
(global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "M-o") 'crux-other-window-or-switch-buffer)
;; overrides mark-whole-buffer
(global-set-key "\C-ch" 'help-command)
;; (global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "C-;") 'avy-goto-char-2)
(global-set-key (kbd "C-c C-r") 'query-replace)
(global-set-key (kbd "C-c C-i") 'yari)
(global-set-key (kbd "C-c r r") 'inf-ruby)
(require 'expand-region)
(global-set-key (kbd "M-l") 'er/expand-region)
(global-set-key (kbd "C-c n") 'crux-cleanup-buffer-or-region)
(global-set-key (kbd "C-c k") 'crux-kill-other-buffers)
(global-set-key (kbd "C-x 4 t") 'crux-transpose-windows)
(global-set-key (kbd "C-<tab>") 'previous-buffer )
(global-set-key (kbd "C-S-<iso-lefttab>") 'next-buffer )
(global-set-key (kbd "M-j") (kbd "<return>")) ; makes M-j act as enter



;; sentences end with single space
(setq sentence-end-double-space nil)


;; make C-h work as backspace.
(global-set-key "\C-h" 'delete-backward-char)


;; auto-complete
;; (setq icomplete-mode t)
(package-install 'auto-complete)
(require 'auto-complete)
(setq ac-dwim t)
(ac-config-default)
(setq ac-sources '(ac-source-yasnippet
ac-source-abbrev
ac-source-words-in-same-mode-buffers))


;; projectile
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(require 'helm-projectile)
(helm-projectile-on)

;; projectile-rails
(require 'projectile-rails)
(projectile-rails-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)


;; wrap lines
(when (fboundp 'adaptive-wrap-prefix-mode)
  (defun my-activate-adaptive-wrap-prefix-mode ()
    "Toggle `visual-line-mode' and `adaptive-wrap-prefix-mode' simultaneously."
    (adaptive-wrap-prefix-mode (if visual-line-mode 1 -1)))
  (add-hook 'visual-line-mode-hook 'my-activate-adaptive-wrap-prefix-mode))


;; yasnippets support (completes code snippets)
(package-install 'yasnippet)
(require 'yasnippet)
;; (yas/load-directory "~/.emacs.d/snippets/"))
(setq yas/indent-line 'auto)
(yas-global-mode 1)
(global-set-key (kbd "C-c C-y") #'yas-insert-snippet)


;; ripgrep
(require 'rg)
(global-set-key (kbd "C-c s") #'rg-menu)
(add-to-list 'load-path "/usr/bin/")
(with-eval-after-load 'rg
  rg-executable [(executable-find "rg")]
  ;; Your settings goes here.
  )
(setq rg-custom-type-aliases
  '(("rake" .    "*.rake")
    ))

;; google-this
(use-package google-this
  :config
  (google-this-mode 1))


;; web-mode for some file types
(use-package web-mode
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; which-key
(require 'which-key)
(which-key-mode 1)

;; diff-hl -> shows git changes in sidebar for buffer.
(global-diff-hl-mode)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; dumb-jump for going to definition of functions
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load additional files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/theme")
(put 'narrow-to-region 'disabled nil)
(load "~/.emacs.d/dired")
