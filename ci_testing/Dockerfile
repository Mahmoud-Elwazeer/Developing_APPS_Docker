FROM jenkins/jenkins:lts

USER root
RUN apt-get update \
    && apt install sudo -y \
    && apt-get install ca-certificates curl -y \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc \
    && chmod a+r /etc/apt/keyrings/docker.asc \
    && echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y \
    && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli --plugins $(cat /usr/share/jenkins/plugins.txt)
