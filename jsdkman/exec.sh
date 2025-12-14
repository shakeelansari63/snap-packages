#!/bin/bash
export SDKMAN_DIR="$SNAP/_sdkman"
source "$SNAP/_sdkman/bin/sdkman-init.sh"
sdk $@
