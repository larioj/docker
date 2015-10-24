(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
			package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
			package-archives)
(package-initialize)

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/plugins")

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key "\t" 'company-complete-common)
(setq company-idle-delay 0)

(setq company-backends (delete 'company-semantic company-backends))

(load-file (concat user-emacs-directory "/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "cedet/contrib/cedet-contrib-load.el"))

(require 'cc-mode)
;;(require 'semantic)

;;(global-semanticdb-minor-mode 1)
;;(global-semantic-idle-scheduler-mode 1)

;;(semantic-mode 1)

(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(progn
    (set-face-attribute 'flycheck-warning nil
      :foreground "yellow"
      :background "red")))

(require 'function-args)
(fa-config-default)

(require 'yasnippet)
(setq yas-snippet-dirs
  '("~/.emacs.d/snippets"
))
(yas-global-mode 1)

(load "elscreen" "ElScreen" t)
(elscreen-start)

(setq evil-toggle-key "C-`")
(require 'evil)
(require 'evil-leader)
(evil-mode 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(setq evil-move-cursor-back nil)

(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)
;;(define-key evil-normal-state-map (kbd "'") 'evil-set-marker)
;;(define-key evil-motion-state-map (kbd "m") 'evil-goto-mark-line)
(define-key evil-insert-state-map "\C-c" 'fa-show)

(evil-leader/set-key
  "c" 'elscreen-create
  "x" 'elscreen-kill
  "n" 'elscreen-next
  "l" 'elscreen-previous
  "k" 'kill-buffer
  "f" 'semantic-tag-folding-fold-all
  "F" 'semantic-tag-folding-show-all)

(require 'evil-elscreen)

;; Behaviour
(setq-default show-trailing-whitespace t)

(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-message t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

(setq scroll-conservatively 10000)

;; Look
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'spolsky t)