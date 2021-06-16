(require 'package)
(set1 package-enable-at-startup nil)
(add-to-list 'package-archives
			 '("gnu" . "https://elpa.gnu.org/packages/"))
			 '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(setq tls-checktrust t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
