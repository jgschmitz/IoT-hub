python3
#IP address of PC with Fake JSON Server is 192.168.2.22.from datetime import datetime
from urllib.parse import quote
import requests
from ruuvitag_sensor.ruuvi import RuuviTagSensor
print "1,2,3,4,5,6,7,8,9,10,11"
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
