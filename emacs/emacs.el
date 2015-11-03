(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
			package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
			package-archives)
(package-initialize)

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-face-attribute 'default nil :height 160)
(setq-default show-trailing-whitespace t)

(menu-bar-mode -1)

(require 'linum)
(global-linum-mode 1)
(setq linum-format "%d ")

(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq scroll-conservatively 10000)

(require 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

(require 'cc-mode)

(add-to-list 'load-path "~/.emacs.d/plugins/evil")
(require 'evil)
(evil-mode 1)
(setq evil-move-cursor-back nil)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

(add-to-list 'load-path "~/.emacs.d/plugins/powerline")
(require 'powerline)
(display-time-mode t)

(add-to-list 'load-path "~/.emacs.d/plugins/powerline-evil")
(require 'powerline-evil)
(powerline-evil-vim-color-theme)

(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(progn
    (set-face-attribute 'flycheck-warning nil
      :foreground "yellow"
      :background "red")))
(eval-after-load 'flycheck
  '(progn
    (set-face-attribute 'flycheck-error nil
      :foreground "yellow"
      :background "red")))
(eval-after-load 'flycheck
  '(progn
    (set-face-attribute 'flycheck-info nil
      :foreground "yellow"
      :background "red")))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key "\t" 'company-complete-common)
(setq company-idle-delay 0)
(setq company-backends (delete 'company-semantic company-backends))

(require 'function-args)
(fa-config-default)
(define-key evil-insert-state-map "\C-s" 'fa-show)
(define-key evil-insert-state-map "\C-h" 'fa-abort)

(require 'yasnippet)
(setq yas-snippet-dirs
  '("~/.emacs.d/snippets"
))
(add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippet-snippets")
(yas-global-mode 1)

(load "elscreen" "ElScreen" t)
(elscreen-start)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "c" 'elscreen-create
  "x" 'elscreen-kill
  "n" 'elscreen-next
  "l" 'elscreen-previous
  "k" 'kill-buffer
  "f" 'semantic-tag-folding-fold-all
  "F" 'semantic-tag-folding-show-all)

(add-to-list 'load-path "~/.emacs.d/plugins/evil-elscreen")
(require 'evil-elscreen)

(load-theme 'manoj-dark t)
