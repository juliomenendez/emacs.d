;;; Julio Menendez's Emacs Configuration
;;; Based out of Yasser Gonzalez's Emacs Configuration https://github.com/yasserglez/dotfiles/tree/master/emacs

;; Everything is contained in one Org-babel file that is loaded here.
;; See ~/.emacs.d/config.org for the actual configuration.

(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

(require 'org)
(setq vc-follow-symlinks nil)
(defvar my-config-file "~/.emacs.d/config.org")
(org-babel-load-file my-config-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
