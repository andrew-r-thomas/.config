;;; Startup
;;; PACKAGE LIST
(setq package-archives 
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(set-frame-parameter nil 'fullscreen 'fullboth)

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/pinky/diy/plugins/loom/loom.org" "/Users/andrewthomas/pinky/teknaut/solan-park-robello/solanpark.org" "/Users/andrewthomas/pinky/teknaut/hall-law-firm/admin.mercyhall.com/hlfadmin.org" "/Users/andrewthomas/pinky/teknaut/hall-law-firm/hall-law-firm.org" "/Users/andrewthomas/pinky/dat_clock.org" "/Users/andrewthomas/pinky/people/brooke-blenkush.org" "/Users/andrewthomas/pinky/personal/friends-and-family.org" "/Users/andrewthomas/pinky/personal/val(car).org" "/Users/andrewthomas/pinky/personal/routines.org" "/Users/andrewthomas/pinky/inbox.org"))
 '(package-selected-packages '(evil-org evil-collection evil solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#657b83" :background "#fdf6e3")))))

(load-theme 'solarized-light t)

;; Enable Evil
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(set-frame-font "NotoMono Nerd Font 16" nil t)

(setq org-agenda-start-on-weekday 1)
(setq org-agenda-span 1)

(global-set-key (kbd "M-a") 'org-agenda)
(global-set-key (kbd "M-f") 'find-file)
