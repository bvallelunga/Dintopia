# Import NPM Modules
express        = require "express"
slashes        = require "connect-slashes"
ejs            = require "ejs"
app            = express()
srv            = require("http").createServer(app);
RedisStore     = require("connect-redis") express

# Import Local Modules
routes         = require "./routes"
locals         = require "./routes/locals"
assets         = require "./assets"

# Global Variables
GLOBAL.$       = require "jquery"
GLOBAL.async   = require "async"
GLOBAL.config  = require "./config"
GLOBAL.lib     = require "./lib"

# Initialize Lib
lib.init.bind(lib, ejs)()

# HTML Engine
app.engine "html", ejs.renderFile

# Express Config
app.set "views", "#{__dirname}/views"
app.set "view engine", "html"
app.set "view options", layout: true
app.set "view cache", true
app.set "x-powered-by", false

# Express Settings
app.use express.logger("dev")
app.use express.compress()
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser config.cookies.session.secret
app.use express.session
   key: config.cookies.session.key,
   secret: config.cookies.session.secret,
   store: new RedisStore

# Piler Assests
assets.init app
app.use assets.express

# Direct Assests
app.use "/favicon", express.static "#{__dirname}/assets/favicons"
app.use "/fonts", express.static "#{__dirname}/assets/fonts"
app.use "/img", express.static "#{__dirname}/assets/images"

# External Addons
app.use slashes true

# Initialize Models
app.use lib.models

# Setup Locals
app.use locals

# Activate Routes
routes app

# Start Listening to Port
srv.listen config.general.port
