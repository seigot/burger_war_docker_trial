# burger_war_docker_trial


# docker build (if necessary)

```
docker build -t robocon-container-trial:0.01 .
```

# docker run

```
docker-compose up -d
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
