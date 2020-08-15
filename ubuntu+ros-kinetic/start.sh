#!/bin/bash

HOME=/home/ubuntu
source $HOME/.bashrc
source /opt/ros/kinetic/setup.bash

function install_package(){
    # turtlebot3
    sudo apt-get install -y apt-utils
    sudo apt-get update

    sudo apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-pip ros-kinetic-turtlebot3 ros-kinetic-turtlebot3-msgs ros-kinetic-turtlebot3-simulations
    pip install requests flask

    # additional package
    sudo apt-get install -y ros-kinetic-dwa-local-planner
    sudo apt-get install -y ros-kinetic-global-planner
    sudo apt install -y libarmadillo-dev libarmadillo6
}
install_package

# workspace作成
#mkdir -p $HOME/catkin_ws/src
#cd $HOME/catkin_ws/src
#catkin_init_workspace
#cd $HOME/catkin_ws/
#catkin_make
#echo "source ~/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
#source $HOME/.bashrc

# Turtlebot3のモデル名の指定を環境変数に追加。
echo "export GAZEBO_MODEL_PATH=$HOME/catkin_ws/src/burger_war/burger_war/models/" >> $HOME/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> $HOME/.bashrc
source $HOME/.bashrc

# make
#cd $HOME/catkin_ws/src
#git clone https://github.com/pal-robotics/aruco_ros
#cd $HOME/catkin_ws
#catkin_make

# onenightrobocon
#cd $HOME/catkin_ws/src
#git clone https://github.com/OneNightROBOCON/burger_war
#mv burger_war burger_war.org
#cd $HOME/catkin_ws
#catkin_make

mkdir -p $HOME/catkin_ws/src
cd $HOME/catkin_ws/src
git clone https://github.com/pal-robotics/aruco_ros   # arco
git clone https://github.com/OneNightROBOCON/burger_war # onenightrobocon
git clone https://github.com/tysik/obstacle_detector.git # obstacle detector
cd $HOME/catkin_ws
catkin build
echo "source ~/catkin_ws/devel/setup.bash" >> $HOME/.bashrc
source $HOME/.bashrc


# gazebo/gzserver setting
echo "export QT_X11_NO_MITSHM=1" >> $HOME/.bashrc
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install gazebo7 -y
source $HOME/.bashrc

#コンテナを起動し続ける
#tail -f /dev/null
