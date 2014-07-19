# Setup Enviroment

``` bash
# Copy TMP Configs
cp config.tmp.json config.json
cp dashboard.tmp.json dashboard.json

# Make Log Directory
mkdir logs

# Activate Submodules
git submodule init
git submodule update

# Install NPM Libraries
npm install

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
