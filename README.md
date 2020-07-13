# burger_war_docker_trial

# step1. dockerをインストール

[Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

```
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable test edge"
sudo apt-get update
sudo apt-get install -y docker-ce
```

# step2. コンテナ起動

```
docker run -p 6081:80 --shm-size=512m stakada3o3/robocon-container-trial:0.01
```

# step3. ブラウザからコンテナへアクセス

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
開発用

# docker compose

```
docker-compose up -d
```

# docker build (if necessary)

x.xx is container version

```
docker build -t robocon-container-trial:x.xx .
```
