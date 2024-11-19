#!/bin/bash

set -e

export RUNNER_TOKEN="AKNKBIKCVCKPJ7SSYJWPI6DHHQYNI"
export REPO_URL="hhttps://github.com/alsmk/CI-CD_tasks/"
export RUNNER_NAME="runner-$(hostname)-$RANDOM"
export RUNNER_LABELS="self-hosted"

# Register the runner
./config.sh --unattended \
    --url "${REPO_URL}" \
    --token "${RUNNER_TOKEN}" \
    --name "${RUNNER_NAME}" \
    --labels "${RUNNER_LABELS:-self-hosted}"

# Start the runner
exec ./run.sh
