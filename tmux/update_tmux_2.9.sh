wget https://gist.githubusercontent.com/tbutts/6abf7fb5b948c066bf180922fb37adcf/raw/198f744327a9924febdd11677f044a4ecd3f3c96/tmux-migrate-options.py
cp ~/.tmux.conf ~/.tmux.conf.org
python tmux-migrate-options.py ~/.tmux.conf.org > ~/.tmux.conf
diff ~/.tmux.conf.org ~/.tmux.conf
rm tmux-migrate-options.py
