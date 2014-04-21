;; conf for coq, proof general and other logic stuff

;; coq mode (install coq with Homebrew first!)
(setq auto-mode-alist (cons '("\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

;; Proof General
(load-file "~/.emacs.d/lib/ProofGeneral/generic/proof-site.el")
(setq coq-prog-name "/usr/local/bin/coqtop")
(setq proof-splash-enable nil)
