if [ -d "$HOME/.bashrc_conf" ]; then
    if [ -f "$HOME/.bashrc_conf/environment.bash" ]; then
        . "$HOME/.bashrc_conf/environment.bash" || {
            echo "FAILED TO FIND environment.bash in .bashrc"
        }
    fi
fi
