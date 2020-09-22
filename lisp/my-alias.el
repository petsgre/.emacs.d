;; 每当我们输入下面的缩写 并以空格结束时，Emacs 就会将其自动展开成为我们所需要的字符串
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; Shifu
					    ("8zl" "zilongshanren")
					    ;; Tudi
					    ("8lxy" "lixinyang")
					    ))


(provide 'my-alias)
