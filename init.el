(setq backup-inhibited t)
(setq auto-save-default nil)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(setq package-enable-at-startup nil)

(defvar my-packages
  '(evil
    elscreen
    evil-surround
    ensime
    projectile))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'evil)
(evil-mode t)

(require 'ensime)
(setq ensime-startup-snapshot-notification nil)
(add-hook 'scala-mode-hook
  (lambda ()
    (setq ensime-use-helm t)
    (ensime-mode)))

(projectile-global-mode)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (projectile use-package evil-surround evil-leader ensime elscreen async))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
