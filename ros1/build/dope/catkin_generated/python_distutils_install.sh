#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/john/CV_ws/Deep_Object_Pose/ros1/src/dope"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/john/CV_ws/Deep_Object_Pose/ros1/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/john/CV_ws/Deep_Object_Pose/ros1/install/lib/python3/dist-packages:/home/john/CV_ws/Deep_Object_Pose/ros1/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/john/CV_ws/Deep_Object_Pose/ros1/build" \
    "/usr/bin/python3" \
    "/home/john/CV_ws/Deep_Object_Pose/ros1/src/dope/setup.py" \
     \
    build --build-base "/home/john/CV_ws/Deep_Object_Pose/ros1/build/dope" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/john/CV_ws/Deep_Object_Pose/ros1/install" --install-scripts="/home/john/CV_ws/Deep_Object_Pose/ros1/install/bin"
