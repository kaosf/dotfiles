;; set C-h to backspace
(global-set-key "\C-h" 'backward-delete-char-untabify)

(setq visible-bell t)

(setq make-backup-files nil)

;; for package.el
;; ref.
;;   http://d.hatena.ne.jp/syohex/20130624/1372082597
;;   https://github.com/clojure-emacs/clojure-mode
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; I executed following commands to install "clojure-mode"
;; 2013-09-11
;; M-x eval-buffer
;; M-x package-refresh-contents
;; M-x package-install [RET] clojure-mode [RET]

;; ref. http://boronology.blogspot.jp/2011/06/emacs-eshell.html
(add-hook 'after-init-hook (lambda()
  (setq w (selected-window))
  (setq w2 (split-window w (- (window-height w) 4)))
  (select-window w2)
  (eshell)
  (select-window w)))
