#!/bin/sh

APP_DIR="/app"
CUSTOM_NODES_DIR="$APP_DIR/custom_nodes"
VENV_PATH="$APP_DIR/venv"
LAUNCH_COMMAND="python3 $APP_DIR/main.py --listen"

if test "$FORCE_CPU" = "1"; then
    LAUNCH_COMMAND="${LAUNCH_COMMAND} --cpu"
fi

if test -n "$(find "$CUSTOM_NODES_DIR/" -maxdepth 0 -empty)" ; then
    echo "$CUSTOM_NODES_DIR is empty: unpack pre-installed set"
    su comfy -c "tar -xvf \"$APP_DIR/custom_nodes_backup.tar.gz\" -C \"$CUSTOM_NODES_DIR/\""
fi

export PATH="$VENV_PATH:$PATH"
exec /bin/sh -c "${LAUNCH_COMMAND}"
