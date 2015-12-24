-- mqtt_app.lua
local module = {}
mqttClient = nil

-- send an update to the server
local function send_ping()
  mqttClient:publish("test/node/ping","ping",0,0)
end


-- Set up MQTT connection
local function mqtt_setup()
  mqttClient = mqtt.Client(config.ID, 120, config.USER, config.PASSWORD)
  
  mqttClient:connect(config.HOST, config.PORT, 0, function(conn)
    print("connected")
    
    -- use timer to generate interrupts on 5 secnods
    tmr.stop(2)
    
    -- call the publish function on the interrupt
    tmr.alarm(2, 5000, 1, send_ping)
  end)
  
end

-- start up the mqtt client
function module.start()
  mqtt_setup()
  print("mqtt set up")
end

return module
  