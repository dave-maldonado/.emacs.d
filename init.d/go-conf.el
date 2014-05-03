;; golang config

;; set paths
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/Cellar/go/1.2.1/bin"))
(setenv "PATH" (concat (getenv "PATH") ":~/code/go/bin"))
(setq exec-path (append exec-path '("/usr/local/Cellar/go/1.2.1/bin")))
(setq exec-path (append exec-path '("~/code/go/bin")))

;; go mode
(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)

;; go flymake
(add-to-list 'load-path "~/code/go/src/github.com/dougm/goflymake")
(require 'go-flymake)

;; go auto-complete
(add-to-list 'load-path "~/code/go/src/github.com/nsf/gocode")
(require 'go-autocomplete)

;; go errcheck
(require 'go-errcheck)
