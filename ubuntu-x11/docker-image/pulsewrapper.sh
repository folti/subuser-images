#!/bin/bash - 
#===============================================================================
#
#          FILE: spotwrapper.sh
# 
#         USAGE: ./spotwrapper.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-09-14 21:01
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

cmd=$1
shift
pulsedirs="/run/user/$UID/pulse/ /run/pulse/native"
for _pd in $pulsedirs; do
    if [ -d "$_pd" ] && [ -e "$_pd/native" ]; then
        export PULSE_SERVER="$_pd/native"
        break
    fi
done
"$cmd" $@

# vim: sw=4 ts=4 et
