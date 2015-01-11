(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq make-backup-files nil)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/.cask/24.4.1/elpa/auto-complete-20141228.633/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
