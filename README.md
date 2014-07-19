# Setup Enviroment

``` bash
# Run Init Script
bash init.sh

# Update Config Files
vim config.json
vim dashboard.json

# Configure PM2
pm2 start config.json
```

# Stop Service on PM2
```
# By Name
pm2 stop <service>

# All in Config
pm2 stop config.json

# All of Them
pm2 stop all
```

# Log Watching
```
# By Name
pm2 logs <service>

# All of Them
pm2 logs all
```

# Kill PM2 Deamon
```
pm2 kill
```
