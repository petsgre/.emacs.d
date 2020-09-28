;; 把光标变成竖线
(setq-default cursor-type 'bar)

(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        ;; (ruby . t)
        ;; (ditaa . t)
        ;; (python . t)
        (js . t)
        ;; (sh . t)
        ;; (latex . t)
        ;; (plantuml . t)
        ;; (R . t)
	)
      )
;;(setq electric-layout-rules '((?\{ . around) (?\} . around)))

;; macOS 复制到系统剪切板
 (defun copy-from-osx () 
 (shell-command-to-string "pbpaste")) 
 (defun paste-to-osx (text &optional push) 
 (let ((process-connection-type nil)) 
 (let ((proc (start-process"pbcopy" "*Messages*" "pbcopy"))) 
 (process-send-string proc text) 
 (process-send-eof proc)))) 
 (setq interprogram-cut-function 'paste-to-osx) 
 (setq interprogram-paste-function 'copy-from-osx) 

(setq ediff-split-window-function 'split-window-horizontally)

(setq save-interprogram-paste-before-kill t)
;; org打开缩进
;; (setq org-startup-indented t)

;; 最近文件列表
(recentf-mode 1)
(setq recentf-max-menu-items 150)
(setq recentf-max-saved-items 150)

;; 返回上级目录
(global-set-key (kbd"C-x C-j") 'dired-jump)

(defun delete-line-no-kill ()
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
 (delete-char 1)
)
(global-set-key (kbd"C-k") 'delete-line-no-kill)

(use-package diff-hl
  :ensure t
  )
(global-diff-hl-mode)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; 快速切换上下buffer
(global-set-key (kbd"s-{") 'previous-buffer)
(global-set-key (kbd"s-}") 'next-buffer)

;; 切换buffer时光标高亮动画
(beacon-mode 1)

;; 全局模式修改自动保存
(setq wgrep-auto-save-buffer t)

;; 不生成~备份文件
(setq make-backup-files nil)

;; 禁止自动换行
(set-default 'truncate-lines t)

;; 不要导航菜单
(tool-bar-mode -1)

;; 退出保存buffer
;; (desktop-save-mode 1)

;; 不要滚动条
(scroll-bar-mode -1)

;; 自动开启删除模式 选中之后直接编辑
(delete-selection-mode 1)
(delete-selection-mode nil)

;; 自动刷新被修改过的文件
(global-auto-revert-mode 1)

;; 关闭自动保存文件
(setq auto-save-default nil)

;; 高亮括号
(show-paren-mode 1)
;; 高亮当前行
(global-hl-line-mode 1)

;; 让'_'被视为单词的一部分
(add-hook 'after-change-major-mode-hook (lambda () 
                                          (modify-syntax-entry ?_ "w")))

;; 选中当前区域或单词
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)

;; magit查看每行log
(global-set-key (kbd "C-c b") 'magit-blame-addition)

;; 进入全屏
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key (kbd "<s-return>") 'fullscreen)

;; 将询问语改成 y和n简写
;;(fset yes-or-no-p 'y-or-n-p)

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%d:")
;; 行号开启
;; (add-hook 'prog-mode-hook display-line-numbers)


;; 使用f5刷新
(global-set-key (kbd "<f5>") 'revert-buffer)

;; 设置字体格式 describe-font 获取描述文件
(set-default-font "-*-Monaco-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")


;; 设置打开新窗口默认在右边
(setq
 split-width-threshold 0
 split-height-threshold nil)


;; 上下移动选中的区域或者行
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
	(exchange-point-and-mark))
    (let ((column (current-column))
	  (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
	(transpose-lines arg))
      (forward-line -1)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [\M-\S-up] 'move-text-up)
(global-set-key [\M-\S-down] 'move-text-down)

;; 在当前窗口显示buffer list
(global-set-key (kbd "C-x C-b") 'counsel-ibuffer)

;; 注释快捷键
(global-set-key (kbd "C-x C-/") 'comment-or-uncomment-region)

;; 剪切整行
(global-set-key (kbd "<s-backspace>") 'kill-whole-line)

;; 列出function菜单
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; 启动prettier
;; (global-prettier-mode 1)

;; 直接使用prettier命令
;; (defun jester/prettier-js-file-1 ()
;;   "Call prettier on current file."
;;   (interactive)
;;   (call-process-shell-command (format "node %s/node_modules/.bin/prettier --no-semi false --no-editorconfig --write %s"
;;                                       (projectile-project-root)
;;                                       (buffer-file-name))))
;; (eval-after-load "web-mode" '(progn
;;                                (define-key web-mode-map (kbd "C-M-\\") 'jester/prettier-js-file-1)))

;;(global-set-key (kbd "C-M-\\") 'jester/prettier-js-file-1)

;; 刷新buffer无需confirm
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))
(global-set-key (kbd "C-x j") (lambda () (interactive) (revert-buffer-no-confirm)))

;; 复制当前行或者区域
(defun duplicate-line-or-region (&optional n)
      "Duplicate current line, or region if active.
    With argument N, make N copies.
    With negative N, comment out original line and use the absolute value."
      (interactive "*p")
      (let ((use-region (use-region-p)))
        (save-excursion
          (let ((text (if use-region        ;Get region if active, otherwise line
                          (buffer-substring (region-beginning) (region-end))
                        (prog1 (thing-at-point 'line)
                          (end-of-line)
                          (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                              (newline))))))
            (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
              (insert text))))
        (if use-region nil                  ;Only if we're working with a line (not a region)
          (let ((pos (- (point) (line-beginning-position)))) ;Save column
            (if (> 0 n)                             ;Comment out original with negative arg
                (comment-region (line-beginning-position) (line-end-position)))
            (forward-line 1)
            (forward-char pos)))))

(global-set-key (kbd "M-n") 'duplicate-line-or-region)

;; 启动窗口最大化
;;(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; 窗口移动
(global-set-key (kbd "s-[")  'windmove-left)
(global-set-key (kbd "s-]") 'windmove-right)

(provide 'my-common)
