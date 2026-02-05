(require 'package)
(package-initialize)

;;Emacs Self-written text
(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file 'noerror)

;;Loading the file responsible for rc/require
(load-file "~/.emacs.d/.emacs.rc/rc.el")

;;Default visual/QOL options
(global-display-line-numbers-mode 1)
(setq visible-bell t)
(rc/require-theme 'gruber-darker)

;;Font
(setq default-frame-alist
      '((font . "Iosevka Nerd Font-20")))
(set-frame-font "Iosevka Nerd Font-20" t t)


;;Reduce file bloat
(setq backup-directory-alist
      `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-save" t)))
(setq create-lockfiles nil)

;;Importing simpC mode from Tsoding
(add-to-list 'load-path "~/.emacs.d/.emacs.local")
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; Multiple cursors
(rc/require 'multiple-cursors)

;;Tsoding function for duplicating lines
(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))


;; Importing vertico for pretty listing
(rc/require 'vertico)
(vertico-mode 1)

;; Importing marginalia for function descriptions
(rc/require 'marginalia)
(marginalia-mode 1)

;; Importing an autocomplete module
(rc/require 'corfu)
(global-corfu-mode 1)
(define-key corfu-map (kbd "TAB") #'corfu-complete)
(define-key corfu-map (kbd "<tab>") #'corfu-complete)
(setq corfu-auto t)
(setq corfu-auto-delay 0.2)
(setq corfu-auto-prefix 1)

;; Improves the search for functions
(rc/require 'orderless)
(setq completion-styles '(orderless basic))
(setq completion-category-defaults nil)
(setq completion-category-overrides '((file (styles partial-completion))))

;;Complements autocomplete
(rc/require 'cape)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-elisp-block)

;;Importing all of my custom keybinds
(require 'key_binds)		

