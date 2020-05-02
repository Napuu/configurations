# juttuja :-)

## jos haluaa tehdä muutoksia /usr/bin tai jotain vastaavaa
1. bootataan recoverymodeen (command + R pohjassa bootin aikana)
2. csrutil disable
3. reboot
3. 
```
sudo mount -uw /
killall Finder
```
4. tee muutokset

## tmux status bar
```set -g status-right '#[default, bg=white]#(istats|grep CPU|grep temp|cut -d " " -f 17-17)#[default] #[default, bg=white]#(uptime |cut -d " " -f 11-13)#[default] #[fg=black,bg=white]%d.%m.%y#[default] #[fg=black,bg=white]%H:%M#[default] '```
