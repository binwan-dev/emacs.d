;;; text
(setq-default cursor-type 'bar)
(delete-selection-mode 1)
(setq-default line-spacing 0.4) ; font space

;; font begin
(defun set-graphic-font()
  (setq fonts
	(cond ((eq system-type 'darwin)     '("MonoLisa Nasy"    "STHeiti"))
              ((eq system-type 'gnu/linux)  '("Cascadia Code"     "WenQuanYi Zen Hei"))
              ((eq system-type 'windows-nt) '("Cascadia Code"  "Microsoft Yahei"))))
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 14))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family (car (cdr fonts)))))

  ;Fix chinese font width and rescale
  (setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2) ("STHeiti". 1.2)))

  (with-eval-after-load 'doom-modeline
    (set-face-attribute 'mode-line nil :font "Cascadia Code 12")
    (set-face-attribute 'mode-line-inactive nil :font "Cascadia Code 12")))

(when (display-graphic-p)
  (set-graphic-font))
;; font end

;; backup file
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-interval 50)
(setq auto-save-timeout 120)
(setq backup-directory-alist `((".*" . "~/.autosave/")))
(setq auto-save-file-name-transforms `((".*","~/.autosave/" t)))
(setq create-lockfiles nil)

;; recent file
(use-package recentf
  :init (recentf-mode 1)
  :config (setq recentf-max-menu-items 25)
  :bind  (("C-x C-r" . #'recentf-open-files)))

;; move files
(defun move-file (new-location)
  "Write this file to NEW-LOCATION, and delete the old one."
  (interactive (list (expand-file-name
                      (if buffer-file-name
                          (read-file-name "Move file to: ")
                        (read-file-name "Move file to: "
                                        default-directory
                                        (expand-file-name (file-name-nondirectory (buffer-name))
                                                          default-directory))))))
  (when (file-exists-p new-location)
    (delete-file new-location))
  (let ((old-location (expand-file-name (buffer-file-name))))
    (message "old file is %s and new file is %s"
             old-location
             new-location)
    (write-file new-location t)
    (when (and old-location
               (file-exists-p new-location)
               (not (string-equal old-location new-location)))
      (delete-file old-location))))

;; open init file root directory
(defun binwan-open-my-init-file ()
  "open my config"
  (interactive)
  (find-file "~/.emacs.d/config/init-config.el"))

;; comment-or-uncomment
(defun my-comment-or-uncomment-region (beg end &optional arg)    
  (interactive (if (use-region-p)    
                   (list (region-beginning) (region-end) nil)    
                 (list (line-beginning-position)    
                       (line-beginning-position 2))))    
  (comment-or-uncomment-region beg end arg))

;; use huagry-delete
(use-package hungry-delete
  :config
  (global-hungry-delete-mode t)
  ;; 解决终端模式 Backspace变为Ctrl+h
  (when (not (display-graphic-p))
    (global-set-key "\C-h" 'backward-kill-word)))

;; 终端模式 mark
(when (not (display-graphic-p))
  (global-set-key (kbd "C-c SPC") 'set-mark-command))

(global-display-line-numbers-mode t) ;; show number for column

;; tab conver to space
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; mutiple curror
(use-package multiple-cursors
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; keybindings
(global-set-key (kbd "C-c b r") #'revert-buffer) ;; refesh buffer
(global-set-key (kbd "C-c m") #'move-file) ;; move file
(global-set-key (kbd "<f1>") #'binwan-open-my-init-file) ;; open init file directory
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region) ;; comment
(global-set-key (kbd "C-c C-/") #'comment-or-uncomment-region) ;; comment
(global-set-key (kbd "C-c b b") #'pop-tag-mark) ;; tag mark

;; evil
(use-package evil
  :config
  (setq evil-toggle-key "C-c C-c")
  (setq evil-mode t))


(provide 'init-profile)
