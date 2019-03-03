(in-package :dungen)

(defun test (&rest attrs)
  (let ((stage (apply #'make-stage attrs)))
    (format t "~&")
    (loop :for y :from (1- (stage-height stage)) :downto 0
          :do (loop :for x :below (stage-width stage)
                    :for cell = (get-cell stage x y)
                    :do (format t "~a"
                                (cond ((has-feature-p cell +door/horizontal+) "──")
                                      ((has-feature-p cell +door/vertical+) "│ ")
                                      ((has-feature-p cell +stairs/up+) "↑↑")
                                      ((has-feature-p cell +stairs/down+) "↓↓")
                                      ((has-feature-p cell +room+) "  ")
                                      ((has-feature-p cell +corridor+) "  ")
                                      ((has-feature-p cell +wall+) "██"))))
              (format t "~%"))))
