#!/usr/bin/python
import pigpio
import time

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

  if (temp > 30):
    pwm.set_PWM_dutycycle(servo, 40)
  elif (temp > 50):
    pwm.set_PWM_dutycycle(servo, 50)
  elif (temp > 60):
    pwm.set_PWM_dutycycle(servo, 70)
  elif (temp > 70):
    pwm.set_PWM_dutycycle(servo, 80)
  elif (temp > 75):
    pwm.set_PWM_dutycycle(servo, 100)
  elif (temp < 30):
    pwm.set_PWM_dutycycle(servo, 0)

  time.sleep(60)
