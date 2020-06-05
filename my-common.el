;; 把光标变成竖线
(setq-default cursor-type 'bar)

;; 不要导航菜单
(tool-bar-mode -1)

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

;; 选中当前区域或单词
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)

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
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; 注释快捷键
(global-set-key (kbd "C-x C-/") 'comment-or-uncomment-region)

;; 剪切整行
(global-set-key (kbd "<s-backspace>") 'kill-whole-line)

;; 列出function菜单
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; 启动prettier
(global-prettier-mode 1)

(provide 'my-common)
