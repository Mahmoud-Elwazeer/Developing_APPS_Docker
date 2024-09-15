## "Continuous Integration and Testing with Docker"

## Installation

* **docker build -t ci_testing .**

## Run

* **docker run --name jenkins-data ci_testing echo "Jenkins Data Container"**

* **docker run -d --name jenkins -p 8080:8080 \
        --volumes-from jenkins-data \
        -v /var/run/docker.sock:/var/run/docker.sock ci_testing**

* **docker exec -it jenkins /bin/bash**