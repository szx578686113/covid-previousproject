import os

os.system("python ./src/timestamp.py")

os.system("cd ./src/scrapy && python download.py")

os.system("cd ./src/spark && python run.py")

os.system("cd ./src/flask && python app.py")

