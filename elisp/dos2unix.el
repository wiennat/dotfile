;; user define function
;; เวลาใช้ ก็กด M-x แล้วก็พิมพ์ dos2unix
;; ====================
;; custom command
(defun dos2unix ()
  "Convert this entire buffer from MS-DOS text file format to UNIX."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\r$" "" nil)
    (goto-char (1- (point-max)))
    (if (looking-at "\C-z")
        (delete-char 1))))

