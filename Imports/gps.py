import serial
import pynmea2

class gps:
    def __init__(self,port='/dev/serial0', baud_rate=9600, timeout=0.5):
        self.port = port
        self.serial = serial.Serial(port, baud_rate, timeout=timeout)
        
    def get_gps(self):
        self.dataout = pynmea2.NMEAStreamReader()
        self.new_data = str(self.serial.readline(), 'utf-8')
        if "$GNRMC" in self.new_data:
            self.new_msg = pynmea2.parse(self.new_data)
            self.lat = self.new_msg.latitude
            self.lng = self.new_msg.longitude
            return self.lat, self.lng
        else:
            print('[ERROR]No data\n')
            return 0, 0
