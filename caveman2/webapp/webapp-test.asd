(defsystem "webapp-test"
  :defsystem-depends-on ("prove-asdf")
  :author "zhuzha"
  :license ""
  :depends-on ("webapp"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "webapp"))))
  :description "Test system for webapp"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
