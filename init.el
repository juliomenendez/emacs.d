(require 'cask)
(cask-initialize)

(require 'pallet)
(pallet-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/customizations/themes")

(mapc 'load (directory-files "~/.emacs.d/customizations" t "^[0-9]+.*\.el$"))

(provide 'init)