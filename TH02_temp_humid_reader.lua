-- TH02 Temperature and Humidity Sensor for NodeMCU
-- Author: Andy Kobyljanec


busid = 0     -- Always 0 for NodeMCU
sda   = 2     -- SDA wired to IO index 2
scl   = 1     -- SCL wired to IO index 1
addr  = 0x40  -- 7-bit device address

i2c.setup(busid,sda,scl,i2c.SLOW)

function readTH02Id()
  i2c.start(busid)
  i2c.address(busid, addr, i2c.TRANSMITTER)
  i2c.write(busid, 0x11)  -- 0x11 is the ID register
  i2c.start(busid)        -- send a repeating start
  i2c.address(busid, addr, i2c.RECEIVER)
  d_id = i2c.read(busid, 1)
  i2c.stop(busid)
  
  if d_id:byte(1) == 0x50 then
    print("device detected")
  else
    print("device not detected")
  end
end

function readReadyBit()
    -- read the ready bit
  i2c.start(busid)
  i2c.address(busid, addr, i2c.TRANSMITTER)
  i2c.write(busid, 0x00)
  i2c.start(busid)          -- send repeating start
  i2c.address(busid, addr, i2c.RECEIVER)
  ready_byte = i2c.read(busid, 1)
  i2c.stop(busid)
  ready = ready_byte:byte(1) % 2    -- the ready bit is the LSB, so use mod 2
  
  -- Ready bit == 0 means the measurement is complete
  if ready == 0 then
    return true
  else
    return false
  end
end
  
  
function readTemperature()
  i2c.start(busid)
  i2c.address(busid, addr, i2c.TRANSMITTER)
  i2c.write(busid, 0x03)    -- write to status register
  i2c.write(busid, 0x11)    -- start a temperature reading
  i2c.stop(busid)
  
  -- wait until the ready bit means measurement complete
  ready = false
  while ready == false do
    ready = readReadyBit()
  end
  
  -- Read conversion result
  i2c.start(busid)
  i2c.address(busid, addr, i2c.TRANSMITTER)
  i2c.write(busid, 0x01)
  i2c.start(busid)
  i2c.address(busid, addr, i2c.RECEIVER)
  data = i2c.read(busid, 2)
  i2c.stop(busid)
  
  tempout = (bit.lshift(data:byte(1),6)) + (bit.rshift(data:byte(2),2)) 
  
  temperature = (tempout/32) - 50
  print("temperature: "..temperature)
  
  return temperature
end


function readHumidity()
  i2c.start(busid)
  i2c.address(busid, addr, i2c.TRANSMITTER)
  i2c.write(busid, 0x03)    -- write to status register
  i2c.write(busid, 0x01)    -- start a temperature reading
  i2c.stop(busid)
  
  -- wait until the ready bit means measurement complete
  ready = false
  while ready == false do
    ready = readReadyBit()
  end
  
  -- Read conversion result
  i2c.start(busid)
  i2c.address(busid, addr, i2c.TRANSMITTER)
  i2c.write(busid, 0x01)
  i2c.start(busid)
  i2c.address(busid, addr, i2c.RECEIVER)
  data = i2c.read(busid, 2)
  i2c.stop(busid)
  
  humidout = (bit.lshift(data:byte(1),4)) + (bit.rshift(data:byte(2),4)) 
  
  humidity = (humidout/16) - 24
  print("humidity: "..humidity)
  
  return humidity
end
  
readTH02Id()
readTemperature()
readHumidity()