#!/bin/bash
set -eu

# turtlebot3
apt-get update
apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-pip ros-melodic-turtlebot3 ros-melodic-turtlebot3-msgs ros-melodic-turtlebot3-simulations
pip install requests flask
apt-get install -y ros-melodic-dwa-local-planner
apt-get install -y ros-melodic-global-planner

###
sudo apt-get install -y ros-melodic-dwa-local-planner
sudo apt-get install -y ros-melodic-slam-gmapping
pip install transitions
sudo apt-get install -y graphviz graphviz-dev
pip install pygraphviz
#sudo apt-get install -y ros-groovy-executive-smach
#rospack find smach
sudo apt-get install --no-install-recommends -y libarmadillo-dev
#cd ~/catkin_ws/src

###
sudo apt install -y ros-melodic-dwa-local-planner
sudo apt install -y ros-melodic-jsk-rviz-plugins
sudo apt install -y ros-melodic-smach*
sudo apt install -y libarmadillo-dev #libarmadillo6

###
sudo apt install -y ros-melodic-libg2o
sudo apt install -y libopencv-dev
sudo apt install -y ros-melodic-costmap-converter
sudo apt install -y libsuitesparse-dev
sudo apt install -y libarmadillo-dev #libarmadillo6
