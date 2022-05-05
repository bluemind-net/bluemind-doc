#!/usr/bin/env python
# -*- coding: utf-8 -*-
import requests, json

WEBSITE = "https://marketplace.blue-mind.net/"
API_KEY = "your_api_key"

#### POST PLUGIN
data = {
  'api_key': API_KEY,
  'name': 'Super plugin 3',
  'shortdesc': 'A short description',
  'description': 'A long description',
  'license': 'A license',
  'installation_instructions': 'Several instructions !',
  'home_url': "https://google.fr"
}

files = {
    'thumbnail': open('/home/user/Images/thumbnail.jpg', 'rb'),
    'screen1': open('/home/user/Images/screenshot1.png', 'rb'),
    'screen2': open('/home/user/Images/screenshot1.png', 'rb')
}

URL = WEBSITE + 'addons/api/plugins/'

#### POST PLUGIN VERSION
# data = {
#   'api_key': API_KEY,
#   'plugin_name': 'Super plugin',
#   'version': '0.2',
#   'target_bm_versions': '3.x',
#   'release_notes': 'On vient de faire une nouvelle release'
# }
#
# files = {
#     'package': open('/home/user/Files/super_plugin.jar', 'rb')
# }
#
# URL = WEBSITE + 'addons/api/plugin_version/'

#### POST REQUEST
req = requests.post(URL, files=files, data={'json': json.dumps(data)}, verify=False)


#### GET PLUGINS
# headers = {
#     'api-key': API_KEY
# }
#
# URL = WEBSITE + 'addons/api/plugins/'
#
# #### GET REQUEST
# req = requests.get(URL, headers=headers, verify=False)


#### POST OR GET RESPONSE
print "Status code : " + str(req.status_code)
if req.text:
    print "Contents : " + str(json.dumps(req.json(), indent=4, sort_keys=True))
