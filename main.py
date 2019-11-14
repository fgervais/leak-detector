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
CHARGING_VPIN = 3

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

def show_leak_cap_value():
    try:
        value = leak_detect_pad.read()
    except:
        value = 0

    print("Leak capacitance: " + str(value))


class Device:
    def __init__(self, blynk, buzzer_pwm):
        self.blynk = blynk
        self.buzzer_pwm = buzzer_pwm

    def beacon(self):
        self.blynk.virtual_write(
            BEACON_VPIN,
            TinyPICO.get_battery_voltage())
        self.blynk.run()

    def alarm(self):
        for i in range(3):
            self.buzzer_pwm.duty(512)
            time.sleep(0.25)
            self.buzzer_pwm.duty(0)
            time.sleep(0.25)

    @property
    def leak_led(self):
        return False

    @leak_led.setter
    def leak_led(self, state):
        self.blynk.virtual_write(LEAK_LED_VPIN, 255 if state else 0)
        self.blynk.run()

    @property
    def charging(self):
        return False

    @charging.setter
    def charging(self, state):
        self.blynk.virtual_write(CHARGING_VPIN, 255 if state else 0)
        self.blynk.run()

    def leak_detected(self):
        self.leak_led = True

        self.blynk.notify("A leak has been detected!");
        self.blynk.run()


buzzer = PWM(Pin(BUZZER_PIN), freq=4000, duty=512)
time.sleep(0.05)
buzzer.duty(0)

leak_detect_pad = TouchPad(Pin(LEAK_TOUCHPAD_PIN))
leak_detect_pad.config(LEAK_CAP_THRESHOLD)

blynk = blynklib.Blynk(secret.BLYNK_AUTH, log=print)
dishwasher = Device(blynk, buzzer)

connect()
blynk.run()

show_leak_cap_value()

if not is_leak():
    print("There is no leak")
    dishwasher.leak_led = False
    dishwasher.beacon()
    esp32.wake_on_touch(True)
    sleep_time = 1 * 60 * 60 * 1000 # 1 week
else:
    print("A leak has been detected!")
    dishwasher.leak_detected()
    esp32.wake_on_touch(False)
    for i in range(30):
        dishwasher.alarm()
        time.sleep(2)
    sleep_time = 3 * 60 * 1000 # 3 minutes

if TinyPICO.get_battery_charging():
    print("Charging")
    dishwasher.charging = True
    sleep_time = 5 * 60 * 1000 # 5 minutes
else:
    print("Not charging")
    dishwasher.charging = False


blynk.disconnect()

print("Going to sleep")
TinyPICO.go_deepsleep(sleep_time)

print("not reached")

while True:
    pass
