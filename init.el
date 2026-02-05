(require 'package)
(package-initialize)

;;Emacs Self-written text
(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file 'noerror)

;;Loading the file responsible for rc/require
(load-file "~/.emacs.d/.emacs.rc/rc.el")

;;Default visual/QOL options
(global-display-line-numbers-mode 1)
(ido-mode 1)
(ido-everywhere 1)
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

;; Alt X autocomplete
(rc/require 'smex)
;; Multiplos Cursores
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

;;Importing all of my custom keybinds
(require 'key_binds)		
