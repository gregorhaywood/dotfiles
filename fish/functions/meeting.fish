
function meeting
    set d $(string lower $argv[1])
    mkdir -p ~/phd/meetings/$d
    cd ~/phd/meetings/$d
    printf "# Meeting on $(date "+%B %d %Y")\nIn Attendance: Gregor, $argv \n\n" >> $(date +%y_%m_%d.md);
    helix $( date +%y_%m_%d.md);
end    
