(require 'package)
;; MELPAのみ追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; パッケージ情報の更新
(package-refresh-contents)

;; インストールするパッケージ
(defvar my/favorite-packages
  '(
    ;;;; for auto-complete
    auto-complete fuzzy popup pos-tip

    ;;;; buffer utils
    popwin elscreen yascroll buffer-move

    ;;;; flymake
    flycheck flymake-jslint

    ;;;; go
    go-mode

    ;;;; python
    jedi

    ;;;; helm
    helm

    ;;;; git
    magit git-gutter
    ))

;; my/favorite-packagesからインストールしていないパッケージをインストール
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; ref. http://emacs-jp.github.io/packages/package-management/package-el.html

;;;; Execute the following commands to install the packages.
;; C-x C-f ~/.emacs.d/packages.el
;; M-x eval-buffer

;;;; Packages are installed into ~/.emacs.d/elpa directory.
