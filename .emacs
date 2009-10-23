;; Syntax coloring
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Setup path for elisp, binaries.
(setq exec-path
      (append (list
               "/usr/local/bin"
               "/opt/local/bin"
               "/usr/bin")
              exec-path))
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/elisp/")
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))

;; Minor modes -------------------------------------------------------------

;; TextMate-like parenthesis matching, only enable this for Python-mode.
(autoload 'textmate-mode "emacs-textmate" "TextMate Pair Mode" t)
(add-hook 'python-mode-hook '(lambda () (textmate-mode 1)) t)


;; Major Mode -------------------------------------------------
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(setq show-paren-mode t)

;; Use php-mode for .php,.php3,.php4 and .phtml files
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist
	     '("\\.php[34]\\'\\|\\.php\\'\\|\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))

;; Python-mode
(autoload 'python-mode "python-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; JavaScript-mode, only loads when open file ".js"
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;; RST-mode
(autoload 'rst-mode "rst.el" nil t)
(add-to-list 'auto-mode-alist '("\\.rst" . rst-mode))

;; Django HTML mode
(autoload 'django-html-mode "django-html-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\'" . django-html-mode))

;; User-defined function
(load "dos2unix.el")
(load "django-func.el")

;; Personalize

;; Uniquify 
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode)
;; Git-emacs
(require 'git-emacs)

;; We don't want to clutter our working directory. No need to backup
(setq backup-inhibited t)
(setq auto-save-default nil)

(pc-selection-mode)
;; Map meta-g to goto-line
(global-set-key (kbd "M-g") 'goto-line)

(require 'color-theme)
(load "custom-theme.el")
(color-theme-initialize)
(color-theme-sunburst)
;; Remove splash screen
(setq inhibit-splash-screen t)
