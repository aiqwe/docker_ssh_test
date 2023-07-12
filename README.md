#### 도커 컴포즈 다운받기
```bash
curl -SL https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
```

#### 도커 컴포즈 실행하기
```bash
docker-compose up -d
```

#### 실행
root 패스워드 확인 : Dockerfile에서 RUN echo 'root:{password}' | chpasswd 부분확인, 현재는 1111로 세팅해놓음
같은 클러스터에서 컨테이너를 띄웠다는 가정하에, docker network driver bridge로 연결해놔서 컨테이너명으로 ssh 접근 가능(root@컨테이너명)
```bash
docker ps -a

CONTAINER ID   IMAGE                    COMMAND                  CREATED          STATUS          PORTS                NAMES
6071101657ef   docker_ssh-con2          "/usr/sbin/sshd -D"      10 minutes ago   Up 10 minutes   22/tcp               docker_ssh-con2-1
7d14edbb4070   docker_ssh-con1          "/usr/sbin/sshd -D"      10 minutes ago   Up 10 minutes   22/tcp               docker_ssh-con1-1
```

  
docker_ssh_con1-1 에서 docker_ssh_con2-1로 ssh 접속해보기
```bash
docker exec -it docker_ssh-con2-1 ssh root@docker_ssh-con1-1
```
  
실행시키면 root 패스워드 물어보는데 세팅해놓은 1111 입력시 ssh로 접근 가능  
이미지를 내리려면 아래 명령어 입력
```bash
docker-compose down
```

### References
Install Docker Compose : https://docs.docker.com/compose/install/standalone/#on-linux  
Docker Network - Bridge : https://docs.docker.com/network/drivers/bridge  
Docker Compose : https://docs.docker.com/compose/  
