import serial
import pynmea2
import datetime
i=0
while True:
    
    try:
        port = "/dev/serial0"
        ser = serial.Serial(port, baudrate=9600, timeout=0.5)
        dataout = pynmea2.NMEAStreamReader()
        newdata = ser.readline()
        # print(newdata, '\n')
        newdata = str(newdata, 'utf-8')
        if "$GNRMC" in newdata:
            # print('heya')
            newmsg = pynmea2.parse(newdata)
            print(newmsg)
            lat = newmsg.latitude
            lng = newmsg.longitude
            time = datetime.datetime.now()
            gps = "Latitude = " + \
                str(lat) + " and Longitude = " + str(lng) + \
                "and time=" + time
            with open("gps.txt", "a") as f:
                f.write(gps)
                f.write('\n')
            i+=1
    except Exception as e:
        print('[ERROR]',e)
        pass

