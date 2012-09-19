(tool-bar-mode 0)
(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(setq fill-column 79
      inhibit-startup-message t
      kill-whole-line t
      default-major-mode 'text-mode
      delete-key-deletes-forward t
      next-line-add-newlines nil
      save-place t
      make-backup-files nil)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(defconst emacsd-dir (expand-file-name "~/.emacs.d/"))
(setq load-path (append
		 (list (expand-file-name "contrib/" emacsd-dir)
                       (expand-file-name "contrib/tramp/" emacsd-dir)
                       (expand-file-name "contrib/yasnippet/" emacsd-dir)
                       (expand-file-name "contrib/js2-mode/" emacsd-dir))
		 load-path))

(fset 'yes-or-no-p 'y-or-n-p) ;; Use y or n instead of yes or no

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'tramp)
(setq tramp-default-method "ssh")

;; Save a list of recent files visited.
(recentf-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point t
        ido-max-prospects 10))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)


;; Python-mode stuff

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
				   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)


(defun cs-python-mode-hook ()
   (turn-on-font-lock)
   (setq auto-fill-function 'do-auto-fill
         indent-tabs-mode nil
         py-python-command "python"
         py-indent-offset 4
         py-smart-indentation t
         py-block-comment-prefix "#")

   (set (make-variable-buffer-local 'beginning-of-defun-function)
	'py-beginning-of-def-or-class)
   (setq outline-regexp "def\\|class "))
(add-hook 'python-mode-hook 'cs-python-mode-hook)


;; Javascript-mode stuff

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-consistent-level-indent-inner-bracket-p t
     js2-pretty-multiline-decl-indentation-p t)


;; Functions

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/contrib/yasnippet/snippets")
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt))

(let ((closure-snippets "~/.emacs.d/contrib/closure-snippets"))
  (add-to-list 'load-path closure-snippets)
  (require 'closure-snippets-support)
  (yas/load-directory closure-snippets))

(defun view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    ;; TODO: switch to nxml/nxhtml mode
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))


;; PHP mode stuff
(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-file-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Indentation help
(global-set-key (kbd "C-x ^") 'join-line)

;; Fetch the contents at a URL, display it raw.
(global-set-key (kbd "C-x h") 'view-url)

;; alt is alt, cmd is meta
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)


;; Markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

(require 'magit)

(load "nxhtml/autostart.el")
;; Mumamo is making emacs 24 freak out:
(when (and (> emacs-major-version 23)
           (> emacs-minor-version 3))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js2-basic-offset 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
