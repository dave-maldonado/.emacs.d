;; haskell stuffs

(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/lib/haskell-mode/")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
