(add-to-list 'load-path "/home/tshepang/projects/rust/src/etc/emacs/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

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
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
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
    (insert (shell-command-to-string "xsel -o -b"))
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

(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'rst-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(diff-switches "-u")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(linum-format "%d ")
 '(major-mode (quote text-mode))
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1)
 '(semantic-mode t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32)))
 '(tab-width 4)
 '(tool-bar-mode nil)
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
