;; Auto-generated. Do not edit!


(when (boundp 'spar_msgs::FlightMotionFeedback)
  (if (not (find-package "SPAR_MSGS"))
    (make-package "SPAR_MSGS"))
  (shadow 'FlightMotionFeedback (find-package "SPAR_MSGS")))
(unless (find-package "SPAR_MSGS::FLIGHTMOTIONFEEDBACK")
  (make-package "SPAR_MSGS::FLIGHTMOTIONFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude FlightMotionFeedback.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass spar_msgs::FlightMotionFeedback
  :super ros::object
  :slots (_progress _waiting_for_convergence _goal_position _goal_yaw ))

(defmethod spar_msgs::FlightMotionFeedback
  (:init
   (&key
    ((:progress __progress) 0.0)
    ((:waiting_for_convergence __waiting_for_convergence) nil)
    ((:goal_position __goal_position) (instance geometry_msgs::Point :init))
    ((:goal_yaw __goal_yaw) 0.0)
    )
   (send-super :init)
   (setq _progress (float __progress))
   (setq _waiting_for_convergence __waiting_for_convergence)
   (setq _goal_position __goal_position)
   (setq _goal_yaw (float __goal_yaw))
   self)
  (:progress
   (&optional __progress)
   (if __progress (setq _progress __progress)) _progress)
  (:waiting_for_convergence
   (&optional (__waiting_for_convergence :null))
   (if (not (eq __waiting_for_convergence :null)) (setq _waiting_for_convergence __waiting_for_convergence)) _waiting_for_convergence)
  (:goal_position
   (&rest __goal_position)
   (if (keywordp (car __goal_position))
       (send* _goal_position __goal_position)
     (progn
       (if __goal_position (setq _goal_position (car __goal_position)))
       _goal_position)))
  (:goal_yaw
   (&optional __goal_yaw)
   (if __goal_yaw (setq _goal_yaw __goal_yaw)) _goal_yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _progress
    4
    ;; bool _waiting_for_convergence
    1
    ;; geometry_msgs/Point _goal_position
    (send _goal_position :serialization-length)
    ;; float32 _goal_yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _progress
       (sys::poke _progress (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _waiting_for_convergence
       (if _waiting_for_convergence (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Point _goal_position
       (send _goal_position :serialize s)
     ;; float32 _goal_yaw
       (sys::poke _goal_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _progress
     (setq _progress (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _waiting_for_convergence
     (setq _waiting_for_convergence (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Point _goal_position
     (send _goal_position :deserialize buf ptr-) (incf ptr- (send _goal_position :serialization-length))
   ;; float32 _goal_yaw
     (setq _goal_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get spar_msgs::FlightMotionFeedback :md5sum-) "6f23ddce6055aec8d4fbc59ea65c4cb8")
(setf (get spar_msgs::FlightMotionFeedback :datatype-) "spar_msgs/FlightMotionFeedback")
(setf (get spar_msgs::FlightMotionFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

# Feedback

float32 progress					# Progress 0..1 from start to goal
bool waiting_for_convergence		# Mark to show if waiting for convergence

geometry_msgs/Point goal_position	# Current goal position
float32 goal_yaw					# Current goal yaw


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :spar_msgs/FlightMotionFeedback "6f23ddce6055aec8d4fbc59ea65c4cb8")


