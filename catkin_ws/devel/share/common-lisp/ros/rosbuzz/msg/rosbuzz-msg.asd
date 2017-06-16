
(cl:in-package :asdf)

(defsystem "rosbuzz-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "neigh_pos" :depends-on ("_package_neigh_pos"))
    (:file "_package_neigh_pos" :depends-on ("_package"))
  ))