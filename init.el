;; Dave's emacs init file 2015, configuration in /init.d, libraries in /lib

;; add .emacs.d/lib/ and subdirectories to load path
(add-to-list 'load-path "~/.emacs.d/lib/")
(let ((default-directory "~/.emacs.d/lib/"))
  (normal-top-level-add-subdirs-to-load-path))

;; add .emacs.d/init.d/ and subdirectories to load path
(load "~/.emacs.d/lib/load-directory.el")
(load-directory "~/.emacs.d/init.d/")

