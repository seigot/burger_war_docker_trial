#!/bin/bash

# sudo -E オプションをつける理由はproxy環境下でdocker proxy設定を継承するため。

HOME=/home/ubuntu
source $HOME/.bashrc
source /opt/ros/melodic/setup.bash

function install_package(){
    # turtlebot3
    sudo -E apt-get update
    sudo -E apt-get install -y apt-utils
    sudo -E apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-pip ros-melodic-turtlebot3 ros-melodic-turtlebot3-msgs ros-melodic-turtlebot3-simulations
    pip install requests flask

    # my repository
    sudo -E apt-get install ros-melodic-dwa-local-planner
    sudo -E apt-get install ros-melodic-global-planner
    sudo -E apt install -y libarmadillo-dev libarmadillo8  # necessary to install obstacle_detector

    # other repository --->
    sudo -E apt-get install ros-melodic-dwa-local-planner
    sudo -E apt-get install ros-melodic-slam-gmapping
    pip install transitions
    sudo -E apt-get install graphviz graphviz-dev
    pip install graphviz
    sudo -E apt install ros-melodic-executive-smach
    sudo -E apt-get install --no-install-recommends -y libarmadillo-dev libarmadillo8

    ###
    sudo -E apt install -y ros-melodic-jsk-rviz-plugins
    sudo -E apt install -y ros-melodic-smach*

    ###
    sudo -E apt install -y ros-melodic-libg2o
    sudo -E apt install -y libopencv-dev
    sudo -E apt install -y ros-melodic-costmap-converter
    sudo -E apt install -y libsuitesparse-dev
    sudo -E apt install -y libarmadillo-dev libarmadillo8
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
