import network
import time
import tinypico as TinyPICO
import micropython
import esp32
import blynklib
import secret

from machine import Pin, PWM, ADC, TouchPad


BEACON_VPIN = 1
LEAK_LED_VPIN = 2

LEAK_CAP_THRESHOLD = 50

LEAK_TOUCHPAD_PIN = 33
BUZZER_PIN = 25


def connect():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        print('connecting to network...')
        wlan.connect(secret.ESSID, secret.PSK)
        while not wlan.isconnected():
            time.sleep(1)
    print('network config:', wlan.ifconfig())

def is_leak():
    try:
        if leak_detect_pad.read() < LEAK_CAP_THRESHOLD:
            return True
    except:
        return True

    return False


class Device:
    def __init__(self, blynk):
        self.blynk = blynk

    def beacon(self):
        self.blynk.virtual_write(
            BEACON_VPIN,
            TinyPICO.get_battery_voltage())
        self.blynk.run()

    @property
    def leak_led(self):
        return False

    @leak_led.setter
    def leak_led(self, state):
        self.blynk.virtual_write(LEAK_LED_VPIN, 255 if state else 0)
        self.blynk.run()

    def leak_detected(self):
        self.leak_led = True

        self.blynk.notify("A leak has been detected!");
        self.blynk.run()

buzzer = PWM(Pin(BUZZER_PIN))

leak_detect_pad = TouchPad(Pin(LEAK_TOUCHPAD_PIN))
leak_detect_pad.config(LEAK_CAP_THRESHOLD)

blynk = blynklib.Blynk(secret.BLYNK_AUTH, log=print)
dishwasher = Device(blynk)


print("\nHello from TinyPICO!")
print("--------------------\n")

print("Battery Voltage is {}V".format(TinyPICO.get_battery_voltage()))
print("Battery Charge State is {}\n".format(TinyPICO.get_battery_charging()))

print("Memory Info - micropython.mem_info()")
print("------------------------------------")
micropython.mem_info()


connect()
blynk.run()


sleep_time = 1 * 24 * 60 * 60 * 1000 # 1 week

if not is_leak():
    print("There is no leak")
    dishwasher.leak_led = False
    dishwasher.beacon()
    esp32.wake_on_touch(True)
else:
    print("A leak has been detected!")
    dishwasher.leak_detected()
    esp32.wake_on_touch(False)
    sleep_time = 5 * 60 * 1000 # 5 minutes

blynk.disconnect()
blynk.run()

print("Going to sleep")
TinyPICO.go_deepsleep(sleep_time)

print("not reached")

while True:
    pass
