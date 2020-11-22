# burger_war_docker_trial
Ubuntu 18.04 + ROS melodic/ROS kinetic環境

---
# Ubuntu 18.04 LTS用

## step1. dockerをインストール

[Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

```
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable test edge"
sudo apt-get update
sudo apt-get install -y docker-ce docker.io
```

## step2. コンテナ起動

```
sudo docker run -p 6081:80 --shm-size=512m stakada3o3/robocon-container-trial:0.05
```

(参考) ROS kinetic環境の場合

```
sudo docker run -p 6081:80 --shm-size=512m stakada3o3/robocon-container-trial:kinetic
```


## step3. ブラウザからコンテナへアクセス

```
http://127.0.0.1:6081
```

アクセスできたら以下により動作検証する

左下アイコン --> system tools --> terminator

Terminalを2つ用意してそれぞれで以下を実行

```
cd ~/catkin_make/src/burger_war
bash scripts/sim_with_judge.sh
```

```
cd ~/catkin_make/src/burger_war
bash scripts/start.sh
```

---
# Mac用(MacBookPro Corei5環境で動作検証済)

## step1. dockerをインストール

[Macにdockerインストール](https://qiita.com/ama_keshi/items/b4c47a4aca5d48f2661c)


## step2. コンテナ起動

```
sudo docker run -p 6081:80 --shm-size=512m stakada3o3/robocon-container-trial:0.02
```

## step3. ブラウザからコンテナへアクセス
同上

---
# RaspberryPi用(Raspi4 + Raspbian busterで動作検証済)

## step1. dockerをインストール

[Docker comes to Raspberry Pi](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)

```
curl -sSL https://get.docker.com | sh
```

## step2. コンテナ起動

```
sudo docker run -p 6081:80 --shm-size=512m stakada3o3/robocon-container-trial:raspi0.1
```

## step3. ブラウザからコンテナへアクセス

同上

---
# JetsonNano用(Jetpack4.4で動作検証済)

## step1. dockerをインストール

```
jetpackには最初からdockerがインストールされている。従って追加インストール不要
```

## step2. コンテナ起動

```
sudo docker run -p 6081:80 --shm-size=512m stakada3o3/robocon-container-trial:jetson-nano0.1
```

## step3. ブラウザからコンテナへアクセス

同上

---
開発用

## docker compose

```
docker-compose up -d
```

## docker build (if necessary)

x.xx is container version

```
docker build -t robocon-container-trial:x.xx .
```

---
## ライセンス
see [LICENSE](./LICENSE)
