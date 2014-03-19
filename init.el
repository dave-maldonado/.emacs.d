;; Dave's emacs init file 2013

;; font and size
(set-default-font "Inconsolata 14")

;; turn stupid GUI toolbar and scrollbars off
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; start w/ scratch buffer
(setq inhibit-startup-screen +1)

;; add .emacs.d/lib/ and subdirectories to load path
(add-to-list 'load-path "~/.emacs.d/lib/")
(let ((default-directory "~/.emacs.d/lib/"))
  (normal-top-level-add-subdirs-to-load-path))

;; keybindings
(define-key global-map (kbd "M-h") 'delete-backward-char)
(define-key global-map (kbd "M-?") 'help-command)
(define-key global-map (kbd "C-x C-o") 'other-window)
(define-key global-map (kbd "M-n") 'scroll-up-command)
(define-key global-map (kbd "M-p") 'scroll-down-command)
(define-key global-map (kbd "C-x C-m") 'execute-extended-command)
(define-key global-map (kbd "C-x m") 'execute-extended-command)

;; C-w backward-delete-word if no region is selected
(defadvice kill-region (before unix-werase activate compile)
  (interactive
  (if mark-active (list (region-beginning) (region-end))
    (list (save-excursion (backward-word 1) (point)) (point)))))

(defun unix-werase-or-kill (arg)
  (interactive "*p")
  (if (and transient-mark-mode
	   mark-active)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

;; C-n newlines if at end of buffer
(setq next-line-add-newlines t)

;; line numbering
(global-linum-mode 1)
(setq linum-format " %d ")

;; kill trailing whitespace on file write
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; highlight part of line that goes beyond column 80
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; electric-indent
(electric-indent-mode +1)

;; solarized color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".rb" ".erb" ".haml " ".html" ".java" ".clj" ".hs"))

;; git-gutter
(when (window-system)
  (require 'git-gutter-fringe)
  (global-git-gutter-mode t))

;; scrolling mods
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq mouse-wheel-follow 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; disable bell
(setq ring-bell-function 'ignore)

;; ROR STUFFS
(add-to-list 'auto-mode-alist '("\\.\\(rb\\|ru\\|builder\\|rake\\|thor\\|gemspec\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\(rake\\|thor\\|guard\\|gem\\|cap\\|vagrant\\)file\\'" . ruby-mode))
(require 'rinari)
(require 'rhtml-mode)
(require 'haml-mode)
(require 'slim-mode)

;; rvm
(require 'rvm)
(rvm-use-default)

;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.test\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; autopair
(require 'autopair)
(autopair-global-mode)
