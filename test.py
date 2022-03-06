#############################Buzzer#######################
# from gpiozero import Buzzer
# from time import sleep
# buzzer = Buzzer(17)
# while True:
#     buzzer.on()
#     sleep(1)
#     buzzer.off()
#     sleep(1)
################################Switch##########################
# import RPi.GPIO as GPIO
# GPIO.setmode(GPIO.BCM)
# GPIO.setup(17, GPIO.IN)
# i=0
# while True:
#     input_value = GPIO.input(17)
#     if input_value == False:
#         print('Who pressed my button! ', i)
#         i+=1
#     while input_value == False:
#         input_value = GPIO.input(17)
######################################MotorKit##########################
# import time
# import board
# from adafruit_motorkit import MotorKit

# kit = MotorKit(i2c=board.I2C())

# kit.motor1.throttle = 0
# kit.motor2.throttle = 0
# kit.motor3.throttle = 0
# kit.motor4.throttle = 0

# try:
#     while True:
#         print("Forward!")
#         kit.motor3.throttle = 0.1
#         time.sleep(1)
#         kit.motor3.throttle = -0.1
#         time.sleep(1)
# except KeyboardInterrupt:
#     kit.motor3.throttle = 0

# from Imports.Max30102.heartrate_monitor import HeartRateMonitor
# import time
import pandas as pd
# max30102 = HeartRateMonitor()
# max30102.start_sensor()
# df = pd.DataFrame(columns=['SPO2'])
# i = 0
# try:
#     while True:
#         print('SPO2 : ', max30102.spo_cal, '%')
#         print('Pulse Rate :', max30102.Bpm_cal, 'bpm')
#         print('Red : ', max30102.red, 'Lumens \n')
#         df.at[i] = [max30102.red]
#         time.sleep(1)
#         i+=1
# except KeyboardInterrupt:
#     max30102.stop_sensor()
#     df.to_csv('SPO2.csv')
#     print('\nData Collected Successfully')
import requests
import random
df = pd.read_csv('SPO2.csv')
login_request = requests.post(
    "http://192.168.137.1:5000/login", json={"username": "lucif3r", "password": "lucif3r"}
)
print(login_request.json())
import time
auth_token = "Bearer " + login_request.json()["access_token"]
try:
    for i in range(len(df)):
        stream_data = {
            "id": i,
            "pr": random.randint(1, 100),
            "spo2": str(df["SPO2"][i]),
            "pip": random.randint(1, 100),
            "peep": random.randint(1, 100),
            "i_e": random.choices(["1:1", "1:1.5", "1:2", "1:4", "1:5"], k=1)[0],
            "ecg_1": random.randint(1, 100),
            # 'ecg_1' : np.sin(i/10),
            "ecg_2": random.randint(1, 100),
            # 'ecg_2' : np.cos(i/10),
            "sys": random.randint(1, 100),
            "dia": random.randint(1, 100),
            "lat": random.randint(1, 100),
            "long": random.randint(1, 100),
        }
        headers = {
                "Authorization": auth_token,
            }
        request = requests.post(
                "http://192.168.137.1:5000/api/data", json=stream_data, headers=headers
            )

        print("[DEBUG] Recieved Text", request.text)
        if "access_token" in request.json():
            auth_token = "Bearer " + request.json()["access_token"]
            print("[DEBUG] New Token")
        time.sleep(.2)
except Exception as e:
    print(e)
    # print(request.text)
    pass
except KeyboardInterrupt:
    requests.delete("http://192.168.137.1:5000/api/data?all=1", headers=headers)
