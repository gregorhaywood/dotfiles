#! /bin/bash

# Info I want:
# list of non-special windows by ID, their monitor, and the active workspace on each
#    monitor 
#
# Later additions: details about number of windows, active window, etc.


 function w {
  MON=\"$1\"
 	spaces (){
    # hyprctl workspaces -j  
 		# WORKSPACE_WINDOWS=$(
    echo $(hyprctl workspaces -j | jq "map(select(.monitor == $MON)) |map(select(.id > 0))| map(.id)")
     #map({key: .id | tostring, value: .name}) |from_entries')
      # jq 'map({key: .id | tostring, value: {key: "monitor", value: .monitor} }) | from_entries')
    # echo $WORKSPACE_WINDOWS # | jq to_entries
    
 		# seq 1 10 | jq --argjson monitor "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., monitor: ($monitor[.]//0)})'
 	}

 	spaces
 	socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
 		spaces
 done
 }

function c {
  MON=\"$1\"
 	spaces (){
    echo $(hyprctl monitors -j | jq "map(select(.name == $MON)) |map(.activeWorkspace.id)| .[0]")
 	}
 	spaces
 	socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
 		spaces
 done
 }

if [[ $1 == "w" ]]
then
  w $2
elif [[ $1 == "c" ]]
then
  c $2
fi

# socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
#   stdbuf -o0 awk -F '>>|,' -e '/^workspace>>/ {print $2}' -e '/^focusedmon>>/ {print $3}'

# #
# function clamp {
# 	min=$1
# 	max=$2
# 	val=$3
# 	python -c "print(max($min, min($val, $max)))"
# }

# direction=$1
# current=$2
# if test "$direction" = "down"
# then
# 	target=$(clamp 1 10 $(($current+1)))
# 	echo "jumping to $target"
# 	hyprctl dispatch workspace $target
# elif test "$direction" = "up"
# then
# 	target=$(clamp 1 10 $(($current-1)))
# 	echo "jumping to $target"
# 	hyprctl dispatch workspace $target
# fi
  
