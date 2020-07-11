# burger_war_docker_trial


# docker run

```
docker-compose up -d
```

# Browser Access

```
http://127.0.0.1:8080
```

# robocon start

左下アイコン --> system tools --> terminator

```
cd ~/catkin_make/src/burger_war
bash scripts/sim_with_judge.sh
bash scripts/start.sh
```

# docker build (if necessary)

xx is a number

```
docker build -t robocon-container-trial:x.xx .
```
