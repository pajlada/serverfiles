#!/bin/bash

# Ensure that systemd user directory exists
mkdir -p ~/.config/systemd/user

ln -s "$(pwd)/backup-pajbot.service" ~/.config/systemd/user/
ln -s "$(pwd)/backup-pajbot.timer" ~/.config/systemd/user/

systemctl --user daemon-reload

# Enable and start the timer service
systemctl --user enable backup-pajbot.timer
systemctl --user start backup-pajbot.timer

PAGER= systemctl --user list-timers 'backup-pajbot.timer'

echo "Enable linger for this user if it isn't already enabled, otherwise the timer won't work (I think KKona) sudo systemdl enable-linger USERNAME"
