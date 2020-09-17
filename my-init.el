(require 'package)

;; 添加melpa资源
(add-to-list 'package-archives
	     '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
;;	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

;; 使用use-package下载一些包
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 下面这三段式让buffer在下面可以使用tab切换出来
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)



(provide 'my-init)
