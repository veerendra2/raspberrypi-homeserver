# GPIO and Fan Controller
This fan controller script is based on [fan.py](https://github.com/geekworm-com/x-c1/blob/main/fan.py) and [X-C1 Software](https://wiki.geekworm.com/X-C1_Software) for [Geekworm NASPi Gemini V2.0 Dual](https://geekworm.com/collections/nas-storage/products/naspi-gemini) with `X882 V2.0` board. 
* Ansible task [tasks/pigpio.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/pigpio.yml)
* fan.py script [scripts/fan.py](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/scripts/fan.py)

`pigpiod` and `fan.py` are configured to run as systemd daemons.
```
$ systemctl status fan-py
● fan-py.service - Daemon required to control fan speed via pigpio
     Loaded: loaded (/lib/systemd/system/fan-py.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-01-02 21:39:24 CET; 4 days ago
    Process: 1022 ExecStartPre=/bin/sleep 5 (code=exited, status=0/SUCCESS)
   Main PID: 1137 (python3)
      Tasks: 2 (limit: 9237)
     Memory: 5.6M
        CPU: 6.123s
     CGroup: /system.slice/fan-py.service
             └─1137 /usr/bin/python3 /usr/local/bin/fan.py

Jan 07 13:39:07 atom python3[1137]: DEBUG:2023-01-07 13:39:07,542 Current CPU temperature is 47.23°C. Setting fan speed to 40%
Jan 07 13:41:07 atom python3[1137]: DEBUG:2023-01-07 13:41:07,643 Current CPU temperature is 47.71°C. Setting fan speed to 40%

$ systemctl status pigpiod
● pigpiod.service - Daemon required to control GPIO pins via pigpio
     Loaded: loaded (/lib/systemd/system/pigpiod.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-01-02 21:39:19 CET; 4 days ago
    Process: 987 ExecStartPre=/bin/sleep 0 (code=exited, status=0/SUCCESS)
    Process: 1013 ExecStart=/usr/local/bin/pigpiod (code=exited, status=0/SUCCESS)
   Main PID: 1021 (pigpiod)
      Tasks: 6 (limit: 9237)
     Memory: 900.0K
        CPU: 9h 20min 39.918s
     CGroup: /system.slice/pigpiod.service
             └─1021 /usr/local/bin/pigpiod

Jan 02 21:39:19 atom systemd[1]: Starting Daemon required to control GPIO pins via pigpio...
Jan 02 21:39:19 atom systemd[1]: Started Daemon required to control GPIO pins via pigpio.
```
## References
* https://github.com/veerendra2/raspberrypi-homeserver/issues/45



