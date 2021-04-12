(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(add-to-list 'load-path "/home/jinx/Software/emacs-neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)

(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(add-hook 'prog-mode-hook 'whitespace-mode)

(require 'auto-complete-config)
(ac-config-default)

(global-auto-complete-mode t)

(ac-set-trigger-key "TAB")

(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/.*\.php[345]?\'" . php-mode)) auto-mode-alist))

(require 'clang-format)

;(global-set-key (kbd "C-c i") 'clang-format-region)
;(global-set-key (kbd "C-c u") 'clang-format-buffer)

(setq clang-format-style-option "gnu")

(defun clang-format-on-save()
  (add-hook 'before-save-hook #'clang-format-buffer nil 'local))
(add-hook 'c-mode-hook 'clang-format-on-save)
(add-hook 'c++-mode-hook 'clang-format-on-save)
