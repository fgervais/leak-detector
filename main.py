import network
import time
import tinypico as TinyPICO
import micropython
# import blynklib

from machine import Pin, PWM, ADC, TouchPad

import secret


def connect():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        print('connecting to network...')
        wlan.connect(secret.ESSID, secret.PSK)
        while not wlan.isconnected():
            time.sleep(1)
    print('network config:', wlan.ifconfig())



# vbat = ADC(Pin(36))
buzzer = PWM(Pin(25))

leak_detect_pad = TouchPad(Pin(4))
leak_detect_pad.config(500)

# blynk = blynklib.Blynk(secret.BLYNK_AUTH)


# Say hello
print("\nHello from TinyPICO!")
print("--------------------\n")

# Show some info on boot
print("Battery Voltage is {}V".format( TinyPICO.get_battery_voltage() ) )
print("Battery Charge State is {}\n".format( TinyPICO.get_battery_charging() ) )

# Show available memory
print("Memory Info - micropython.mem_info()")
print("------------------------------------")
micropython.mem_info()


connect()

# import random
# blynk.virtual_write(1, random.randint(0, 255))


# esp32.wake_on_touch(True)
# TinyPICO.go_deepsleep()


# last_push_timestamp = 0

# while True:
#     blynk.run()

    # if (time.time() > last_push_timestamp + 30):
    #     blynk.virtual_write(1, random.randint(0, 255))

    #     last_push_timestamp = time.time()
