#!/usr/bin/python3
'''
Description: A simple script to control 3pin PWM fan in raspberry pi 4
'''
import pigpio
import time
import logging

# Pin number for the fan
FAN_PIN = 18

# PWM frequency and duty cycle range
PWM_FREQ = 25000
PWM_RANGE = 100

# Temperature thresholds and corresponding duty cycles
TEMP_THRESHOLDS = [(75, 100), (70, 80), (60, 70), (40, 60), (30, 40)]

logging.basicConfig(format='%(levelname)s:%(asctime)s %(message)s', level=logging.DEBUG)

pwm = pigpio.pi()
pwm.set_mode(FAN_PIN, pigpio.OUTPUT)
pwm.set_PWM_frequency(FAN_PIN, PWM_FREQ)
pwm.set_PWM_range(FAN_PIN, PWM_RANGE)

prev_dc = None
while True:
  # Get CPU temp
  with open("/sys/class/thermal/thermal_zone0/temp") as f:
      temp = float(f.read()) / 1000.00
      temp = round(temp, 2)

  # Determine duty cycle based on temperature
  duty_cycle = 0
  for threshold, dc in TEMP_THRESHOLDS:
      if temp >= threshold:
          duty_cycle = dc
          break

  # Set fan speed if duty cycle has changed
  if duty_cycle != prev_dc:
      pwm.set_PWM_dutycycle(FAN_PIN, duty_cycle)
      logging.debug(f"Current CPU temperature is {temp}°C. Setting fan speed to {duty_cycle}%")
      prev_dc = duty_cycle

  # Wait for 2 minutes before checking temperature again
  time.sleep(60)
