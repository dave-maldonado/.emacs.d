;; general emacs config

;; start server for emacsclient
(server-start)

;; font and size
(set-default-font "Inconsolata 16")

;; turn stupid GUI toolbar and scrollbars off
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; start w/ scratch buffer
(setq inhibit-startup-screen +1)

;; kill all the buffers!
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

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

;; line numbering
(global-linum-mode 1)
(setq linum-format " %d ")

;; kill trailing whitespace on file write
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".rb" ".erb" ".haml " ".html" ".java" ".clj" ".hs"))

;; scrolling mods
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; disable bell
(setq ring-bell-function 'ignore)

;; auto refresh buffers when changes made on disk
(global-auto-revert-mode t)

;; electric pair mode
(electric-pair-mode 1)

;; rainbow delimiters
;; if re-installing don't forget to M-x byte-compile-file rainbow-delimiters.el
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error
                    :strike-through t)

;; base 16 emacs themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/lib/base16-emacs")
(load-theme 'base16-chalk t)

;; git-gutter
(when (window-system)
  (require 'git-gutter-fringe)
  (global-git-gutter-mode t))

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
