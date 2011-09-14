(add-lib-path "js2-mode")
(require 'js2-mode)

(eval-after-load 'js2-mode
  '(progn (define-key js2-mode-map "{" 'paredit-open-curly)
          (define-key js2-mode-map "}" 'paredit-close-curly-and-newline)
          ;; fixes problem with pretty function font-lock
          (define-key js2-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js2-mode `(("\\(function *\\)("
                             (0 (progn (compose-region (match-beginning 1)
                                                       (match-end 1) "ƒ")
                                       nil)))))))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
