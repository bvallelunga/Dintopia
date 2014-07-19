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
