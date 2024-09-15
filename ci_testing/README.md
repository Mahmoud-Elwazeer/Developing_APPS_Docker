## "Continuous Integration and Testing with Docker"

## Installation

* **docker build -t ci_testing .**

## Run

* **docker run --name jenkins-data ci_testing echo "Jenkins Data Container"**

* **docker run -d --name jenkins -p 8080:8080 \
        --volumes-from jenkins-data \
        -v /var/run/docker.sock:/var/run/docker.sock ci_testing**

* **docker exec -it jenkins /bin/bash**

## Backup

* **docker run --volumes-from jenkins-data -v $(pwd):/backup \
 debian tar -zcvf /backup/jenkins-data.tar.gz /var/jenkins_home**

 OR

* **docker run --name jenkins-data2 identijenk echo "New Jenkins Data Container"**

* **docker run --volumes-from jenkins-data2 -v $(pwd):/backup \
 debian tar -xzvf /backup/backup.tar**