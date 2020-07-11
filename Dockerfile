FROM tiryoh/ros-desktop-vnc:melodic

RUN apt-get update ;\
    apt-get -y upgrade ;

# environment setting
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# tools
RUN apt-get update ;\
    apt-get install -y \
    sudo \
    lsb-release \
    terminator \
    gnome-terminal \
    emacs25;

# turtlebot3
RUN apt-get update ;\
    apt-get install -y \
    python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential \
    python-pip \
    ros-melodic-turtlebot3 ros-melodic-turtlebot3-msgs ros-melodic-turtlebot3-simulations; \
    pip install requests flask;

# command
ADD  start.sh  /
RUN  chmod +x /start.sh
RUN  /start.sh

# コンテナ起動時に実行する
#ADD  start.sh  /
#RUN  chmod +x /start.sh
#CMD  ["/start.sh"]

