FROM jetbrains/teamcity-agent:2022.04.3-linux-sudo
USER root

# apt-get update
RUN apt-get update

# install aws-cli
RUN apt-get install -y awscli

# install kubectl
RUN apt-get install -y ca-certificates curl && \
    apt-get install -y apt-transport-https && \
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

# install eks-ctl
RUN curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
    mv /tmp/eksctl /usr/local/bin
