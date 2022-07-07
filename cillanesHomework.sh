#Carla Illanes Sanchez
#Docker Training | Homework 1

Network creation:
$ docker network create dockertnetwork

1. PostgreSQL Commands
$ docker volume create postgres_vol
$ docker run -d --name sonarPostgress --network dockertnetwork --restart always -e POSTGRES_USER=sonar_user -e POSTGRES_PASSWORD=Control123 -v ~/postgresql:/var/lib/postgresql -v postgresql_vol:/var/lib/postgresql/data postgres:13.7-alpine

2. Sonarqube Community Edition Commands
$ docker volume create sonarqube_data
$ docker volume create sonarqube_logs
$ docker volume create sonarqube_extentions

3. Jenkins Commands
$ docker volume create jenkins_vol
$ docker run -d --name jenkins --network dockertnetwork --restart always --group-add $(stat -c '%g' /var/run/docker.sock) -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_data:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11

4. Sonatype Nexus 3 Commands
$ docker volume create nexus_vol
$ docker run -d --name nexus3 --network dockertnetwork --restart always -p 8081:8081 -p 8082:8082 -v nexus_data:/nexus-data sonatype/nexus3

5. Portainer Commands
$ docker volume create portainer_vol
$ docker container run -d --name portainer --network dockertnetwork --restart always -p 9443:9443 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_vol:/data portainer/portainer

