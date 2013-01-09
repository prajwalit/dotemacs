(live-add-pack-lib "android")

(require 'cedet)
(require 'android-mode)
;; (require 'android)

(setq android-mode-sdk-dir "~/playground/android-sdk-macosx/")

(define-key js2-mode-map "{" 'paredit-open-curly)
          (define-key js2-mode-map "}" 'paredit-close-curly-and-newline)


(defun android-man (dir)
  "Look for AndroidManifest.xml file to find project dir of android application."
  (message dir)
  (locate-dominating-file dir "AndroidManifest.xml"))

(defmacro android-in-dir (dir body)
  "Execute BODY form with project dir directory as
dir directory can be found."
  `(let ((android-root (android-man ,dir)))
     (message "Running android in root dir %s" android-root)
     (when android-root
       (let ((default-directory android-root))
         ,body))))

(defun build-helpshift ()
  (interactive)
  (android-in-dir "/Users/prajwalit/src/r2d2/QotdApp/"
                  (compile "ant -e debug"))
  (while compilation-in-progress (sleep-for 5))
  (android-in-dir "/Users/prajwalit/src/r2d2/QotdApp/"
                  (compile "ant -e installd"))
  (while compilation-in-progress (sleep-for 5))
  (compile "/Users/prajwalit/playground/android-sdk-macosx/platform-tools/adb shell am start -n com.example.qotdapp/com.example.qotdapp.MainActivity")
  (while compilation-in-progress (sleep-for 5))
  (compile "/usr/local/bin/growlnotify -m 'Android install done'"))

(eval-after-load "android-mode"
 '(progn
    (define-key android-mode-map
      (kbd "C-c C-c v")
      'build-helpshift)))

(defun java-setup ()
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92)
    indent-tabs-mode nil
    tab-width 4
    fill-column 96
    c-comment-start-regexp "\\(@\\|/\\(/\\|[*][*]?\\)\\)"))

(add-hook 'android-mode-hook 'java-setup)
