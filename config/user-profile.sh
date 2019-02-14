export CMDER_ROOT=/c/cmder

# Load aliases
. ${CMDER_ROOT}/config/user-aliases.sh

# Link docker to windows daemon
export DOCKER_HOST=tcp://0.0.0.0:2375
