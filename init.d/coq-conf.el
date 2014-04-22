;; conf for coq, proof general and other logic stuff

;; coq mode (install coq with Homebrew first!)
(setq auto-mode-alist (cons '("\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

;; turn off electric-indent for coq
(add-hook 'coq-mode-hook (lambda () (electric-indent-mode -1)))

;; Proof General
(load-file "~/.emacs.d/lib/ProofGeneral/generic/proof-site.el")
(setq coq-prog-name "/usr/local/bin/coqtop")
(setq proof-splash-enable nil)
(setq proof-electric-terminator-enable t)
