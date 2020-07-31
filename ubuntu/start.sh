#!/bin/bash

HOME=/home/ubuntu
source $HOME/.bashrc
source /opt/ros/melodic/setup.bash

# workspace作成
mkdir -p $HOME/catkin_ws/src
cd $HOME/catkin_ws/src
catkin_init_workspace
cd $HOME/catkin_ws/
catkin_make
echo "source ~/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
source $HOME/.bashrc

# Turtlebot3のモデル名の指定を環境変数に追加。
echo "export GAZEBO_MODEL_PATH=$HOME/catkin_ws/src/burger_war/burger_war/models/" >> $HOME/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> $HOME/.bashrc
source $HOME/.bashrc

# make
cd $HOME/catkin_ws/src
git clone https://github.com/pal-robotics/aruco_ros
cd $HOME/catkin_ws
catkin_make

# onenightrobocon
cd $HOME/catkin_ws/src
git clone https://github.com/OneNightROBOCON/burger_war
#mv burger_war burger_war.org
cd $HOME/catkin_ws
catkin_make


#コンテナを起動し続ける
#tail -f /dev/null
