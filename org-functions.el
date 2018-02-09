(defun org-capture-class ()
  "Capture a class template for org-capture"
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((course   (read-string "Course: " nil nil '(nil)))
          (week     (read-string "Week: " nil nil '(nil)))
          (lecture  (read-string "Lecture No.: " nil nil '(nil)))
          (date     (org-read-date nil t))
          (location (read-string "Location: " nil nil '(nil))))
      (when (and course week lecture date location)
        (concat (format "* TODO %s: Week %s Lecture %s\n"
                        course week lecture)
                (format "  SCHEDULED: %s\n" (update date 0))
                (format "  Location: %s %%?\n" location)
                (format "** TODO %s: review lecture %s from week %s\n"
                        course lecture week)
                (format "    DEADLINE: %s SCHEDULED: %s\n"
                        (update date 2) (update date 1)))))))

(defun org-capture-event ()
  "Capture an event template for org-capture"
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((title   (read-string "Title: " nil nil '(nil)))
          (speaker (read-string "Speaker: " nil nil '(nil)))
          (date    (org-read-date nil t))
          (location (read-string "Location: " nil nil '(nil))))
      (when (and title speaker date location)
        (concat (format "* %s with %s\n"
                        title speaker)
                (format "  %s\n" (update date 0))
                (format "  Location: %s %%?\n" location))))))

(defun org-capture-meeting ()
  "Capture an event template for org-capture"
  (cl-labels ((update (date days)
		      (format-time-string
		       car org-time-stamp-formats)
		      (seconds-to-time (+ (time-to-seconds date)
					  (* days 86400)))))
    (let ((with  (read-string "Meet with: " nil nil '(nil)))
	  (date  (org-read-date nil t))
	  (location (read-string "Location: " nil nil '(nil)))
	  (about    (read-string "Regarding: " nil nil '(nil))))
      (when (and with date location about)
	(concat (format "* Meet with %s\n" with)
		(format "  %s\n" (update date 0))
		(format "  Regarding %s\n" about)
		(format "  Location: %s %%?\n" location))))))

(defun org-capture-note ()
  "Capture a note template for org-capture"
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((note (read-string "Note: " nil nil '(nil)))
          (date (org-read-date nil t)))
      (when (and note date)
        (concat (format "* %s\n" note)
                (format "  Noted: %s" date))))))

(defun org-capture-phone
    "Capture a phone call template for org-capture"
  (cl-labels ((update (date days)
                      (format-time-string
                       (car org-time-stamp-formats)
                       (seconds-to-time (+ (time-to-seconds date)
                                           (* days 86400))))))
    (let ((contact (read-string "Contact: " nil nil '(nil)))
          (subject (read-string "Subject: " nil nil '(nil)))
          (date    (org-read-date nil t)))
      (when (and contact subject date)
        (concat (format "* TODO Call %s about %s\n"
                        contact subject)
                (format "  Noted: %s" date))))))
