import os
import time
os.system("cd ./src/scrapy/hjx && python download.py")

os.system("cd ./src/spark && python run.py")



os.system("cd ./src && python timestamp.py")