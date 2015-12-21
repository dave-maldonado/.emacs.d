;; ruby and rails emacs configurations

;; ROR STUFFS
(add-to-list 'auto-mode-alist '("\\.\\(rb\\|ru\\|builder\\|rake\\|thor\\|gemspec\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\(rake\\|thor\\|guard\\|gem\\|cap\\|vagrant\\)file\\'" . ruby-mode))
(require 'rspec-mode)
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))
(require 'rhtml-mode)
(require 'haml-mode)
(require 'slim-mode)
(setq exec-path (cons (expand-file-name "~/.rvm/gems/ruby-2.1.1@global/gems") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.test\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; rvm
(require 'rvm)
(rvm-use-default)

;; sennys string interpolation insert
(defun senny-ruby-interpolate ()
  "In a double quoted string, interpolate."
  (interactive)
  (insert "#")
  (when (and
         (looking-back "\".*")
         (looking-at ".*\""))
    (insert "{}")
    (backward-char 1)))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)))

;; flymake-ruby
(require 'flymake-easy)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
