;;; st.el --- define function key sequences for st

;; Author: Jules Maselbas
;; Keywords: terminals

;; Copyright (C) 2021 Jules Maselbas

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;;; Commentary:

;;; Code:

;; require xterm for color initilisation
(require 'term/xterm)

(defgroup st nil
  "st - simple terminal support."
  :version "0.8.1"
  :group 'terminals)

(defun st-set-window-title (&optional terminal)
  "Set the window title of the st TERMINAL.
The title is constructed from `frame-title-format'."
  (send-string-to-terminal
   (format "\e]0;%s\a" (format-mode-line frame-title-format))
   terminal))

(defun terminal-init-st ()
  "Terminal initialization function for st."
  (xterm-register-default-colors xterm-standard-colors)
  (tty-set-up-initial-frame-faces)
  (define-key input-decode-map "\e[1~" [home])
  (define-key input-decode-map "\e[4~" [end])
  (define-key input-decode-map "\e[1;2A" [S-up])
  (define-key input-decode-map "\e[1;2B" [S-down])
  (define-key input-decode-map "\e[1;2C" [S-right])
  (define-key input-decode-map "\e[1;2D" [S-left])
  (define-key input-decode-map "\e[1;3A" [M-up])
  (define-key input-decode-map "\e[1;3B" [M-down])
  (define-key input-decode-map "\e[1;3C" [M-right])
  (define-key input-decode-map "\e[1;3D" [M-left])
  (define-key input-decode-map "\e[1;4A" [M-S-up])
  (define-key input-decode-map "\e[1;4B" [M-S-down])
  (define-key input-decode-map "\e[1;4C" [M-S-right])
  (define-key input-decode-map "\e[1;4D" [M-S-left])
  (define-key input-decode-map "\e[1;5A" [C-up])
  (define-key input-decode-map "\e[1;5B" [C-down])
  (define-key input-decode-map "\e[1;5C" [C-right])
  (define-key input-decode-map "\e[1;5D" [C-left])
  (define-key input-decode-map "\e[1;6A" [C-S-up])
  (define-key input-decode-map "\e[1;6B" [C-S-down])
  (define-key input-decode-map "\e[1;6C" [C-S-right])
  (define-key input-decode-map "\e[1;6D" [C-S-left])
  (define-key input-decode-map "\e[1;7A" [C-M-up])
  (define-key input-decode-map "\e[1;7B" [C-M-down])
  (define-key input-decode-map "\e[1;7C" [C-M-right])
  (define-key input-decode-map "\e[1;7D" [C-M-left])
  (define-key input-decode-map "\e[1;8A" [C-M-S-up])
  (define-key input-decode-map "\e[1;8B" [C-M-S-down])
  (define-key input-decode-map "\e[1;8C" [C-M-S-right])
  (define-key input-decode-map "\e[1;8D" [C-M-S-left])

  (st-set-window-title)
  (add-hook 'post-command-hook 'st-set-window-title)
  (add-hook 'minibuffer-exit-hook 'st-set-window-title))

(provide 'term/st)
;;; st.el ends here
