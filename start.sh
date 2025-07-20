#!/bin/sh

VENV_PATH="/app/venv"
LAUNCH_COMMAND="python3 /app/main.py --listen"

if test "$FORCE_CPU" = "1"; then
    LAUNCH_COMMAND="${LAUNCH_COMMAND} --cpu"
fi

export PATH="$VENV_PATH:$PATH"
exec /bin/sh -c "${LAUNCH_COMMAND}"
