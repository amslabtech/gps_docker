FROM ros:kinetic-ros-base

RUN apt-get update

# ROS setting
WORKDIR /root

RUN /bin/bash -c "mkdir -p catkin_ws/src"

RUN cd catkin_ws/src && /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_init_workspace"

RUN cd catkin_ws && /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make"

RUN cd /root && echo source /root/catkin_ws/devel/setup.bash >> .bashrc

ENV ROS_PACKAGE_PATH=/root/catkin_ws:$ROS_PACKAGE_PATH

ENV ROS_WORKSPACE=/root/catkin_ws

RUN apt-get update && \
    apt-get install --no-install-recommends -y\
                       ros-kinetic-tf* \
                       ros-kinetic-nmea-comms \
                       ros-kinetic-nmea-msgs \
                       ros-kinetic-nmea-navsat-driver \
                       ros-kinetic-gps-* \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root