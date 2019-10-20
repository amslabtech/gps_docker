FROM ros:melodic-ros-base

RUN apt-get update

# ROS setting
WORKDIR /root

RUN /bin/bash -c "mkdir -p catkin_ws/src"

RUN cd catkin_ws/src && /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_init_workspace"

RUN cd catkin_ws && /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_make"

RUN cd /root && echo source /root/catkin_ws/devel/setup.bash >> .bashrc

ENV ROS_PACKAGE_PATH=/root/catkin_ws:$ROS_PACKAGE_PATH

ENV ROS_WORKSPACE=/root/catkin_ws

RUN apt-get update && \
    apt-get install --no-install-recommends -y\
                       ros-melodic-tf* \
                       ros-melodic-nmea-comms \
                       ros-melodic-nmea-msgs \
                       ros-melodic-gps-* \
                       ros-melodic-roslint-* \
                       python-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/catkin_ws/src

RUN git clone https://github.com/ros-drivers/nmea_navsat_driver

WORKDIR /root

RUN cd catkin_ws && /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_make"

RUN pip install pyserial

COPY ./ros_entrypoint.sh /

CMD ["/ros_entrypoint.sh"]
