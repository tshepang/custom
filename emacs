(if (and (version< emacs-version "26.3") (>= libgnutls-version 30600))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(setq-default truncate-lines t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

'(rust-always-locate-project-on-open t)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") 'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
(require 'lsp-mode)
(require 'lsp-clients)

(add-to-list 'auto-mode-alist '("stack\\(exchange\\|overflow\\)\\.com\\.[a-z0-9]+\\.txt" . fundamental-mode))

;; http://stackoverflow.com/a/19625063/321731
(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel --input --clipboard")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )
(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert (shell-command-to-string "xsel --output --clipboard"))
    )
  )
(global-set-key [f8] 'copy-to-clipboard)
(global-set-key [f9] 'paste-from-clipboard)

;; http://stackoverflow.com/a/683575/321731
(defvar my-keys-map (make-keymap) "my-keys keymap.")
(define-key my-keys-map (kbd "M-p") 'previous-multiframe-window)
(define-key my-keys-map (kbd "M-n") 'other-window)
(define-key my-keys-map (kbd "<f5>") 'revert-buffer-no-confirm)
(define-minor-mode my-keys
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-map)
(defun my-minibuffer-setup-hook ()
  (my-keys 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; http://stackoverflow.com/a/19199071/321731
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'yaml-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'racer-mode-hook 'company-mode)
(add-hook 'flycheck-mode-hook 'flycheck-rust-setup)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(create-lockfiles nil)
 '(custom-enabled-themes '(wombat))
 '(diff-switches "-u")
 '(dired-listing-switches
   "--human --group-directories-first --format=long --no-group --time-style=long-iso")
 '(history-delete-duplicates t)
 '(history-length 1000)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold 1000000000)
 '(linum-format "%d ")
 '(lsp-file-watch-threshold 100000)
 '(lsp-rust-server 'rust-analyzer)
 '(major-mode 'text-mode)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(go-mode restclient yasnippet flycheck-rust ac-js2 flycheck company-lsp lsp-ui helm-lsp lsp-treemacs lsp-mode markdown-mode+))
 '(rust-format-on-save t)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1)
 '(semantic-mode t)
 '(send-mail-function 'smtpmail-send-it)
 '(show-paren-mode t)
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tab-width 4)
 '(undo-limit 800000)
 '(vc-handled-backends nil)
 '(view-read-only t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
