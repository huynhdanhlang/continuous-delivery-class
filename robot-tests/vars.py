from selenium.webdriver.edge.options import Options
from selenium.webdriver import EdgeService
import json
import os
# NOTICE: Use of absolute paths is adviced.

# create signal_service and point it to correct version of preinstalled chromedriver
# version should match your electron framework and those can be downloaded from:
# https://github.com/electron/electron/releases under the version, from assets.
signal_service = EdgeService(executable_path=r"/usr/local/bin/msedgedriver")
dir_path = os.getcwd()

# And here we construct options that point to use your actual electron app.
signal_electron = Options()
signal_electron.binary_location = r"/usr/bin/microsoft-edge-stable"
signal_electron.add_argument(f"--user-data-dir={dir_path}/selenium")

print(json.dumps(signal_electron.__dict__, indent=2))
