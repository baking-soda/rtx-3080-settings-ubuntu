#!/bin/bash
# Preparation:
# Step 1.
# Run "sudo nvidia-xconfig --coolbits=28"
# Step 2.
# Edit the file below (sudo needed)
# /etc/X11/Xwrapper.config
# And change the line
# "needs_root_rights=no"
# to 
# "needs_root_rights=yes"

# This variable should be set to the output of "echo $DISPLAY" in
# the monitor driven by Nvidia GPU.
DISPLAY=:0

# This variable should be set to the output of "ps aux | awk '/Xorg/ {print $16}' | head -n1"
XAUTHORITY=/run/user/125/gdm/Xauthority

# Set power-limit to 215W
sudo nvidia-smi -pl 215

# Set memory overclocked by 1100MB/s (+550MHz in QDDR freq) at all perf levels:
sudo DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY nvidia-settings -c :0 -a '[gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=1100'

# Set SM underclocked by 100MHz at all perf levels.
sudo DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY nvidia-settings -c :0 -a '[gpu:0]/GPUGraphicsClockOffsetAllPerformanceLevels=-100'
