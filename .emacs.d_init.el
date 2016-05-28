;; set C-h to backspace
(global-set-key "\C-h" 'backward-delete-char-untabify)

;; configuration for smooth scroll
;; ref.
;;   http://www-section.cocolog-nifty.com/blog/2008/10/1-080c.html
;;   http://stackoverflow.com/questions/3470518/is-there-a-visual-studio-equivalent-of-vim-scrolloff-or-emacs-scroll-margin
(setq scroll-step 1)
(setq scroll-margin 8)

(setq visible-bell t)

(setq make-backup-files nil)

;; for package.el
;; ref.
;;   http://d.hatena.ne.jp/syohex/20130624/1372082597
;;   https://github.com/clojure-emacs/clojure-mode
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; I executed following commands to install "clojure-mode"
;; 2013-09-11
;; M-x eval-buffer
;; M-x package-refresh-contents
;; M-x package-install [RET] clojure-mode [RET]

;; Run the following command to install "cider" on 2016-05-28
;; ref. https://github.com/clojure-emacs/cider#quickstart
;; M-x package-install [RET] cider [RET]
