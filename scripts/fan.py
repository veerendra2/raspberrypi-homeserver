#!/usr/bin/python3
'''
Description: A simple script to control 3pin PWM fan in raspberry pi 4
Reference: https://github.com/geekworm-com/x-c1/blob/main/fan.py
'''
import pigpio
import time
import logging

logging.basicConfig(format='%(levelname)s:%(asctime)s %(message)s', level=logging.DEBUG)

servo = 18

pwm = pigpio.pi()
pwm.set_mode(servo, pigpio.OUTPUT)
pwm.set_PWM_frequency(servo, 25000)
pwm.set_PWM_range(servo, 100)
while (True):
  # Get CPU temp
  with open("/sys/class/thermal/thermal_zone0/temp") as f:
    temp = float(f.read()) / 1000.00
    temp = float('%.2f' % temp)

  if (temp > 75):
    logging.debug(f"Current CPU temperature is {temp}°C. Setting fan speed to 100%")
    pwm.set_PWM_dutycycle(servo, 100)
  elif (temp > 70):
    logging.debug(f"Current CPU temperature is {temp}°C. Setting fan speed to 80%")
    pwm.set_PWM_dutycycle(servo, 80)
  elif (temp > 60):
    logging.debug(f"Current CPU temperature is {temp}°C. Setting fan speed to 70%")
    pwm.set_PWM_dutycycle(servo, 70)
  elif (temp > 50):
    logging.debug(f"Current CPU temperature is {temp}°C. Setting fan speed to 50%")
    pwm.set_PWM_dutycycle(servo, 50)
  elif (temp > 30):
    logging.debug(f"Current CPU temperature is {temp}°C. Setting fan speed to 40%")
    pwm.set_PWM_dutycycle(servo, 40)
  elif (temp < 30):
    logging.debug(f"Current CPU temperature is {temp}°C. Setting fan speed to 0%")
    pwm.set_PWM_dutycycle(servo, 0)

  time.sleep(120)
