

function reboot
    read -P'This machine is $hostname. Reboot? (y/n)' confirm
    switch $confirm
        case 'y*'
            sudo reboot $argv
        case '*'
            echo "Aborting Reboot"
    end
end


