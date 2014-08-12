;; general emacs configurations, i.e. stuff for all buffers

;; font and size
(set-default-font "Inconsolata 16")

;; turn stupid GUI toolbar and scrollbars off
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; start w/ scratch buffer
(setq inhibit-startup-screen +1)

;; kill all the buffers!
(defun close-all-buffers ()
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

;; autopair
(require 'autopair)
(autopair-global-mode)
;; pair % in rhtml mode
(add-hook 'rhtml-mode-hook
          #'(lambda ()
              (modify-syntax-entry ?% "\"")
              (autopair-mode)))

;; rainbow delimiters
;; if re-installing don't forget to M-x byte-compile-file rainbow-delimiters.el
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error
                    :strike-through t)

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

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/dave/.emacs.d/lib//ac-dict")
(ac-config-default)

;; ag
(require 'ag)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
(setq multi-term-program-switches "--login")
(add-to-list 'term-bind-key-alist '("C-f" . forward-char))
(add-to-list 'term-bind-key-alist '("C-b" . backward-char))
(add-to-list 'term-bind-key-alist '("C-a" . move-beginning-of-line))
(add-to-list 'term-bind-key-alist '("C-e" . move-end-of-line))
(add-to-list 'term-bind-key-alist '("M-p" . scroll-down-command))
(add-to-list 'term-bind-key-alist '("M-n" . scroll-up-command))
(add-to-list 'term-bind-key-alist '("C-w" . kill-region))
(add-to-list 'term-bind-key-alist '("M-w" . kill-ring-save))
(add-to-list 'term-bind-key-alist '("M-y" . yank-pop))

;; fix too-dark faces
(set-face-attribute 'term-color-black nil :foreground "#52676f")
(set-face-attribute 'whitespace-indentation nil :foreground "#52676f")
(set-face-attribute 'whitespace-space nil :foreground "#52676f")
(set-face-attribute 'whitespace-tab nil :foreground "#52676f")

;; pretty mode plus
(require 'pretty-mode-plus)
(global-pretty-mode 1)

;; start server for emacsclient
(server-start)
