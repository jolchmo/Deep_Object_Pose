execute_process(COMMAND "/home/john/CV_ws/Deep_Object_Pose/ros1/build/dope/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/john/CV_ws/Deep_Object_Pose/ros1/build/dope/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
