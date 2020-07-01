;;缓存scratch草稿
(use-package persistent-scratch
  :ensure t
  :config
  (persistent-scratch-autosave-mode 1))

;; lsp 可以使用js ts等语言的server
;; (use-package lsp-mode
;;     :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;             (web-mode . lsp)
;;             ;; if you want which-key integration
;;             (lsp-mode . lsp-enable-which-key-integration))
;;     :commands lsp
;;     :config
;;     (setq lsp-log-io nil)
;;     (setq lsp-enable-snippet nil)
;;     (setq lsp-enable-symbol-highlighting nil)
;;     (setq lsp-client-packages '(lsp-clients)))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

;; 不使用lsp的flychecker
(setq lsp-diagnostic-package :none)

;; GUI打开能获取shell path
(use-package exec-path-from-shell
  :ensure t
  :custom
  (exec-path-from-shell-check-startup-files nil)
  :config
  (push "HISTFILE" exec-path-from-shell-variables)
  (exec-path-from-shell-initialize))

;; 有道词典，非常有用
(use-package
  youdao-dictionary
  :defer 2 
  :ensure t 
  :config (setq url-automatic-caching t) 
  (which-key-add-key-based-replacements "C-x y" "有道翻译") 
  :bind (("C-x y t" . 'youdao-dictionary-search-at-point+) 
         ("C-x y g" . 'youdao-dictionary-search-at-point-posframe) 
         ("C-x y p" . 'youdao-dictionary-play-voice-at-point) 
         ("C-x y r" . 'youdao-dictionary-search-and-replace) 
         ("C-x y i" . 'youdao-dictionary-search-from-input)))

;; 多点编辑
(use-package multiple-cursors
  :ensure t)


;; try可以临时使用这个包，再次重启emacs会删除掉使用try安装的包
(use-package try
  :ensure t)

;; 使用which key 在输入 C-x时会有命令提示
(use-package which-key
  :ensure t
  :config (which-key-mode))


;; 使用swiper在底部显示待选项，可以用 C n C p快速切换
(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper-thing-at-point)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))
;; 自动完成
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;; 添加redo undo 树
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))


;; 选择括号中间的内容
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "s-=") 'er/expand-region))


;; 集成了很多非常有用的的功能
(use-package counsel
  :hook
  ('counsel-mode . 'dashboard-mode)
  :ensure t
  :bind
  (("C-x C-r" . 'counsel-recentf) ;;打开最近的文件
   ("C-x d" . 'counsel-dired)) ;;打开文件目录，可以在minibuffer中查看
  :config
  ;; Integration with `projectile'
  (with-eval-after-load 'projectile
    (setq projectile-completion-system 'ivy)))

;; 项目管理
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy))


;; GIT管理工具
(use-package magit ; TODO key bindings and such
  :ensure t)

;; 高亮 TODO
(use-package hl-todo
  :ensure t
  ;; global hook activates hl-todo-mode for prog-mode, text-mode
  ;; mode can be explicitly defined using hl-todo-activate-in-modes variable
  :hook (after-init . global-hl-todo-mode))

;; 在finder中打开
(use-package reveal-in-osx-finder
  :ensure t)

;; 跳转到定义
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)

;; 记住最长用的命令，并放在前面
(use-package smex
  :ensure t)

(provide 'my-tools)
