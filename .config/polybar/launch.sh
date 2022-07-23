#!/usr/bin/env bash

polybar-msg cmd quit

echo "Bar Launched: $(date)" | tee -a /tmp/polybar-hdmi.log /tmp/polybar-dp.log
polybar hdmi 2>&1 | tee -a /tmp/polybar-hdmi.log & disown
polybar dp 2>&1 | tee -a /tmp/polybar-dp.log & disown
