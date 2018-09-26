# Use this file to run your own startup commands for bash

CMDER_ROOT=/c/cmder
export CMDER_ROOT

# Load aliases
. ${CMDER_ROOT}/config/user-aliases.sh

# Link docker to windows daemon
export DOCKER_HOST=tcp://0.0.0.0:2375
