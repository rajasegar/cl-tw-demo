(defsystem "cl-tw-demo-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Rajasegar Chandran"
  :license ""
  :depends-on ("cl-tw-demo"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cl-tw-demo"))))
  :description "Test system for cl-tw-demo"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
