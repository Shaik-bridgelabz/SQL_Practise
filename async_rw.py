import asyncio
import csv
import json
import mysql.connector
from aiohttp import ClientSession

conn = mysql.connector.connect(host='localhost', database='covid', user='root', password='')
db = conn.cursor()


async def fetch_html(url):
    async with ClientSession() as session:
        print("Fetching Data from url")
        resp = await session.request(method="GET", url=url)
        html = await resp.text()
        print("Done Fetching Data")
        return html

async def insert_into_db(json_data):
    for data in json_data['cases_time_series']:
        db.execute("INSERT INTO covid_data(dailyconfirmed,dailydeceased,dailyrecovered,date,totalconfirmed,totaldeceased,totalrecovered) values(%s, %s, %s, %s, %s, %s, %s)",[data['dailyconfirmed'],data['dailydeceased'],data['dailyrecovered'],data['date'],data['totalconfirmed'],data['totaldeceased'], data['totalrecovered']])
    conn.commit()
    db.close()
    print("Successfully wrote into database")

async def insert_into_csv(json_data):
    with open('covid_data.csv', 'w') as csv_file:
        await write_csv(csv_file, json_data)
        await asyncio.sleep(5)
        print("Successfully wrote into csv file")

async def write_csv(csv_file, json_data):
    writer = csv.DictWriter(csv_file,
                            fieldnames=['dailyconfirmed', 'dailydeceased', 'dailyrecovered', 'date', 'totalconfirmed',
                                        'totaldeceased', 'totalrecovered'])
    writer.writeheader()
    writer.writerows(json_data['cases_time_series'])

async def main():
    data = await fetch_html("https://api.covid19india.org/data.json")
    json_data = json.loads(data)
    csv_data = loop.create_task(insert_into_csv(json_data))
    database = loop.create_task(insert_into_db(json_data))
    await asyncio.wait([csv_data, database])
    # return csv_data, database

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main())
    loop.close()

