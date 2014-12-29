# Greylock Hackfest 2014

**Placed:** N/A

**Coding Time:** 15 hours

**Team Members:** 2

![Dintopia](https://github.com/bvallelunga/dintopia/raw/master/screenshot.png)


# Setup Enviroment

``` bash
# Run Init Script
bash init.sh

# Update Config Files
vim config.json

# Configure Forever
forever start -c coffee config.json
```

# Stop Service on Forever
```
forever stop start.coffee
```

# Log Watching
```
tail -f logs/log*
```

# Kill Forever Deamon
```
forever stopall
```
