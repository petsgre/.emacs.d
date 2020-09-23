
;;缓存scratch草稿
(use-package persistent-scratch
  :ensure t
  :config
  (persistent-scratch-autosave-mode 1))

;; optionally lsp-ui 暂时有bug，全屏会出现一个黑屏
;;(use-package lsp-ui :commands lsp-ui-mode)

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

;; (use-package ivy
;;   :ensure t)

;; (use-package ivy-rich
;;   :ensure t
;;   :after (ivy)
;;   )
;; (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
;; (ivy-rich-mode 1)


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
    (global-set-key (kbd "C-c k") 'counsel-rg)
    (global-set-key (kbd "C-c i") 'counsel-projectile-rg)
    (global-set-key (kbd "C-c o") 'counsel-projectile-git-grep)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))

;; 拼音首字母搜索，还不能用，测试不通过
(require 'pinyinlib)

(use-package pyim
  :ensure t
  :after ivy
  :commands eh-ivy-cregexp
  :init
  (setq pyim-default-scheme   'xiaohe-shuangpin
        ivy-re-builders-alist '((t . eh-ivy-cregexp)))
  :config
  (defun eh-ivy-cregexp (str)
    (let ((x (ivy--regex-ignore-order str))
          (case-fold-search nil))
      (if (listp x)
          (mapcar (lambda (y)
                    (if (cdr y)
                        (list (if (equal (car y) "")
                                  ""
                                (pyim-cregexp-build (car y)))
                              (cdr y))
                      (list (pyim-cregexp-build (car y)))))
                  x)
        (pyim-cregexp-build x)))))

(use-package pinyinlib
  :ensure t
  :commands pinyinlib-build-regexp-string
  :init
    (defun my-pinyinlib-build-regexp-string (str)
      (cond ((equal str ".*")
             ".*")
            (t
             (pinyinlib-build-regexp-string str t))))

    (defun my-pinyin-regexp-helper (str)
      (cond ((equal str " ")
             ".*")
            ((equal str "")
             nil)
            (t
             str)))

    (defun pinyin-to-utf8 (str)
      (cond ((equal 0 (length str))
             nil)
            ((equal (substring str 0 1) ":")
             (mapconcat 'my-pinyinlib-build-regexp-string
                        (remove nil (mapcar 'my-pinyin-regexp-helper
                                            (split-string
                                             (replace-regexp-in-string ":" "" str ) "")))
                        ""))
            nil))

    (defun re-builder-pinyin (str)
      (or (pinyin-to-utf8 str)
          (ivy--regex-plus str)))

    (setq ivy-re-builders-alist
          '((t . re-builder-pinyin))))

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

(use-package neotree
  :ensure t
  :config)

;; 在当前项目打开目录tree
(defun open-tree-in-current-project ()
  (interactive)
  (neotree-projectile-action))

(global-set-key (kbd "s-b") 'open-tree-in-current-project)

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

;; 用于全局替换修改
(use-package wgrep
  :ensure t)

;; 使用emaca打开telegram，由于tdlib还没更到1.6.6 暂时不会搞
(use-package telega
  :load-path  "~/telega.el"
  :commands (telega)
  :defer t)
;; (telega-notifications-mode 1)

;; (setq telega-proxies
;;       (list
;;        '(:server "127.0.0.1" :port 1081 :enable t :type
;; 	  (:@type "proxyTypeSocks5"))
;;        ))

;; 好用的终端 相比于 term e/shell
(use-package vterm
  :ensure t)

;; 非常有用的模糊搜索 fuzzy search
(use-package fzf
  :ensure t
  :bind(("M-p" . fzf-git-files)
        ("s-F" . fzf-git-grep)))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

;; 一种查看目录的方式
;; (use-package ranger
;;   :ensure t)

;; 彩虹猫
(use-package nyan-mode
  :ensure t
  :init
(nyan-mode t))

(add-hook 'org-mode-hook #'valign-mode)

(use-package counsel-projectile
  :ensure t
  :config
  (projectile-mode))
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'my-tools)
