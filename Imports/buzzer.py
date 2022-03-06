import RPi.GPIO as GPIO
from time import sleep
import logging


class Buzzer:
    BUZZER = 23

    def __init__(self):
        GPIO.setwarnings(False)
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.BUZZER, GPIO.OUT)
        format = "%(asctime)s: %(message)s"
        logging.basicConfig(
            format="%(asctime)s:%(message)s", level=logging.INFO, datefmt="%H:%M:%S"
        )

    def start(self, name):
        try:
            GPIO.output(self.BUZZER, GPIO.HIGH)
            logging.info("Buzzer: %s Beep", name)
            sleep(0.5)  # Delay in seconds
            GPIO.output(self.BUZZER, GPIO.LOW)
            logging.info("Buzzer: %s No Beep", name)
            sleep(0.5)
        except KeyboardInterrupt:
            GPIO.cleanup()

    def stop(self):
        GPIO.output(self.BUZZER, GPIO.LOW)
