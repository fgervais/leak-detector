import network
import time
import tinypico as TinyPICO
import micropython
import esp32
import blynklib
import secret
import machine

from machine import Pin, PWM, ADC, TouchPad, RTC


BEACON_VPIN = 1
LEAK_LED_VPIN = 2
CHARGING_VPIN = 3
LEAK_VAL_VPIN = 4

LEAK_CAP_THRESHOLD = 50

LEAK_TOUCHPAD_PIN = 33
BUZZER_PIN = 21


wlan = network.WLAN(network.STA_IF)
def connect():
    wlan.active(True)
    if not wlan.isconnected():
        print('connecting to network...')
        wlan.connect(secret.ESSID, secret.PSK)
        while not wlan.isconnected():
            time.sleep(1)
    print('network config:', wlan.ifconfig())

def usb_connected():
    return (TinyPICO.get_battery_voltage() == 3.7)


class Device:
    def __init__(self, blynk, buzzer_pwm, wifi_connect_function, leak_pad):
        self.blynk = blynk
        self.buzzer_pwm = buzzer_pwm
        self.wifi_connect_function = wifi_connect_function
        self.leak_pad = leak_pad

        self.connected = False

    def connect(self):
        if not self.connected:
            self.wifi_connect_function()
            self.blynk.connect()
            self.connected = True

    def blynk_virtual_write(self, vpin, value):
        self.connect()

        self.blynk.virtual_write(vpin, value)
        self.blynk.run()

    def blynk_notify(self, msg):
        self.connect()

        self.blynk.notify(msg);
        self.blynk.run()

    def beacon(self):
        self.blynk_virtual_write(
            BEACON_VPIN,
            TinyPICO.get_battery_voltage())

    def alarm(self, seconds):
        start_time = time.time()
        while time.time() < start_time + seconds:
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
        self.blynk_virtual_write(LEAK_LED_VPIN, 255 if state else 0)

    @property
    def charging(self):
        return False

    @charging.setter
    def charging(self, state):
        self.blynk_virtual_write(CHARGING_VPIN, 255 if state else 0)

    def leak_detected(self):
        self.leak_led = True
        self.blynk_notify("A leak has been detected!");

    def teardown(self):
        if self.connected:
            self.blynk.disconnect()

    def is_leak(self):
        try:
            if self.leak_pad.read() < LEAK_CAP_THRESHOLD:
                return True
        except:
            return True

        return False

    def show_leak_cap_value(self):
        try:
            value = self.leak_pad.read()
        except:
            value = 0

        print("Leak capacitance: " + str(value))
        self.blynk_virtual_write(LEAK_VAL_VPIN, value)


initial_buzzer_duty = 0
if machine.reset_cause() == machine.PWRON_RESET:
    initial_buzzer_duty = 512

buzzer = PWM(Pin(BUZZER_PIN), freq=4000, duty=initial_buzzer_duty)
time.sleep(0.05)
buzzer.duty(0)

leak_detect_pad = TouchPad(Pin(LEAK_TOUCHPAD_PIN))
leak_detect_pad.config(LEAK_CAP_THRESHOLD)
print("Slowing down touch sensor measurement rate")
esp32.set_touch_sensor_measurement_time(
    0xffff, # 2.28885 Hz
    0x1fff) # 1.02388 ms

rtc = RTC()
print("RTC memory: {}".format(rtc.memory()))
error_reported = True if rtc.memory() else False

blynk = blynklib.Blynk(secret.BLYNK_AUTH, log=print)
dishwasher = Device(blynk, buzzer, connect, leak_detect_pad)

if not dishwasher.is_leak():
    print("There is no leak")
    dishwasher.leak_led = False
    dishwasher.beacon()
    # The touchpad reading gets lower when wifi is activated so it's possible
    # that we get here (there is no leak) but still that the capacitance
    # shown below is below LEAK_CAP_THRESHOLD since here we sent a beacon
    # hence we are connected to wifi.
    # It doesn't affect a real leak since a leak bottoms out the capacitance
    # to 0.
    dishwasher.show_leak_cap_value()
    esp32.wake_on_touch(True)
    sleep_time = 7 * 24 * 60 * 60 * 1000 # 1 week

    print("Let say we are not charging")
    dishwasher.charging = False

else:
    print("A leak has been detected!")
    if not error_reported:
        dishwasher.leak_detected()
        dishwasher.show_leak_cap_value()
        rtc.memory(b'\x01')

    # If the error was already reported, we should not be connected to wifi here.
    # This is so we can go to sleep and wakeup and beep again without wasting
    # energy on wifi for each loop.

    dishwasher.alarm(60)

    esp32.wake_on_touch(False)
    sleep_time = 0 # forever


dishwasher.teardown()

if wlan.isconnected():
    wlan.disconnect()
    while wlan.isconnected():
        time.sleep(1)

print("Going to sleep")
TinyPICO.go_deepsleep(sleep_time)

print("not reached")

while True:
    pass
