;;; Global bindings

(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

(global-set-key (kbd "C-x m") 'multi-term)
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one

(global-set-key (kbd "<f5>") 'revert-all-buffers)
(global-set-key (kbd "<f11>") 'full-screen-toggle)

(global-set-key "\C-xk" 'kill-current-buffer)
(global-set-key (kbd "C-c y") 'bury-buffer)

(global-set-key (kbd "M-R") 'rgrep)
(global-set-key (kbd "M-g") 'goto-line)

(global-set-key (kbd "C-c C-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c C-b") 'ido-switch-buffer-other-window)

(global-set-key (kbd "C-x SPC") 'whitespace-cleanup)

;; (global-set-key (kbd "<up>") 'punish-me)
;; (global-set-key (kbd "<down>") 'punish-me)
;; (global-set-key (kbd "<left>") 'punish-me)
;; (global-set-key (kbd "<right>") 'punish-me)


(eval-after-load "magit"
  (progn '(global-set-key (kbd "C-x g") 'magit-status)))
