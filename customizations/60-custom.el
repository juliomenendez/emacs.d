;;; Custom --- Summary
;;; Commentary:
;;; Code:
(setq custom-file "~/.emacs.d/customizations/60-custom.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-amsmath-label "eq:")
 '(LaTeX-command-style
   (quote
    (("" "%(PDF)%(latex) -file-line-error %S%(PDFout)"))))
 '(LaTeX-label-function (quote reftex-label))
 '(TeX-PDF-mode t)
 '(TeX-auto-save t)
 '(TeX-electric-sub-and-superscript t)
 '(TeX-master nil)
 '(TeX-parse-self t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server nil)
 '(TeX-view-program-list (quote (("OS X Preview" "open %o"))))
 '(TeX-view-program-selection (quote ((output-pdf "OS X Preview"))))
 '(ac-auto-start t)
 '(ac-quick-help-delay 0.5)
 '(ac-trigger-key "TAB")
 '(auto-save-default nil)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (hopscotch)))
 '(custom-safe-themes
   (quote
    ("b13febcce1dc98fe1ffd6a83988e5f006a6ccd58ade738d3b3b57be98823c4ac" default)))
 '(dired-details-hidden-string "")
 '(dired-use-ls-dired nil)
 '(electric-indent-mode t)
 '(electric-layout-mode t)
 '(electric-pair-mode t)
 '(flx-ido-mode t)
 '(flycheck-clang-language-standard "c++11")
 '(gist-view-gist nil)
 '(global-auto-complete-mode t)
 '(global-flycheck-mode t nil (flycheck))
 '(global-rainbow-delimiters-mode t)
 '(global-whitespace-mode t)
 '(haskell-font-lock-symbols t)
 '(haskell-stylish-on-save t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces t)
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-virtual-buffers t)
 '(inferior-julia-program-name "julia")
 '(jedi:complete-on-dot t)
 '(jedi:setup-keys t)
 '(js2-basic-offset 2)
 '(keyfreq-autosave-mode t)
 '(keyfreq-mode t)
 '(magit-set-upstream-on-push (quote askifnotset))
 '(make-backup-files nil)
 '(projectile-global-mode t)
 '(py-split-windows-on-execute-p nil)
 '(reftex-plug-into-AUCTeX t)
 '(rng-nxml-auto-validate-flag nil)
 '(safe-local-variable-values
   (quote
    ((TeX-master . "master")
     (TeX-master . t)
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(scala-indent:add-space-for-scaladoc-asterisk t)
 '(scala-indent:use-javadoc-style t)
 '(scalable-fonts-allowed t)
 '(scss-compile-at-save nil)
 '(yas-global-mode t nil (yasnippet))
 '(yas-triggers-in-field t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 160
                    :weight 'normal)

(provide '60-custom)
;;; 60-custom.el ends here
