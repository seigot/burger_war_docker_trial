# burger_war_docker_trial

# docker run

```
docker run -p 6081:80 --shm-size=512m stakada3o3/robocon-container-trial:0.01
```

# Browser Access

```
http://127.0.0.1:6081
```

# robocon start

左下アイコン --> system tools --> terminator

```
cd ~/catkin_make/src/burger_war
bash scripts/sim_with_judge.sh
bash scripts/start.sh
```

# docker compose

```
docker-compose up -d
```

# docker build (if necessary)

x.xx is container version

```
docker build -t robocon-container-trial:x.xx .
```
