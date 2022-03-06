import RPi.GPIO as GPIO


class RotaryEncoder:

    COUNTER = 0

    def __init__(self, clockPin, dataPin, switchPin):
        # persist values
        self.clockPin = clockPin
        self.dataPin = dataPin
        self.switchPin = switchPin
        self.rotaryCallback = ""
        self.switchCallback = ""
        self.counter = 0
        self.param = ""

        # setup pins
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(clockPin, GPIO.IN)
        GPIO.setup(dataPin, GPIO.IN)
        GPIO.setup(switchPin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
        self.clkLastState = GPIO.input(self.clockPin)

    def setup(self, rotaryCallback, switchCallback, param, counter: int):

        self.rotaryCallback = rotaryCallback
        self.switchCallback = switchCallback
        self.counter = int(counter)
        self.param = param

    def start(self):
        if self.COUNTER == 0:
            GPIO.add_event_detect(
                self.clockPin,
                GPIO.FALLING,
                callback=self._clockCallback,
            )
            GPIO.add_event_detect(
                self.switchPin,
                GPIO.FALLING,
                callback=self._switchCallback,
            )
        self.COUNTER = 1

    def stop(self):
        GPIO.remove_event_detect(self.clockPin)
        GPIO.remove_event_detect(self.switchPin)

    def _clockCallback(self, pin):
        self.clkState = GPIO.input(self.clockPin)
        self.dtState = GPIO.input(self.dataPin)
        if self.clkState != self.clkLastState:
            if self.dtState != self.clkState:
                if self.param == "TV":
                    if self.counter < 2000 and self.counter >= 0:
                        self.counter += 10

                if self.param == "RR":
                    if self.counter < 30 and self.counter >= 0:
                        self.counter += 1

                if self.param == "FiO2":
                    if self.counter < 100 and self.counter >= 0:
                        self.counter += 1

                # if self.param == 'TV':
                #     if self.counter <= 2000 and self.counter > 0:
                #         self.counter += 1
            else:
                if self.param == "TV":
                    if self.counter < 2001 and self.counter > 0:
                        self.counter -= 10
                if self.param == "RR":
                    if self.counter < 31 and self.counter > 0:
                        self.counter -= 1
                if self.param == "FiO2":
                    if self.counter < 101 and self.counter > 0:
                        self.counter -= 1

            self.clkLastState = self.clkState
            if self.param == "TV":
                self.rotaryCallback(self.counter, "TV")
            if self.param == "RR":
                self.rotaryCallback(self.counter, "RR")
            if self.param == "FiO2":
                self.rotaryCallback(self.counter, "FiO2")

    def _switchCallback(self, pin):
        if GPIO.input(self.switchPin) == 0:
            self.switchCallback()
