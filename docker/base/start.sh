#!/bin/bash
set -o errexit

# Processing /opt/kolla/config_files/config.json
python /opt/kolla/set_configs.py
CMD=$(cat /run_command)
ARGS=""

# Run additional commands if present
source kolla_extend_start

echo "Running command: '${CMD}${ARGS:+ $ARGS}'"
exec ${CMD} ${ARGS}
