-- config.lua
-- NOTE: rename to config.lua and replace with your own settings!


local config = {}

config.HOST = "test.mosquitto.org"
config.PORT = 1883
config.ID = "node" .. node.chipid()
config.USER = "user"
config.PASSWORD = "password"

return config