;; Set org-directory
(setq org-directory "~/org") 

;; org-capture
(setq org-default-notes-file (concat org-directory "/notes.org"))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


(setq org-capture-templates
      '(("t" "Todo" entry
	 (file+headline "~/org/todos.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
	("n" "Note" entry
	 (file+headline "~/org/notes.org" "Notes")
         "* %?\n  %i\n  %a")
	("q" "Question" entry
	 (file+headline "~/org/questions.org" "Questions")
         "* %?\n  %i\n  %a")
        ("j" "Journal" entry
	 (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
