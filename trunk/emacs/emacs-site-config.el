;; set some site-specific things, don't copy this if you are copying my .emacs
;; you will have to write your own

(defconst my-full-name (user-full-name))
(defconst my-first-name (if (string-match "\\(\\w+\\)" my-full-name)
			    (setq my-first-name (substring
						 my-full-name
						 (match-beginning 0)
						 (match-end 0)))
			  "Don"))
(defconst my-login-name (user-login-name))
(defconst my-domain (let ((hostname (system-name))
			  (site (getenv "SITE")))
		      (cond ((or (string-equal site "ffnet")
				 (string-equal site "inktomi"))
			     "inktomi.com")
			    ((or (string-equal site "nbttech"))
			     (or (string-equal site "riverbed"))
			     "riverbed.com")
			    ((string-match "\\." hostname)
			     (substring hostname (1+ (match-beginning 0))))
			    (t
			     hostname))))
(defconst my-mail-address (cond ((string= my-domain "cs.utah.edu")
				 (concat my-login-name "@pobox.com"))
				((string= my-domain "riverbed.com")
				 "Bart.Robinson@riverbed.com")
				(t
				 (concat my-login-name "@" my-domain))))
(defconst my-mail-box (cond ((string= my-domain "riverbed.com")
			     "Bart.Robinson")
			    (t
			     my-login-name)))
(defconst my-from-line (concat my-full-name " <" my-mail-address ">"))
(defconst my-url (format "http://www.cs.utah.edu/~%s/" my-login-name))
