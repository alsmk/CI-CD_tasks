FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    curl \
    jq \
    git \
    tar && \
    apt-get clean

ENV RUNNER_VERSION=2.320.0
ENV RUNNER_HOME=/home/github-runner

RUN useradd -m github-runner && \
    mkdir -p "$RUNNER_HOME" && \
    chown github-runner:github-runner "$RUNNER_HOME"

RUN curl -o actions-runner.tar.gz -L \
    "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz" && \
    tar xzf actions-runner.tar.gz -C "$RUNNER_HOME" && \
    rm -f actions-runner.tar.gz && \
    chown -R github-runner:github-runner "$RUNNER_HOME"

WORKDIR $RUNNER_HOME


COPY entrypoint.sh $RUNNER_HOME/entrypoint.sh
RUN chmod +x $RUNNER_HOME/entrypoint.sh

USER github-runner
ENTRYPOINT ["./entrypoint.sh"]
