(add-to-list 'auto-mode-alist '("stack\\(exchange\\|overflow\\)\\.com\\.[a-z0-9]+\\.txt" . fundamental-mode))
(define-key global-map (kbd "M-p") 'previous-multiframe-window)
(define-key global-map (kbd "M-n") 'other-window)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'rst-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)
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
 '(semantic-mode t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32)))
 '(tool-bar-mode nil)
 '(vc-handled-backends nil)
 '(view-read-only t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
