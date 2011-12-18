(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("9cdf9fb94f560902b567b73f65c2ed4e5cfbaafe" "b30ffa4845952f3e851bea90572afa70ab8da05d" default)))
 '(tool-bar-mode nil))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Inconsolata")))))

(global-set-key (kbd "<select>") 'end-of-line)

(set-default-font "Inconsolata-10")

;; From http://sachachua.com/blog/2008/07/emacs-and-php-tutorial-php-mode/
(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/.emacs.d")
;(add-to-list 'load-path "~/.emacs.d/calfw")



;(load "~/elisp/column-marker.el")
(add-hook 'python-mode-hook
	  (lambda () (interactive) (column-marker-1 80)))


;; Use Uniquify to keep buffer names unique and meaninful
;; (thanks emacswiki!)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(setq auto-mode-alist (cons '("\\.html$" . html-mode) auto-mode-alist))

;; Add the original Emacs Lisp Package Archive
;(add-to-list 'package-archives
;             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/"))

;(require 'color-theme-gruber-darker)
;(color-theme-gruber-darker)

;;===== PyFlakes
;; code checking via pyflakes+flymake
(when (load "flymake" t)
 (defun flymake-pyflakes-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
 'flymake-create-temp-inplace))
 (local-file (file-relative-name
 temp-file
 (file-name-directory buffer-file-name))))
 (list "pyflakes" (list local-file))))
 
 (add-to-list 'flymake-allowed-file-name-masks
 '("\\.py\\'" flymake-pyflakes-init)))
 
(add-hook 'find-file-hook 'flymake-find-file-hook)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
