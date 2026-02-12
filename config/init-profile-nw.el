(defun bin-shell-select-up () "Select text upward (previous line)."(interactive)
  (if (use-region-p)
      (previous-line 1)
    (progn
      (push-mark nil t t) ; 激活区域，但不改变光标位置
      (previous-line 1))))


(defun bin-shell-select-down () "Select text upward (next line)."(interactive)
  (if (use-region-p)
      (next-line 1)
    (progn
      (push-mark nil t t) ; 激活区域，但不改变光标位置
      (next-line 1))))

(defun bin-shell-select-right () "Select text upward (right char)."(interactive)
  (if (use-region-p)
      (forward-char 1)
    (progn
      (push-mark nil t t) ; 激活区域，但不改变光标位置
      (forward-char 1))))

(defun bin-shell-select-left () "Select text upward (left char)."(interactive)
  (if (use-region-p)
      (backward-char 1)
    (progn
      (push-mark nil t t) ; 激活区域，但不改变光标位置
      (backward-char 1))))

(defun bin-shell-select-beginning () "Select text upward (beginning line)."(interactive)
  (if (use-region-p)
      (beginning-of-line)
    (progn
      (push-mark nil t t) ; 激活区域，但不改变光标位置
      (beginning-of-line))))

(defun bin-shell-select-end () "Select text upward (end line)."(interactive)
  (if (use-region-p)
      (end-of-line)
    (progn
      (push-mark nil t t) ; 激活区域，但不改变光标位置
      (end-of-line))))

(global-set-key (kbd "C-M-p") 'bin-shell-select-up)
(global-set-key (kbd "C-M-n") 'bin-shell-select-down)
(global-set-key (kbd "C-M-f") 'bin-shell-select-right)
(global-set-key (kbd "C-M-b") 'bin-shell-select-left)
(global-set-key (kbd "C-M-a") 'bin-shell-select-beginning)
(global-set-key (kbd "C-M-e") 'bin-shell-select-end)


(provide 'init-profile-nw)
