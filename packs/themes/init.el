(setq custom-theme-directory (live-pack-lib-dir))

(load-theme 'zenburn t)

(add-hook 'after-init-hook 'zenburn-init)
