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
                       (expand-file-name "contrib/tramp/" emacsd-dir))
		 load-path))

(fset 'yes-or-no-p 'y-or-n-p) ;; Use y or n instead of yes or no

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

;; nxhtml stuff
(load "nxhtml/autostart")
(setq mumamo-chunk-coloring 'submode-colored
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil)

(eval-after-load 'nxhtml
  '(eval-after-load 'zenburn
     '(set-face-background 'mumamo-background-chunk-submode "gray22")))


;; Python-mode stuff

(require 'ipython)
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

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Functions

(require 'thingatpt)

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


(load "bindings")
