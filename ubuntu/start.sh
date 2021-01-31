#!/bin/bash

HOME=/home/ubuntu
source $HOME/.bashrc
source /opt/ros/melodic/setup.bash

function install_package(){
    # turtlebot3
    sudo apt-get update
    sudo apt-get install -y apt-utils
    sudo apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-pip ros-melodic-turtlebot3 ros-melodic-turtlebot3-msgs ros-melodic-turtlebot3-simulations
    pip install requests flask

    # my repository
    sudo apt-get install ros-melodic-dwa-local-planner
    sudo apt-get install ros-melodic-global-planner
    sudo apt install -y libarmadillo-dev libarmadillo8  # necessary to install obstacle_detector

    # other repository --->
    sudo apt-get install ros-melodic-dwa-local-planner
    sudo apt-get install ros-melodic-slam-gmapping
    pip install transitions
    sudo apt-get install graphviz graphviz-dev
    pip install graphviz
    sudo apt install ros-melodic-executive-smach
    sudo apt-get install --no-install-recommends -y libarmadillo-dev libarmadillo8

    ###
    sudo apt install -y ros-melodic-jsk-rviz-plugins
    sudo apt install -y ros-melodic-smach*

    ###
    sudo apt install -y ros-melodic-libg2o
    sudo apt install -y libopencv-dev
    sudo apt install -y ros-melodic-costmap-converter
    sudo apt install -y libsuitesparse-dev
    sudo apt install -y libarmadillo-dev libarmadillo8
    ### --->
}
install_package

# Turtlebot3のモデル名の指定を環境変数に追加。
# echo "export GAZEBO_MODEL_PATH=$HOME/catkin_ws/src/burger_war/burger_war/models/" >> $HOME/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> $HOME/.bashrc
source $HOME/.bashrc

# workspace作成
# build
mkdir -p $HOME/catkin_ws/src
cd $HOME/catkin_ws/src
#git clone https://github.com/pal-robotics/aruco_ros   # arco
git clone https://github.com/seigot/burger_war_kit
git clone https://github.com/seigot/burger_war_dev
git clone https://github.com/tysik/obstacle_detector.git # obstacle detector
cd $HOME/catkin_ws
catkin init
catkin build

echo "source ~/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
source $HOME/.bashrc

#コンテナを起動し続ける
#tail -f /dev/null
