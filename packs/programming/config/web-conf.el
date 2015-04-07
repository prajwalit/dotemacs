(live-add-pack-lib "web")
(require 'web-mode)

(eval-after-load 'web-mode
  '(progn (define-key web-mode-map "{" 'paredit-open-curly)
          (define-key web-mode-map "}" 'paredit-close-curly-and-newline)
          (setq web-mode-code-indent-offset 2)
          (setq web-mode-markup-indent-offset 2)
          (setq comment-start "//")
          (setq comment-end "")
          (font-lock-add-keywords
           'web-mode `(("\\(function *\\)("
                        (0 (progn (compose-region (match-beginning 1)
                                                  (match-end 1) "ƒ")
                                  nil)))))))


(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))


(defun web-mode-hook ()
  (auto-complete-mode 1)
  (paredit-mode t)
  (setq web-mode-ac-sources-alist
        '(("css" . (ac-source-words-in-buffer ac-source-css-property))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev))
          ("jsx" . (ac-source-words-in-buffer ac-source-words-in-same-mode-buffers)))))


(add-hook 'web-mode-hook 'web-mode-hook)

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
