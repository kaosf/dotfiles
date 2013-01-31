;;;;;; global configurations
;;;; key configurations
;; C-h as backspace
(global-set-key "\C-h" 'backward-delete-char-untabify)
;; C-x C-h instead of C-h
(global-set-key (kbd "C-x C-h") 'help)
;(global-set-key "\C-u" 'undo)
(global-set-key "\C-u" 'redo)
;;;; other configurations
(setq visible-bell t)
(setq make-backup-files nil)

;; load-path configuration
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; install-elisp configuration
(setq load-path (cons "~/.emacs.d/elisp/installer" load-path))
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/installer")

;; Lua configuration
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;;colorization
;(add-hook 'lua-mode-hook 'turn-on-font-lock)
;;hideshow
;(add-hook 'lua-mode-hook 'hs-minor-mode)

;; Objective-C
; copy C++ setting
(add-hook 'objc-mode-hook
  '(lambda()
    (c-set-style "bsd") ; set indent width to 8; then force to change TAB
  )
)

(require 'cc-mode)

;; Kernighan & Ritchie style
(setq c-default-style "k&r")

;; make BackSpace key "clever"
;; indent width is 2
(add-hook 'c-mode-common-hook
          '(lambda ()
             (progn
               (c-toggle-hungry-state 1)
               ;; change TAB to SPACEs
               (setq c-basic-offset 2 indent-tabs-mode nil)
               ;; use TAB as TAB
               (setq c-basic-offset 2)
               (setq indent-tabs-mode nil)
               (c-set-offset 'innamespace 0))))

(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-offset 'innamespace 0))) ; don't indent in "namespace {}"

;; doesn't use tab in Emacs Lisp mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)))

;; tab width configuration
;(setq tab-width 4)
(setq-default tab-width 4)
(setq default-tab-width 4) ; which should I use?

;;;; abolishment Emacs Lisp ;;;;

;; C++ style
; indent with TAB
;(add-hook 'c++-mode-hook
;  '(lambda()
;    (c-set-style "bsd") ; set indent width to 8; then force to change TAB
;    (c-set-offset 'innamespace 0) ; don't indent in "namespace {}"
;  )
;)

;; C++
; open *.h files as C++ mode
;(setq auto-mode-alist
;  (append'(("\\.h$" . c++-mode)) auto-mode-alist)
;)

;;;; ref. http://boronology.blogspot.jp/2011/06/emacs-eshell.html
(add-hook 'after-init-hook (lambda()
    (setq w (selected-window))
    (setq w2 (split-window w (- (window-height w) 4)))
    (select-window w2)
    (eshell)
    (select-window w)))

;; CEDET
(load-file "~/.emacs.d/elisp/cedet-1.0pre7/common/cedet.el")
(global-ede-mode 1)                 ; Enable the Project management system
(semantic-load-enable-code-helpers) ; Enable prototype help and smart completion
(global-srecode-minor-mode 1)       ; Enable template insertion menu

;; ECB
(add-to-list 'load-path
             "~/.emacs.d/elisp/ecb-2.41")
(require 'ecb)

;;;; default setting (Ubuntu Server only?)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
