# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
import csv

class MyfirstspiderPipeline:
    def process_item(self, item, spider):
        headers = ['Location', 'Cases', 'Deaths', 'Recoveries']
        rows = []
        for i in range(len(item["country"])):
            country = str(item["country"][i]).replace("\n", "")[21:]
            case = str(item["case"][i]).replace("\n", "").replace(",", "")
            death = str(item["death"][i]).replace("\n", "").replace(",", "")
            recovery = str(item["recovery"][i]).replace("\n", "").replace(",", "")
            rows.append([country, case, death, recovery])
        with open('../../../../../data/scrapy_covid.csv', 'w', newline='', encoding='utf-8-sig') as f:
            f_csv = csv.writer(f)
            f_csv.writerow(headers)
            f_csv.writerows(rows)