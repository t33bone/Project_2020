import requests
import json
import time

from ruuvitag_sensor.ruuvitag import RuuviTag

# Change here your own device's mac-address
macs = ['C1:05:25:89:4A:F0',
        'DD:39:47:16:BA:F5',
        'EF:12:4E:E0:FC:95']

arrayLenght = len(macs)

postUrl = 'http://195.148.21.106/api/ruuvi/post/details'

print('Starting')

while True:
    for i in range(arrayLenght):
        mac = macs[i]
        idDevice = i+2 #for some reason the database doesn't like no.1

        sensor = RuuviTag(mac)
        data = sensor.update()

        temperature = data['temperature']
        humidity = data['humidity']
        pressure = data['pressure']

        j_file = {
            "Devices_idDevice": idDevice,
            "Temperature": temperature,
            "Humidity": humidity,
            "AirPressure": pressure}

        print("macAddr is = ", mac)

        x = requests.post(postUrl, json = j_file)

        if x.status_code == 200:
            print("Code 200, success!")
        else:
            print("Error", x)
            print("The post was unsuccessful.\n")
            time.sleep(1)
    else:
        print("sleep")
        time.sleep(60)
