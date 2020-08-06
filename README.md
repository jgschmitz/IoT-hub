<b>Running the setup</b>
Start Fake JSON Server
Clone the repository
$ git clone https://github.com/ttu/dotnet-fake-json-server.git
$ cd dotnet-fake-json-server/FakeServer
Copy sensors.html from Gist to /wwwroot folder
Edit appsettings.json
Set Common.EagerDataReload to false
Set Api.UpsertOnPut to true
Start the server
$ dotnet run --file iot.json --urls http://0.0.0.0:57602
Open http://localhost:57602/sensors.html
Install RuuviTag package to Raspberry Pi (Raspbian) or to PC with Linux
RuuviTag Python package Installation Guide

Execute Python script
IP address of PC with Fake JSON Server is 192.168.2.22.

from datetime import datetime
from urllib.parse import quote
import requests
from ruuvitag_sensor.ruuvi import RuuviTagSensor

all_data = {}
url = 'http://192.168.2.22:57602/api'

def handle_data(new_data):
    sensor_mac = new_data[0]
    sensor_data = new_data[1]

    if sensor_mac not in all_data or all_data[sensor_mac]['data'] != sensor_data:
        # sensordatas POST will overwrite id, but sensors PUT will use it
        update_data = {'id': sensor_mac, 'mac': sensor_mac, 'data': sensor_data, 'timestamp': datetime.now().isoformat()}
        all_data[sensor_mac] = update_data
        requests.put('{url}/sensors/{mac}'.format(url=url, mac=quote(sensor_mac)), json=update_data)
        requests.post('{url}/sensordatas'.format(url=url), json=update_data)

RuuviTagSensor.get_datas(handle_data)
Async version of the script can be found from ruuvitag-sensor/examples.

Script sends data to 2 different endpoints:

POST /api/sensordatas    : sensordatas has all sent datas
PUT  /api/sensors/{mac}  : sensors has latest data for each sensor
Saved data
Data in iot.json. Sensors have different fields depending on the sensor’s firmware.

{
  "sensors": [
    {
      "id": "F4:A5:74:89:16:57",
      "mac": "F4:A5:74:89:16:57",
      "data": {
        "humidity": 46.5,
        "temperature": 24.36,
        "pressure": 998.55,
        "acceleration": 1038.0433516958722,
        "acceleration_x": 78,
        "acceleration_y": -15,
        "acceleration_z": 1035,
        "battery": 2893
      },
      "timestamp": "2017-07-01T18:36:56.547306"
    },
    {
      "id": "CA:F7:44:DE:EB:E1",
      "mac": "CA:F7:44:DE:EB:E1",
      "data": {
        "temperature": 24.0,
        "humidity": 38.0,
        "pressure": 998.0,
        "identifier": null
      },
      "timestamp": "2017-07-01T18:36:57.229115"
    }
  ],
  "sensordatas": [
    {
      "id": 0,
      "mac": "F4:A5:74:89:16:57",
      "data": {
        "humidity": 46.5,
        "temperature": 24.35,
        "pressure": 998.48,
        "acceleration": 1030.2921915650918,
        "acceleration_x": 82,
        "acceleration_y": -7,
        "acceleration_z": 1027,
        "battery": 2887
      },
      "timestamp": "2017-07-01T18:36:56.044941"
    },
    {
      "id": 1,
      "mac": "F4:A5:74:89:16:57",
      "data": {
        "humidity": 46.5,
        "temperature": 24.36,
        "pressure": 998.55,
        "acceleration": 1038.0433516958722,
        "acceleration_x": 78,
        "acceleration_y": -15,
        "acceleration_z": 1035,
        "battery": 2893
      },
      "timestamp": "2017-07-01T18:36:56.547306"
    },
    {
      "id": 2,
      "mac": "CA:F7:44:DE:EB:E1",
      "data": {
        "temperature": 24.0,
        "humidity": 38.0,
        "pressure": 998.0,
        "identifier": null
      },
      "timestamp": "2017-07-01T18:36:57.229115"
    }
  ]
}


