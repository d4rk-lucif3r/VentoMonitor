from Imports.Max30102.max30102 import MAX30102
from Imports.Max30102.hrcalc import calc_hr_and_spo2
import threading
import time
import numpy as np


class HeartRateMonitor:
    """
    A class that encapsulates the max30102 device into a thread
    """

    Bpm_cal = 0
    spo_cal = 0
    ir = 0
    red = 0
    red_data = []
    ir_data = []
    LOOP_TIME = 0.01

    def __init__(self, print_raw=False, print_result=True):
        self.bpm = 0
        self.spo2 = 0
        if print_raw is True:
            print("IR, Red")
        self.print_raw = print_raw
        self.print_result = print_result

    def run_sensor(self):
        sensor = MAX30102()
        ir_data = []
        red_data = []
        bpms = []
        spo2s = []

        # run until told to stop
        while not self._thread.stopped:
            # check if any data is available
            num_bytes = sensor.get_data_present()
            if num_bytes > 0:
                # grab all the data and stash it into arrays
                while num_bytes > 0:
                    red, ir = sensor.read_fifo()
                    num_bytes -= 1
                    ir_data.append(ir)
                    red_data.append(red)
                    # if self.print_raw:
                    # print("{0}, {1}".format(ir, red))

                while len(ir_data) > 100:
                    ir_data.pop(0)
                    red_data.pop(0)

                if len(ir_data) == 100:
                    bpm, valid_bpm, spo2, valid_spo2 = calc_hr_and_spo2(
                        ir_data, red_data
                    )
                    if valid_bpm & valid_spo2:
                        bpms.append(bpm)
                        spo2s.append(spo2)
                        while len(bpms) > 4:
                            bpms.pop(0)
                        while len(spo2s) > 4:
                            spo2s.pop(0)
                        self.bpm = np.mean(bpms)
                        self.spo2 = np.mean(spo2s)
                        if np.mean(ir_data) < 50000 and np.mean(red_data) < 50000:
                            self.bpm = 0
                            self.spo2 = 0
                            # if self.print_result:
                            #     print("Finger not detected")
                        if self.print_result:

                            self.spo_cal = self.spo2
                            self.Bpm_cal = self.bpm
                            self.ir = ir
                            self.ir_data = ir_data
                            self.red_data = red_data
                            self.red = red
                            # print("BPM: {0}, SpO2: {1}".format(self.Bpm_cal, self.spo_cal))

            time.sleep(self.LOOP_TIME)

        sensor.shutdown()

    def start_sensor(self):
        self._thread = threading.Thread(target=self.run_sensor)
        self._thread.stopped = False
        self._thread.start()

    def stop_sensor(self, timeout=2.0):
        self._thread.stopped = True
        self.bpm = 0
        self.spo2 = 0
        self._thread.join(timeout)
