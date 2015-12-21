# nodemcu_temperature_humidity_sensor

Reads temperature and humidity from an I2C sensor and uploads to a server via MQTT.  NodeMCU is a firmware package for the ESP8266 low-cost wifi device which uses Lua to easily script event-based Internet-of-Things devices.  The hardware can be purchased from SeeedStudio for ~$30 total.

### Hardware
- [NodeMCU v2 - Lua based ESP8266 development kit](http://www.seeedstudio.com/depot/NodeMCU-v2-Lua-based-ESP8266-development-kit-p-2415.html)
- [Grove Base Shield for NodeMCU](http://www.seeedstudio.com/depot/Grove-Base-Shield-for-NodeMCU-p-2513.html)
- [Grove - Temperature&Humidity Sensor (High-Accuracy & Mini)](http://www.seeedstudio.com/depot/Grove-TemperatureHumidity-Sensor-HighAccuracy-Mini-p-1921.html?cPath=25_125)

## Software Tools
- [LuaLoader for ESP8266](http://benlo.com/esp8266/): Simple tool for interacting with the ESP8266 and NodeMCU


## Information
- [NodeMCU Firmware](https://github.com/nodemcu/nodemcu-firmware)
- [NodeMCU I2C Documentation](http://www.nodemcu.com/docs/i2c-module/)
- [TH02 Digital I2C Humidity and Temperature Sensor Datasheet](http://www.seeedstudio.com/wiki/images/3/30/TH02_SENSOR.pdf)
- [I2C NodeMCU Guide](https://primalcortex.wordpress.com/2015/08/21/nodemcu-and-i2c-how-to-start-and-using-the-pcf8574a-i2c-port-expander-on-esp-01-board/) - See i2_scan.lua
- [Bit operations NodeMCU Guide)(http://www.nodemcu.com/docs/bit-module/)